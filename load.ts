import { Database } from "bun:sqlite";
import { Glob } from "bun";

const schemaPath = process.argv[2] || "./schema.sql";
const dataDir = process.argv[3] || "./test-data/fhir_r4/fhir";
const dbPath = process.argv[4] || "./fhir.db";

// Delete existing db
await Bun.$`rm -f ${dbPath}`;

const db = new Database(dbPath);

// Load schema
console.log("Loading schema...");
const schema = await Bun.file(schemaPath).text();
db.exec(schema);

// Get all JSON files
const glob = new Glob("*.json");
const files = [...glob.scanSync(dataDir)];
console.log(`Found ${files.length} bundle files`);

// Track resource counts
const resourceCounts: Record<string, number> = {};
let totalResources = 0;
let loadedFiles = 0;
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
      // Table doesn't exist, skip silently
      return null;
    }
  }
  return insertStatements[resourceType];
}

// Process files
const startTime = Date.now();

for (const file of files) {
  const path = `${dataDir}/${file}`;
  try {
    const content = await Bun.file(path).json();

    if (content.resourceType !== "Bundle" || !content.entry) {
      continue;
    }

    db.exec("BEGIN TRANSACTION");

    for (const entry of content.entry) {
      const resource = entry.resource;
      if (!resource?.resourceType || !resource?.id) continue;

      const stmt = getInsertStmt(resource.resourceType);
      if (!stmt) continue;

      try {
        stmt.run(resource.id, JSON.stringify(resource));
        resourceCounts[resource.resourceType] = (resourceCounts[resource.resourceType] || 0) + 1;
        totalResources++;
      } catch (e: any) {
        errors.push(`${resource.resourceType}/${resource.id}: ${e.message}`);
      }
    }

    db.exec("COMMIT");
    loadedFiles++;

    if (loadedFiles % 100 === 0) {
      console.log(`Loaded ${loadedFiles}/${files.length} files...`);
    }
  } catch (e: any) {
    db.exec("ROLLBACK");
    errors.push(`File ${file}: ${e.message}`);
  }
}

const elapsed = (Date.now() - startTime) / 1000;

console.log(`\nLoaded ${totalResources} resources from ${loadedFiles} files in ${elapsed.toFixed(2)}s`);
console.log(`\nResources by type:`);

const sorted = Object.entries(resourceCounts).sort((a, b) => b[1] - a[1]);
for (const [type, count] of sorted) {
  console.log(`  ${type}: ${count}`);
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

// Show db size
const stats = await Bun.file(dbPath).stat();
console.log(`\nDatabase size: ${(stats.size / 1024 / 1024).toFixed(2)} MB`);

db.close();
