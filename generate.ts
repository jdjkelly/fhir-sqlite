import { CanonicalManager } from "@atomic-ehr/fhir-canonical-manager";

const FHIR_TYPE_TO_SQL: Record<string, string> = {
  string: "TEXT",
  token: "TEXT",
  reference: "TEXT",
  date: "TEXT",
  quantity: "TEXT",
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

async function generateSchema(resourceType: string, manager: any) {
  const searchParams = await manager.getSearchParametersForResource(resourceType);
  if (!searchParams || searchParams.length === 0) return null;

  const columns: string[] = [];
  const seenColumns = new Set<string>();
  let skipped = 0;

  // Skip params handled by lookup tables
  const lookupTableParams = ["family", "given", "phonetic"];

  for (const sp of searchParams) {
    if (!sp.expression || sp.expression === "(none)") continue;
    if (sp.code.startsWith("_")) continue;
    if (lookupTableParams.includes(sp.code)) continue;

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
  }

  if (columns.length === 0) return null;

  const tableName = sanitizeTableName(resourceType);
  const ddl = `-- ${resourceType}: ${columns.length} columns (${skipped} complex skipped)
CREATE TABLE ${tableName} (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
${columns.join(",\n")}
);
`;

  return { ddl, count: columns.length, skipped };
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

  for (const resourceType of resourceTypes) {
    const result = await generateSchema(resourceType, manager);
    if (result) {
      console.log(result.ddl);
      total += result.count;
      skippedTotal += result.skipped;
      createdTables.push(resourceType);
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
`);

  // Resources with HumanName
  const humanNameResources = ["Patient", "Practitioner", "RelatedPerson", "Person"];

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
  }
}

main().catch(console.error);
