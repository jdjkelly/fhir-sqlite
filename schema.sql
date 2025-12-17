-- fhir-sqlite schema (simple paths only, no UDF required)
-- Generated from FHIR R4 SearchParameters

-- Account: 7 columns (1 complex skipped)
CREATE TABLE Account (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  owner TEXT GENERATED ALWAYS AS (resource ->> '$.owner.reference') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.servicePeriod') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- ActivityDefinition: 15 columns (7 complex skipped)
CREATE TABLE ActivityDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  topic TEXT GENERATED ALWAYS AS (resource ->> '$.topic') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- AdverseEvent: 12 columns (0 complex skipped)
CREATE TABLE AdverseEvent (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  actuality TEXT GENERATED ALWAYS AS (resource ->> '$.actuality') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  event TEXT GENERATED ALWAYS AS (resource ->> '$.event') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  recorder TEXT GENERATED ALWAYS AS (resource ->> '$.recorder.reference') STORED,
  resultingcondition TEXT GENERATED ALWAYS AS (resource ->> '$.resultingCondition.reference') STORED,
  seriousness TEXT GENERATED ALWAYS AS (resource ->> '$.seriousness') STORED,
  severity TEXT GENERATED ALWAYS AS (resource ->> '$.severity') STORED,
  study TEXT GENERATED ALWAYS AS (resource ->> '$.study.reference') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  substance TEXT GENERATED ALWAYS AS (resource ->> '$.suspectEntity.instance.reference') STORED
);

-- AllergyIntolerance: 16 columns (0 complex skipped)
CREATE TABLE AllergyIntolerance (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  asserter TEXT GENERATED ALWAYS AS (resource ->> '$.asserter.reference') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  clinical_status TEXT GENERATED ALWAYS AS (resource ->> '$.clinicalStatus') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  criticality TEXT GENERATED ALWAYS AS (resource ->> '$.criticality') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.recordedDate') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  last_date TEXT GENERATED ALWAYS AS (resource ->> '$.lastOccurrence') STORED,
  manifestation TEXT GENERATED ALWAYS AS (resource ->> '$.reaction.manifestation') STORED,
  onset TEXT GENERATED ALWAYS AS (resource ->> '$.reaction.onset') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  recorder TEXT GENERATED ALWAYS AS (resource ->> '$.recorder.reference') STORED,
  route TEXT GENERATED ALWAYS AS (resource ->> '$.reaction.exposureRoute') STORED,
  severity TEXT GENERATED ALWAYS AS (resource ->> '$.reaction.severity') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  verification_status TEXT GENERATED ALWAYS AS (resource ->> '$.verificationStatus') STORED
);

-- Appointment: 14 columns (3 complex skipped)
CREATE TABLE Appointment (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  actor TEXT GENERATED ALWAYS AS (resource ->> '$.participant.actor.reference') STORED,
  appointment_type TEXT GENERATED ALWAYS AS (resource ->> '$.appointmentType') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.start') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  part_status TEXT GENERATED ALWAYS AS (resource ->> '$.participant.status') STORED,
  reason_code TEXT GENERATED ALWAYS AS (resource ->> '$.reasonCode') STORED,
  reason_reference TEXT GENERATED ALWAYS AS (resource ->> '$.reasonReference.reference') STORED,
  service_category TEXT GENERATED ALWAYS AS (resource ->> '$.serviceCategory') STORED,
  service_type TEXT GENERATED ALWAYS AS (resource ->> '$.serviceType') STORED,
  slot TEXT GENERATED ALWAYS AS (resource ->> '$.slot.reference') STORED,
  specialty TEXT GENERATED ALWAYS AS (resource ->> '$.specialty') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  supporting_info TEXT GENERATED ALWAYS AS (resource ->> '$.supportingInformation.reference') STORED
);

-- AppointmentResponse: 4 columns (3 complex skipped)
CREATE TABLE AppointmentResponse (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  actor TEXT GENERATED ALWAYS AS (resource ->> '$.actor.reference') STORED,
  appointment TEXT GENERATED ALWAYS AS (resource ->> '$.appointment.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  part_status TEXT GENERATED ALWAYS AS (resource ->> '$.participantStatus') STORED
);

-- AuditEvent: 17 columns (1 complex skipped)
CREATE TABLE AuditEvent (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  action TEXT GENERATED ALWAYS AS (resource ->> '$.action') STORED,
  address TEXT GENERATED ALWAYS AS (resource ->> '$.agent.network.address') STORED,
  agent TEXT GENERATED ALWAYS AS (resource ->> '$.agent.who.reference') STORED,
  agent_name TEXT GENERATED ALWAYS AS (resource ->> '$.agent.name') STORED,
  agent_role TEXT GENERATED ALWAYS AS (resource ->> '$.agent.role') STORED,
  altid TEXT GENERATED ALWAYS AS (resource ->> '$.agent.altId') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.recorded') STORED,
  entity TEXT GENERATED ALWAYS AS (resource ->> '$.entity.what.reference') STORED,
  entity_name TEXT GENERATED ALWAYS AS (resource ->> '$.entity.name') STORED,
  entity_role TEXT GENERATED ALWAYS AS (resource ->> '$.entity.role') STORED,
  entity_type TEXT GENERATED ALWAYS AS (resource ->> '$.entity.type') STORED,
  outcome TEXT GENERATED ALWAYS AS (resource ->> '$.outcome') STORED,
  policy TEXT GENERATED ALWAYS AS (resource ->> '$.agent.policy') STORED,
  site TEXT GENERATED ALWAYS AS (resource ->> '$.source.site') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.source.observer.reference') STORED,
  subtype TEXT GENERATED ALWAYS AS (resource ->> '$.subtype') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- Basic: 5 columns (1 complex skipped)
CREATE TABLE Basic (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- BodyStructure: 4 columns (0 complex skipped)
CREATE TABLE BodyStructure (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location') STORED,
  morphology TEXT GENERATED ALWAYS AS (resource ->> '$.morphology') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED
);

-- Bundle: 5 columns (0 complex skipped)
CREATE TABLE Bundle (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  composition TEXT GENERATED ALWAYS AS (resource ->> '$.entry[0].resource.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  message TEXT GENERATED ALWAYS AS (resource ->> '$.entry[0].resource.reference') STORED,
  timestamp TEXT GENERATED ALWAYS AS (resource ->> '$.timestamp') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- CapabilityStatement: 21 columns (2 complex skipped)
CREATE TABLE CapabilityStatement (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  fhirversion TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED,
  format TEXT GENERATED ALWAYS AS (resource ->> '$.format') STORED,
  guide TEXT GENERATED ALWAYS AS (resource ->> '$.implementationGuide.reference') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  mode TEXT GENERATED ALWAYS AS (resource ->> '$.rest.mode') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  resource_ TEXT GENERATED ALWAYS AS (resource ->> '$.rest.resource.type') STORED,
  resource_profile TEXT GENERATED ALWAYS AS (resource ->> '$.rest.resource.profile.reference') STORED,
  security_service TEXT GENERATED ALWAYS AS (resource ->> '$.rest.security.service') STORED,
  software TEXT GENERATED ALWAYS AS (resource ->> '$.software.name') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  supported_profile TEXT GENERATED ALWAYS AS (resource ->> '$.rest.resource.supportedProfile.reference') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- CarePlan: 19 columns (1 complex skipped)
CREATE TABLE CarePlan (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  activity_code TEXT GENERATED ALWAYS AS (resource ->> '$.activity.detail.code') STORED,
  activity_date TEXT GENERATED ALWAYS AS (resource ->> '$.activity.detail.scheduled') STORED,
  activity_reference TEXT GENERATED ALWAYS AS (resource ->> '$.activity.reference.reference') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  care_team TEXT GENERATED ALWAYS AS (resource ->> '$.careTeam.reference') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  condition TEXT GENERATED ALWAYS AS (resource ->> '$.addresses.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  goal TEXT GENERATED ALWAYS AS (resource ->> '$.goal.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  intent TEXT GENERATED ALWAYS AS (resource ->> '$.intent') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.activity.detail.performer.reference') STORED,
  replaces TEXT GENERATED ALWAYS AS (resource ->> '$.replaces.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- CareTeam: 7 columns (1 complex skipped)
CREATE TABLE CareTeam (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  participant TEXT GENERATED ALWAYS AS (resource ->> '$.participant.member.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- ChargeItem: 16 columns (1 complex skipped)
CREATE TABLE ChargeItem (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  account TEXT GENERATED ALWAYS AS (resource ->> '$.account.reference') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  context TEXT GENERATED ALWAYS AS (resource ->> '$.context.reference') STORED,
  entered_date TEXT GENERATED ALWAYS AS (resource ->> '$.enteredDate') STORED,
  enterer TEXT GENERATED ALWAYS AS (resource ->> '$.enterer.reference') STORED,
  factor_override REAL GENERATED ALWAYS AS (resource ->> '$.factorOverride') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  occurrence TEXT GENERATED ALWAYS AS (resource ->> '$.occurrence') STORED,
  performer_actor TEXT GENERATED ALWAYS AS (resource ->> '$.performer.actor.reference') STORED,
  performer_function TEXT GENERATED ALWAYS AS (resource ->> '$.performer.function') STORED,
  performing_organization TEXT GENERATED ALWAYS AS (resource ->> '$.performingOrganization.reference') STORED,
  price_override TEXT GENERATED ALWAYS AS (resource ->> '$.priceOverride') STORED,
  quantity TEXT GENERATED ALWAYS AS (resource ->> '$.quantity') STORED,
  requesting_organization TEXT GENERATED ALWAYS AS (resource ->> '$.requestingOrganization.reference') STORED,
  service TEXT GENERATED ALWAYS AS (resource ->> '$.service.reference') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- ChargeItemDefinition: 13 columns (2 complex skipped)
CREATE TABLE ChargeItemDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Claim: 17 columns (0 complex skipped)
CREATE TABLE Claim (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  care_team TEXT GENERATED ALWAYS AS (resource ->> '$.careTeam.provider.reference') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  detail_udi TEXT GENERATED ALWAYS AS (resource ->> '$.item.detail.udi.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.item.encounter.reference') STORED,
  enterer TEXT GENERATED ALWAYS AS (resource ->> '$.enterer.reference') STORED,
  facility TEXT GENERATED ALWAYS AS (resource ->> '$.facility.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  insurer TEXT GENERATED ALWAYS AS (resource ->> '$.insurer.reference') STORED,
  item_udi TEXT GENERATED ALWAYS AS (resource ->> '$.item.udi.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  payee TEXT GENERATED ALWAYS AS (resource ->> '$.payee.party.reference') STORED,
  priority TEXT GENERATED ALWAYS AS (resource ->> '$.priority') STORED,
  procedure_udi TEXT GENERATED ALWAYS AS (resource ->> '$.procedure.udi.reference') STORED,
  provider TEXT GENERATED ALWAYS AS (resource ->> '$.provider.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subdetail_udi TEXT GENERATED ALWAYS AS (resource ->> '$.item.detail.subDetail.udi.reference') STORED,
  use TEXT GENERATED ALWAYS AS (resource ->> '$.use') STORED
);

-- ClaimResponse: 11 columns (0 complex skipped)
CREATE TABLE ClaimResponse (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  disposition TEXT GENERATED ALWAYS AS (resource ->> '$.disposition') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  insurer TEXT GENERATED ALWAYS AS (resource ->> '$.insurer.reference') STORED,
  outcome TEXT GENERATED ALWAYS AS (resource ->> '$.outcome') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  payment_date TEXT GENERATED ALWAYS AS (resource ->> '$.payment.date') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.request.reference') STORED,
  requestor TEXT GENERATED ALWAYS AS (resource ->> '$.requestor.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  use TEXT GENERATED ALWAYS AS (resource ->> '$.use') STORED
);

-- ClinicalImpression: 12 columns (1 complex skipped)
CREATE TABLE ClinicalImpression (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  assessor TEXT GENERATED ALWAYS AS (resource ->> '$.assessor.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  finding_code TEXT GENERATED ALWAYS AS (resource ->> '$.finding.itemCodeableConcept') STORED,
  finding_ref TEXT GENERATED ALWAYS AS (resource ->> '$.finding.itemReference.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  investigation TEXT GENERATED ALWAYS AS (resource ->> '$.investigation.item.reference') STORED,
  previous TEXT GENERATED ALWAYS AS (resource ->> '$.previous.reference') STORED,
  problem TEXT GENERATED ALWAYS AS (resource ->> '$.problem.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  supporting_info TEXT GENERATED ALWAYS AS (resource ->> '$.supportingInfo.reference') STORED
);

-- CodeSystem: 18 columns (2 complex skipped)
CREATE TABLE CodeSystem (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.concept.code') STORED,
  content_mode TEXT GENERATED ALWAYS AS (resource ->> '$.content') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  language TEXT GENERATED ALWAYS AS (resource ->> '$.concept.designation.language') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  supplements TEXT GENERATED ALWAYS AS (resource ->> '$.supplements.reference') STORED,
  system TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Communication: 14 columns (1 complex skipped)
CREATE TABLE Communication (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  medium TEXT GENERATED ALWAYS AS (resource ->> '$.medium') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  received TEXT GENERATED ALWAYS AS (resource ->> '$.received') STORED,
  recipient TEXT GENERATED ALWAYS AS (resource ->> '$.recipient.reference') STORED,
  sender TEXT GENERATED ALWAYS AS (resource ->> '$.sender.reference') STORED,
  sent TEXT GENERATED ALWAYS AS (resource ->> '$.sent') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- CommunicationRequest: 14 columns (2 complex skipped)
CREATE TABLE CommunicationRequest (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  authored TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  group_identifier TEXT GENERATED ALWAYS AS (resource ->> '$.groupIdentifier') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  medium TEXT GENERATED ALWAYS AS (resource ->> '$.medium') STORED,
  priority TEXT GENERATED ALWAYS AS (resource ->> '$.priority') STORED,
  recipient TEXT GENERATED ALWAYS AS (resource ->> '$.recipient.reference') STORED,
  replaces TEXT GENERATED ALWAYS AS (resource ->> '$.replaces.reference') STORED,
  requester TEXT GENERATED ALWAYS AS (resource ->> '$.requester.reference') STORED,
  sender TEXT GENERATED ALWAYS AS (resource ->> '$.sender.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- CompartmentDefinition: 12 columns (2 complex skipped)
CREATE TABLE CompartmentDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  resource_ TEXT GENERATED ALWAYS AS (resource ->> '$.resource.code') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Composition: 15 columns (3 complex skipped)
CREATE TABLE Composition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  attester TEXT GENERATED ALWAYS AS (resource ->> '$.attester.party.reference') STORED,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  confidentiality TEXT GENERATED ALWAYS AS (resource ->> '$.confidentiality') STORED,
  context TEXT GENERATED ALWAYS AS (resource ->> '$.event.code') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  entry TEXT GENERATED ALWAYS AS (resource ->> '$.section.entry.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.event.period') STORED,
  section TEXT GENERATED ALWAYS AS (resource ->> '$.section.code') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- ConceptMap: 20 columns (6 complex skipped)
CREATE TABLE ConceptMap (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  dependson TEXT GENERATED ALWAYS AS (resource ->> '$.group.element.target.dependsOn.property') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  other TEXT GENERATED ALWAYS AS (resource ->> '$.group.unmapped.url.reference') STORED,
  product TEXT GENERATED ALWAYS AS (resource ->> '$.group.element.target.product.property') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  source_code TEXT GENERATED ALWAYS AS (resource ->> '$.group.element.code') STORED,
  source_system TEXT GENERATED ALWAYS AS (resource ->> '$.group.source') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  target_code TEXT GENERATED ALWAYS AS (resource ->> '$.group.element.target.code') STORED,
  target_system TEXT GENERATED ALWAYS AS (resource ->> '$.group.target') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Condition: 20 columns (1 complex skipped)
CREATE TABLE Condition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  abatement_age TEXT GENERATED ALWAYS AS (resource ->> '$.abatement.as(Age)') STORED,
  abatement_date TEXT GENERATED ALWAYS AS (resource ->> '$.abatement.as(dateTime)') STORED,
  abatement_string TEXT GENERATED ALWAYS AS (resource ->> '$.abatement.as(string)') STORED,
  asserter TEXT GENERATED ALWAYS AS (resource ->> '$.asserter.reference') STORED,
  body_site TEXT GENERATED ALWAYS AS (resource ->> '$.bodySite') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  clinical_status TEXT GENERATED ALWAYS AS (resource ->> '$.clinicalStatus') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  evidence TEXT GENERATED ALWAYS AS (resource ->> '$.evidence.code') STORED,
  evidence_detail TEXT GENERATED ALWAYS AS (resource ->> '$.evidence.detail.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  onset_age TEXT GENERATED ALWAYS AS (resource ->> '$.onset.as(Age)') STORED,
  onset_date TEXT GENERATED ALWAYS AS (resource ->> '$.onset.as(dateTime)') STORED,
  onset_info TEXT GENERATED ALWAYS AS (resource ->> '$.onset.as(string)') STORED,
  recorded_date TEXT GENERATED ALWAYS AS (resource ->> '$.recordedDate') STORED,
  severity TEXT GENERATED ALWAYS AS (resource ->> '$.severity') STORED,
  stage TEXT GENERATED ALWAYS AS (resource ->> '$.stage.summary') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  verification_status TEXT GENERATED ALWAYS AS (resource ->> '$.verificationStatus') STORED
);

-- Consent: 15 columns (0 complex skipped)
CREATE TABLE Consent (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  action TEXT GENERATED ALWAYS AS (resource ->> '$.provision.action') STORED,
  actor TEXT GENERATED ALWAYS AS (resource ->> '$.provision.actor.reference.reference') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  consentor TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  data TEXT GENERATED ALWAYS AS (resource ->> '$.provision.data.reference.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.dateTime') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.organization.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.provision.period') STORED,
  purpose TEXT GENERATED ALWAYS AS (resource ->> '$.provision.purpose') STORED,
  scope TEXT GENERATED ALWAYS AS (resource ->> '$.scope') STORED,
  security_label TEXT GENERATED ALWAYS AS (resource ->> '$.provision.securityLabel') STORED,
  source_reference TEXT GENERATED ALWAYS AS (resource ->> '$.source.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- Contract: 9 columns (1 complex skipped)
CREATE TABLE Contract (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  authority TEXT GENERATED ALWAYS AS (resource ->> '$.authority.reference') STORED,
  domain TEXT GENERATED ALWAYS AS (resource ->> '$.domain.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  instantiates TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  issued TEXT GENERATED ALWAYS AS (resource ->> '$.issued') STORED,
  signer TEXT GENERATED ALWAYS AS (resource ->> '$.signer.party.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED
);

-- Coverage: 11 columns (0 complex skipped)
CREATE TABLE Coverage (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  beneficiary TEXT GENERATED ALWAYS AS (resource ->> '$.beneficiary.reference') STORED,
  class_type TEXT GENERATED ALWAYS AS (resource ->> '$.class.type') STORED,
  class_value TEXT GENERATED ALWAYS AS (resource ->> '$.class.value') STORED,
  dependent TEXT GENERATED ALWAYS AS (resource ->> '$.dependent') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.beneficiary.reference') STORED,
  payor TEXT GENERATED ALWAYS AS (resource ->> '$.payor.reference') STORED,
  policy_holder TEXT GENERATED ALWAYS AS (resource ->> '$.policyHolder.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subscriber TEXT GENERATED ALWAYS AS (resource ->> '$.subscriber.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- CoverageEligibilityRequest: 7 columns (0 complex skipped)
CREATE TABLE CoverageEligibilityRequest (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  enterer TEXT GENERATED ALWAYS AS (resource ->> '$.enterer.reference') STORED,
  facility TEXT GENERATED ALWAYS AS (resource ->> '$.facility.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  provider TEXT GENERATED ALWAYS AS (resource ->> '$.provider.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- CoverageEligibilityResponse: 9 columns (0 complex skipped)
CREATE TABLE CoverageEligibilityResponse (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  disposition TEXT GENERATED ALWAYS AS (resource ->> '$.disposition') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  insurer TEXT GENERATED ALWAYS AS (resource ->> '$.insurer.reference') STORED,
  outcome TEXT GENERATED ALWAYS AS (resource ->> '$.outcome') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.request.reference') STORED,
  requestor TEXT GENERATED ALWAYS AS (resource ->> '$.requestor.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- DetectedIssue: 6 columns (0 complex skipped)
CREATE TABLE DetectedIssue (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  identified TEXT GENERATED ALWAYS AS (resource ->> '$.identified') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  implicated TEXT GENERATED ALWAYS AS (resource ->> '$.implicated.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED
);

-- Device: 12 columns (1 complex skipped)
CREATE TABLE Device (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  device_name TEXT GENERATED ALWAYS AS (resource ->> '$.deviceName.name') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  manufacturer TEXT GENERATED ALWAYS AS (resource ->> '$.manufacturer') STORED,
  model TEXT GENERATED ALWAYS AS (resource ->> '$.modelNumber') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.owner.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  udi_carrier TEXT GENERATED ALWAYS AS (resource ->> '$.udiCarrier.carrierHRF') STORED,
  udi_di TEXT GENERATED ALWAYS AS (resource ->> '$.udiCarrier.deviceIdentifier') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED
);

-- DeviceDefinition: 3 columns (0 complex skipped)
CREATE TABLE DeviceDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  parent TEXT GENERATED ALWAYS AS (resource ->> '$.parentDevice.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- DeviceMetric: 5 columns (0 complex skipped)
CREATE TABLE DeviceMetric (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  parent TEXT GENERATED ALWAYS AS (resource ->> '$.parent.reference') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.source.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- DeviceRequest: 14 columns (4 complex skipped)
CREATE TABLE DeviceRequest (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  authored_on TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  group_identifier TEXT GENERATED ALWAYS AS (resource ->> '$.groupIdentifier') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  insurance TEXT GENERATED ALWAYS AS (resource ->> '$.insurance.reference') STORED,
  intent TEXT GENERATED ALWAYS AS (resource ->> '$.intent') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  prior_request TEXT GENERATED ALWAYS AS (resource ->> '$.priorRequest.reference') STORED,
  requester TEXT GENERATED ALWAYS AS (resource ->> '$.requester.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- DeviceUseStatement: 4 columns (0 complex skipped)
CREATE TABLE DeviceUseStatement (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  device TEXT GENERATED ALWAYS AS (resource ->> '$.device.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- DiagnosticReport: 15 columns (2 complex skipped)
CREATE TABLE DiagnosticReport (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  conclusion TEXT GENERATED ALWAYS AS (resource ->> '$.conclusionCode') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.effective') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  issued TEXT GENERATED ALWAYS AS (resource ->> '$.issued') STORED,
  media TEXT GENERATED ALWAYS AS (resource ->> '$.media.link.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  result TEXT GENERATED ALWAYS AS (resource ->> '$.result.reference') STORED,
  results_interpreter TEXT GENERATED ALWAYS AS (resource ->> '$.resultsInterpreter.reference') STORED,
  specimen TEXT GENERATED ALWAYS AS (resource ->> '$.specimen.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- DocumentManifest: 12 columns (1 complex skipped)
CREATE TABLE DocumentManifest (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.masterIdentifier') STORED,
  item TEXT GENERATED ALWAYS AS (resource ->> '$.content.reference') STORED,
  recipient TEXT GENERATED ALWAYS AS (resource ->> '$.recipient.reference') STORED,
  related_id TEXT GENERATED ALWAYS AS (resource ->> '$.related.identifier') STORED,
  related_ref TEXT GENERATED ALWAYS AS (resource ->> '$.related.ref.reference') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.source') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- DocumentReference: 24 columns (1 complex skipped)
CREATE TABLE DocumentReference (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  authenticator TEXT GENERATED ALWAYS AS (resource ->> '$.authenticator.reference') STORED,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  contenttype TEXT GENERATED ALWAYS AS (resource ->> '$.content.attachment.contentType') STORED,
  custodian TEXT GENERATED ALWAYS AS (resource ->> '$.custodian.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.context.encounter.reference') STORED,
  event TEXT GENERATED ALWAYS AS (resource ->> '$.context.event') STORED,
  facility TEXT GENERATED ALWAYS AS (resource ->> '$.context.facilityType') STORED,
  format TEXT GENERATED ALWAYS AS (resource ->> '$.content.format') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.masterIdentifier') STORED,
  language TEXT GENERATED ALWAYS AS (resource ->> '$.content.attachment.language') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.content.attachment.url') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.context.period') STORED,
  related TEXT GENERATED ALWAYS AS (resource ->> '$.context.related.reference') STORED,
  relatesto TEXT GENERATED ALWAYS AS (resource ->> '$.relatesTo.target.reference') STORED,
  relation TEXT GENERATED ALWAYS AS (resource ->> '$.relatesTo.code') STORED,
  relationship JSON GENERATED ALWAYS AS (resource ->> '$.relatesTo') STORED,
  security_label TEXT GENERATED ALWAYS AS (resource ->> '$.securityLabel') STORED,
  setting TEXT GENERATED ALWAYS AS (resource ->> '$.context.practiceSetting') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- EffectEvidenceSynthesis: 14 columns (2 complex skipped)
CREATE TABLE EffectEvidenceSynthesis (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Encounter: 21 columns (2 complex skipped)
CREATE TABLE Encounter (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  account TEXT GENERATED ALWAYS AS (resource ->> '$.account.reference') STORED,
  appointment TEXT GENERATED ALWAYS AS (resource ->> '$.appointment.reference') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  class_ TEXT GENERATED ALWAYS AS (resource ->> '$.class') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  diagnosis TEXT GENERATED ALWAYS AS (resource ->> '$.diagnosis.condition.reference') STORED,
  episode_of_care TEXT GENERATED ALWAYS AS (resource ->> '$.episodeOfCare.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  length TEXT GENERATED ALWAYS AS (resource ->> '$.length') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.location.reference') STORED,
  location_period TEXT GENERATED ALWAYS AS (resource ->> '$.location.period') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  participant TEXT GENERATED ALWAYS AS (resource ->> '$.participant.individual.reference') STORED,
  participant_type TEXT GENERATED ALWAYS AS (resource ->> '$.participant.type') STORED,
  reason_code TEXT GENERATED ALWAYS AS (resource ->> '$.reasonCode') STORED,
  reason_reference TEXT GENERATED ALWAYS AS (resource ->> '$.reasonReference.reference') STORED,
  service_provider TEXT GENERATED ALWAYS AS (resource ->> '$.serviceProvider.reference') STORED,
  special_arrangement TEXT GENERATED ALWAYS AS (resource ->> '$.hospitalization.specialArrangement') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- Endpoint: 6 columns (0 complex skipped)
CREATE TABLE Endpoint (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  connection_type TEXT GENERATED ALWAYS AS (resource ->> '$.connectionType') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.managingOrganization.reference') STORED,
  payload_type TEXT GENERATED ALWAYS AS (resource ->> '$.payloadType') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- EnrollmentRequest: 4 columns (0 complex skipped)
CREATE TABLE EnrollmentRequest (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.candidate.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.candidate.reference') STORED
);

-- EnrollmentResponse: 3 columns (0 complex skipped)
CREATE TABLE EnrollmentResponse (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.request.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- EpisodeOfCare: 8 columns (1 complex skipped)
CREATE TABLE EpisodeOfCare (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  condition TEXT GENERATED ALWAYS AS (resource ->> '$.diagnosis.condition.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  incoming_referral TEXT GENERATED ALWAYS AS (resource ->> '$.referralRequest.reference') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.managingOrganization.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- EventDefinition: 15 columns (7 complex skipped)
CREATE TABLE EventDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  topic TEXT GENERATED ALWAYS AS (resource ->> '$.topic') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Evidence: 15 columns (7 complex skipped)
CREATE TABLE Evidence (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  topic TEXT GENERATED ALWAYS AS (resource ->> '$.topic') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- EvidenceVariable: 15 columns (7 complex skipped)
CREATE TABLE EvidenceVariable (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  topic TEXT GENERATED ALWAYS AS (resource ->> '$.topic') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- ExampleScenario: 11 columns (2 complex skipped)
CREATE TABLE ExampleScenario (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- ExplanationOfBenefit: 17 columns (0 complex skipped)
CREATE TABLE ExplanationOfBenefit (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  care_team TEXT GENERATED ALWAYS AS (resource ->> '$.careTeam.provider.reference') STORED,
  claim TEXT GENERATED ALWAYS AS (resource ->> '$.claim.reference') STORED,
  coverage TEXT GENERATED ALWAYS AS (resource ->> '$.insurance.coverage.reference') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  detail_udi TEXT GENERATED ALWAYS AS (resource ->> '$.item.detail.udi.reference') STORED,
  disposition TEXT GENERATED ALWAYS AS (resource ->> '$.disposition') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.item.encounter.reference') STORED,
  enterer TEXT GENERATED ALWAYS AS (resource ->> '$.enterer.reference') STORED,
  facility TEXT GENERATED ALWAYS AS (resource ->> '$.facility.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  item_udi TEXT GENERATED ALWAYS AS (resource ->> '$.item.udi.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  payee TEXT GENERATED ALWAYS AS (resource ->> '$.payee.party.reference') STORED,
  procedure_udi TEXT GENERATED ALWAYS AS (resource ->> '$.procedure.udi.reference') STORED,
  provider TEXT GENERATED ALWAYS AS (resource ->> '$.provider.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subdetail_udi TEXT GENERATED ALWAYS AS (resource ->> '$.item.detail.subDetail.udi.reference') STORED
);

-- FamilyMemberHistory: 9 columns (0 complex skipped)
CREATE TABLE FamilyMemberHistory (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.condition.code') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  relationship TEXT GENERATED ALWAYS AS (resource ->> '$.relationship') STORED,
  sex TEXT GENERATED ALWAYS AS (resource ->> '$.sex') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- Flag: 5 columns (1 complex skipped)
CREATE TABLE Flag (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- Goal: 5 columns (3 complex skipped)
CREATE TABLE Goal (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  achievement_status TEXT GENERATED ALWAYS AS (resource ->> '$.achievementStatus') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  lifecycle_status TEXT GENERATED ALWAYS AS (resource ->> '$.lifecycleStatus') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- GraphDefinition: 12 columns (2 complex skipped)
CREATE TABLE GraphDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  start TEXT GENERATED ALWAYS AS (resource ->> '$.start') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Group: 9 columns (1 complex skipped)
CREATE TABLE "Group" (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  actual TEXT GENERATED ALWAYS AS (resource ->> '$.actual') STORED,
  characteristic TEXT GENERATED ALWAYS AS (resource ->> '$.characteristic.code') STORED,
  characteristic_value JSON GENERATED ALWAYS AS (resource ->> '$.characteristic') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  exclude TEXT GENERATED ALWAYS AS (resource ->> '$.characteristic.exclude') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  managing_entity TEXT GENERATED ALWAYS AS (resource ->> '$.managingEntity.reference') STORED,
  member TEXT GENERATED ALWAYS AS (resource ->> '$.member.entity.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- GuidanceResponse: 3 columns (1 complex skipped)
CREATE TABLE GuidanceResponse (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.requestIdentifier') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- HealthcareService: 12 columns (0 complex skipped)
CREATE TABLE HealthcareService (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  characteristic TEXT GENERATED ALWAYS AS (resource ->> '$.characteristic') STORED,
  coverage_area TEXT GENERATED ALWAYS AS (resource ->> '$.coverageArea.reference') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.providedBy.reference') STORED,
  program TEXT GENERATED ALWAYS AS (resource ->> '$.program') STORED,
  service_category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  service_type TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  specialty TEXT GENERATED ALWAYS AS (resource ->> '$.specialty') STORED
);

-- ImagingStudy: 16 columns (1 complex skipped)
CREATE TABLE ImagingStudy (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  basedon TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  bodysite TEXT GENERATED ALWAYS AS (resource ->> '$.series.bodySite') STORED,
  dicom_class TEXT GENERATED ALWAYS AS (resource ->> '$.series.instance.sopClass') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  instance TEXT GENERATED ALWAYS AS (resource ->> '$.series.instance.uid') STORED,
  interpreter TEXT GENERATED ALWAYS AS (resource ->> '$.interpreter.reference') STORED,
  modality TEXT GENERATED ALWAYS AS (resource ->> '$.series.modality') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.series.performer.actor.reference') STORED,
  reason TEXT GENERATED ALWAYS AS (resource ->> '$.reasonCode') STORED,
  referrer TEXT GENERATED ALWAYS AS (resource ->> '$.referrer.reference') STORED,
  series TEXT GENERATED ALWAYS AS (resource ->> '$.series.uid') STORED,
  started TEXT GENERATED ALWAYS AS (resource ->> '$.started') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- Immunization: 16 columns (0 complex skipped)
CREATE TABLE Immunization (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.occurrence') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  lot_number TEXT GENERATED ALWAYS AS (resource ->> '$.lotNumber') STORED,
  manufacturer TEXT GENERATED ALWAYS AS (resource ->> '$.manufacturer.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.actor.reference') STORED,
  reaction TEXT GENERATED ALWAYS AS (resource ->> '$.reaction.detail.reference') STORED,
  reaction_date TEXT GENERATED ALWAYS AS (resource ->> '$.reaction.date') STORED,
  reason_code TEXT GENERATED ALWAYS AS (resource ->> '$.reasonCode') STORED,
  reason_reference TEXT GENERATED ALWAYS AS (resource ->> '$.reasonReference.reference') STORED,
  series TEXT GENERATED ALWAYS AS (resource ->> '$.protocolApplied.series') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  status_reason TEXT GENERATED ALWAYS AS (resource ->> '$.statusReason') STORED,
  target_disease TEXT GENERATED ALWAYS AS (resource ->> '$.protocolApplied.targetDisease') STORED,
  vaccine_code TEXT GENERATED ALWAYS AS (resource ->> '$.vaccineCode') STORED
);

-- ImmunizationEvaluation: 7 columns (0 complex skipped)
CREATE TABLE ImmunizationEvaluation (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  dose_status TEXT GENERATED ALWAYS AS (resource ->> '$.doseStatus') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  immunization_event TEXT GENERATED ALWAYS AS (resource ->> '$.immunizationEvent.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  target_disease TEXT GENERATED ALWAYS AS (resource ->> '$.targetDisease') STORED
);

-- ImmunizationRecommendation: 8 columns (0 complex skipped)
CREATE TABLE ImmunizationRecommendation (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  information TEXT GENERATED ALWAYS AS (resource ->> '$.recommendation.supportingPatientInformation.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.recommendation.forecastStatus') STORED,
  support TEXT GENERATED ALWAYS AS (resource ->> '$.recommendation.supportingImmunization.reference') STORED,
  target_disease TEXT GENERATED ALWAYS AS (resource ->> '$.recommendation.targetDisease') STORED,
  vaccine_type TEXT GENERATED ALWAYS AS (resource ->> '$.recommendation.vaccineCode') STORED
);

-- ImplementationGuide: 16 columns (2 complex skipped)
CREATE TABLE ImplementationGuide (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  depends_on TEXT GENERATED ALWAYS AS (resource ->> '$.dependsOn.uri.reference') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  experimental TEXT GENERATED ALWAYS AS (resource ->> '$.experimental') STORED,
  global TEXT GENERATED ALWAYS AS (resource ->> '$.global.profile.reference') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  resource_ TEXT GENERATED ALWAYS AS (resource ->> '$.definition.resource.reference.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- InsurancePlan: 12 columns (1 complex skipped)
CREATE TABLE InsurancePlan (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  address TEXT GENERATED ALWAYS AS (resource ->> '$.contact.address') STORED,
  address_city TEXT GENERATED ALWAYS AS (resource ->> '$.contact.address.city') STORED,
  address_country TEXT GENERATED ALWAYS AS (resource ->> '$.contact.address.country') STORED,
  address_postalcode TEXT GENERATED ALWAYS AS (resource ->> '$.contact.address.postalCode') STORED,
  address_state TEXT GENERATED ALWAYS AS (resource ->> '$.contact.address.state') STORED,
  address_use TEXT GENERATED ALWAYS AS (resource ->> '$.contact.address.use') STORED,
  administered_by TEXT GENERATED ALWAYS AS (resource ->> '$.administeredBy.reference') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  owned_by TEXT GENERATED ALWAYS AS (resource ->> '$.ownedBy.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- Invoice: 12 columns (1 complex skipped)
CREATE TABLE Invoice (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  account TEXT GENERATED ALWAYS AS (resource ->> '$.account.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  issuer TEXT GENERATED ALWAYS AS (resource ->> '$.issuer.reference') STORED,
  participant TEXT GENERATED ALWAYS AS (resource ->> '$.participant.actor.reference') STORED,
  participant_role TEXT GENERATED ALWAYS AS (resource ->> '$.participant.role') STORED,
  recipient TEXT GENERATED ALWAYS AS (resource ->> '$.recipient.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  totalgross TEXT GENERATED ALWAYS AS (resource ->> '$.totalGross') STORED,
  totalnet TEXT GENERATED ALWAYS AS (resource ->> '$.totalNet') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- Library: 17 columns (7 complex skipped)
CREATE TABLE Library (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  content_type TEXT GENERATED ALWAYS AS (resource ->> '$.content.contentType') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  topic TEXT GENERATED ALWAYS AS (resource ->> '$.topic') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Linkage: 3 columns (0 complex skipped)
CREATE TABLE Linkage (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  item TEXT GENERATED ALWAYS AS (resource ->> '$.item.resource.reference') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.item.resource.reference') STORED
);

-- List: 11 columns (1 complex skipped)
CREATE TABLE List (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  empty_reason TEXT GENERATED ALWAYS AS (resource ->> '$.emptyReason') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  item TEXT GENERATED ALWAYS AS (resource ->> '$.entry.item.reference') STORED,
  notes TEXT GENERATED ALWAYS AS (resource ->> '$.note.text') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.source.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED
);

-- Location: 15 columns (0 complex skipped)
CREATE TABLE Location (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  address TEXT GENERATED ALWAYS AS (resource ->> '$.address') STORED,
  address_city TEXT GENERATED ALWAYS AS (resource ->> '$.address.city') STORED,
  address_country TEXT GENERATED ALWAYS AS (resource ->> '$.address.country') STORED,
  address_postalcode TEXT GENERATED ALWAYS AS (resource ->> '$.address.postalCode') STORED,
  address_state TEXT GENERATED ALWAYS AS (resource ->> '$.address.state') STORED,
  address_use TEXT GENERATED ALWAYS AS (resource ->> '$.address.use') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  near TEXT GENERATED ALWAYS AS (resource ->> '$.position') STORED,
  operational_status TEXT GENERATED ALWAYS AS (resource ->> '$.operationalStatus') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.managingOrganization.reference') STORED,
  partof TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- Measure: 15 columns (7 complex skipped)
CREATE TABLE Measure (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  topic TEXT GENERATED ALWAYS AS (resource ->> '$.topic') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- MeasureReport: 8 columns (1 complex skipped)
CREATE TABLE MeasureReport (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  evaluated_resource TEXT GENERATED ALWAYS AS (resource ->> '$.evaluatedResource.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  measure TEXT GENERATED ALWAYS AS (resource ->> '$.measure.reference') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  reporter TEXT GENERATED ALWAYS AS (resource ->> '$.reporter.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- Media: 12 columns (1 complex skipped)
CREATE TABLE Media (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  device TEXT GENERATED ALWAYS AS (resource ->> '$.device.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  modality TEXT GENERATED ALWAYS AS (resource ->> '$.modality') STORED,
  operator TEXT GENERATED ALWAYS AS (resource ->> '$.operator.reference') STORED,
  site TEXT GENERATED ALWAYS AS (resource ->> '$.bodySite') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  view TEXT GENERATED ALWAYS AS (resource ->> '$.view') STORED
);

-- Medication: 7 columns (2 complex skipped)
CREATE TABLE Medication (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  expiration_date TEXT GENERATED ALWAYS AS (resource ->> '$.batch.expirationDate') STORED,
  form TEXT GENERATED ALWAYS AS (resource ->> '$.form') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  lot_number TEXT GENERATED ALWAYS AS (resource ->> '$.batch.lotNumber') STORED,
  manufacturer TEXT GENERATED ALWAYS AS (resource ->> '$.manufacturer.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- MedicationAdministration: 10 columns (3 complex skipped)
CREATE TABLE MedicationAdministration (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context TEXT GENERATED ALWAYS AS (resource ->> '$.context.reference') STORED,
  device TEXT GENERATED ALWAYS AS (resource ->> '$.device.reference') STORED,
  effective_time TEXT GENERATED ALWAYS AS (resource ->> '$.effective') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.actor.reference') STORED,
  reason_given TEXT GENERATED ALWAYS AS (resource ->> '$.reasonCode') STORED,
  reason_not_given TEXT GENERATED ALWAYS AS (resource ->> '$.statusReason') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.request.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- MedicationDispense: 12 columns (3 complex skipped)
CREATE TABLE MedicationDispense (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context TEXT GENERATED ALWAYS AS (resource ->> '$.context.reference') STORED,
  destination TEXT GENERATED ALWAYS AS (resource ->> '$.destination.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.actor.reference') STORED,
  prescription TEXT GENERATED ALWAYS AS (resource ->> '$.authorizingPrescription.reference') STORED,
  receiver TEXT GENERATED ALWAYS AS (resource ->> '$.receiver.reference') STORED,
  responsibleparty TEXT GENERATED ALWAYS AS (resource ->> '$.substitution.responsibleParty.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  whenhandedover TEXT GENERATED ALWAYS AS (resource ->> '$.whenHandedOver') STORED,
  whenprepared TEXT GENERATED ALWAYS AS (resource ->> '$.whenPrepared') STORED
);

-- MedicationKnowledge: 11 columns (2 complex skipped)
CREATE TABLE MedicationKnowledge (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  classification TEXT GENERATED ALWAYS AS (resource ->> '$.medicineClassification.classification') STORED,
  classification_type TEXT GENERATED ALWAYS AS (resource ->> '$.medicineClassification.type') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  doseform TEXT GENERATED ALWAYS AS (resource ->> '$.doseForm') STORED,
  manufacturer TEXT GENERATED ALWAYS AS (resource ->> '$.manufacturer.reference') STORED,
  monitoring_program_name TEXT GENERATED ALWAYS AS (resource ->> '$.monitoringProgram.name') STORED,
  monitoring_program_type TEXT GENERATED ALWAYS AS (resource ->> '$.monitoringProgram.type') STORED,
  monograph TEXT GENERATED ALWAYS AS (resource ->> '$.monograph.source.reference') STORED,
  monograph_type TEXT GENERATED ALWAYS AS (resource ->> '$.monograph.type') STORED,
  source_cost TEXT GENERATED ALWAYS AS (resource ->> '$.cost.source') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- MedicationRequest: 13 columns (3 complex skipped)
CREATE TABLE MedicationRequest (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  authoredon TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.dosageInstruction.timing.event') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  intended_dispenser TEXT GENERATED ALWAYS AS (resource ->> '$.dispenseRequest.performer.reference') STORED,
  intended_performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  intended_performertype TEXT GENERATED ALWAYS AS (resource ->> '$.performerType') STORED,
  intent TEXT GENERATED ALWAYS AS (resource ->> '$.intent') STORED,
  priority TEXT GENERATED ALWAYS AS (resource ->> '$.priority') STORED,
  requester TEXT GENERATED ALWAYS AS (resource ->> '$.requester.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- MedicationStatement: 8 columns (3 complex skipped)
CREATE TABLE MedicationStatement (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  context TEXT GENERATED ALWAYS AS (resource ->> '$.context.reference') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effective') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.informationSource.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- MedicinalProduct: 3 columns (0 complex skipped)
CREATE TABLE MedicinalProduct (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name.productName') STORED,
  name_language TEXT GENERATED ALWAYS AS (resource ->> '$.name.countryLanguage.language') STORED
);

-- MedicinalProductAuthorization: 5 columns (0 complex skipped)
CREATE TABLE MedicinalProductAuthorization (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  country TEXT GENERATED ALWAYS AS (resource ->> '$.country') STORED,
  holder TEXT GENERATED ALWAYS AS (resource ->> '$.holder.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- MedicinalProductContraindication: 1 columns (0 complex skipped)
CREATE TABLE MedicinalProductContraindication (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- MedicinalProductIndication: 1 columns (0 complex skipped)
CREATE TABLE MedicinalProductIndication (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- MedicinalProductInteraction: 1 columns (0 complex skipped)
CREATE TABLE MedicinalProductInteraction (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- MedicinalProductPackaged: 2 columns (0 complex skipped)
CREATE TABLE MedicinalProductPackaged (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- MedicinalProductPharmaceutical: 3 columns (0 complex skipped)
CREATE TABLE MedicinalProductPharmaceutical (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  route TEXT GENERATED ALWAYS AS (resource ->> '$.routeOfAdministration.code') STORED,
  target_species TEXT GENERATED ALWAYS AS (resource ->> '$.routeOfAdministration.targetSpecies.code') STORED
);

-- MedicinalProductUndesirableEffect: 1 columns (0 complex skipped)
CREATE TABLE MedicinalProductUndesirableEffect (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- MessageDefinition: 17 columns (2 complex skipped)
CREATE TABLE MessageDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  event TEXT GENERATED ALWAYS AS (resource ->> '$.event') STORED,
  focus TEXT GENERATED ALWAYS AS (resource ->> '$.focus.code') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  parent TEXT GENERATED ALWAYS AS (resource ->> '$.parent.reference') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- MessageHeader: 14 columns (0 complex skipped)
CREATE TABLE MessageHeader (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.response.code') STORED,
  destination TEXT GENERATED ALWAYS AS (resource ->> '$.destination.name') STORED,
  destination_uri TEXT GENERATED ALWAYS AS (resource ->> '$.destination.endpoint') STORED,
  enterer TEXT GENERATED ALWAYS AS (resource ->> '$.enterer.reference') STORED,
  event TEXT GENERATED ALWAYS AS (resource ->> '$.event') STORED,
  focus TEXT GENERATED ALWAYS AS (resource ->> '$.focus.reference') STORED,
  receiver TEXT GENERATED ALWAYS AS (resource ->> '$.destination.receiver.reference') STORED,
  response_id TEXT GENERATED ALWAYS AS (resource ->> '$.response.identifier') STORED,
  responsible TEXT GENERATED ALWAYS AS (resource ->> '$.responsible.reference') STORED,
  sender TEXT GENERATED ALWAYS AS (resource ->> '$.sender.reference') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.source.name') STORED,
  source_uri TEXT GENERATED ALWAYS AS (resource ->> '$.source.endpoint') STORED,
  target TEXT GENERATED ALWAYS AS (resource ->> '$.destination.target.reference') STORED
);

-- MolecularSequence: 13 columns (0 complex skipped)
CREATE TABLE MolecularSequence (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  chromosome TEXT GENERATED ALWAYS AS (resource ->> '$.referenceSeq.chromosome') STORED,
  chromosome_variant_coordinate JSON GENERATED ALWAYS AS (resource ->> '$.variant') STORED,
  chromosome_window_coordinate JSON GENERATED ALWAYS AS (resource ->> '$.referenceSeq') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  referenceseqid TEXT GENERATED ALWAYS AS (resource ->> '$.referenceSeq.referenceSeqId') STORED,
  referenceseqid_variant_coordinate JSON GENERATED ALWAYS AS (resource ->> '$.variant') STORED,
  referenceseqid_window_coordinate JSON GENERATED ALWAYS AS (resource ->> '$.referenceSeq') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  variant_end REAL GENERATED ALWAYS AS (resource ->> '$.variant.end') STORED,
  variant_start REAL GENERATED ALWAYS AS (resource ->> '$.variant.start') STORED,
  window_end REAL GENERATED ALWAYS AS (resource ->> '$.referenceSeq.windowEnd') STORED,
  window_start REAL GENERATED ALWAYS AS (resource ->> '$.referenceSeq.windowStart') STORED
);

-- NamingSystem: 17 columns (2 complex skipped)
CREATE TABLE NamingSystem (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  contact TEXT GENERATED ALWAYS AS (resource ->> '$.contact.name') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  id_type TEXT GENERATED ALWAYS AS (resource ->> '$.uniqueId.type') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  kind TEXT GENERATED ALWAYS AS (resource ->> '$.kind') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.uniqueId.period') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  responsible TEXT GENERATED ALWAYS AS (resource ->> '$.responsible') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  telecom TEXT GENERATED ALWAYS AS (resource ->> '$.contact.telecom') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  value TEXT GENERATED ALWAYS AS (resource ->> '$.uniqueId.value') STORED
);

-- NutritionOrder: 12 columns (0 complex skipped)
CREATE TABLE NutritionOrder (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  additive TEXT GENERATED ALWAYS AS (resource ->> '$.enteralFormula.additiveType') STORED,
  datetime TEXT GENERATED ALWAYS AS (resource ->> '$.dateTime') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  formula TEXT GENERATED ALWAYS AS (resource ->> '$.enteralFormula.baseFormulaType') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  oraldiet TEXT GENERATED ALWAYS AS (resource ->> '$.oralDiet.type') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  provider TEXT GENERATED ALWAYS AS (resource ->> '$.orderer.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  supplement TEXT GENERATED ALWAYS AS (resource ->> '$.supplement.type') STORED
);

-- Observation: 25 columns (18 complex skipped)
CREATE TABLE Observation (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  combo_code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  combo_code_value_concept JSON GENERATED ALWAYS AS (resource ->> '$.component') STORED,
  combo_code_value_quantity JSON GENERATED ALWAYS AS (resource ->> '$.component') STORED,
  combo_data_absent_reason TEXT GENERATED ALWAYS AS (resource ->> '$.dataAbsentReason') STORED,
  component_code TEXT GENERATED ALWAYS AS (resource ->> '$.component.code') STORED,
  component_code_value_concept JSON GENERATED ALWAYS AS (resource ->> '$.component') STORED,
  component_code_value_quantity JSON GENERATED ALWAYS AS (resource ->> '$.component') STORED,
  component_data_absent_reason TEXT GENERATED ALWAYS AS (resource ->> '$.component.dataAbsentReason') STORED,
  data_absent_reason TEXT GENERATED ALWAYS AS (resource ->> '$.dataAbsentReason') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.effective') STORED,
  derived_from TEXT GENERATED ALWAYS AS (resource ->> '$.derivedFrom.reference') STORED,
  device TEXT GENERATED ALWAYS AS (resource ->> '$.device.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  focus TEXT GENERATED ALWAYS AS (resource ->> '$.focus.reference') STORED,
  has_member TEXT GENERATED ALWAYS AS (resource ->> '$.hasMember.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  method TEXT GENERATED ALWAYS AS (resource ->> '$.method') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  specimen TEXT GENERATED ALWAYS AS (resource ->> '$.specimen.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- OperationDefinition: 20 columns (2 complex skipped)
CREATE TABLE OperationDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  base TEXT GENERATED ALWAYS AS (resource ->> '$.base.reference') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  input_profile TEXT GENERATED ALWAYS AS (resource ->> '$.inputProfile.reference') STORED,
  instance TEXT GENERATED ALWAYS AS (resource ->> '$.instance') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  kind TEXT GENERATED ALWAYS AS (resource ->> '$.kind') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  output_profile TEXT GENERATED ALWAYS AS (resource ->> '$.outputProfile.reference') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  system TEXT GENERATED ALWAYS AS (resource ->> '$.system') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Organization: 12 columns (0 complex skipped)
CREATE TABLE Organization (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  address TEXT GENERATED ALWAYS AS (resource ->> '$.address') STORED,
  address_city TEXT GENERATED ALWAYS AS (resource ->> '$.address.city') STORED,
  address_country TEXT GENERATED ALWAYS AS (resource ->> '$.address.country') STORED,
  address_postalcode TEXT GENERATED ALWAYS AS (resource ->> '$.address.postalCode') STORED,
  address_state TEXT GENERATED ALWAYS AS (resource ->> '$.address.state') STORED,
  address_use TEXT GENERATED ALWAYS AS (resource ->> '$.address.use') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  partof TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- OrganizationAffiliation: 12 columns (2 complex skipped)
CREATE TABLE OrganizationAffiliation (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  network TEXT GENERATED ALWAYS AS (resource ->> '$.network.reference') STORED,
  participating_organization TEXT GENERATED ALWAYS AS (resource ->> '$.participatingOrganization.reference') STORED,
  primary_organization TEXT GENERATED ALWAYS AS (resource ->> '$.organization.reference') STORED,
  role TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  service TEXT GENERATED ALWAYS AS (resource ->> '$.healthcareService.reference') STORED,
  specialty TEXT GENERATED ALWAYS AS (resource ->> '$.specialty') STORED,
  telecom TEXT GENERATED ALWAYS AS (resource ->> '$.telecom') STORED
);

-- Patient: 16 columns (6 complex skipped)
CREATE TABLE Patient (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  address TEXT GENERATED ALWAYS AS (resource ->> '$.address') STORED,
  address_city TEXT GENERATED ALWAYS AS (resource ->> '$.address.city') STORED,
  address_country TEXT GENERATED ALWAYS AS (resource ->> '$.address.country') STORED,
  address_postalcode TEXT GENERATED ALWAYS AS (resource ->> '$.address.postalCode') STORED,
  address_state TEXT GENERATED ALWAYS AS (resource ->> '$.address.state') STORED,
  address_use TEXT GENERATED ALWAYS AS (resource ->> '$.address.use') STORED,
  birthdate TEXT GENERATED ALWAYS AS (resource ->> '$.birthDate') STORED,
  gender TEXT GENERATED ALWAYS AS (resource ->> '$.gender') STORED,
  general_practitioner TEXT GENERATED ALWAYS AS (resource ->> '$.generalPractitioner.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  language TEXT GENERATED ALWAYS AS (resource ->> '$.communication.language') STORED,
  link TEXT GENERATED ALWAYS AS (resource ->> '$.link.other.reference') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.managingOrganization.reference') STORED,
  telecom TEXT GENERATED ALWAYS AS (resource ->> '$.telecom') STORED
);

-- PaymentNotice: 7 columns (0 complex skipped)
CREATE TABLE PaymentNotice (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  payment_status TEXT GENERATED ALWAYS AS (resource ->> '$.paymentStatus') STORED,
  provider TEXT GENERATED ALWAYS AS (resource ->> '$.provider.reference') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.request.reference') STORED,
  response TEXT GENERATED ALWAYS AS (resource ->> '$.response.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- PaymentReconciliation: 8 columns (0 complex skipped)
CREATE TABLE PaymentReconciliation (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  disposition TEXT GENERATED ALWAYS AS (resource ->> '$.disposition') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  outcome TEXT GENERATED ALWAYS AS (resource ->> '$.outcome') STORED,
  payment_issuer TEXT GENERATED ALWAYS AS (resource ->> '$.paymentIssuer.reference') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.request.reference') STORED,
  requestor TEXT GENERATED ALWAYS AS (resource ->> '$.requestor.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- Person: 13 columns (5 complex skipped)
CREATE TABLE Person (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  address TEXT GENERATED ALWAYS AS (resource ->> '$.address') STORED,
  address_city TEXT GENERATED ALWAYS AS (resource ->> '$.address.city') STORED,
  address_country TEXT GENERATED ALWAYS AS (resource ->> '$.address.country') STORED,
  address_postalcode TEXT GENERATED ALWAYS AS (resource ->> '$.address.postalCode') STORED,
  address_state TEXT GENERATED ALWAYS AS (resource ->> '$.address.state') STORED,
  address_use TEXT GENERATED ALWAYS AS (resource ->> '$.address.use') STORED,
  birthdate TEXT GENERATED ALWAYS AS (resource ->> '$.birthDate') STORED,
  gender TEXT GENERATED ALWAYS AS (resource ->> '$.gender') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  link TEXT GENERATED ALWAYS AS (resource ->> '$.link.target.reference') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.managingOrganization.reference') STORED,
  telecom TEXT GENERATED ALWAYS AS (resource ->> '$.telecom') STORED
);

-- PlanDefinition: 17 columns (7 complex skipped)
CREATE TABLE PlanDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  definition TEXT GENERATED ALWAYS AS (resource ->> '$.action.definition.reference') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  topic TEXT GENERATED ALWAYS AS (resource ->> '$.topic') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Practitioner: 12 columns (2 complex skipped)
CREATE TABLE Practitioner (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  address TEXT GENERATED ALWAYS AS (resource ->> '$.address') STORED,
  address_city TEXT GENERATED ALWAYS AS (resource ->> '$.address.city') STORED,
  address_country TEXT GENERATED ALWAYS AS (resource ->> '$.address.country') STORED,
  address_postalcode TEXT GENERATED ALWAYS AS (resource ->> '$.address.postalCode') STORED,
  address_state TEXT GENERATED ALWAYS AS (resource ->> '$.address.state') STORED,
  address_use TEXT GENERATED ALWAYS AS (resource ->> '$.address.use') STORED,
  communication TEXT GENERATED ALWAYS AS (resource ->> '$.communication') STORED,
  gender TEXT GENERATED ALWAYS AS (resource ->> '$.gender') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  telecom TEXT GENERATED ALWAYS AS (resource ->> '$.telecom') STORED
);

-- PractitionerRole: 11 columns (2 complex skipped)
CREATE TABLE PractitionerRole (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.organization.reference') STORED,
  practitioner TEXT GENERATED ALWAYS AS (resource ->> '$.practitioner.reference') STORED,
  role TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  service TEXT GENERATED ALWAYS AS (resource ->> '$.healthcareService.reference') STORED,
  specialty TEXT GENERATED ALWAYS AS (resource ->> '$.specialty') STORED,
  telecom TEXT GENERATED ALWAYS AS (resource ->> '$.telecom') STORED
);

-- Procedure: 15 columns (1 complex skipped)
CREATE TABLE Procedure (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.performed') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.actor.reference') STORED,
  reason_code TEXT GENERATED ALWAYS AS (resource ->> '$.reasonCode') STORED,
  reason_reference TEXT GENERATED ALWAYS AS (resource ->> '$.reasonReference.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- Provenance: 8 columns (2 complex skipped)
CREATE TABLE Provenance (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  agent TEXT GENERATED ALWAYS AS (resource ->> '$.agent.who.reference') STORED,
  agent_role TEXT GENERATED ALWAYS AS (resource ->> '$.agent.role') STORED,
  agent_type TEXT GENERATED ALWAYS AS (resource ->> '$.agent.type') STORED,
  entity TEXT GENERATED ALWAYS AS (resource ->> '$.entity.what.reference') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  recorded TEXT GENERATED ALWAYS AS (resource ->> '$.recorded') STORED,
  signature_type TEXT GENERATED ALWAYS AS (resource ->> '$.signature.type') STORED,
  target TEXT GENERATED ALWAYS AS (resource ->> '$.target.reference') STORED
);

-- Questionnaire: 17 columns (2 complex skipped)
CREATE TABLE Questionnaire (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.item.code') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  definition TEXT GENERATED ALWAYS AS (resource ->> '$.item.definition') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject_type TEXT GENERATED ALWAYS AS (resource ->> '$.subjectType') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- QuestionnaireResponse: 10 columns (2 complex skipped)
CREATE TABLE QuestionnaireResponse (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  authored TEXT GENERATED ALWAYS AS (resource ->> '$.authored') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  questionnaire TEXT GENERATED ALWAYS AS (resource ->> '$.questionnaire.reference') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.source.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- RelatedPerson: 14 columns (2 complex skipped)
CREATE TABLE RelatedPerson (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  address TEXT GENERATED ALWAYS AS (resource ->> '$.address') STORED,
  address_city TEXT GENERATED ALWAYS AS (resource ->> '$.address.city') STORED,
  address_country TEXT GENERATED ALWAYS AS (resource ->> '$.address.country') STORED,
  address_postalcode TEXT GENERATED ALWAYS AS (resource ->> '$.address.postalCode') STORED,
  address_state TEXT GENERATED ALWAYS AS (resource ->> '$.address.state') STORED,
  address_use TEXT GENERATED ALWAYS AS (resource ->> '$.address.use') STORED,
  birthdate TEXT GENERATED ALWAYS AS (resource ->> '$.birthDate') STORED,
  gender TEXT GENERATED ALWAYS AS (resource ->> '$.gender') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  relationship TEXT GENERATED ALWAYS AS (resource ->> '$.relationship') STORED,
  telecom TEXT GENERATED ALWAYS AS (resource ->> '$.telecom') STORED
);

-- RequestGroup: 13 columns (1 complex skipped)
CREATE TABLE RequestGroup (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  authored TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  group_identifier TEXT GENERATED ALWAYS AS (resource ->> '$.groupIdentifier') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  intent TEXT GENERATED ALWAYS AS (resource ->> '$.intent') STORED,
  participant TEXT GENERATED ALWAYS AS (resource ->> '$.action.participant.reference') STORED,
  priority TEXT GENERATED ALWAYS AS (resource ->> '$.priority') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- ResearchDefinition: 15 columns (7 complex skipped)
CREATE TABLE ResearchDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  topic TEXT GENERATED ALWAYS AS (resource ->> '$.topic') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- ResearchElementDefinition: 15 columns (7 complex skipped)
CREATE TABLE ResearchElementDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  topic TEXT GENERATED ALWAYS AS (resource ->> '$.topic') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- ResearchStudy: 13 columns (0 complex skipped)
CREATE TABLE ResearchStudy (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  focus TEXT GENERATED ALWAYS AS (resource ->> '$.focus') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  keyword TEXT GENERATED ALWAYS AS (resource ->> '$.keyword') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location') STORED,
  partof TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  principalinvestigator TEXT GENERATED ALWAYS AS (resource ->> '$.principalInvestigator.reference') STORED,
  protocol TEXT GENERATED ALWAYS AS (resource ->> '$.protocol.reference') STORED,
  site TEXT GENERATED ALWAYS AS (resource ->> '$.site.reference') STORED,
  sponsor TEXT GENERATED ALWAYS AS (resource ->> '$.sponsor.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED
);

-- ResearchSubject: 6 columns (0 complex skipped)
CREATE TABLE ResearchSubject (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  individual TEXT GENERATED ALWAYS AS (resource ->> '$.individual.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.individual.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  study TEXT GENERATED ALWAYS AS (resource ->> '$.study.reference') STORED
);

-- RiskAssessment: 8 columns (2 complex skipped)
CREATE TABLE RiskAssessment (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  condition TEXT GENERATED ALWAYS AS (resource ->> '$.condition.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  method TEXT GENERATED ALWAYS AS (resource ->> '$.method') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  probability REAL GENERATED ALWAYS AS (resource ->> '$.prediction.probability') STORED,
  risk TEXT GENERATED ALWAYS AS (resource ->> '$.prediction.qualitativeRisk') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- RiskEvidenceSynthesis: 14 columns (2 complex skipped)
CREATE TABLE RiskEvidenceSynthesis (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Schedule: 7 columns (0 complex skipped)
CREATE TABLE Schedule (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  actor TEXT GENERATED ALWAYS AS (resource ->> '$.actor.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.planningHorizon') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  service_category TEXT GENERATED ALWAYS AS (resource ->> '$.serviceCategory') STORED,
  service_type TEXT GENERATED ALWAYS AS (resource ->> '$.serviceType') STORED,
  specialty TEXT GENERATED ALWAYS AS (resource ->> '$.specialty') STORED
);

-- SearchParameter: 17 columns (2 complex skipped)
CREATE TABLE SearchParameter (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  base TEXT GENERATED ALWAYS AS (resource ->> '$.base') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  component TEXT GENERATED ALWAYS AS (resource ->> '$.component.definition.reference') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  derived_from TEXT GENERATED ALWAYS AS (resource ->> '$.derivedFrom.reference') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  target TEXT GENERATED ALWAYS AS (resource ->> '$.target') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- ServiceRequest: 20 columns (1 complex skipped)
CREATE TABLE ServiceRequest (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  authored TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  body_site TEXT GENERATED ALWAYS AS (resource ->> '$.bodySite') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  intent TEXT GENERATED ALWAYS AS (resource ->> '$.intent') STORED,
  occurrence TEXT GENERATED ALWAYS AS (resource ->> '$.occurrence') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  performer_type TEXT GENERATED ALWAYS AS (resource ->> '$.performerType') STORED,
  priority TEXT GENERATED ALWAYS AS (resource ->> '$.priority') STORED,
  replaces TEXT GENERATED ALWAYS AS (resource ->> '$.replaces.reference') STORED,
  requester TEXT GENERATED ALWAYS AS (resource ->> '$.requester.reference') STORED,
  requisition TEXT GENERATED ALWAYS AS (resource ->> '$.requisition') STORED,
  specimen TEXT GENERATED ALWAYS AS (resource ->> '$.specimen.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

-- Slot: 8 columns (0 complex skipped)
CREATE TABLE Slot (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  appointment_type TEXT GENERATED ALWAYS AS (resource ->> '$.appointmentType') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  schedule TEXT GENERATED ALWAYS AS (resource ->> '$.schedule.reference') STORED,
  service_category TEXT GENERATED ALWAYS AS (resource ->> '$.serviceCategory') STORED,
  service_type TEXT GENERATED ALWAYS AS (resource ->> '$.serviceType') STORED,
  specialty TEXT GENERATED ALWAYS AS (resource ->> '$.specialty') STORED,
  start TEXT GENERATED ALWAYS AS (resource ->> '$.start') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- Specimen: 11 columns (1 complex skipped)
CREATE TABLE Specimen (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  accession TEXT GENERATED ALWAYS AS (resource ->> '$.accessionIdentifier') STORED,
  bodysite TEXT GENERATED ALWAYS AS (resource ->> '$.collection.bodySite') STORED,
  collected TEXT GENERATED ALWAYS AS (resource ->> '$.collection.collected') STORED,
  collector TEXT GENERATED ALWAYS AS (resource ->> '$.collection.collector.reference') STORED,
  container TEXT GENERATED ALWAYS AS (resource ->> '$.container.type') STORED,
  container_id TEXT GENERATED ALWAYS AS (resource ->> '$.container.identifier') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  parent TEXT GENERATED ALWAYS AS (resource ->> '$.parent.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

-- SpecimenDefinition: 3 columns (0 complex skipped)
CREATE TABLE SpecimenDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  container TEXT GENERATED ALWAYS AS (resource ->> '$.typeTested.container.type') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.typeCollected') STORED
);

-- StructureDefinition: 24 columns (2 complex skipped)
CREATE TABLE StructureDefinition (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  abstract TEXT GENERATED ALWAYS AS (resource ->> '$.abstract') STORED,
  base TEXT GENERATED ALWAYS AS (resource ->> '$.baseDefinition.reference') STORED,
  base_path TEXT GENERATED ALWAYS AS (resource ->> '$.snapshot.element.base.path') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  derivation TEXT GENERATED ALWAYS AS (resource ->> '$.derivation') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  experimental TEXT GENERATED ALWAYS AS (resource ->> '$.experimental') STORED,
  ext_context TEXT GENERATED ALWAYS AS (resource ->> '$.context.type') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  keyword TEXT GENERATED ALWAYS AS (resource ->> '$.keyword') STORED,
  kind TEXT GENERATED ALWAYS AS (resource ->> '$.kind') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  path TEXT GENERATED ALWAYS AS (resource ->> '$.snapshot.element.path') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  valueset TEXT GENERATED ALWAYS AS (resource ->> '$.snapshot.element.binding.valueSet.reference') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- StructureMap: 13 columns (2 complex skipped)
CREATE TABLE StructureMap (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Subscription: 6 columns (0 complex skipped)
CREATE TABLE Subscription (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  contact TEXT GENERATED ALWAYS AS (resource ->> '$.contact') STORED,
  criteria TEXT GENERATED ALWAYS AS (resource ->> '$.criteria') STORED,
  payload TEXT GENERATED ALWAYS AS (resource ->> '$.channel.payload') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.channel.type') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.channel.endpoint') STORED
);

-- Substance: 7 columns (1 complex skipped)
CREATE TABLE Substance (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  container_identifier TEXT GENERATED ALWAYS AS (resource ->> '$.instance.identifier') STORED,
  expiry TEXT GENERATED ALWAYS AS (resource ->> '$.instance.expiry') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  quantity TEXT GENERATED ALWAYS AS (resource ->> '$.instance.quantity') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- SubstanceSpecification: 1 columns (0 complex skipped)
CREATE TABLE SubstanceSpecification (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code.code') STORED
);

-- SupplyDelivery: 5 columns (0 complex skipped)
CREATE TABLE SupplyDelivery (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  receiver TEXT GENERATED ALWAYS AS (resource ->> '$.receiver.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  supplier TEXT GENERATED ALWAYS AS (resource ->> '$.supplier.reference') STORED
);

-- SupplyRequest: 7 columns (0 complex skipped)
CREATE TABLE SupplyRequest (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  requester TEXT GENERATED ALWAYS AS (resource ->> '$.requester.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.deliverTo.reference') STORED,
  supplier TEXT GENERATED ALWAYS AS (resource ->> '$.supplier.reference') STORED
);

-- Task: 18 columns (1 complex skipped)
CREATE TABLE Task (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  authored_on TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  business_status TEXT GENERATED ALWAYS AS (resource ->> '$.businessStatus') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  focus TEXT GENERATED ALWAYS AS (resource ->> '$.focus.reference') STORED,
  group_identifier TEXT GENERATED ALWAYS AS (resource ->> '$.groupIdentifier') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  intent TEXT GENERATED ALWAYS AS (resource ->> '$.intent') STORED,
  modified TEXT GENERATED ALWAYS AS (resource ->> '$.lastModified') STORED,
  owner TEXT GENERATED ALWAYS AS (resource ->> '$.owner.reference') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performerType') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.executionPeriod') STORED,
  priority TEXT GENERATED ALWAYS AS (resource ->> '$.priority') STORED,
  requester TEXT GENERATED ALWAYS AS (resource ->> '$.requester.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.for.reference') STORED
);

-- TerminologyCapabilities: 12 columns (2 complex skipped)
CREATE TABLE TerminologyCapabilities (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- TestReport: 6 columns (0 complex skipped)
CREATE TABLE TestReport (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  issued TEXT GENERATED ALWAYS AS (resource ->> '$.issued') STORED,
  participant TEXT GENERATED ALWAYS AS (resource ->> '$.participant.uri') STORED,
  result TEXT GENERATED ALWAYS AS (resource ->> '$.result') STORED,
  tester TEXT GENERATED ALWAYS AS (resource ->> '$.tester') STORED,
  testscript TEXT GENERATED ALWAYS AS (resource ->> '$.testScript.reference') STORED
);

-- TestScript: 14 columns (2 complex skipped)
CREATE TABLE TestScript (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  testscript_capability TEXT GENERATED ALWAYS AS (resource ->> '$.metadata.capability.description') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- ValueSet: 16 columns (2 complex skipped)
CREATE TABLE ValueSet (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.expansion.contains.code') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  expansion TEXT GENERATED ALWAYS AS (resource ->> '$.expansion.identifier') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  jurisdiction TEXT GENERATED ALWAYS AS (resource ->> '$.jurisdiction') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  reference TEXT GENERATED ALWAYS AS (resource ->> '$.compose.include.system') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- VerificationResult: 1 columns (0 complex skipped)
CREATE TABLE VerificationResult (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  target TEXT GENERATED ALWAYS AS (resource ->> '$.target.reference') STORED
);

-- VisionPrescription: 6 columns (0 complex skipped)
CREATE TABLE VisionPrescription (
  id TEXT PRIMARY KEY,
  versionId INTEGER,
  lastUpdated TEXT,
  resource JSON NOT NULL,
  datewritten TEXT GENERATED ALWAYS AS (resource ->> '$.dateWritten') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  identifier TEXT GENERATED ALWAYS AS (resource ->> '$.identifier') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  prescriber TEXT GENERATED ALWAYS AS (resource ->> '$.prescriber.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- Summary: 133 resources, 1480 columns
-- 217 complex expressions skipped (would need fhirpath UDF)

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

CREATE TRIGGER Account_identifier_insert AFTER INSERT ON Account
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Account', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ActivityDefinition_identifier_insert AFTER INSERT ON ActivityDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ActivityDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER AdverseEvent_identifier_insert AFTER INSERT ON AdverseEvent
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'AdverseEvent', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER AllergyIntolerance_identifier_insert AFTER INSERT ON AllergyIntolerance
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'AllergyIntolerance', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Appointment_identifier_insert AFTER INSERT ON Appointment
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Appointment', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER AppointmentResponse_identifier_insert AFTER INSERT ON AppointmentResponse
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'AppointmentResponse', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER AuditEvent_identifier_insert AFTER INSERT ON AuditEvent
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'AuditEvent', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Basic_identifier_insert AFTER INSERT ON Basic
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Basic', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER BodyStructure_identifier_insert AFTER INSERT ON BodyStructure
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'BodyStructure', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Bundle_identifier_insert AFTER INSERT ON Bundle
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Bundle', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER CapabilityStatement_identifier_insert AFTER INSERT ON CapabilityStatement
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'CapabilityStatement', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER CarePlan_identifier_insert AFTER INSERT ON CarePlan
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'CarePlan', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER CareTeam_identifier_insert AFTER INSERT ON CareTeam
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'CareTeam', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ChargeItem_identifier_insert AFTER INSERT ON ChargeItem
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ChargeItem', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ChargeItemDefinition_identifier_insert AFTER INSERT ON ChargeItemDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ChargeItemDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Claim_identifier_insert AFTER INSERT ON Claim
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Claim', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ClaimResponse_identifier_insert AFTER INSERT ON ClaimResponse
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ClaimResponse', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ClinicalImpression_identifier_insert AFTER INSERT ON ClinicalImpression
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ClinicalImpression', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER CodeSystem_identifier_insert AFTER INSERT ON CodeSystem
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'CodeSystem', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Communication_identifier_insert AFTER INSERT ON Communication
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Communication', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER CommunicationRequest_identifier_insert AFTER INSERT ON CommunicationRequest
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'CommunicationRequest', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER CompartmentDefinition_identifier_insert AFTER INSERT ON CompartmentDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'CompartmentDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Composition_identifier_insert AFTER INSERT ON Composition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Composition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ConceptMap_identifier_insert AFTER INSERT ON ConceptMap
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ConceptMap', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Condition_identifier_insert AFTER INSERT ON Condition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Condition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Consent_identifier_insert AFTER INSERT ON Consent
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Consent', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Contract_identifier_insert AFTER INSERT ON Contract
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Contract', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Coverage_identifier_insert AFTER INSERT ON Coverage
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Coverage', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER CoverageEligibilityRequest_identifier_insert AFTER INSERT ON CoverageEligibilityRequest
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'CoverageEligibilityRequest', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER CoverageEligibilityResponse_identifier_insert AFTER INSERT ON CoverageEligibilityResponse
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'CoverageEligibilityResponse', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER DetectedIssue_identifier_insert AFTER INSERT ON DetectedIssue
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'DetectedIssue', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Device_identifier_insert AFTER INSERT ON Device
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Device', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER DeviceDefinition_identifier_insert AFTER INSERT ON DeviceDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'DeviceDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER DeviceMetric_identifier_insert AFTER INSERT ON DeviceMetric
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'DeviceMetric', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER DeviceRequest_identifier_insert AFTER INSERT ON DeviceRequest
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'DeviceRequest', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER DeviceUseStatement_identifier_insert AFTER INSERT ON DeviceUseStatement
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'DeviceUseStatement', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER DiagnosticReport_identifier_insert AFTER INSERT ON DiagnosticReport
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'DiagnosticReport', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER DocumentManifest_identifier_insert AFTER INSERT ON DocumentManifest
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'DocumentManifest', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER DocumentReference_identifier_insert AFTER INSERT ON DocumentReference
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'DocumentReference', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER EffectEvidenceSynthesis_identifier_insert AFTER INSERT ON EffectEvidenceSynthesis
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'EffectEvidenceSynthesis', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Encounter_identifier_insert AFTER INSERT ON Encounter
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Encounter', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Endpoint_identifier_insert AFTER INSERT ON Endpoint
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Endpoint', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER EnrollmentRequest_identifier_insert AFTER INSERT ON EnrollmentRequest
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'EnrollmentRequest', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER EnrollmentResponse_identifier_insert AFTER INSERT ON EnrollmentResponse
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'EnrollmentResponse', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER EpisodeOfCare_identifier_insert AFTER INSERT ON EpisodeOfCare
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'EpisodeOfCare', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER EventDefinition_identifier_insert AFTER INSERT ON EventDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'EventDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Evidence_identifier_insert AFTER INSERT ON Evidence
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Evidence', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER EvidenceVariable_identifier_insert AFTER INSERT ON EvidenceVariable
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'EvidenceVariable', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ExampleScenario_identifier_insert AFTER INSERT ON ExampleScenario
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ExampleScenario', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ExplanationOfBenefit_identifier_insert AFTER INSERT ON ExplanationOfBenefit
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ExplanationOfBenefit', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER FamilyMemberHistory_identifier_insert AFTER INSERT ON FamilyMemberHistory
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'FamilyMemberHistory', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Flag_identifier_insert AFTER INSERT ON Flag
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Flag', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Goal_identifier_insert AFTER INSERT ON Goal
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Goal', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER GraphDefinition_identifier_insert AFTER INSERT ON GraphDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'GraphDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Group_identifier_insert AFTER INSERT ON "Group"
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Group', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER GuidanceResponse_identifier_insert AFTER INSERT ON GuidanceResponse
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'GuidanceResponse', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER HealthcareService_identifier_insert AFTER INSERT ON HealthcareService
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'HealthcareService', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ImagingStudy_identifier_insert AFTER INSERT ON ImagingStudy
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ImagingStudy', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Immunization_identifier_insert AFTER INSERT ON Immunization
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Immunization', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ImmunizationEvaluation_identifier_insert AFTER INSERT ON ImmunizationEvaluation
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ImmunizationEvaluation', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ImmunizationRecommendation_identifier_insert AFTER INSERT ON ImmunizationRecommendation
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ImmunizationRecommendation', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ImplementationGuide_identifier_insert AFTER INSERT ON ImplementationGuide
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ImplementationGuide', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER InsurancePlan_identifier_insert AFTER INSERT ON InsurancePlan
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'InsurancePlan', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Invoice_identifier_insert AFTER INSERT ON Invoice
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Invoice', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Library_identifier_insert AFTER INSERT ON Library
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Library', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Linkage_identifier_insert AFTER INSERT ON Linkage
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Linkage', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER List_identifier_insert AFTER INSERT ON List
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'List', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Location_identifier_insert AFTER INSERT ON Location
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Location', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Measure_identifier_insert AFTER INSERT ON Measure
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Measure', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MeasureReport_identifier_insert AFTER INSERT ON MeasureReport
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MeasureReport', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Media_identifier_insert AFTER INSERT ON Media
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Media', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Medication_identifier_insert AFTER INSERT ON Medication
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Medication', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicationAdministration_identifier_insert AFTER INSERT ON MedicationAdministration
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicationAdministration', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicationDispense_identifier_insert AFTER INSERT ON MedicationDispense
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicationDispense', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicationKnowledge_identifier_insert AFTER INSERT ON MedicationKnowledge
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicationKnowledge', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicationRequest_identifier_insert AFTER INSERT ON MedicationRequest
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicationRequest', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicationStatement_identifier_insert AFTER INSERT ON MedicationStatement
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicationStatement', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicinalProduct_identifier_insert AFTER INSERT ON MedicinalProduct
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicinalProduct', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicinalProductAuthorization_identifier_insert AFTER INSERT ON MedicinalProductAuthorization
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicinalProductAuthorization', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicinalProductContraindication_identifier_insert AFTER INSERT ON MedicinalProductContraindication
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicinalProductContraindication', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicinalProductIndication_identifier_insert AFTER INSERT ON MedicinalProductIndication
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicinalProductIndication', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicinalProductInteraction_identifier_insert AFTER INSERT ON MedicinalProductInteraction
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicinalProductInteraction', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicinalProductPackaged_identifier_insert AFTER INSERT ON MedicinalProductPackaged
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicinalProductPackaged', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicinalProductPharmaceutical_identifier_insert AFTER INSERT ON MedicinalProductPharmaceutical
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicinalProductPharmaceutical', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MedicinalProductUndesirableEffect_identifier_insert AFTER INSERT ON MedicinalProductUndesirableEffect
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MedicinalProductUndesirableEffect', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MessageDefinition_identifier_insert AFTER INSERT ON MessageDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MessageDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MessageHeader_identifier_insert AFTER INSERT ON MessageHeader
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MessageHeader', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER MolecularSequence_identifier_insert AFTER INSERT ON MolecularSequence
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'MolecularSequence', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER NamingSystem_identifier_insert AFTER INSERT ON NamingSystem
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'NamingSystem', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER NutritionOrder_identifier_insert AFTER INSERT ON NutritionOrder
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'NutritionOrder', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Observation_identifier_insert AFTER INSERT ON Observation
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Observation', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER OperationDefinition_identifier_insert AFTER INSERT ON OperationDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'OperationDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Organization_identifier_insert AFTER INSERT ON Organization
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Organization', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER OrganizationAffiliation_identifier_insert AFTER INSERT ON OrganizationAffiliation
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'OrganizationAffiliation', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Patient_identifier_insert AFTER INSERT ON Patient
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Patient', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Patient_humanname_insert AFTER INSERT ON Patient
BEGIN
  INSERT INTO HumanName (resourceType, resourceId, family, given, use)
  SELECT 'Patient', NEW.id,
         json_extract(n.value, '$.family'),
         g.value,
         json_extract(n.value, '$.use')
  FROM json_each(NEW.resource, '$.name') AS n,
       json_each(json_extract(n.value, '$.given')) AS g;
END;

CREATE TRIGGER PaymentNotice_identifier_insert AFTER INSERT ON PaymentNotice
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'PaymentNotice', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER PaymentReconciliation_identifier_insert AFTER INSERT ON PaymentReconciliation
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'PaymentReconciliation', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Person_identifier_insert AFTER INSERT ON Person
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Person', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Person_humanname_insert AFTER INSERT ON Person
BEGIN
  INSERT INTO HumanName (resourceType, resourceId, family, given, use)
  SELECT 'Person', NEW.id,
         json_extract(n.value, '$.family'),
         g.value,
         json_extract(n.value, '$.use')
  FROM json_each(NEW.resource, '$.name') AS n,
       json_each(json_extract(n.value, '$.given')) AS g;
END;

CREATE TRIGGER PlanDefinition_identifier_insert AFTER INSERT ON PlanDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'PlanDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Practitioner_identifier_insert AFTER INSERT ON Practitioner
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Practitioner', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Practitioner_humanname_insert AFTER INSERT ON Practitioner
BEGIN
  INSERT INTO HumanName (resourceType, resourceId, family, given, use)
  SELECT 'Practitioner', NEW.id,
         json_extract(n.value, '$.family'),
         g.value,
         json_extract(n.value, '$.use')
  FROM json_each(NEW.resource, '$.name') AS n,
       json_each(json_extract(n.value, '$.given')) AS g;
END;

CREATE TRIGGER PractitionerRole_identifier_insert AFTER INSERT ON PractitionerRole
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'PractitionerRole', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Procedure_identifier_insert AFTER INSERT ON Procedure
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Procedure', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Provenance_identifier_insert AFTER INSERT ON Provenance
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Provenance', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Questionnaire_identifier_insert AFTER INSERT ON Questionnaire
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Questionnaire', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER QuestionnaireResponse_identifier_insert AFTER INSERT ON QuestionnaireResponse
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'QuestionnaireResponse', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER RelatedPerson_identifier_insert AFTER INSERT ON RelatedPerson
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'RelatedPerson', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER RelatedPerson_humanname_insert AFTER INSERT ON RelatedPerson
BEGIN
  INSERT INTO HumanName (resourceType, resourceId, family, given, use)
  SELECT 'RelatedPerson', NEW.id,
         json_extract(n.value, '$.family'),
         g.value,
         json_extract(n.value, '$.use')
  FROM json_each(NEW.resource, '$.name') AS n,
       json_each(json_extract(n.value, '$.given')) AS g;
END;

CREATE TRIGGER RequestGroup_identifier_insert AFTER INSERT ON RequestGroup
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'RequestGroup', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ResearchDefinition_identifier_insert AFTER INSERT ON ResearchDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ResearchDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ResearchElementDefinition_identifier_insert AFTER INSERT ON ResearchElementDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ResearchElementDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ResearchStudy_identifier_insert AFTER INSERT ON ResearchStudy
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ResearchStudy', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ResearchSubject_identifier_insert AFTER INSERT ON ResearchSubject
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ResearchSubject', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER RiskAssessment_identifier_insert AFTER INSERT ON RiskAssessment
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'RiskAssessment', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER RiskEvidenceSynthesis_identifier_insert AFTER INSERT ON RiskEvidenceSynthesis
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'RiskEvidenceSynthesis', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Schedule_identifier_insert AFTER INSERT ON Schedule
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Schedule', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER SearchParameter_identifier_insert AFTER INSERT ON SearchParameter
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'SearchParameter', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ServiceRequest_identifier_insert AFTER INSERT ON ServiceRequest
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ServiceRequest', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Slot_identifier_insert AFTER INSERT ON Slot
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Slot', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Specimen_identifier_insert AFTER INSERT ON Specimen
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Specimen', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER SpecimenDefinition_identifier_insert AFTER INSERT ON SpecimenDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'SpecimenDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER StructureDefinition_identifier_insert AFTER INSERT ON StructureDefinition
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'StructureDefinition', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER StructureMap_identifier_insert AFTER INSERT ON StructureMap
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'StructureMap', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Subscription_identifier_insert AFTER INSERT ON Subscription
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Subscription', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Substance_identifier_insert AFTER INSERT ON Substance
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Substance', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER SubstanceSpecification_identifier_insert AFTER INSERT ON SubstanceSpecification
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'SubstanceSpecification', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER SupplyDelivery_identifier_insert AFTER INSERT ON SupplyDelivery
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'SupplyDelivery', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER SupplyRequest_identifier_insert AFTER INSERT ON SupplyRequest
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'SupplyRequest', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Task_identifier_insert AFTER INSERT ON Task
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Task', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER TerminologyCapabilities_identifier_insert AFTER INSERT ON TerminologyCapabilities
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'TerminologyCapabilities', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER TestReport_identifier_insert AFTER INSERT ON TestReport
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'TestReport', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER TestScript_identifier_insert AFTER INSERT ON TestScript
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'TestScript', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER ValueSet_identifier_insert AFTER INSERT ON ValueSet
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'ValueSet', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER VerificationResult_identifier_insert AFTER INSERT ON VerificationResult
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'VerificationResult', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER VisionPrescription_identifier_insert AFTER INSERT ON VisionPrescription
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'VisionPrescription', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

