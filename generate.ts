import { CanonicalManager } from "@atomic-ehr/fhir-canonical-manager";

const FHIR_TYPE_TO_SQL: Record<string, string> = {
  string: "TEXT",
  token: "TEXT",
  reference: "TEXT",
  date: "TEXT",
  quantity: "REAL",
  number: "REAL",
  uri: "TEXT",
  composite: "JSON",
  special: "TEXT",
};

function sanitizeColumnName(code: string): string {
  const name = code.replace(/-/g, "_");
  const reserved = ["order", "group", "select", "index", "type", "class", "resource"];
  return reserved.includes(name.toLowerCase()) ? `${name}_` : name;
}

function sanitizeTableName(name: string): string {
  const reserved = ["group", "order", "select", "index", "table"];
  return reserved.includes(name.toLowerCase()) ? `"${name}"` : name;
}

function isSimplePath(expr: string): boolean {
  return (
    !expr.includes("|") &&
    !expr.includes(" as ") &&
    !expr.includes(".where(") &&
    !expr.includes(".resolve(") &&
    !expr.includes(".exists(") &&
    !expr.includes(".ofType(") &&
    !expr.includes("extension(")
  );
}

function extractPathForResource(expr: string, resourceType: string): string | null {
  // Handle union expressions like "Patient.gender | Person.gender"
  const parts = expr.split(" | ");
  const prefix = `${resourceType}.`;

  for (const part of parts) {
    const trimmed = part.trim();
    if (trimmed.startsWith(prefix)) {
      return trimmed.slice(prefix.length);
    }
  }
  return null;
}

function fhirPathToJsonExtract(
  expr: string,
  resourceType: string,
  searchParamType: string
): string | null {
  // Handle quantity type with "as Quantity" syntax
  // e.g., "(Observation.value as Quantity)" -> valueQuantity.value
  if (searchParamType === "quantity") {
    const quantityMatch = expr.match(new RegExp(`\\(${resourceType}\\.([a-zA-Z]+) as Quantity\\)`));
    if (quantityMatch) {
      const fieldName = quantityMatch[1]; // e.g., "value"
      // FHIR polymorphic: "value as Quantity" means valueQuantity
      const quantityField = fieldName + "Quantity";
      // Cast to REAL for numeric comparison
      return `CAST(resource ->> '$.${quantityField}.value' AS REAL)`;
    }
    return null; // Skip complex quantity expressions
  }

  const path = extractPathForResource(expr, resourceType);
  if (!path) return null;

  // Check the extracted path is simple (no .where(), .resolve(), etc.)
  if (!isSimplePath(`${resourceType}.${path}`)) return null;

  let jsonPath = "$." + path;

  // For reference types, extract the .reference string directly
  if (searchParamType === "reference") {
    jsonPath += ".reference";
  }

  return `resource ->> '${jsonPath}'`;
}

// Types handled by lookup tables instead of generated columns
const LOOKUP_TABLE_TYPES = new Set(["Address", "HumanName", "Identifier", "ContactPoint", "CodeableConcept"]);

async function buildTypeMap(resourceType: string, manager: any): Promise<Map<string, string>> {
  const sd = await manager.resolve(`http://hl7.org/fhir/StructureDefinition/${resourceType}`);
  const typeMap = new Map<string, string>();
  for (const el of sd?.snapshot?.element || []) {
    if (el.type?.[0]?.code) {
      typeMap.set(el.path, el.type[0].code);
    }
  }
  return typeMap;
}

