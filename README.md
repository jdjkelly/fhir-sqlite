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

-- By identifier (lookup table, auto-populated by trigger)
SELECT p.* FROM Patient p
JOIN Identifier i ON i.resourceId = p.id
WHERE i.system = 'http://hospital.org/mrn' AND i.value = '12345';

-- By name (lookup table, auto-populated by trigger)
SELECT DISTINCT p.* FROM Patient p
JOIN HumanName h ON h.resourceId = p.id
WHERE h.family = 'Smith' OR h.given = 'John';
```

## Tables

### Resource tables (133 total)

Each FHIR resource type gets a table with generated columns for searchable fields:

```
┌──────────────────────────────────────────────────────────────────────────┐
│ Patient                                                                  │
├────┬────────┬────────────┬──────────────────────────┬────────────────────┤
│ id │ gender │ birthdate  │ name                     │ resource           │
├────┼────────┼────────────┼──────────────────────────┼────────────────────┤
│ p1 │ male   │ 1990-01-15 │ [{"family":"Smith",...}] │ {"resourceType"…}  │
└────┴────────┴────────────┴──────────────────────────┴────────────────────┘
       ▲        ▲            ▲
       └────────┴────────────┴── generated columns (auto-extracted from JSON)
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
```

## Usage

```bash
bun install
bun generate.ts > schema.sql
bun test
```

## Stats

- **133** resource tables
- **1480** generated columns
- **2** lookup tables (Identifier, HumanName)

## Requirements

- [Bun](https://bun.sh)

## Gaps / TODO

Complex FHIRPath expressions not yet supported:

- **`.where()` filters** — e.g. `Patient.telecom.where(system='email')` for email/phone search
- **`.exists()` checks** — e.g. `Patient.deceased.exists()` for boolean presence
- **`extension()`** — e.g. `Patient.extension('http://hl7.org/.../mothersMaidenName')`
- **Address lookup table** — like HumanName, for address search

These would need either FHIRPath UDF support (not yet in Bun's SQLite) or additional lookup tables with triggers.

## Acknowledgments

Thanks to [@atomic-ehr](https://github.com/atomic-ehr) for the excellent [fhir-canonical-manager](https://github.com/atomic-ehr/fhir-canonical-manager) — makes working with FHIR packages a breeze.
