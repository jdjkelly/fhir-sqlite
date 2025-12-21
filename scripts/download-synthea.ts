const DATA_DIR = "./test-data";
const FHIR_DIR = `${DATA_DIR}/fhir_r4`;
const ZIP_FILE = `${DATA_DIR}/synthea_fhir_r4.zip`;
const URL = "https://synthetichealth.github.io/synthea-sample-data/downloads/synthea_sample_data_fhir_r4_sep2019.zip";

// Check if already downloaded
const fhirPath = `${FHIR_DIR}/fhir`;
const existing = await Bun.file(fhirPath).exists();
if (existing) {
  const files = await Array.fromAsync(new Bun.Glob("*.json").scan(fhirPath));
  if (files.length > 0) {
    console.log(`Test data already exists at ${fhirPath} (${files.length} files)`);
    console.log(`To re-download, remove the directory first: rm -rf ${DATA_DIR}`);
    process.exit(0);
  }
}

await Bun.$`mkdir -p ${DATA_DIR}`;

console.log("Downloading Synthea FHIR R4 sample data (~85MB)...");
const response = await fetch(URL);
if (!response.ok) {
  console.error(`Failed to download: ${response.status} ${response.statusText}`);
  process.exit(1);
}

await Bun.write(ZIP_FILE, response);
console.log("Download complete.");

console.log("Extracting...");
await Bun.$`unzip -o ${ZIP_FILE} -d ${FHIR_DIR}`;

console.log("Cleaning up...");
await Bun.$`rm ${ZIP_FILE}`;

const files = await Array.fromAsync(new Bun.Glob("*.json").scan(fhirPath));
console.log(`Done! ${files.length} bundle files downloaded to ${fhirPath}`);