// Find direct CodeableConcept paths for a resource with cardinality
// Returns array of { path, isArray } where isArray means max > 1
async function getCodeableConceptPaths(resourceType: string, manager: any): Promise<{ path: string; isArray: boolean }[]> {
  const sd = await manager.resolve(`http://hl7.org/fhir/StructureDefinition/${resourceType}`);
  const paths: { path: string; isArray: boolean }[] = [];
  const prefix = `${resourceType}.`;

  for (const el of sd?.snapshot?.element || []) {
    if (el.type?.[0]?.code !== "CodeableConcept") continue;
    if (!el.path.startsWith(prefix)) continue;

    // Only direct children (no dots after resourceType.)
    const subPath = el.path.slice(prefix.length);
    if (!subPath.includes(".")) {
      const isArray = el.max === "*" || parseInt(el.max) > 1;
      paths.push({ path: subPath, isArray });
    }
  }
  return paths;
}

function getTargetType(expression: string, resourceType: string, typeMap: Map<string, string>): string | null {
  const path = extractPathForResource(expression, resourceType);
  if (!path) return null;

  // Walk up the path to find the target type
  // e.g., for "contact.address.city", check:
  //   1. ResourceType.contact.address.city
  //   2. ResourceType.contact.address  <- finds Address
  //   3. ResourceType.contact
  const segments = path.split(".");
  for (let i = segments.length; i > 0; i--) {
    const checkPath = `${resourceType}.${segments.slice(0, i).join(".")}`;
    const type = typeMap.get(checkPath);
    if (type && LOOKUP_TABLE_TYPES.has(type)) {
      return type;
    }
  }
  return null;
}

async function generateSchema(resourceType: string, manager: any) {
  const searchParams = await manager.getSearchParametersForResource(resourceType);
  if (!searchParams || searchParams.length === 0) return null;

  const typeMap = await buildTypeMap(resourceType, manager);
  const columns: string[] = [];
  const referenceColumns: string[] = [];
  const seenColumns = new Set<string>();
  let skipped = 0;

  for (const sp of searchParams) {
    if (!sp.expression || sp.expression === "(none)") continue;
    if (sp.code.startsWith("_")) continue;

    // Skip params targeting types handled by lookup tables
    const targetType = getTargetType(sp.expression, resourceType, typeMap);
    if (targetType && LOOKUP_TABLE_TYPES.has(targetType)) continue;

    const colName = sanitizeColumnName(sp.code);
    if (seenColumns.has(colName)) continue;

    const sql = fhirPathToJsonExtract(sp.expression, resourceType, sp.type);
    if (!sql) {
      skipped++;
      continue;
    }

    seenColumns.add(colName);
    const sqlType = FHIR_TYPE_TO_SQL[sp.type] || "TEXT";
    columns.push(`  ${colName} ${sqlType} GENERATED ALWAYS AS (${sql}) STORED`);

    // Track reference columns for indexing
    if (sp.type === "reference") {
      referenceColumns.push(colName);
    }
  }

  if (columns.length === 0) return null;

  const tableName = sanitizeTableName(resourceType);
  const ddl = `-- ${resourceType}: ${columns.length} columns (${skipped} complex skipped)
CREATE TABLE ${tableName} (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
${columns.join(",\n")}
);
`;

  return { ddl, count: columns.length, skipped, tableName, referenceColumns };
}

