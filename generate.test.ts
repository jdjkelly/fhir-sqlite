import { test, expect, beforeAll, afterAll } from "bun:test";
import { Database } from "bun:sqlite";
import { readFileSync } from "fs";

let db: Database;

const observations = [
  {
    resourceType: "Observation",
    id: "obs1",
    status: "final",
    category: [
      {
        coding: [
          { system: "http://terminology.hl7.org/CodeSystem/observation-category", code: "vital-signs", display: "Vital Signs" }
        ]
      }
    ],
    code: {
      coding: [
        { system: "http://loinc.org", code: "8867-4", display: "Heart rate" },
        { system: "http://snomed.info/sct", code: "364075005", display: "Heart rate" }
      ]
    },
    valueQuantity: { value: 72, unit: "beats/minute" }
  },
  {
    resourceType: "Observation",
    id: "obs2",
    status: "final",
    category: [
      {
        coding: [
          { system: "http://terminology.hl7.org/CodeSystem/observation-category", code: "laboratory", display: "Laboratory" }
        ]
      }
    ],
    code: {
      coding: [
        { system: "http://loinc.org", code: "2339-0", display: "Glucose" }
      ]
    },
    valueQuantity: { value: 95, unit: "mg/dL" }
  },
  // Blood pressure with components
  {
    resourceType: "Observation",
    id: "bp1",
    status: "final",
    category: [
      {
        coding: [
          { system: "http://terminology.hl7.org/CodeSystem/observation-category", code: "vital-signs", display: "Vital Signs" }
        ]
      }
    ],
    code: {
      coding: [
        { system: "http://loinc.org", code: "85354-9", display: "Blood pressure panel" }
      ]
    },
    component: [
      {
        code: {
          coding: [
            { system: "http://loinc.org", code: "8480-6", display: "Systolic blood pressure" }
          ]
        },
        valueQuantity: { value: 145, unit: "mmHg" }
      },
      {
        code: {
          coding: [
            { system: "http://loinc.org", code: "8462-4", display: "Diastolic blood pressure" }
          ]
        },
        valueQuantity: { value: 90, unit: "mmHg" }
      }
    ]
  },
  // Normal blood pressure
  {
    resourceType: "Observation",
    id: "bp2",
    status: "final",
    code: {
      coding: [
        { system: "http://loinc.org", code: "85354-9", display: "Blood pressure panel" }
      ]
    },
    component: [
      {
        code: {
          coding: [
            { system: "http://loinc.org", code: "8480-6", display: "Systolic blood pressure" }
          ]
        },
        valueQuantity: { value: 118, unit: "mmHg" }
      },
      {
        code: {
          coding: [
            { system: "http://loinc.org", code: "8462-4", display: "Diastolic blood pressure" }
          ]
        },
        valueQuantity: { value: 75, unit: "mmHg" }
      }
    ]
  }
];

const patients = [
  {
    resourceType: "Patient",
    id: "p1",
    meta: {
      versionId: "3",
      lastUpdated: "2024-06-15T10:30:00Z",
      profile: ["http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"]
    },
    identifier: [
      { system: "http://example.org/mrn", value: "12345" },
      { system: "http://example.org/ssn", value: "999-99-9999" },
    ],
    name: [
      { family: "Smith", given: ["John", "James"], use: "official" },
      { family: "Smithy", given: ["Johnny"], use: "nickname" },
    ],
    address: [
      { use: "home", city: "Boston", state: "MA", postalCode: "02101", country: "USA" },
      { use: "work", city: "Cambridge", state: "MA", postalCode: "02139", country: "USA" },
    ],
    telecom: [
      { system: "phone", value: "555-1234", use: "home" },
      { system: "email", value: "john.smith@example.com", use: "work" },
    ],
    gender: "male",
    birthDate: "1990-01-15",
  },
  {
    resourceType: "Patient",
    id: "p2",
    identifier: [{ system: "http://example.org/mrn", value: "67890" }],
    name: [{ family: "Doe", given: ["Jane"], use: "official" }],
    address: [
      { use: "home", city: "New York", state: "NY", postalCode: "10001", country: "USA" },
    ],
    telecom: [
      { system: "email", value: "jane.doe@example.com", use: "home" },
    ],
    gender: "female",
    birthDate: "1985-06-20",
  },
];

beforeAll(() => {
  db = new Database(":memory:");
  const schema = readFileSync("schema.sql", "utf-8");
  db.exec(schema);

  const insertPatient = db.prepare("INSERT INTO Patient (id, resource) VALUES (?, ?)");
  for (const p of patients) {
    insertPatient.run(p.id, JSON.stringify(p));
  }

  const insertObs = db.prepare("INSERT INTO Observation (id, resource) VALUES (?, ?)");
  for (const o of observations) {
    insertObs.run(o.id, JSON.stringify(o));
  }
});

afterAll(() => {
  db.close();
});

test("Identifier trigger populates lookup table", () => {
  const identifiers = db.query("SELECT * FROM Identifier WHERE resourceType = 'Patient'").all();
  expect(identifiers).toHaveLength(3);
});

