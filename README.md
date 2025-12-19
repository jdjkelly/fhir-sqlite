# fhir-sqlite

SQLite schema generator for FHIR R4 resources.

Uses [@atomic-ehr/fhir-canonical-manager](https://github.com/atomic-ehr/fhir-canonical-manager) for FHIR package management.

## How it works

**1. Store** — Just insert `id` and `resource`. Everything else is automatic:

```sql
INSERT INTO Patient (id, resource) VALUES ('p1', '{
  "resourceType": "Patient",
  "id": "p1",
  "identifier": [{"system": "http://hospital.org/mrn", "value": "12345"}],
  "name": [{"family": "Smith", "given": ["John", "James"]}],
  "gender": "male",
  "birthDate": "1990-01-15"
}');
```

**2. Search** — Query via generated columns or lookup tables:

```sql
-- By generated column
SELECT * FROM Patient WHERE gender = 'male' AND birthdate > '1980-01-01';

-- By meta fields (versionId, lastUpdated, profile)
SELECT * FROM Patient WHERE lastUpdated > '2024-01-01';
SELECT * FROM Patient WHERE profile IS NOT NULL;

-- By identifier (lookup table, auto-populated by trigger)
SELECT p.* FROM Patient p
JOIN Identifier i ON i.resourceId = p.id
WHERE i.system = 'http://hospital.org/mrn' AND i.value = '12345';

-- By name (lookup table, auto-populated by trigger)
SELECT DISTINCT p.* FROM Patient p
JOIN HumanName h ON h.resourceId = p.id
WHERE h.family = 'Smith' OR h.given = 'John';

-- By address (lookup table, auto-populated by trigger)
SELECT DISTINCT p.* FROM Patient p
JOIN Address a ON a.resourceId = p.id
WHERE a.city = 'Boston' AND a.state = 'MA';

-- By email (lookup table, auto-populated by trigger)
SELECT DISTINCT p.* FROM Patient p
JOIN ContactPoint c ON c.resourceId = p.id
WHERE c.system = 'email' AND c.value = 'john@example.com';

-- By phone (lookup table, auto-populated by trigger)
SELECT DISTINCT p.* FROM Patient p
JOIN ContactPoint c ON c.resourceId = p.id
WHERE c.system = 'phone';

-- By LOINC code (lookup table, auto-populated by trigger)
SELECT DISTINCT o.* FROM Observation o
JOIN Coding c ON c.resourceId = o.id AND c.resourceType = 'Observation'
WHERE c.path = 'code' AND c.system = 'http://loinc.org' AND c.code = '8867-4';

-- By category (lookup table, auto-populated by trigger)
SELECT DISTINCT o.* FROM Observation o
JOIN Coding c ON c.resourceId = o.id AND c.resourceType = 'Observation'
WHERE c.path = 'category' AND c.code = 'vital-signs';

-- By quantity value (generated column, numeric comparison)
SELECT * FROM Observation WHERE value_quantity > 100;
SELECT * FROM Observation WHERE value_quantity BETWEEN 70 AND 100;

-- Composite search: blood pressure with systolic > 140 (hypertension)
SELECT DISTINCT o.* FROM Observation o
JOIN ObservationComponent c ON c.resourceId = o.id
WHERE c.codeSystem = 'http://loinc.org'
  AND c.code = '8480-6'
  AND c.valueQuantity > 140;

-- Find patients with normal blood pressure (both systolic < 120 AND diastolic < 80)
SELECT DISTINCT o.* FROM Observation o
WHERE EXISTS (
  SELECT 1 FROM ObservationComponent c
  WHERE c.resourceId = o.id AND c.code = '8480-6' AND c.valueQuantity < 120
)
AND EXISTS (
  SELECT 1 FROM ObservationComponent c
  WHERE c.resourceId = o.id AND c.code = '8462-4' AND c.valueQuantity < 80
);
```

## Tables

### Resource tables (133 total)

Each FHIR resource type gets a table with generated columns for searchable fields:

```
┌────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Patient                                                                                                    │
├────┬───────────┬──────────────────────┬─────────────────────────┬────────┬────────────┬────────────────────┤
│ id │ versionId │ lastUpdated          │ profile                 │ gender │ birthdate  │ resource           │
├────┼───────────┼──────────────────────┼─────────────────────────┼────────┼────────────┼────────────────────┤
│ p1 │ 3         │ 2024-06-15T10:30:00Z │ ["http://hl7.org/..."]  │ male   │ 1990-01-15 │ {"resourceType"…}  │
└────┴───────────┴──────────────────────┴─────────────────────────┴────────┴────────────┴────────────────────┘
       ▲           ▲                      ▲                         ▲        ▲
       └───────────┴──────────────────────┴─────────────────────────┴────────┴── generated columns (auto-extracted from JSON)
```

### Lookup tables

Triggers auto-populate lookup tables on insert:

```
┌───────────────────────────────────────────────────────────┐
│ Identifier                                                │
├──────────────┬────────────┬───────────────────┬───────────┤
│ resourceType │ resourceId │ system            │ value     │
├──────────────┼────────────┼───────────────────┼───────────┤
│ Patient      │ p1         │ http://hospital…  │ 12345     │
└──────────────┴────────────┴───────────────────┴───────────┘

┌───────────────────────────────────────────────────────────┐
│ HumanName                                                 │
├──────────────┬────────────┬────────────┬──────────────────┤
│ resourceType │ resourceId │ family     │ given            │
├──────────────┼────────────┼────────────┼──────────────────┤
│ Patient      │ p1         │ Smith      │ John             │
│ Patient      │ p1         │ Smith      │ James            │
└──────────────┴────────────┴────────────┴──────────────────┘

┌────────────────────────────────────────────────────────────────────────────┐
│ Address                                                                    │
├──────────────┬────────────┬────────┬───────┬────────────┬──────────────────┤
│ resourceType │ resourceId │ city   │ state │ postalCode │ country          │
├──────────────┼────────────┼────────┼───────┼────────────┼──────────────────┤
│ Patient      │ p1         │ Boston │ MA    │ 02101      │ USA              │
└──────────────┴────────────┴────────┴───────┴────────────┴──────────────────┘

┌───────────────────────────────────────────────────────────────────────────┐
│ ContactPoint                                                              │
├──────────────┬────────────┬─────────┬──────────────────────┬──────────────┤
│ resourceType │ resourceId │ system  │ value                │ use          │
├──────────────┼────────────┼─────────┼──────────────────────┼──────────────┤
│ Patient      │ p1         │ phone   │ 555-1234             │ home         │
│ Patient      │ p1         │ email   │ john@example.com     │ work         │
└──────────────┴────────────┴─────────┴──────────────────────┴──────────────┘

┌──────────────────────────────────────────────────────────────────────────────────────┐
│ Coding                                                                               │
├──────────────┬────────────┬──────────┬───────────────────┬─────────┬─────────────────┤
│ resourceType │ resourceId │ path     │ system            │ code    │ display         │
├──────────────┼────────────┼──────────┼───────────────────┼─────────┼─────────────────┤
│ Observation  │ obs1       │ code     │ http://loinc.org  │ 8867-4  │ Heart rate      │
│ Observation  │ obs1       │ category │ http://term...    │ vital…  │ Vital Signs     │
└──────────────┴────────────┴──────────┴───────────────────┴─────────┴─────────────────┘

┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│ ObservationComponent (for composite search like component-code-value-quantity)               │
├────────────┬────────────────────┬─────────┬──────────────────────────────┬───────────────────┤
│ resourceId │ codeSystem         │ code    │ codeDisplay                  │ valueQuantity     │
├────────────┼────────────────────┼─────────┼──────────────────────────────┼───────────────────┤
│ bp1        │ http://loinc.org   │ 8480-6  │ Systolic blood pressure      │ 145               │
│ bp1        │ http://loinc.org   │ 8462-4  │ Diastolic blood pressure     │ 90                │
└────────────┴────────────────────┴─────────┴──────────────────────────────┴───────────────────┘
```

## Usage

```bash
bun install
bun generate.ts > schema.sql
bun test
```

## Stats

- **133** resource tables
- **1480+** generated columns (plus 3 meta columns per table: versionId, lastUpdated, profile)
- **6** lookup tables (Identifier, HumanName, Address, ContactPoint, Coding, ObservationComponent)
- **428** indexes (lookup tables + reference columns)

## Requirements

- [Bun](https://bun.sh)

## Gaps / TODO

Complex FHIRPath expressions not yet supported:

- **`.exists()` checks** — e.g. `Patient.deceased.exists()` for boolean presence
- **`extension()`** — e.g. `Patient.extension('http://hl7.org/.../mothersMaidenName')`

These would need FHIRPath UDF support (not yet in Bun's SQLite).

## Acknowledgments

Thanks to [@atomic-ehr](https://github.com/atomic-ehr) for the excellent [fhir-canonical-manager](https://github.com/atomic-ehr/fhir-canonical-manager) — makes working with FHIR packages a breeze.