// All FHIR R4 resource types
const ALL_R4_RESOURCES = [
  "Account", "ActivityDefinition", "AdverseEvent", "AllergyIntolerance", "Appointment",
  "AppointmentResponse", "AuditEvent", "Basic", "Binary", "BiologicallyDerivedProduct",
  "BodyStructure", "Bundle", "CapabilityStatement", "CarePlan", "CareTeam",
  "CatalogEntry", "ChargeItem", "ChargeItemDefinition", "Claim", "ClaimResponse",
  "ClinicalImpression", "CodeSystem", "Communication", "CommunicationRequest",
  "CompartmentDefinition", "Composition", "ConceptMap", "Condition", "Consent",
  "Contract", "Coverage", "CoverageEligibilityRequest", "CoverageEligibilityResponse",
  "DetectedIssue", "Device", "DeviceDefinition", "DeviceMetric", "DeviceRequest",
  "DeviceUseStatement", "DiagnosticReport", "DocumentManifest", "DocumentReference",
  "EffectEvidenceSynthesis", "Encounter", "Endpoint", "EnrollmentRequest",
  "EnrollmentResponse", "EpisodeOfCare", "EventDefinition", "Evidence",
  "EvidenceVariable", "ExampleScenario", "ExplanationOfBenefit", "FamilyMemberHistory",
  "Flag", "Goal", "GraphDefinition", "Group", "GuidanceResponse", "HealthcareService",
  "ImagingStudy", "Immunization", "ImmunizationEvaluation", "ImmunizationRecommendation",
  "ImplementationGuide", "InsurancePlan", "Invoice", "Library", "Linkage", "List",
  "Location", "Measure", "MeasureReport", "Media", "Medication", "MedicationAdministration",
  "MedicationDispense", "MedicationKnowledge", "MedicationRequest", "MedicationStatement",
  "MedicinalProduct", "MedicinalProductAuthorization", "MedicinalProductContraindication",
  "MedicinalProductIndication", "MedicinalProductIngredient", "MedicinalProductInteraction",
  "MedicinalProductManufactured", "MedicinalProductPackaged", "MedicinalProductPharmaceutical",
  "MedicinalProductUndesirableEffect", "MessageDefinition", "MessageHeader",
  "MolecularSequence", "NamingSystem", "NutritionOrder", "Observation",
  "ObservationDefinition", "OperationDefinition", "OperationOutcome", "Organization",
  "OrganizationAffiliation", "Parameters", "Patient", "PaymentNotice", "PaymentReconciliation",
  "Person", "PlanDefinition", "Practitioner", "PractitionerRole", "Procedure",
  "Provenance", "Questionnaire", "QuestionnaireResponse", "RelatedPerson",
  "RequestGroup", "ResearchDefinition", "ResearchElementDefinition", "ResearchStudy",
  "ResearchSubject", "RiskAssessment", "RiskEvidenceSynthesis", "Schedule",
  "SearchParameter", "ServiceRequest", "Slot", "Specimen", "SpecimenDefinition",
  "StructureDefinition", "StructureMap", "Subscription", "Substance",
  "SubstanceNucleicAcid", "SubstancePolymer", "SubstanceProtein",
  "SubstanceReferenceInformation", "SubstanceSourceMaterial", "SubstanceSpecification",
  "SupplyDelivery", "SupplyRequest", "Task", "TerminologyCapabilities", "TestReport",
  "TestScript", "ValueSet", "VerificationResult", "VisionPrescription"
];

