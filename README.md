<div align="center">

# fhir-sqlite

**SQLite schema generator for FHIR R4 resources**

*Store FHIR resources as JSON, query via SQL. Automatic indexing, lookup tables, and search parameter extraction.*

[Quick Start](#quick-start) · [How It Works](#how-it-works) · [Tables](#tables) · [Commands](#commands)

</div>

---

## Architecture

```
  NDJSON / Bundle                  fhir.db                   SQL Queries
  ───────────────                  ───────                   ───────────

  {"resourceType":              ╔══════════════╗            SELECT * FROM Patient
   "Patient",        ────────▶  ║   Patient    ║  ◀───────  WHERE gender = 'male'
   "id": "p1",                  ║   Observation║
   "gender": "male"}            ║   Condition  ║
                                ║   ...133 more║
                                ╚══════╤═══════╝
                                       │
                        ┌──────────────┼──────────────┐
                        ▼              ▼              ▼
                 ╔════════════╗ ╔════════════╗ ╔════════════╗
                 ║ Identifier ║ ║ HumanName  ║ ║   Coding   ║
                 ║  (lookup)  ║ ║  (lookup)  ║ ║  (lookup)  ║
                 ╚════════════╝ ╚════════════╝ ╚════════════╝
                        │              │              │
                        └──────────────┴──────────────┘
                                       │
                                Triggers auto-populate
                                lookup tables on INSERT
```

## Quick Start

```
╭─────────────────────────────────────────────────────────────────────╮
│                                                                     │
│  $ bun install                                                      │
│  $ bun run db:schema          # Generate schema.sql                 │
│  $ bun run db:create          # Create fhir.db with sample data     │
│                                                                     │
│  $ bun run db:import data.ndjson   # Import your own NDJSON         │
│                                                                     │
│  $ sqlite3 fhir.db "SELECT * FROM Patient LIMIT 5"                  │
│                                                                     │
╰─────────────────────────────────────────────────────────────────────╯
```

## How It Works

**1. Store** — Insert `id` and `resource`. Everything else is automatic:

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

What happens automatically:
- Generated columns extract `gender`, `birthDate`, etc.
- Meta fields extracted (`versionId`, `lastUpdated`, `profile`)
- Triggers parse `identifier[]` → Identifier lookup table
- Triggers parse `name[]` → HumanName lookup table

**2. Search** — Query via generated columns or lookup tables:

<details>
<summary><b>Generated column queries</b></summary>

```sql
-- By generated column
SELECT * FROM Patient WHERE gender = 'male' AND birthdate > '1980-01-01';

-- By meta fields (versionId, lastUpdated, profile)
SELECT * FROM Patient WHERE lastUpdated > '2024-01-01';
SELECT * FROM Patient WHERE profile IS NOT NULL;

-- By quantity value (generated column, numeric comparison)
SELECT * FROM Observation WHERE value_quantity > 100;
SELECT * FROM Observation WHERE value_quantity BETWEEN 70 AND 100;
```
</details>

<details>
<summary><b>Lookup table queries (identifier, name, address, telecom)</b></summary>

```sql
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
```
</details>

<details>
<summary><b>Coding queries (LOINC, SNOMED, ICD, etc.)</b></summary>

```sql
-- By LOINC code (lookup table, auto-populated by trigger)
SELECT DISTINCT o.* FROM Observation o
JOIN Coding c ON c.resourceId = o.id AND c.resourceType = 'Observation'
WHERE c.path = 'code' AND c.system = 'http://loinc.org' AND c.code = '8867-4';

-- By category (lookup table, auto-populated by trigger)
SELECT DISTINCT o.* FROM Observation o
JOIN Coding c ON c.resourceId = o.id AND c.resourceType = 'Observation'
WHERE c.path = 'category' AND c.code = 'vital-signs';
```
</details>

<details>
<summary><b>Composite search (blood pressure, panels)</b></summary>

```sql
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
</details>

## Tables

### Resource tables (133 total)

Each FHIR resource type gets a table with generated columns for searchable fields:

```
╔════════════════════════════════════════════════════════════════════════════════════════════╗
║ Patient                                                                                    ║
╠════╦═══════════╦══════════════════════╦════════════════════════╦════════╦══════════╦═══════╣
║ id ║ versionId ║ lastUpdated          ║ profile                ║ gender ║ birthdate║resource║
╠════╬═══════════╬══════════════════════╬════════════════════════╬════════╬══════════╬═══════╣
║ p1 ║ 3         ║ 2024-06-15T10:30:00Z ║ ["http://hl7.org/..."] ║ male   ║1990-01-15║ {...} ║
╚════╩═══════════╩══════════════════════╩════════════════════════╩════════╩══════════╩═══════╝
      ▲           ▲                      ▲                        ▲        ▲
      └───────────┴──────────────────────┴────────────────────────┴────────┴── generated columns
```

### Lookup tables

Triggers auto-populate 6 lookup tables on every INSERT:

<details open>
<summary><b>Identifier</b> — MRNs, SSNs, any system/value pair</summary>

```
╔══════════════╦════════════╦═══════════════════════╦═══════════╗
║ resourceType ║ resourceId ║ system                ║ value     ║
╠══════════════╬════════════╬═══════════════════════╬═══════════╣
║ Patient      ║ p1         ║ http://hospital.org/… ║ 12345     ║
╚══════════════╩════════════╩═══════════════════════╩═══════════╝
```
</details>

<details>
<summary><b>HumanName</b> — family/given name search</summary>

```
╔══════════════╦════════════╦════════════╦══════════════════╗
║ resourceType ║ resourceId ║ family     ║ given            ║
╠══════════════╬════════════╬════════════╬══════════════════╣
║ Patient      ║ p1         ║ Smith      ║ John             ║
║ Patient      ║ p1         ║ Smith      ║ James            ║
╚══════════════╩════════════╩════════════╩══════════════════╝
```
</details>

<details>
<summary><b>Address</b> — geographic search</summary>

```
╔══════════════╦════════════╦════════╦═══════╦════════════╦══════════╗
║ resourceType ║ resourceId ║ city   ║ state ║ postalCode ║ country  ║
╠══════════════╬════════════╬════════╬═══════╬════════════╬══════════╣
║ Patient      ║ p1         ║ Boston ║ MA    ║ 02101      ║ USA      ║
╚══════════════╩════════════╩════════╩═══════╩════════════╩══════════╝
```
</details>

<details>
<summary><b>ContactPoint</b> — phone, email, fax</summary>

```
╔══════════════╦════════════╦═════════╦══════════════════════╦══════════╗
║ resourceType ║ resourceId ║ system  ║ value                ║ use      ║
╠══════════════╬════════════╬═════════╬══════════════════════╬══════════╣
║ Patient      ║ p1         ║ phone   ║ 555-1234             ║ home     ║
║ Patient      ║ p1         ║ email   ║ john@example.com     ║ work     ║
╚══════════════╩════════════╩═════════╩══════════════════════╩══════════╝
```
</details>

<details>
<summary><b>Coding</b> — terminology search (LOINC, SNOMED, ICD)</summary>

```
╔══════════════╦════════════╦══════════╦═══════════════════╦═════════╦═══════════════╗
║ resourceType ║ resourceId ║ path     ║ system            ║ code    ║ display       ║
╠══════════════╬════════════╬══════════╬═══════════════════╬═════════╬═══════════════╣
║ Observation  ║ obs1       ║ code     ║ http://loinc.org  ║ 8867-4  ║ Heart rate    ║
║ Observation  ║ obs1       ║ category ║ http://term...    ║ vital…  ║ Vital Signs   ║
╚══════════════╩════════════╩══════════╩═══════════════════╩═════════╩═══════════════╝
```
</details>

<details>
<summary><b>ObservationComponent</b> — composite search (blood pressure, panels)</summary>

```
╔════════════╦════════════════════╦═════════╦══════════════════════════════╦═══════════════╗
║ resourceId ║ codeSystem         ║ code    ║ codeDisplay                  ║ valueQuantity ║
╠════════════╬════════════════════╬═════════╬══════════════════════════════╬═══════════════╣
║ bp1        ║ http://loinc.org   ║ 8480-6  ║ Systolic blood pressure      ║ 145           ║
║ bp1        ║ http://loinc.org   ║ 8462-4  ║ Diastolic blood pressure     ║ 90            ║
╚════════════╩════════════════════╩═════════╩══════════════════════════════╩═══════════════╝
```
</details>

## Commands

| Command | Description |
|---------|-------------|
| `bun run db:schema` | Generate `schema.sql` from FHIR R4 SearchParameter definitions |
| `bun run db:create` | Create database, load schema, and import Synthea sample data |
| `bun run db:import <file>` | Import NDJSON file into existing database |
| `bun test` | Run tests |

## Roadmap

- [ ] FHIRPath UDF columns (`.exists()`, `extension()`, etc.) — waiting on [bun:sqlite UDF support](https://github.com/oven-sh/bun/issues/5051)

## Acknowledgments

Built with [@atomic-ehr/fhir-canonical-manager](https://github.com/atomic-ehr/fhir-canonical-manager).