test("query by identifier system|value", () => {
  const result = db.query(`
    SELECT p.id FROM Patient p
    JOIN Identifier i ON i.resourceId = p.id AND i.resourceType = 'Patient'
    WHERE i.system = 'http://example.org/mrn' AND i.value = '12345'
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("p1");
});

test("query by identifier value only", () => {
  const result = db.query(`
    SELECT p.id FROM Patient p
    JOIN Identifier i ON i.resourceId = p.id AND i.resourceType = 'Patient'
    WHERE i.value = '67890'
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("p2");
});

test("HumanName trigger flattens given names", () => {
  const names = db.query("SELECT * FROM HumanName WHERE resourceType = 'Patient'").all();
  // p1: John, James, Johnny = 3 rows
  // p2: Jane = 1 row
  expect(names).toHaveLength(4);
});

test("query by family name", () => {
  const result = db.query(`
    SELECT DISTINCT p.id FROM Patient p
    JOIN HumanName h ON h.resourceId = p.id AND h.resourceType = 'Patient'
    WHERE h.family = 'Smith'
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("p1");
});

test("query by given name", () => {
  const result = db.query(`
    SELECT DISTINCT p.id FROM Patient p
    JOIN HumanName h ON h.resourceId = p.id AND h.resourceType = 'Patient'
    WHERE h.given = 'James'
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("p1");
});

test("generated columns extract values", () => {
  const result = db.query("SELECT id, gender, birthdate FROM Patient WHERE id = 'p1'").get() as {
    id: string;
    gender: string;
    birthdate: string;
  };

  expect(result.gender).toBe("male");
  expect(result.birthdate).toBe("1990-01-15");
});

// Meta field tests

test("meta fields are auto-extracted", () => {
  const result = db.query("SELECT versionId, lastUpdated, profile FROM Patient WHERE id = 'p1'").get() as {
    versionId: string;
    lastUpdated: string;
    profile: string;
  };

  expect(result.versionId).toBe("3");
  expect(result.lastUpdated).toBe("2024-06-15T10:30:00Z");
  expect(JSON.parse(result.profile)).toEqual(["http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"]);
});

test("query by lastUpdated", () => {
  const result = db.query(`
    SELECT id FROM Patient WHERE lastUpdated > '2024-01-01'
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("p1");
});

test("meta fields are null when not present", () => {
  const result = db.query("SELECT versionId, lastUpdated, profile FROM Patient WHERE id = 'p2'").get() as {
    versionId: string | null;
    lastUpdated: string | null;
    profile: string | null;
  };

  expect(result.versionId).toBeNull();
  expect(result.lastUpdated).toBeNull();
  expect(result.profile).toBeNull();
});

test("Address trigger populates lookup table", () => {
  const addresses = db.query("SELECT * FROM Address WHERE resourceType = 'Patient'").all();
  // p1: 2 addresses (home, work)
  // p2: 1 address (home)
  expect(addresses).toHaveLength(3);
});

test("query by city", () => {
  const result = db.query(`
    SELECT DISTINCT p.id FROM Patient p
    JOIN Address a ON a.resourceId = p.id AND a.resourceType = 'Patient'
    WHERE a.city = 'Boston'
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("p1");
});

test("query by state", () => {
  const result = db.query(`
    SELECT DISTINCT p.id FROM Patient p
    JOIN Address a ON a.resourceId = p.id AND a.resourceType = 'Patient'
    WHERE a.state = 'MA'
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("p1");
});

test("query by postal code", () => {
  const result = db.query(`
    SELECT DISTINCT p.id FROM Patient p
    JOIN Address a ON a.resourceId = p.id AND a.resourceType = 'Patient'
    WHERE a.postalCode = '10001'
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("p2");
});

test("ContactPoint trigger populates lookup table", () => {
  const contacts = db.query("SELECT * FROM ContactPoint WHERE resourceType = 'Patient'").all();
  // p1: 2 telecom entries (phone, email)
  // p2: 1 telecom entry (email)
  expect(contacts).toHaveLength(3);
});

test("query by email", () => {
  const result = db.query(`
    SELECT DISTINCT p.id FROM Patient p
    JOIN ContactPoint c ON c.resourceId = p.id AND c.resourceType = 'Patient'
    WHERE c.system = 'email' AND c.value = 'john.smith@example.com'
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("p1");
});

test("query by phone", () => {
  const result = db.query(`
    SELECT DISTINCT p.id FROM Patient p
    JOIN ContactPoint c ON c.resourceId = p.id AND c.resourceType = 'Patient'
    WHERE c.system = 'phone' AND c.value = '555-1234'
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("p1");
});

test("query all patients with email", () => {
  const result = db.query(`
    SELECT DISTINCT p.id FROM Patient p
    JOIN ContactPoint c ON c.resourceId = p.id AND c.resourceType = 'Patient'
    WHERE c.system = 'email'
  `).all() as { id: string }[];

  expect(result).toHaveLength(2);
});

// Coding lookup table tests

test("Coding trigger populates lookup table for code (single CodeableConcept)", () => {
  const codings = db.query("SELECT * FROM Coding WHERE resourceType = 'Observation' AND path = 'code'").all();
  // obs1: 2 codings (LOINC + SNOMED)
  // obs2: 1 coding (LOINC)
  // bp1: 1 coding (LOINC blood pressure panel)
  // bp2: 1 coding (LOINC blood pressure panel)
  expect(codings).toHaveLength(5);
});

test("Coding trigger populates lookup table for category (array CodeableConcept)", () => {
  const codings = db.query("SELECT * FROM Coding WHERE resourceType = 'Observation' AND path = 'category'").all();
  // obs1: 1 category coding (vital-signs)
  // obs2: 1 category coding (laboratory)
  // bp1: 1 category coding (vital-signs)
  // bp2: no category
  expect(codings).toHaveLength(3);
});

test("query observation by LOINC code", () => {
  const result = db.query(`
    SELECT DISTINCT o.id FROM Observation o
    JOIN Coding c ON c.resourceId = o.id AND c.resourceType = 'Observation'
    WHERE c.path = 'code' AND c.system = 'http://loinc.org' AND c.code = '8867-4'
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("obs1");
});

test("query observation by category", () => {
  const result = db.query(`
    SELECT DISTINCT o.id FROM Observation o
    JOIN Coding c ON c.resourceId = o.id AND c.resourceType = 'Observation'
    WHERE c.path = 'category' AND c.code = 'vital-signs'
  `).all() as { id: string }[];

  // obs1 and bp1 have vital-signs category
  expect(result).toHaveLength(2);
});

test("query all observations with LOINC codes", () => {
  const result = db.query(`
    SELECT DISTINCT o.id FROM Observation o
    JOIN Coding c ON c.resourceId = o.id AND c.resourceType = 'Observation'
    WHERE c.path = 'code' AND c.system = 'http://loinc.org'
  `).all() as { id: string }[];

  // obs1, obs2, bp1, bp2 all have LOINC codes
  expect(result).toHaveLength(4);
});

// Quantity search tests

test("value_quantity column extracts numeric value", () => {
  const result = db.query("SELECT id, value_quantity FROM Observation WHERE id = 'obs1'").get() as {
    id: string;
    value_quantity: number;
  };

  expect(result.value_quantity).toBe(72);
});

test("query observation by quantity value", () => {
  const result = db.query(`
    SELECT id FROM Observation WHERE value_quantity > 90
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("obs2"); // glucose = 95
});

test("query observation by quantity range", () => {
  const result = db.query(`
    SELECT id FROM Observation WHERE value_quantity BETWEEN 70 AND 100
  `).all() as { id: string }[];

  expect(result).toHaveLength(2); // both obs1 (72) and obs2 (95)
});

// ObservationComponent tests (for composite search)

test("ObservationComponent trigger populates from components", () => {
  const components = db.query("SELECT * FROM ObservationComponent").all();
  // bp1: 2 components (systolic, diastolic)
  // bp2: 2 components (systolic, diastolic)
  expect(components).toHaveLength(4);
});

test("query by component code", () => {
  const result = db.query(`
    SELECT DISTINCT resourceId FROM ObservationComponent
    WHERE codeSystem = 'http://loinc.org' AND code = '8480-6'
  `).all() as { resourceId: string }[];

  // Both bp1 and bp2 have systolic component
  expect(result).toHaveLength(2);
});

test("query by component code and value (systolic > 140 - hypertension)", () => {
  const result = db.query(`
    SELECT DISTINCT o.id FROM Observation o
    JOIN ObservationComponent c ON c.resourceId = o.id
    WHERE c.codeSystem = 'http://loinc.org'
      AND c.code = '8480-6'
      AND c.valueQuantity > 140
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("bp1"); // 145 mmHg
});

test("query by component code and value (diastolic > 80)", () => {
  const result = db.query(`
    SELECT DISTINCT o.id FROM Observation o
    JOIN ObservationComponent c ON c.resourceId = o.id
    WHERE c.codeSystem = 'http://loinc.org'
      AND c.code = '8462-4'
      AND c.valueQuantity > 80
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("bp1"); // 90 mmHg
});

test("query normal blood pressure (systolic < 120 AND diastolic < 80)", () => {
  const result = db.query(`
    SELECT DISTINCT o.id FROM Observation o
    WHERE EXISTS (
      SELECT 1 FROM ObservationComponent c
      WHERE c.resourceId = o.id
        AND c.code = '8480-6' AND c.valueQuantity < 120
    )
    AND EXISTS (
      SELECT 1 FROM ObservationComponent c
      WHERE c.resourceId = o.id
        AND c.code = '8462-4' AND c.valueQuantity < 80
    )
  `).all() as { id: string }[];

  expect(result).toHaveLength(1);
  expect(result[0].id).toBe("bp2"); // 118/75
});
