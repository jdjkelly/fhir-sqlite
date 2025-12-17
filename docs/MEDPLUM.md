# Medplum Database Architecture Research

Analysis of Medplum's PostgreSQL schema for FHIR resource storage, particularly around identifiers and token search parameters.

## Main Resource Table Schema

Each FHIR resource type has a dedicated table:

```sql
-- Example: Patient table
CREATE TABLE "Patient" (
  id                  uuid PRIMARY KEY,
  content             text NOT NULL,          -- Full JSON resource
  lastUpdated         timestamp with time zone,
  compartments        uuid[],
  deleted             boolean DEFAULT false,
  projectId           uuid NOT NULL,
  __version           integer NOT NULL,

  -- Simple search params as columns
  active              boolean,
  birthdate           date,
  gender              text,
  deceased            boolean,

  -- Token search params as UUID arrays
  __identifier        uuid[],                 -- Hashed tokens for exact match
  __identifierText    text[],                 -- Raw text for :text/:contains
  __identifierSort    text,                   -- For ORDER BY
  __email             uuid[],
  __emailText         text[],
  __phone             uuid[],
  __phoneText         text[],
  __telecom           uuid[],
  __telecomText       text[],

  -- Reference arrays
  generalPractitioner text[],
  link                text[],
  organization        text
);
```

## Token Storage Strategy

### UUID v5 Hashing

From `token-column.ts:118`:
```typescript
import { NIL, v5 } from 'uuid';

export function hashTokenColumnValue(value: string): string {
  return v5(value, NIL);
}
```

Values are hashed to UUID v5 for:
- Compact, fixed-size storage
- Consistent hashing across instances
- Efficient GIN index lookups

### Multiple Formats Per Token

For an identifier like `{ system: "http://example.org/mrn", value: "12345" }`, multiple hashes are stored to support different query patterns:

| Query Pattern | Stored Format | Example |
|---------------|---------------|---------|
| `:missing`/`:present` | `code` | `"identifier"` |
| `?identifier=http://mrn\|` | `system` | `"http://example.org/mrn"` |
| `?identifier=http://mrn\|12345` | `system + \x01 + value` | `"http://example.org/mrn\x0112345"` |
| `?identifier=12345` | `\x01 + value` | `"\x0112345"` |
| `?identifier=\|12345` | `\x02 + \x01 + value` | `"\x02\x0112345"` |

Special delimiters:
- `\x01` (DELIM) - separates system from value
- `\x02` (NULL_SYSTEM) - represents explicit null system
- `\x03` (ARRAY_DELIM) - separates entries in text array
- `\x04` (TEXT_SEARCH_SYSTEM) - marks text-searchable tokens

### Two Columns Per Token Parameter

1. **`__identifier` (uuid[])** - Hashed values for exact match queries
   - Uses `ARRAY_OVERLAPS` operator with GIN index

2. **`__identifierText` (text[])** - Raw text for fuzzy search
   - Uses trigram indexes (`gin_trgm_ops`) for `:contains`
   - Uses `token_array_to_text()` function for regex matching

## Lookup Tables for Complex Types

### HumanName Table

```sql
CREATE TABLE "HumanName" (
  resourceId uuid NOT NULL,
  name       text,
  given      text,
  family     text
);

-- Indexes
CREATE INDEX "HumanName_resourceId_idx" ON "HumanName" (resourceId);
CREATE INDEX "HumanName_name_idx" ON "HumanName" (name);
CREATE INDEX "HumanName_name_idx_tsv" ON "HumanName" USING gin (to_tsvector('simple', name));
CREATE INDEX "HumanName_nameTrgm_idx" ON "HumanName" USING gin (name gin_trgm_ops);
CREATE INDEX "HumanName_given_idx" ON "HumanName" (given);
CREATE INDEX "HumanName_given_idx_tsv" ON "HumanName" USING gin (to_tsvector('simple', given));
CREATE INDEX "HumanName_givenTrgm_idx" ON "HumanName" USING gin (given gin_trgm_ops);
CREATE INDEX "HumanName_family_idx" ON "HumanName" (family);
CREATE INDEX "HumanName_family_idx_tsv" ON "HumanName" USING gin (to_tsvector('simple', family));
CREATE INDEX "HumanName_familyTrgm_idx" ON "HumanName" USING gin (family gin_trgm_ops);
```

