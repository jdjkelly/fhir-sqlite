import { test, expect, beforeAll, afterAll } from "bun:test";
import { Database } from "bun:sqlite";
import { readFileSync } from "fs";

let db: Database;

const patients = [
  {
    resourceType: "Patient",
    id: "p1",
    identifier: [
      { system: "http://example.org/mrn", value: "12345" },
      { system: "http://example.org/ssn", value: "999-99-9999" },
    ],
    name: [
      { family: "Smith", given: ["John", "James"], use: "official" },
      { family: "Smithy", given: ["Johnny"], use: "nickname" },
    ],
    gender: "male",
    birthDate: "1990-01-15",
  },
  {
    resourceType: "Patient",
    id: "p2",
    identifier: [{ system: "http://example.org/mrn", value: "67890" }],
    name: [{ family: "Doe", given: ["Jane"], use: "official" }],
    gender: "female",
    birthDate: "1985-06-20",
  },
];

beforeAll(() => {
  db = new Database(":memory:");
  const schema = readFileSync("schema.sql", "utf-8");
  db.exec(schema);

  const insert = db.prepare("INSERT INTO Patient (id, resource) VALUES (?, ?)");
  for (const p of patients) {
    insert.run(p.id, JSON.stringify(p));
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
