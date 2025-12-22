import { Database } from "bun:sqlite";

const ndjsonPath = process.argv[2];
const dbPath = process.argv[3] || "./fhir.db";

if (!ndjsonPath) {
  console.error("Usage: bun import.ts <ndjson-file> [db-path]");
  console.error("");
  console.error("Arguments:");
  console.error("  <ndjson-file>  Path to NDJSON file containing FHIR resources (one JSON per line)");
  console.error("  [db-path]      Path to SQLite database (default: ./fhir.db)");
  console.error("");
  console.error("Example:");
  console.error("  bun import.ts patients.ndjson");
  console.error("  bun import.ts observations.ndjson ./my-fhir.db");
  process.exit(1);
}

// Check if file exists
const file = Bun.file(ndjsonPath);
if (!(await file.exists())) {
  console.error(`Error: File not found: ${ndjsonPath}`);
  process.exit(1);
}

// Check if database exists
const dbFile = Bun.file(dbPath);
if (!(await dbFile.exists())) {
  console.error(`Error: Database not found: ${dbPath}`);
  console.error("Run 'bun run db:create' first to initialize the database.");
  process.exit(1);
}

const db = new Database(dbPath);

// Track resource counts
const resourceCounts: Record<string, number> = {};
let totalResources = 0;
let lineNumber = 0;
const errors: string[] = [];

// Prepare statements cache
const insertStatements: Record<string, ReturnType<Database["prepare"]>> = {};

function getInsertStmt(resourceType: string) {
  if (!insertStatements[resourceType]) {
    const tableName = resourceType === "Group" || resourceType === "Order"
      ? `"${resourceType}"`
      : resourceType;
    try {
      insertStatements[resourceType] = db.prepare(
        `INSERT OR REPLACE INTO ${tableName} (id, resource) VALUES (?, ?)`
      );
    } catch (e: any) {
      // Table doesn't exist
      return null;
    }
  }
  return insertStatements[resourceType];
}

console.log(`Importing from ${ndjsonPath} into ${dbPath}...`);
const startTime = Date.now();

// Read file as text and process line by line
const content = await file.text();
const lines = content.split("\n");

// Process in batches for better performance
const BATCH_SIZE = 1000;
let batch: Array<{ resource: any; line: number }> = [];

function processBatch() {
  if (batch.length === 0) return;

  db.exec("BEGIN TRANSACTION");

  for (const { resource, line } of batch) {
    const stmt = getInsertStmt(resource.resourceType);
    if (!stmt) {
      errors.push(`Line ${line}: Unknown resource type "${resource.resourceType}"`);
      continue;
    }

    try {
      stmt.run(resource.id, JSON.stringify(resource));
      resourceCounts[resource.resourceType] = (resourceCounts[resource.resourceType] || 0) + 1;
      totalResources++;
    } catch (e: any) {
      errors.push(`Line ${line} (${resource.resourceType}/${resource.id}): ${e.message}`);
    }
  }

  db.exec("COMMIT");
  batch = [];
}

for (const line of lines) {
  lineNumber++;
  const trimmed = line.trim();

  // Skip empty lines
  if (!trimmed) continue;

  try {
    const resource = JSON.parse(trimmed);

    if (!resource.resourceType) {
      errors.push(`Line ${lineNumber}: Missing resourceType`);
      continue;
    }

    if (!resource.id) {
      errors.push(`Line ${lineNumber}: Missing id for ${resource.resourceType}`);
      continue;
    }

    batch.push({ resource, line: lineNumber });

    if (batch.length >= BATCH_SIZE) {
      processBatch();
      console.log(`Processed ${lineNumber} lines...`);
    }
  } catch (e: any) {
    errors.push(`Line ${lineNumber}: Invalid JSON - ${e.message}`);
  }
}

// Process remaining batch
processBatch();

const elapsed = (Date.now() - startTime) / 1000;

console.log(`\nImported ${totalResources} resources from ${lineNumber} lines in ${elapsed.toFixed(2)}s`);

if (Object.keys(resourceCounts).length > 0) {
  console.log(`\nResources by type:`);
  const sorted = Object.entries(resourceCounts).sort((a, b) => b[1] - a[1]);
  for (const [type, count] of sorted) {
    console.log(`  ${type}: ${count}`);
  }
}

if (errors.length > 0) {
  console.log(`\nErrors (${errors.length}):`);
  for (const err of errors.slice(0, 10)) {
    console.log(`  ${err}`);
  }
  if (errors.length > 10) {
    console.log(`  ... and ${errors.length - 10} more`);
  }
}

db.close();