async function main() {
  const manager = CanonicalManager({
    packages: ["hl7.fhir.r4.core"],
    workingDir: "./fhir-cache",
  });
  await manager.init();

  const resourceTypes = ALL_R4_RESOURCES;

  let total = 0;
  let skippedTotal = 0;
  const createdTables: string[] = [];

  console.log("-- fhir-sqlite schema (simple paths only, no UDF required)");
  console.log("-- Generated from FHIR R4 SearchParameters\n");

  const tableResults: { resourceType: string; tableName: string; referenceColumns: string[] }[] = [];

  for (const resourceType of resourceTypes) {
    const result = await generateSchema(resourceType, manager);
    if (result) {
      console.log(result.ddl);
      // Generate indexes for reference columns
      // Use resourceType for index name (no quotes), tableName for table reference (may have quotes)
      for (const col of result.referenceColumns) {
        console.log(`CREATE INDEX idx_${resourceType.toLowerCase()}_${col} ON ${result.tableName}(${col});`);
      }
      if (result.referenceColumns.length > 0) console.log();

      total += result.count;
      skippedTotal += result.skipped;
      createdTables.push(resourceType);
      tableResults.push({ resourceType, tableName: result.tableName, referenceColumns: result.referenceColumns });
    }
  }

  console.log(`-- Summary: ${createdTables.length} resources, ${total} columns`);
  console.log(`-- ${skippedTotal} complex expressions skipped (would need fhirpath UDF)`);

  // Identifier lookup table
  console.log(`
-- Identifier lookup table
CREATE TABLE Identifier (
  resourceType TEXT NOT NULL,
  resourceId TEXT NOT NULL,
  system TEXT,
  value TEXT NOT NULL
);

CREATE INDEX idx_identifier_lookup ON Identifier(resourceType, system, value);
CREATE INDEX idx_identifier_value ON Identifier(resourceType, value);

-- HumanName lookup table (flattened: one row per given name)
CREATE TABLE HumanName (
  resourceType TEXT NOT NULL,
  resourceId TEXT NOT NULL,
  family TEXT,
  given TEXT,
  use TEXT
);

CREATE INDEX idx_humanname_resource ON HumanName(resourceType, resourceId);
CREATE INDEX idx_humanname_family ON HumanName(resourceType, family);
CREATE INDEX idx_humanname_given ON HumanName(resourceType, given);

-- Address lookup table
CREATE TABLE Address (
  resourceType TEXT NOT NULL,
  resourceId TEXT NOT NULL,
  use TEXT,
  city TEXT,
  state TEXT,
  postalCode TEXT,
  country TEXT
);

CREATE INDEX idx_address_resource ON Address(resourceType, resourceId);
CREATE INDEX idx_address_city ON Address(resourceType, city);
CREATE INDEX idx_address_state ON Address(resourceType, state);
CREATE INDEX idx_address_postalcode ON Address(resourceType, postalCode);

-- ContactPoint lookup table (for telecom: email, phone, etc.)
CREATE TABLE ContactPoint (
  resourceType TEXT NOT NULL,
  resourceId TEXT NOT NULL,
  system TEXT,
  value TEXT,
  use TEXT
);

CREATE INDEX idx_contactpoint_resource ON ContactPoint(resourceType, resourceId);
CREATE INDEX idx_contactpoint_system_value ON ContactPoint(resourceType, system, value);
CREATE INDEX idx_contactpoint_value ON ContactPoint(resourceType, value);

-- Coding lookup table (for CodeableConcept: code, category, etc.)
CREATE TABLE Coding (
  resourceType TEXT NOT NULL,
  resourceId TEXT NOT NULL,
  path TEXT NOT NULL,
  system TEXT,
  code TEXT,
  display TEXT
);

CREATE INDEX idx_coding_resource ON Coding(resourceType, resourceId);
CREATE INDEX idx_coding_path_system_code ON Coding(resourceType, path, system, code);
CREATE INDEX idx_coding_path_code ON Coding(resourceType, path, code);

-- ObservationComponent table (for component-level composite search)
CREATE TABLE ObservationComponent (
  resourceId TEXT NOT NULL,
  codeSystem TEXT,
  code TEXT,
  codeDisplay TEXT,
  valueQuantity REAL,
  valueString TEXT,
  valueCodeSystem TEXT,
  valueCode TEXT
);

CREATE INDEX idx_obscomp_resource ON ObservationComponent(resourceId);
CREATE INDEX idx_obscomp_code ON ObservationComponent(codeSystem, code);
CREATE INDEX idx_obscomp_code_quantity ON ObservationComponent(codeSystem, code, valueQuantity);
`);

  // Resources with HumanName
  const humanNameResources = ["Patient", "Practitioner", "RelatedPerson", "Person"];

  // Resources with Address
  const addressResources = ["Patient", "Practitioner", "RelatedPerson", "Person", "Organization", "Location"];

  // Resources with telecom (ContactPoint)
  const telecomResources = ["Patient", "Practitioner", "PractitionerRole", "RelatedPerson", "Person"];

  // Generate triggers only for tables that were created
  for (const resourceType of createdTables) {
    const tableName = sanitizeTableName(resourceType);

    // Identifier trigger
    console.log(`CREATE TRIGGER ${resourceType}_identifier_insert AFTER INSERT ON ${tableName}
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT '${resourceType}', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;
`);

    // HumanName trigger (only for resources with name)
    if (humanNameResources.includes(resourceType)) {
      console.log(`CREATE TRIGGER ${resourceType}_humanname_insert AFTER INSERT ON ${tableName}
BEGIN
  INSERT INTO HumanName (resourceType, resourceId, family, given, use)
  SELECT '${resourceType}', NEW.id,
         json_extract(n.value, '$.family'),
         g.value,
         json_extract(n.value, '$.use')
  FROM json_each(NEW.resource, '$.name') AS n,
       json_each(json_extract(n.value, '$.given')) AS g;
END;
`);
    }

    // Address trigger (only for resources with address)
    if (addressResources.includes(resourceType)) {
      console.log(`CREATE TRIGGER ${resourceType}_address_insert AFTER INSERT ON ${tableName}
BEGIN
  INSERT INTO Address (resourceType, resourceId, use, city, state, postalCode, country)
  SELECT '${resourceType}', NEW.id,
         json_extract(a.value, '$.use'),
         json_extract(a.value, '$.city'),
         json_extract(a.value, '$.state'),
         json_extract(a.value, '$.postalCode'),
         json_extract(a.value, '$.country')
  FROM json_each(NEW.resource, '$.address') AS a;
END;
`);
    }

    // ContactPoint trigger (only for resources with telecom)
    if (telecomResources.includes(resourceType)) {
      console.log(`CREATE TRIGGER ${resourceType}_contactpoint_insert AFTER INSERT ON ${tableName}
BEGIN
  INSERT INTO ContactPoint (resourceType, resourceId, system, value, use)
  SELECT '${resourceType}', NEW.id,
         json_extract(t.value, '$.system'),
         json_extract(t.value, '$.value'),
         json_extract(t.value, '$.use')
  FROM json_each(NEW.resource, '$.telecom') AS t;
END;
`);
    }

    // Coding trigger (for CodeableConcept fields)
    const ccPaths = await getCodeableConceptPaths(resourceType, manager);
    if (ccPaths.length > 0) {
      const inserts = ccPaths.map(({ path, isArray }) => {
        if (isArray) {
          // Array of CodeableConcept: iterate array, then coding
          return `  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT '${resourceType}', NEW.id, '${path}',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.${path}') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;`;
        } else {
          // Single CodeableConcept: just iterate coding
          return `  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT '${resourceType}', NEW.id, '${path}',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.${path}.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;`;
        }
      });

      console.log(`CREATE TRIGGER ${resourceType}_coding_insert AFTER INSERT ON ${tableName}
BEGIN
${inserts.join("\n")}
END;
`);
    }

    // ObservationComponent trigger (only for Observation)
    if (resourceType === "Observation") {
      console.log(`CREATE TRIGGER Observation_component_insert AFTER INSERT ON Observation
BEGIN
  INSERT INTO ObservationComponent (resourceId, codeSystem, code, codeDisplay, valueQuantity, valueString, valueCodeSystem, valueCode)
  SELECT NEW.id,
         json_extract(coding.value, '$.system'),
         json_extract(coding.value, '$.code'),
         json_extract(coding.value, '$.display'),
         CAST(json_extract(comp.value, '$.valueQuantity.value') AS REAL),
         json_extract(comp.value, '$.valueString'),
         json_extract(valcode.value, '$.system'),
         json_extract(valcode.value, '$.code')
  FROM json_each(NEW.resource, '$.component') AS comp,
       json_each(json_extract(comp.value, '$.code.coding')) AS coding
       LEFT JOIN json_each(json_extract(comp.value, '$.valueCodeableConcept.coding')) AS valcode
  WHERE json_extract(coding.value, '$.code') IS NOT NULL;
END;
`);
    }
  }
}

main().catch(console.error);