### Address Table

```sql
CREATE TABLE "Address" (
  resourceId uuid NOT NULL,
  address    text,
  city       text,
  country    text,
  postalCode text,
  state      text,
  use        text
);

-- Similar index pattern with btree, tsvector, and trigram indexes
```

### Coding Table (for CodeableConcept/Coding)

```sql
CREATE TABLE "Coding" (
  id        bigint PRIMARY KEY,
  system    uuid NOT NULL,           -- References CodingSystem
  code      text NOT NULL,
  display   text,
  isSynonym boolean NOT NULL,
  synonymOf bigint                   -- Self-reference for synonyms
);

CREATE TABLE "CodingSystem" (
  id     bigint PRIMARY KEY,
  system text NOT NULL UNIQUE        -- The actual system URL
);
```

## Query Patterns

### Exact Token Match
```sql
-- ?identifier=http://mrn|12345
SELECT * FROM "Patient"
WHERE __identifier && ARRAY['<uuid-hash>']::uuid[];
```

### Text/Contains Search
```sql
-- ?identifier:contains=123
SELECT * FROM "Patient"
WHERE token_array_to_text("__identifierText") ~* '\x03identifier\x01[^\x03]*123';
```

### Name Search (via Lookup Table)
```sql
-- ?name=Smith
SELECT p.* FROM "Patient" p
WHERE EXISTS (
  SELECT 1 FROM "HumanName" h
  WHERE h.resourceId = p.id
  AND to_tsvector('simple', h.name) @@ to_tsquery('simple', 'Smith:*')
);
```

## Key Design Decisions

1. **Hybrid approach**: Simple scalars as columns, complex types as lookup tables or arrays
2. **UUID hashing**: Normalizes variable-length tokens to fixed-size for indexing
3. **Multiple hash formats**: Supports all FHIR token search semantics
4. **Separate text columns**: Enables fuzzy search without affecting exact match performance
5. **GIN indexes**: PostgreSQL-specific for efficient array containment queries

## Implications for SQLite

SQLite lacks:
- UUID type (use TEXT)
- Array types (use lookup tables or JSON)
- GIN indexes (use btree on lookup tables)
- Trigram indexes (use LIKE or FTS5)
- tsvector/tsquery (use FTS5)

Proposed SQLite alternative:

```sql
-- Identifier lookup table
CREATE TABLE Identifier (
  resourceType TEXT NOT NULL,
  resourceId   TEXT NOT NULL,
  system       TEXT,
  value        TEXT NOT NULL,
  PRIMARY KEY (resourceType, resourceId, COALESCE(system, ''), value)
);

CREATE INDEX idx_identifier_value ON Identifier(resourceType, value);
CREATE INDEX idx_identifier_system_value ON Identifier(resourceType, system, value);

-- HumanName lookup table
CREATE TABLE HumanName (
  resourceType TEXT NOT NULL,
  resourceId   TEXT NOT NULL,
  name         TEXT,
  given        TEXT,
  family       TEXT
);

CREATE INDEX idx_humanname_resource ON HumanName(resourceType, resourceId);
CREATE INDEX idx_humanname_family ON HumanName(resourceType, family);
CREATE INDEX idx_humanname_given ON HumanName(resourceType, given);
```

## Source Files

- `/packages/server/src/fhir/lookups/lookuptable.ts` - Base lookup table class
- `/packages/server/src/fhir/lookups/humanname.ts` - HumanName implementation
- `/packages/server/src/fhir/lookups/address.ts` - Address implementation
- `/packages/server/src/fhir/lookups/coding.ts` - Coding implementation
- `/packages/server/src/fhir/tokens.ts` - Token extraction logic
- `/packages/server/src/fhir/token-column.ts` - Token column storage and querying
