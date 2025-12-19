-- fhir-sqlite schema (simple paths only, no UDF required)
-- Generated from FHIR R4 SearchParameters

-- Account: 5 columns (1 complex skipped)
CREATE TABLE Account (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  owner TEXT GENERATED ALWAYS AS (resource ->> '$.owner.reference') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.servicePeriod') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_account_owner ON Account(owner);
CREATE INDEX idx_account_subject ON Account(subject);

-- ActivityDefinition: 12 columns (7 complex skipped)
CREATE TABLE ActivityDefinition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- AdverseEvent: 8 columns (0 complex skipped)
CREATE TABLE AdverseEvent (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  actuality TEXT GENERATED ALWAYS AS (resource ->> '$.actuality') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  recorder TEXT GENERATED ALWAYS AS (resource ->> '$.recorder.reference') STORED,
  resultingcondition TEXT GENERATED ALWAYS AS (resource ->> '$.resultingCondition.reference') STORED,
  study TEXT GENERATED ALWAYS AS (resource ->> '$.study.reference') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  substance TEXT GENERATED ALWAYS AS (resource ->> '$.suspectEntity.instance.reference') STORED
);

CREATE INDEX idx_adverseevent_location ON AdverseEvent(location);
CREATE INDEX idx_adverseevent_recorder ON AdverseEvent(recorder);
CREATE INDEX idx_adverseevent_resultingcondition ON AdverseEvent(resultingcondition);
CREATE INDEX idx_adverseevent_study ON AdverseEvent(study);
CREATE INDEX idx_adverseevent_subject ON AdverseEvent(subject);
CREATE INDEX idx_adverseevent_substance ON AdverseEvent(substance);

-- AllergyIntolerance: 10 columns (0 complex skipped)
CREATE TABLE AllergyIntolerance (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  asserter TEXT GENERATED ALWAYS AS (resource ->> '$.asserter.reference') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  criticality TEXT GENERATED ALWAYS AS (resource ->> '$.criticality') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.recordedDate') STORED,
  last_date TEXT GENERATED ALWAYS AS (resource ->> '$.lastOccurrence') STORED,
  onset TEXT GENERATED ALWAYS AS (resource ->> '$.reaction.onset') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  recorder TEXT GENERATED ALWAYS AS (resource ->> '$.recorder.reference') STORED,
  severity TEXT GENERATED ALWAYS AS (resource ->> '$.reaction.severity') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

CREATE INDEX idx_allergyintolerance_asserter ON AllergyIntolerance(asserter);
CREATE INDEX idx_allergyintolerance_patient ON AllergyIntolerance(patient);
CREATE INDEX idx_allergyintolerance_recorder ON AllergyIntolerance(recorder);

-- Appointment: 8 columns (3 complex skipped)
CREATE TABLE Appointment (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  actor TEXT GENERATED ALWAYS AS (resource ->> '$.participant.actor.reference') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.start') STORED,
  part_status TEXT GENERATED ALWAYS AS (resource ->> '$.participant.status') STORED,
  reason_reference TEXT GENERATED ALWAYS AS (resource ->> '$.reasonReference.reference') STORED,
  slot TEXT GENERATED ALWAYS AS (resource ->> '$.slot.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  supporting_info TEXT GENERATED ALWAYS AS (resource ->> '$.supportingInformation.reference') STORED
);

CREATE INDEX idx_appointment_actor ON Appointment(actor);
CREATE INDEX idx_appointment_based_on ON Appointment(based_on);
CREATE INDEX idx_appointment_reason_reference ON Appointment(reason_reference);
CREATE INDEX idx_appointment_slot ON Appointment(slot);
CREATE INDEX idx_appointment_supporting_info ON Appointment(supporting_info);

-- AppointmentResponse: 3 columns (3 complex skipped)
CREATE TABLE AppointmentResponse (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  actor TEXT GENERATED ALWAYS AS (resource ->> '$.actor.reference') STORED,
  appointment TEXT GENERATED ALWAYS AS (resource ->> '$.appointment.reference') STORED,
  part_status TEXT GENERATED ALWAYS AS (resource ->> '$.participantStatus') STORED
);

CREATE INDEX idx_appointmentresponse_actor ON AppointmentResponse(actor);
CREATE INDEX idx_appointmentresponse_appointment ON AppointmentResponse(appointment);

-- AuditEvent: 16 columns (1 complex skipped)
CREATE TABLE AuditEvent (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  action TEXT GENERATED ALWAYS AS (resource ->> '$.action') STORED,
  address TEXT GENERATED ALWAYS AS (resource ->> '$.agent.network.address') STORED,
  agent TEXT GENERATED ALWAYS AS (resource ->> '$.agent.who.reference') STORED,
  agent_name TEXT GENERATED ALWAYS AS (resource ->> '$.agent.name') STORED,
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

CREATE INDEX idx_auditevent_agent ON AuditEvent(agent);
CREATE INDEX idx_auditevent_entity ON AuditEvent(entity);
CREATE INDEX idx_auditevent_source ON AuditEvent(source);

-- Basic: 3 columns (1 complex skipped)
CREATE TABLE Basic (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_basic_author ON Basic(author);
CREATE INDEX idx_basic_subject ON Basic(subject);

-- BodyStructure: 1 columns (0 complex skipped)
CREATE TABLE BodyStructure (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED
);

CREATE INDEX idx_bodystructure_patient ON BodyStructure(patient);

-- Bundle: 4 columns (0 complex skipped)
CREATE TABLE Bundle (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  composition TEXT GENERATED ALWAYS AS (resource ->> '$.entry[0].resource.reference') STORED,
  message TEXT GENERATED ALWAYS AS (resource ->> '$.entry[0].resource.reference') STORED,
  timestamp TEXT GENERATED ALWAYS AS (resource ->> '$.timestamp') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

CREATE INDEX idx_bundle_composition ON Bundle(composition);
CREATE INDEX idx_bundle_message ON Bundle(message);

-- CapabilityStatement: 19 columns (2 complex skipped)
CREATE TABLE CapabilityStatement (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  fhirversion TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED,
  format TEXT GENERATED ALWAYS AS (resource ->> '$.format') STORED,
  guide TEXT GENERATED ALWAYS AS (resource ->> '$.implementationGuide.reference') STORED,
  mode TEXT GENERATED ALWAYS AS (resource ->> '$.rest.mode') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  resource_ TEXT GENERATED ALWAYS AS (resource ->> '$.rest.resource.type') STORED,
  resource_profile TEXT GENERATED ALWAYS AS (resource ->> '$.rest.resource.profile.reference') STORED,
  software TEXT GENERATED ALWAYS AS (resource ->> '$.software.name') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  supported_profile TEXT GENERATED ALWAYS AS (resource ->> '$.rest.resource.supportedProfile.reference') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

CREATE INDEX idx_capabilitystatement_guide ON CapabilityStatement(guide);
CREATE INDEX idx_capabilitystatement_resource_profile ON CapabilityStatement(resource_profile);
CREATE INDEX idx_capabilitystatement_supported_profile ON CapabilityStatement(supported_profile);

-- CarePlan: 16 columns (1 complex skipped)
CREATE TABLE CarePlan (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  activity_date TEXT GENERATED ALWAYS AS (resource ->> '$.activity.detail.scheduled') STORED,
  activity_reference TEXT GENERATED ALWAYS AS (resource ->> '$.activity.reference.reference') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  care_team TEXT GENERATED ALWAYS AS (resource ->> '$.careTeam.reference') STORED,
  condition TEXT GENERATED ALWAYS AS (resource ->> '$.addresses.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  goal TEXT GENERATED ALWAYS AS (resource ->> '$.goal.reference') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  intent TEXT GENERATED ALWAYS AS (resource ->> '$.intent') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.activity.detail.performer.reference') STORED,
  replaces TEXT GENERATED ALWAYS AS (resource ->> '$.replaces.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_careplan_activity_reference ON CarePlan(activity_reference);
CREATE INDEX idx_careplan_based_on ON CarePlan(based_on);
CREATE INDEX idx_careplan_care_team ON CarePlan(care_team);
CREATE INDEX idx_careplan_condition ON CarePlan(condition);
CREATE INDEX idx_careplan_encounter ON CarePlan(encounter);
CREATE INDEX idx_careplan_goal ON CarePlan(goal);
CREATE INDEX idx_careplan_instantiates_canonical ON CarePlan(instantiates_canonical);
CREATE INDEX idx_careplan_part_of ON CarePlan(part_of);
CREATE INDEX idx_careplan_performer ON CarePlan(performer);
CREATE INDEX idx_careplan_replaces ON CarePlan(replaces);
CREATE INDEX idx_careplan_subject ON CarePlan(subject);

-- CareTeam: 5 columns (1 complex skipped)
CREATE TABLE CareTeam (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  participant TEXT GENERATED ALWAYS AS (resource ->> '$.participant.member.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_careteam_encounter ON CareTeam(encounter);
CREATE INDEX idx_careteam_participant ON CareTeam(participant);
CREATE INDEX idx_careteam_subject ON CareTeam(subject);

-- ChargeItem: 11 columns (3 complex skipped)
CREATE TABLE ChargeItem (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  account TEXT GENERATED ALWAYS AS (resource ->> '$.account.reference') STORED,
  context TEXT GENERATED ALWAYS AS (resource ->> '$.context.reference') STORED,
  entered_date TEXT GENERATED ALWAYS AS (resource ->> '$.enteredDate') STORED,
  enterer TEXT GENERATED ALWAYS AS (resource ->> '$.enterer.reference') STORED,
  factor_override REAL GENERATED ALWAYS AS (resource ->> '$.factorOverride') STORED,
  occurrence TEXT GENERATED ALWAYS AS (resource ->> '$.occurrence') STORED,
  performer_actor TEXT GENERATED ALWAYS AS (resource ->> '$.performer.actor.reference') STORED,
  performing_organization TEXT GENERATED ALWAYS AS (resource ->> '$.performingOrganization.reference') STORED,
  requesting_organization TEXT GENERATED ALWAYS AS (resource ->> '$.requestingOrganization.reference') STORED,
  service TEXT GENERATED ALWAYS AS (resource ->> '$.service.reference') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_chargeitem_account ON ChargeItem(account);
CREATE INDEX idx_chargeitem_context ON ChargeItem(context);
CREATE INDEX idx_chargeitem_enterer ON ChargeItem(enterer);
CREATE INDEX idx_chargeitem_performer_actor ON ChargeItem(performer_actor);
CREATE INDEX idx_chargeitem_performing_organization ON ChargeItem(performing_organization);
CREATE INDEX idx_chargeitem_requesting_organization ON ChargeItem(requesting_organization);
CREATE INDEX idx_chargeitem_service ON ChargeItem(service);
CREATE INDEX idx_chargeitem_subject ON ChargeItem(subject);

-- ChargeItemDefinition: 11 columns (2 complex skipped)
CREATE TABLE ChargeItemDefinition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Claim: 15 columns (0 complex skipped)
CREATE TABLE Claim (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  care_team TEXT GENERATED ALWAYS AS (resource ->> '$.careTeam.provider.reference') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  detail_udi TEXT GENERATED ALWAYS AS (resource ->> '$.item.detail.udi.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.item.encounter.reference') STORED,
  enterer TEXT GENERATED ALWAYS AS (resource ->> '$.enterer.reference') STORED,
  facility TEXT GENERATED ALWAYS AS (resource ->> '$.facility.reference') STORED,
  insurer TEXT GENERATED ALWAYS AS (resource ->> '$.insurer.reference') STORED,
  item_udi TEXT GENERATED ALWAYS AS (resource ->> '$.item.udi.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  payee TEXT GENERATED ALWAYS AS (resource ->> '$.payee.party.reference') STORED,
  procedure_udi TEXT GENERATED ALWAYS AS (resource ->> '$.procedure.udi.reference') STORED,
  provider TEXT GENERATED ALWAYS AS (resource ->> '$.provider.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subdetail_udi TEXT GENERATED ALWAYS AS (resource ->> '$.item.detail.subDetail.udi.reference') STORED,
  use TEXT GENERATED ALWAYS AS (resource ->> '$.use') STORED
);

CREATE INDEX idx_claim_care_team ON Claim(care_team);
CREATE INDEX idx_claim_detail_udi ON Claim(detail_udi);
CREATE INDEX idx_claim_encounter ON Claim(encounter);
CREATE INDEX idx_claim_enterer ON Claim(enterer);
CREATE INDEX idx_claim_facility ON Claim(facility);
CREATE INDEX idx_claim_insurer ON Claim(insurer);
CREATE INDEX idx_claim_item_udi ON Claim(item_udi);
CREATE INDEX idx_claim_patient ON Claim(patient);
CREATE INDEX idx_claim_payee ON Claim(payee);
CREATE INDEX idx_claim_procedure_udi ON Claim(procedure_udi);
CREATE INDEX idx_claim_provider ON Claim(provider);
CREATE INDEX idx_claim_subdetail_udi ON Claim(subdetail_udi);

-- ClaimResponse: 10 columns (0 complex skipped)
CREATE TABLE ClaimResponse (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  disposition TEXT GENERATED ALWAYS AS (resource ->> '$.disposition') STORED,
  insurer TEXT GENERATED ALWAYS AS (resource ->> '$.insurer.reference') STORED,
  outcome TEXT GENERATED ALWAYS AS (resource ->> '$.outcome') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  payment_date TEXT GENERATED ALWAYS AS (resource ->> '$.payment.date') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.request.reference') STORED,
  requestor TEXT GENERATED ALWAYS AS (resource ->> '$.requestor.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  use TEXT GENERATED ALWAYS AS (resource ->> '$.use') STORED
);

CREATE INDEX idx_claimresponse_insurer ON ClaimResponse(insurer);
CREATE INDEX idx_claimresponse_patient ON ClaimResponse(patient);
CREATE INDEX idx_claimresponse_request ON ClaimResponse(request);
CREATE INDEX idx_claimresponse_requestor ON ClaimResponse(requestor);

-- ClinicalImpression: 10 columns (1 complex skipped)
CREATE TABLE ClinicalImpression (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  assessor TEXT GENERATED ALWAYS AS (resource ->> '$.assessor.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  finding_ref TEXT GENERATED ALWAYS AS (resource ->> '$.finding.itemReference.reference') STORED,
  investigation TEXT GENERATED ALWAYS AS (resource ->> '$.investigation.item.reference') STORED,
  previous TEXT GENERATED ALWAYS AS (resource ->> '$.previous.reference') STORED,
  problem TEXT GENERATED ALWAYS AS (resource ->> '$.problem.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  supporting_info TEXT GENERATED ALWAYS AS (resource ->> '$.supportingInfo.reference') STORED
);

CREATE INDEX idx_clinicalimpression_assessor ON ClinicalImpression(assessor);
CREATE INDEX idx_clinicalimpression_encounter ON ClinicalImpression(encounter);
CREATE INDEX idx_clinicalimpression_finding_ref ON ClinicalImpression(finding_ref);
CREATE INDEX idx_clinicalimpression_investigation ON ClinicalImpression(investigation);
CREATE INDEX idx_clinicalimpression_previous ON ClinicalImpression(previous);
CREATE INDEX idx_clinicalimpression_problem ON ClinicalImpression(problem);
CREATE INDEX idx_clinicalimpression_subject ON ClinicalImpression(subject);
CREATE INDEX idx_clinicalimpression_supporting_info ON ClinicalImpression(supporting_info);

-- CodeSystem: 16 columns (2 complex skipped)
CREATE TABLE CodeSystem (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.concept.code') STORED,
  content_mode TEXT GENERATED ALWAYS AS (resource ->> '$.content') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
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

CREATE INDEX idx_codesystem_supplements ON CodeSystem(supplements);

-- Communication: 11 columns (1 complex skipped)
CREATE TABLE Communication (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  received TEXT GENERATED ALWAYS AS (resource ->> '$.received') STORED,
  recipient TEXT GENERATED ALWAYS AS (resource ->> '$.recipient.reference') STORED,
  sender TEXT GENERATED ALWAYS AS (resource ->> '$.sender.reference') STORED,
  sent TEXT GENERATED ALWAYS AS (resource ->> '$.sent') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_communication_based_on ON Communication(based_on);
CREATE INDEX idx_communication_encounter ON Communication(encounter);
CREATE INDEX idx_communication_instantiates_canonical ON Communication(instantiates_canonical);
CREATE INDEX idx_communication_part_of ON Communication(part_of);
CREATE INDEX idx_communication_recipient ON Communication(recipient);
CREATE INDEX idx_communication_sender ON Communication(sender);
CREATE INDEX idx_communication_subject ON Communication(subject);

-- CommunicationRequest: 10 columns (2 complex skipped)
CREATE TABLE CommunicationRequest (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  authored TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  priority TEXT GENERATED ALWAYS AS (resource ->> '$.priority') STORED,
  recipient TEXT GENERATED ALWAYS AS (resource ->> '$.recipient.reference') STORED,
  replaces TEXT GENERATED ALWAYS AS (resource ->> '$.replaces.reference') STORED,
  requester TEXT GENERATED ALWAYS AS (resource ->> '$.requester.reference') STORED,
  sender TEXT GENERATED ALWAYS AS (resource ->> '$.sender.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_communicationrequest_based_on ON CommunicationRequest(based_on);
CREATE INDEX idx_communicationrequest_encounter ON CommunicationRequest(encounter);
CREATE INDEX idx_communicationrequest_recipient ON CommunicationRequest(recipient);
CREATE INDEX idx_communicationrequest_replaces ON CommunicationRequest(replaces);
CREATE INDEX idx_communicationrequest_requester ON CommunicationRequest(requester);
CREATE INDEX idx_communicationrequest_sender ON CommunicationRequest(sender);
CREATE INDEX idx_communicationrequest_subject ON CommunicationRequest(subject);

-- CompartmentDefinition: 12 columns (2 complex skipped)
CREATE TABLE CompartmentDefinition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
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

-- Composition: 10 columns (3 complex skipped)
CREATE TABLE Composition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  attester TEXT GENERATED ALWAYS AS (resource ->> '$.attester.party.reference') STORED,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  confidentiality TEXT GENERATED ALWAYS AS (resource ->> '$.confidentiality') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  entry TEXT GENERATED ALWAYS AS (resource ->> '$.section.entry.reference') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.event.period') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED
);

CREATE INDEX idx_composition_attester ON Composition(attester);
CREATE INDEX idx_composition_author ON Composition(author);
CREATE INDEX idx_composition_encounter ON Composition(encounter);
CREATE INDEX idx_composition_entry ON Composition(entry);
CREATE INDEX idx_composition_subject ON Composition(subject);

-- ConceptMap: 18 columns (6 complex skipped)
CREATE TABLE ConceptMap (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  dependson TEXT GENERATED ALWAYS AS (resource ->> '$.group.element.target.dependsOn.property') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
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

CREATE INDEX idx_conceptmap_other ON ConceptMap(other);

-- Condition: 9 columns (3 complex skipped)
CREATE TABLE Condition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  abatement_date TEXT GENERATED ALWAYS AS (resource ->> '$.abatement.as(dateTime)') STORED,
  abatement_string TEXT GENERATED ALWAYS AS (resource ->> '$.abatement.as(string)') STORED,
  asserter TEXT GENERATED ALWAYS AS (resource ->> '$.asserter.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  evidence_detail TEXT GENERATED ALWAYS AS (resource ->> '$.evidence.detail.reference') STORED,
  onset_date TEXT GENERATED ALWAYS AS (resource ->> '$.onset.as(dateTime)') STORED,
  onset_info TEXT GENERATED ALWAYS AS (resource ->> '$.onset.as(string)') STORED,
  recorded_date TEXT GENERATED ALWAYS AS (resource ->> '$.recordedDate') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_condition_asserter ON Condition(asserter);
CREATE INDEX idx_condition_encounter ON Condition(encounter);
CREATE INDEX idx_condition_evidence_detail ON Condition(evidence_detail);
CREATE INDEX idx_condition_subject ON Condition(subject);

-- Consent: 11 columns (0 complex skipped)
CREATE TABLE Consent (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  actor TEXT GENERATED ALWAYS AS (resource ->> '$.provision.actor.reference.reference') STORED,
  consentor TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  data TEXT GENERATED ALWAYS AS (resource ->> '$.provision.data.reference.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.dateTime') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.organization.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.provision.period') STORED,
  purpose TEXT GENERATED ALWAYS AS (resource ->> '$.provision.purpose') STORED,
  security_label TEXT GENERATED ALWAYS AS (resource ->> '$.provision.securityLabel') STORED,
  source_reference TEXT GENERATED ALWAYS AS (resource ->> '$.source.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_consent_actor ON Consent(actor);
CREATE INDEX idx_consent_consentor ON Consent(consentor);
CREATE INDEX idx_consent_data ON Consent(data);
CREATE INDEX idx_consent_organization ON Consent(organization);
CREATE INDEX idx_consent_patient ON Consent(patient);
CREATE INDEX idx_consent_source_reference ON Consent(source_reference);

-- Contract: 8 columns (1 complex skipped)
CREATE TABLE Contract (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  authority TEXT GENERATED ALWAYS AS (resource ->> '$.authority.reference') STORED,
  domain TEXT GENERATED ALWAYS AS (resource ->> '$.domain.reference') STORED,
  instantiates TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  issued TEXT GENERATED ALWAYS AS (resource ->> '$.issued') STORED,
  signer TEXT GENERATED ALWAYS AS (resource ->> '$.signer.party.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED
);

CREATE INDEX idx_contract_authority ON Contract(authority);
CREATE INDEX idx_contract_domain ON Contract(domain);
CREATE INDEX idx_contract_signer ON Contract(signer);
CREATE INDEX idx_contract_subject ON Contract(subject);

-- Coverage: 8 columns (0 complex skipped)
CREATE TABLE Coverage (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  beneficiary TEXT GENERATED ALWAYS AS (resource ->> '$.beneficiary.reference') STORED,
  class_value TEXT GENERATED ALWAYS AS (resource ->> '$.class.value') STORED,
  dependent TEXT GENERATED ALWAYS AS (resource ->> '$.dependent') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.beneficiary.reference') STORED,
  payor TEXT GENERATED ALWAYS AS (resource ->> '$.payor.reference') STORED,
  policy_holder TEXT GENERATED ALWAYS AS (resource ->> '$.policyHolder.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subscriber TEXT GENERATED ALWAYS AS (resource ->> '$.subscriber.reference') STORED
);

CREATE INDEX idx_coverage_beneficiary ON Coverage(beneficiary);
CREATE INDEX idx_coverage_patient ON Coverage(patient);
CREATE INDEX idx_coverage_payor ON Coverage(payor);
CREATE INDEX idx_coverage_policy_holder ON Coverage(policy_holder);
CREATE INDEX idx_coverage_subscriber ON Coverage(subscriber);

-- CoverageEligibilityRequest: 6 columns (0 complex skipped)
CREATE TABLE CoverageEligibilityRequest (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  enterer TEXT GENERATED ALWAYS AS (resource ->> '$.enterer.reference') STORED,
  facility TEXT GENERATED ALWAYS AS (resource ->> '$.facility.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  provider TEXT GENERATED ALWAYS AS (resource ->> '$.provider.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_coverageeligibilityrequest_enterer ON CoverageEligibilityRequest(enterer);
CREATE INDEX idx_coverageeligibilityrequest_facility ON CoverageEligibilityRequest(facility);
CREATE INDEX idx_coverageeligibilityrequest_patient ON CoverageEligibilityRequest(patient);
CREATE INDEX idx_coverageeligibilityrequest_provider ON CoverageEligibilityRequest(provider);

-- CoverageEligibilityResponse: 8 columns (0 complex skipped)
CREATE TABLE CoverageEligibilityResponse (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  disposition TEXT GENERATED ALWAYS AS (resource ->> '$.disposition') STORED,
  insurer TEXT GENERATED ALWAYS AS (resource ->> '$.insurer.reference') STORED,
  outcome TEXT GENERATED ALWAYS AS (resource ->> '$.outcome') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.request.reference') STORED,
  requestor TEXT GENERATED ALWAYS AS (resource ->> '$.requestor.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_coverageeligibilityresponse_insurer ON CoverageEligibilityResponse(insurer);
CREATE INDEX idx_coverageeligibilityresponse_patient ON CoverageEligibilityResponse(patient);
CREATE INDEX idx_coverageeligibilityresponse_request ON CoverageEligibilityResponse(request);
CREATE INDEX idx_coverageeligibilityresponse_requestor ON CoverageEligibilityResponse(requestor);

-- DetectedIssue: 4 columns (0 complex skipped)
CREATE TABLE DetectedIssue (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  identified TEXT GENERATED ALWAYS AS (resource ->> '$.identified') STORED,
  implicated TEXT GENERATED ALWAYS AS (resource ->> '$.implicated.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED
);

CREATE INDEX idx_detectedissue_author ON DetectedIssue(author);
CREATE INDEX idx_detectedissue_implicated ON DetectedIssue(implicated);
CREATE INDEX idx_detectedissue_patient ON DetectedIssue(patient);

-- Device: 10 columns (1 complex skipped)
CREATE TABLE Device (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  device_name TEXT GENERATED ALWAYS AS (resource ->> '$.deviceName.name') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  manufacturer TEXT GENERATED ALWAYS AS (resource ->> '$.manufacturer') STORED,
  model TEXT GENERATED ALWAYS AS (resource ->> '$.modelNumber') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.owner.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  udi_carrier TEXT GENERATED ALWAYS AS (resource ->> '$.udiCarrier.carrierHRF') STORED,
  udi_di TEXT GENERATED ALWAYS AS (resource ->> '$.udiCarrier.deviceIdentifier') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED
);

CREATE INDEX idx_device_location ON Device(location);
CREATE INDEX idx_device_organization ON Device(organization);
CREATE INDEX idx_device_patient ON Device(patient);

-- DeviceDefinition: 1 columns (0 complex skipped)
CREATE TABLE DeviceDefinition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  parent TEXT GENERATED ALWAYS AS (resource ->> '$.parentDevice.reference') STORED
);

CREATE INDEX idx_devicedefinition_parent ON DeviceDefinition(parent);

-- DeviceMetric: 3 columns (0 complex skipped)
CREATE TABLE DeviceMetric (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  parent TEXT GENERATED ALWAYS AS (resource ->> '$.parent.reference') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.source.reference') STORED
);

CREATE INDEX idx_devicemetric_parent ON DeviceMetric(parent);
CREATE INDEX idx_devicemetric_source ON DeviceMetric(source);

-- DeviceRequest: 12 columns (4 complex skipped)
CREATE TABLE DeviceRequest (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  authored_on TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
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

CREATE INDEX idx_devicerequest_based_on ON DeviceRequest(based_on);
CREATE INDEX idx_devicerequest_encounter ON DeviceRequest(encounter);
CREATE INDEX idx_devicerequest_instantiates_canonical ON DeviceRequest(instantiates_canonical);
CREATE INDEX idx_devicerequest_insurance ON DeviceRequest(insurance);
CREATE INDEX idx_devicerequest_performer ON DeviceRequest(performer);
CREATE INDEX idx_devicerequest_prior_request ON DeviceRequest(prior_request);
CREATE INDEX idx_devicerequest_requester ON DeviceRequest(requester);
CREATE INDEX idx_devicerequest_subject ON DeviceRequest(subject);

-- DeviceUseStatement: 3 columns (0 complex skipped)
CREATE TABLE DeviceUseStatement (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  device TEXT GENERATED ALWAYS AS (resource ->> '$.device.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_deviceusestatement_device ON DeviceUseStatement(device);
CREATE INDEX idx_deviceusestatement_patient ON DeviceUseStatement(patient);
CREATE INDEX idx_deviceusestatement_subject ON DeviceUseStatement(subject);

-- DiagnosticReport: 11 columns (2 complex skipped)
CREATE TABLE DiagnosticReport (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.effective') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  issued TEXT GENERATED ALWAYS AS (resource ->> '$.issued') STORED,
  media TEXT GENERATED ALWAYS AS (resource ->> '$.media.link.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  result TEXT GENERATED ALWAYS AS (resource ->> '$.result.reference') STORED,
  results_interpreter TEXT GENERATED ALWAYS AS (resource ->> '$.resultsInterpreter.reference') STORED,
  specimen TEXT GENERATED ALWAYS AS (resource ->> '$.specimen.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_diagnosticreport_based_on ON DiagnosticReport(based_on);
CREATE INDEX idx_diagnosticreport_encounter ON DiagnosticReport(encounter);
CREATE INDEX idx_diagnosticreport_media ON DiagnosticReport(media);
CREATE INDEX idx_diagnosticreport_performer ON DiagnosticReport(performer);
CREATE INDEX idx_diagnosticreport_result ON DiagnosticReport(result);
CREATE INDEX idx_diagnosticreport_results_interpreter ON DiagnosticReport(results_interpreter);
CREATE INDEX idx_diagnosticreport_specimen ON DiagnosticReport(specimen);
CREATE INDEX idx_diagnosticreport_subject ON DiagnosticReport(subject);

-- DocumentManifest: 9 columns (1 complex skipped)
CREATE TABLE DocumentManifest (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  item TEXT GENERATED ALWAYS AS (resource ->> '$.content.reference') STORED,
  recipient TEXT GENERATED ALWAYS AS (resource ->> '$.recipient.reference') STORED,
  related_ref TEXT GENERATED ALWAYS AS (resource ->> '$.related.ref.reference') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.source') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_documentmanifest_author ON DocumentManifest(author);
CREATE INDEX idx_documentmanifest_item ON DocumentManifest(item);
CREATE INDEX idx_documentmanifest_recipient ON DocumentManifest(recipient);
CREATE INDEX idx_documentmanifest_related_ref ON DocumentManifest(related_ref);
CREATE INDEX idx_documentmanifest_subject ON DocumentManifest(subject);

-- DocumentReference: 17 columns (1 complex skipped)
CREATE TABLE DocumentReference (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  authenticator TEXT GENERATED ALWAYS AS (resource ->> '$.authenticator.reference') STORED,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  contenttype TEXT GENERATED ALWAYS AS (resource ->> '$.content.attachment.contentType') STORED,
  custodian TEXT GENERATED ALWAYS AS (resource ->> '$.custodian.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.context.encounter.reference') STORED,
  format TEXT GENERATED ALWAYS AS (resource ->> '$.content.format') STORED,
  language TEXT GENERATED ALWAYS AS (resource ->> '$.content.attachment.language') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.content.attachment.url') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.context.period') STORED,
  related TEXT GENERATED ALWAYS AS (resource ->> '$.context.related.reference') STORED,
  relatesto TEXT GENERATED ALWAYS AS (resource ->> '$.relatesTo.target.reference') STORED,
  relation TEXT GENERATED ALWAYS AS (resource ->> '$.relatesTo.code') STORED,
  relationship JSON GENERATED ALWAYS AS (resource ->> '$.relatesTo') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_documentreference_authenticator ON DocumentReference(authenticator);
CREATE INDEX idx_documentreference_author ON DocumentReference(author);
CREATE INDEX idx_documentreference_custodian ON DocumentReference(custodian);
CREATE INDEX idx_documentreference_encounter ON DocumentReference(encounter);
CREATE INDEX idx_documentreference_related ON DocumentReference(related);
CREATE INDEX idx_documentreference_relatesto ON DocumentReference(relatesto);
CREATE INDEX idx_documentreference_subject ON DocumentReference(subject);

-- EffectEvidenceSynthesis: 12 columns (2 complex skipped)
CREATE TABLE EffectEvidenceSynthesis (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Encounter: 15 columns (3 complex skipped)
CREATE TABLE Encounter (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  account TEXT GENERATED ALWAYS AS (resource ->> '$.account.reference') STORED,
  appointment TEXT GENERATED ALWAYS AS (resource ->> '$.appointment.reference') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  class_ TEXT GENERATED ALWAYS AS (resource ->> '$.class') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  diagnosis TEXT GENERATED ALWAYS AS (resource ->> '$.diagnosis.condition.reference') STORED,
  episode_of_care TEXT GENERATED ALWAYS AS (resource ->> '$.episodeOfCare.reference') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.location.reference') STORED,
  location_period TEXT GENERATED ALWAYS AS (resource ->> '$.location.period') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  participant TEXT GENERATED ALWAYS AS (resource ->> '$.participant.individual.reference') STORED,
  reason_reference TEXT GENERATED ALWAYS AS (resource ->> '$.reasonReference.reference') STORED,
  service_provider TEXT GENERATED ALWAYS AS (resource ->> '$.serviceProvider.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_encounter_account ON Encounter(account);
CREATE INDEX idx_encounter_appointment ON Encounter(appointment);
CREATE INDEX idx_encounter_based_on ON Encounter(based_on);
CREATE INDEX idx_encounter_diagnosis ON Encounter(diagnosis);
CREATE INDEX idx_encounter_episode_of_care ON Encounter(episode_of_care);
CREATE INDEX idx_encounter_location ON Encounter(location);
CREATE INDEX idx_encounter_part_of ON Encounter(part_of);
CREATE INDEX idx_encounter_participant ON Encounter(participant);
CREATE INDEX idx_encounter_reason_reference ON Encounter(reason_reference);
CREATE INDEX idx_encounter_service_provider ON Encounter(service_provider);
CREATE INDEX idx_encounter_subject ON Encounter(subject);

-- Endpoint: 4 columns (0 complex skipped)
CREATE TABLE Endpoint (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  connection_type TEXT GENERATED ALWAYS AS (resource ->> '$.connectionType') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.managingOrganization.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_endpoint_organization ON Endpoint(organization);

-- EnrollmentRequest: 3 columns (0 complex skipped)
CREATE TABLE EnrollmentRequest (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.candidate.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.candidate.reference') STORED
);

CREATE INDEX idx_enrollmentrequest_patient ON EnrollmentRequest(patient);
CREATE INDEX idx_enrollmentrequest_subject ON EnrollmentRequest(subject);

-- EnrollmentResponse: 2 columns (0 complex skipped)
CREATE TABLE EnrollmentResponse (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.request.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_enrollmentresponse_request ON EnrollmentResponse(request);

-- EpisodeOfCare: 6 columns (1 complex skipped)
CREATE TABLE EpisodeOfCare (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  condition TEXT GENERATED ALWAYS AS (resource ->> '$.diagnosis.condition.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  incoming_referral TEXT GENERATED ALWAYS AS (resource ->> '$.referralRequest.reference') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.managingOrganization.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_episodeofcare_condition ON EpisodeOfCare(condition);
CREATE INDEX idx_episodeofcare_incoming_referral ON EpisodeOfCare(incoming_referral);
CREATE INDEX idx_episodeofcare_organization ON EpisodeOfCare(organization);
CREATE INDEX idx_episodeofcare_patient ON EpisodeOfCare(patient);

-- EventDefinition: 12 columns (7 complex skipped)
CREATE TABLE EventDefinition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Evidence: 12 columns (7 complex skipped)
CREATE TABLE Evidence (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- EvidenceVariable: 12 columns (7 complex skipped)
CREATE TABLE EvidenceVariable (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- ExampleScenario: 9 columns (2 complex skipped)
CREATE TABLE ExampleScenario (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- ExplanationOfBenefit: 16 columns (0 complex skipped)
CREATE TABLE ExplanationOfBenefit (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  care_team TEXT GENERATED ALWAYS AS (resource ->> '$.careTeam.provider.reference') STORED,
  claim TEXT GENERATED ALWAYS AS (resource ->> '$.claim.reference') STORED,
  coverage TEXT GENERATED ALWAYS AS (resource ->> '$.insurance.coverage.reference') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  detail_udi TEXT GENERATED ALWAYS AS (resource ->> '$.item.detail.udi.reference') STORED,
  disposition TEXT GENERATED ALWAYS AS (resource ->> '$.disposition') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.item.encounter.reference') STORED,
  enterer TEXT GENERATED ALWAYS AS (resource ->> '$.enterer.reference') STORED,
  facility TEXT GENERATED ALWAYS AS (resource ->> '$.facility.reference') STORED,
  item_udi TEXT GENERATED ALWAYS AS (resource ->> '$.item.udi.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  payee TEXT GENERATED ALWAYS AS (resource ->> '$.payee.party.reference') STORED,
  procedure_udi TEXT GENERATED ALWAYS AS (resource ->> '$.procedure.udi.reference') STORED,
  provider TEXT GENERATED ALWAYS AS (resource ->> '$.provider.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subdetail_udi TEXT GENERATED ALWAYS AS (resource ->> '$.item.detail.subDetail.udi.reference') STORED
);

CREATE INDEX idx_explanationofbenefit_care_team ON ExplanationOfBenefit(care_team);
CREATE INDEX idx_explanationofbenefit_claim ON ExplanationOfBenefit(claim);
CREATE INDEX idx_explanationofbenefit_coverage ON ExplanationOfBenefit(coverage);
CREATE INDEX idx_explanationofbenefit_detail_udi ON ExplanationOfBenefit(detail_udi);
CREATE INDEX idx_explanationofbenefit_encounter ON ExplanationOfBenefit(encounter);
CREATE INDEX idx_explanationofbenefit_enterer ON ExplanationOfBenefit(enterer);
CREATE INDEX idx_explanationofbenefit_facility ON ExplanationOfBenefit(facility);
CREATE INDEX idx_explanationofbenefit_item_udi ON ExplanationOfBenefit(item_udi);
CREATE INDEX idx_explanationofbenefit_patient ON ExplanationOfBenefit(patient);
CREATE INDEX idx_explanationofbenefit_payee ON ExplanationOfBenefit(payee);
CREATE INDEX idx_explanationofbenefit_procedure_udi ON ExplanationOfBenefit(procedure_udi);
CREATE INDEX idx_explanationofbenefit_provider ON ExplanationOfBenefit(provider);
CREATE INDEX idx_explanationofbenefit_subdetail_udi ON ExplanationOfBenefit(subdetail_udi);

-- FamilyMemberHistory: 5 columns (0 complex skipped)
CREATE TABLE FamilyMemberHistory (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_familymemberhistory_instantiates_canonical ON FamilyMemberHistory(instantiates_canonical);
CREATE INDEX idx_familymemberhistory_patient ON FamilyMemberHistory(patient);

-- Flag: 4 columns (1 complex skipped)
CREATE TABLE Flag (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_flag_author ON Flag(author);
CREATE INDEX idx_flag_encounter ON Flag(encounter);
CREATE INDEX idx_flag_subject ON Flag(subject);

-- Goal: 2 columns (3 complex skipped)
CREATE TABLE Goal (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  lifecycle_status TEXT GENERATED ALWAYS AS (resource ->> '$.lifecycleStatus') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_goal_subject ON Goal(subject);

-- GraphDefinition: 11 columns (2 complex skipped)
CREATE TABLE GraphDefinition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  start TEXT GENERATED ALWAYS AS (resource ->> '$.start') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Group: 6 columns (1 complex skipped)
CREATE TABLE "Group" (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  actual TEXT GENERATED ALWAYS AS (resource ->> '$.actual') STORED,
  characteristic_value JSON GENERATED ALWAYS AS (resource ->> '$.characteristic') STORED,
  exclude TEXT GENERATED ALWAYS AS (resource ->> '$.characteristic.exclude') STORED,
  managing_entity TEXT GENERATED ALWAYS AS (resource ->> '$.managingEntity.reference') STORED,
  member TEXT GENERATED ALWAYS AS (resource ->> '$.member.entity.reference') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED
);

CREATE INDEX idx_group_managing_entity ON "Group"(managing_entity);
CREATE INDEX idx_group_member ON "Group"(member);

-- GuidanceResponse: 1 columns (1 complex skipped)
CREATE TABLE GuidanceResponse (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_guidanceresponse_subject ON GuidanceResponse(subject);

-- HealthcareService: 6 columns (0 complex skipped)
CREATE TABLE HealthcareService (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  coverage_area TEXT GENERATED ALWAYS AS (resource ->> '$.coverageArea.reference') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.providedBy.reference') STORED
);

CREATE INDEX idx_healthcareservice_coverage_area ON HealthcareService(coverage_area);
CREATE INDEX idx_healthcareservice_endpoint ON HealthcareService(endpoint);
CREATE INDEX idx_healthcareservice_location ON HealthcareService(location);
CREATE INDEX idx_healthcareservice_organization ON HealthcareService(organization);

-- ImagingStudy: 14 columns (1 complex skipped)
CREATE TABLE ImagingStudy (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  basedon TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  bodysite TEXT GENERATED ALWAYS AS (resource ->> '$.series.bodySite') STORED,
  dicom_class TEXT GENERATED ALWAYS AS (resource ->> '$.series.instance.sopClass') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  instance TEXT GENERATED ALWAYS AS (resource ->> '$.series.instance.uid') STORED,
  interpreter TEXT GENERATED ALWAYS AS (resource ->> '$.interpreter.reference') STORED,
  modality TEXT GENERATED ALWAYS AS (resource ->> '$.series.modality') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.series.performer.actor.reference') STORED,
  referrer TEXT GENERATED ALWAYS AS (resource ->> '$.referrer.reference') STORED,
  series TEXT GENERATED ALWAYS AS (resource ->> '$.series.uid') STORED,
  started TEXT GENERATED ALWAYS AS (resource ->> '$.started') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_imagingstudy_basedon ON ImagingStudy(basedon);
CREATE INDEX idx_imagingstudy_encounter ON ImagingStudy(encounter);
CREATE INDEX idx_imagingstudy_endpoint ON ImagingStudy(endpoint);
CREATE INDEX idx_imagingstudy_interpreter ON ImagingStudy(interpreter);
CREATE INDEX idx_imagingstudy_performer ON ImagingStudy(performer);
CREATE INDEX idx_imagingstudy_referrer ON ImagingStudy(referrer);
CREATE INDEX idx_imagingstudy_subject ON ImagingStudy(subject);

-- Immunization: 11 columns (0 complex skipped)
CREATE TABLE Immunization (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.occurrence') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  lot_number TEXT GENERATED ALWAYS AS (resource ->> '$.lotNumber') STORED,
  manufacturer TEXT GENERATED ALWAYS AS (resource ->> '$.manufacturer.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.actor.reference') STORED,
  reaction TEXT GENERATED ALWAYS AS (resource ->> '$.reaction.detail.reference') STORED,
  reaction_date TEXT GENERATED ALWAYS AS (resource ->> '$.reaction.date') STORED,
  reason_reference TEXT GENERATED ALWAYS AS (resource ->> '$.reasonReference.reference') STORED,
  series TEXT GENERATED ALWAYS AS (resource ->> '$.protocolApplied.series') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_immunization_location ON Immunization(location);
CREATE INDEX idx_immunization_manufacturer ON Immunization(manufacturer);
CREATE INDEX idx_immunization_patient ON Immunization(patient);
CREATE INDEX idx_immunization_performer ON Immunization(performer);
CREATE INDEX idx_immunization_reaction ON Immunization(reaction);
CREATE INDEX idx_immunization_reason_reference ON Immunization(reason_reference);

-- ImmunizationEvaluation: 4 columns (0 complex skipped)
CREATE TABLE ImmunizationEvaluation (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  immunization_event TEXT GENERATED ALWAYS AS (resource ->> '$.immunizationEvent.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_immunizationevaluation_immunization_event ON ImmunizationEvaluation(immunization_event);
CREATE INDEX idx_immunizationevaluation_patient ON ImmunizationEvaluation(patient);

-- ImmunizationRecommendation: 4 columns (0 complex skipped)
CREATE TABLE ImmunizationRecommendation (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  information TEXT GENERATED ALWAYS AS (resource ->> '$.recommendation.supportingPatientInformation.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  support TEXT GENERATED ALWAYS AS (resource ->> '$.recommendation.supportingImmunization.reference') STORED
);

CREATE INDEX idx_immunizationrecommendation_information ON ImmunizationRecommendation(information);
CREATE INDEX idx_immunizationrecommendation_patient ON ImmunizationRecommendation(patient);
CREATE INDEX idx_immunizationrecommendation_support ON ImmunizationRecommendation(support);

-- ImplementationGuide: 15 columns (2 complex skipped)
CREATE TABLE ImplementationGuide (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  depends_on TEXT GENERATED ALWAYS AS (resource ->> '$.dependsOn.uri.reference') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  experimental TEXT GENERATED ALWAYS AS (resource ->> '$.experimental') STORED,
  global TEXT GENERATED ALWAYS AS (resource ->> '$.global.profile.reference') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  resource_ TEXT GENERATED ALWAYS AS (resource ->> '$.definition.resource.reference.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

CREATE INDEX idx_implementationguide_depends_on ON ImplementationGuide(depends_on);
CREATE INDEX idx_implementationguide_global ON ImplementationGuide(global);
CREATE INDEX idx_implementationguide_resource_ ON ImplementationGuide(resource_);

-- InsurancePlan: 5 columns (1 complex skipped)
CREATE TABLE InsurancePlan (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  administered_by TEXT GENERATED ALWAYS AS (resource ->> '$.administeredBy.reference') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  owned_by TEXT GENERATED ALWAYS AS (resource ->> '$.ownedBy.reference') STORED,
  phonetic TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_insuranceplan_administered_by ON InsurancePlan(administered_by);
CREATE INDEX idx_insuranceplan_endpoint ON InsurancePlan(endpoint);
CREATE INDEX idx_insuranceplan_owned_by ON InsurancePlan(owned_by);

-- Invoice: 7 columns (3 complex skipped)
CREATE TABLE Invoice (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  account TEXT GENERATED ALWAYS AS (resource ->> '$.account.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  issuer TEXT GENERATED ALWAYS AS (resource ->> '$.issuer.reference') STORED,
  participant TEXT GENERATED ALWAYS AS (resource ->> '$.participant.actor.reference') STORED,
  recipient TEXT GENERATED ALWAYS AS (resource ->> '$.recipient.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_invoice_account ON Invoice(account);
CREATE INDEX idx_invoice_issuer ON Invoice(issuer);
CREATE INDEX idx_invoice_participant ON Invoice(participant);
CREATE INDEX idx_invoice_recipient ON Invoice(recipient);
CREATE INDEX idx_invoice_subject ON Invoice(subject);

-- Library: 13 columns (7 complex skipped)
CREATE TABLE Library (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  content_type TEXT GENERATED ALWAYS AS (resource ->> '$.content.contentType') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Linkage: 3 columns (0 complex skipped)
CREATE TABLE Linkage (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  item TEXT GENERATED ALWAYS AS (resource ->> '$.item.resource.reference') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.item.resource.reference') STORED
);

CREATE INDEX idx_linkage_author ON Linkage(author);
CREATE INDEX idx_linkage_item ON Linkage(item);
CREATE INDEX idx_linkage_source ON Linkage(source);

-- List: 8 columns (1 complex skipped)
CREATE TABLE List (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  item TEXT GENERATED ALWAYS AS (resource ->> '$.entry.item.reference') STORED,
  notes TEXT GENERATED ALWAYS AS (resource ->> '$.note.text') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.source.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED
);

CREATE INDEX idx_list_encounter ON List(encounter);
CREATE INDEX idx_list_item ON List(item);
CREATE INDEX idx_list_source ON List(source);
CREATE INDEX idx_list_subject ON List(subject);

-- Location: 7 columns (0 complex skipped)
CREATE TABLE Location (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  near TEXT GENERATED ALWAYS AS (resource ->> '$.position') STORED,
  operational_status TEXT GENERATED ALWAYS AS (resource ->> '$.operationalStatus') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.managingOrganization.reference') STORED,
  partof TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_location_endpoint ON Location(endpoint);
CREATE INDEX idx_location_organization ON Location(organization);
CREATE INDEX idx_location_partof ON Location(partof);

-- Measure: 12 columns (7 complex skipped)
CREATE TABLE Measure (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- MeasureReport: 7 columns (1 complex skipped)
CREATE TABLE MeasureReport (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  evaluated_resource TEXT GENERATED ALWAYS AS (resource ->> '$.evaluatedResource.reference') STORED,
  measure TEXT GENERATED ALWAYS AS (resource ->> '$.measure.reference') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  reporter TEXT GENERATED ALWAYS AS (resource ->> '$.reporter.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_measurereport_evaluated_resource ON MeasureReport(evaluated_resource);
CREATE INDEX idx_measurereport_measure ON MeasureReport(measure);
CREATE INDEX idx_measurereport_reporter ON MeasureReport(reporter);
CREATE INDEX idx_measurereport_subject ON MeasureReport(subject);

-- Media: 7 columns (1 complex skipped)
CREATE TABLE Media (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  device TEXT GENERATED ALWAYS AS (resource ->> '$.device.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  operator TEXT GENERATED ALWAYS AS (resource ->> '$.operator.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_media_based_on ON Media(based_on);
CREATE INDEX idx_media_device ON Media(device);
CREATE INDEX idx_media_encounter ON Media(encounter);
CREATE INDEX idx_media_operator ON Media(operator);
CREATE INDEX idx_media_subject ON Media(subject);

-- Medication: 4 columns (2 complex skipped)
CREATE TABLE Medication (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  expiration_date TEXT GENERATED ALWAYS AS (resource ->> '$.batch.expirationDate') STORED,
  lot_number TEXT GENERATED ALWAYS AS (resource ->> '$.batch.lotNumber') STORED,
  manufacturer TEXT GENERATED ALWAYS AS (resource ->> '$.manufacturer.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_medication_manufacturer ON Medication(manufacturer);

-- MedicationAdministration: 7 columns (3 complex skipped)
CREATE TABLE MedicationAdministration (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context TEXT GENERATED ALWAYS AS (resource ->> '$.context.reference') STORED,
  device TEXT GENERATED ALWAYS AS (resource ->> '$.device.reference') STORED,
  effective_time TEXT GENERATED ALWAYS AS (resource ->> '$.effective') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.actor.reference') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.request.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_medicationadministration_context ON MedicationAdministration(context);
CREATE INDEX idx_medicationadministration_device ON MedicationAdministration(device);
CREATE INDEX idx_medicationadministration_performer ON MedicationAdministration(performer);
CREATE INDEX idx_medicationadministration_request ON MedicationAdministration(request);
CREATE INDEX idx_medicationadministration_subject ON MedicationAdministration(subject);

-- MedicationDispense: 10 columns (3 complex skipped)
CREATE TABLE MedicationDispense (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context TEXT GENERATED ALWAYS AS (resource ->> '$.context.reference') STORED,
  destination TEXT GENERATED ALWAYS AS (resource ->> '$.destination.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.actor.reference') STORED,
  prescription TEXT GENERATED ALWAYS AS (resource ->> '$.authorizingPrescription.reference') STORED,
  receiver TEXT GENERATED ALWAYS AS (resource ->> '$.receiver.reference') STORED,
  responsibleparty TEXT GENERATED ALWAYS AS (resource ->> '$.substitution.responsibleParty.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  whenhandedover TEXT GENERATED ALWAYS AS (resource ->> '$.whenHandedOver') STORED,
  whenprepared TEXT GENERATED ALWAYS AS (resource ->> '$.whenPrepared') STORED
);

CREATE INDEX idx_medicationdispense_context ON MedicationDispense(context);
CREATE INDEX idx_medicationdispense_destination ON MedicationDispense(destination);
CREATE INDEX idx_medicationdispense_performer ON MedicationDispense(performer);
CREATE INDEX idx_medicationdispense_prescription ON MedicationDispense(prescription);
CREATE INDEX idx_medicationdispense_receiver ON MedicationDispense(receiver);
CREATE INDEX idx_medicationdispense_responsibleparty ON MedicationDispense(responsibleparty);
CREATE INDEX idx_medicationdispense_subject ON MedicationDispense(subject);

-- MedicationKnowledge: 5 columns (2 complex skipped)
CREATE TABLE MedicationKnowledge (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  manufacturer TEXT GENERATED ALWAYS AS (resource ->> '$.manufacturer.reference') STORED,
  monitoring_program_name TEXT GENERATED ALWAYS AS (resource ->> '$.monitoringProgram.name') STORED,
  monograph TEXT GENERATED ALWAYS AS (resource ->> '$.monograph.source.reference') STORED,
  source_cost TEXT GENERATED ALWAYS AS (resource ->> '$.cost.source') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_medicationknowledge_manufacturer ON MedicationKnowledge(manufacturer);
CREATE INDEX idx_medicationknowledge_monograph ON MedicationKnowledge(monograph);

-- MedicationRequest: 10 columns (3 complex skipped)
CREATE TABLE MedicationRequest (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  authoredon TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.dosageInstruction.timing.event') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  intended_dispenser TEXT GENERATED ALWAYS AS (resource ->> '$.dispenseRequest.performer.reference') STORED,
  intended_performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  intent TEXT GENERATED ALWAYS AS (resource ->> '$.intent') STORED,
  priority TEXT GENERATED ALWAYS AS (resource ->> '$.priority') STORED,
  requester TEXT GENERATED ALWAYS AS (resource ->> '$.requester.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_medicationrequest_encounter ON MedicationRequest(encounter);
CREATE INDEX idx_medicationrequest_intended_dispenser ON MedicationRequest(intended_dispenser);
CREATE INDEX idx_medicationrequest_intended_performer ON MedicationRequest(intended_performer);
CREATE INDEX idx_medicationrequest_requester ON MedicationRequest(requester);
CREATE INDEX idx_medicationrequest_subject ON MedicationRequest(subject);

-- MedicationStatement: 6 columns (3 complex skipped)
CREATE TABLE MedicationStatement (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context TEXT GENERATED ALWAYS AS (resource ->> '$.context.reference') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effective') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.informationSource.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_medicationstatement_context ON MedicationStatement(context);
CREATE INDEX idx_medicationstatement_part_of ON MedicationStatement(part_of);
CREATE INDEX idx_medicationstatement_source ON MedicationStatement(source);
CREATE INDEX idx_medicationstatement_subject ON MedicationStatement(subject);

-- MedicinalProduct: 1 columns (0 complex skipped)
CREATE TABLE MedicinalProduct (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name.productName') STORED
);

-- MedicinalProductAuthorization: 2 columns (0 complex skipped)
CREATE TABLE MedicinalProductAuthorization (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  holder TEXT GENERATED ALWAYS AS (resource ->> '$.holder.reference') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_medicinalproductauthorization_holder ON MedicinalProductAuthorization(holder);
CREATE INDEX idx_medicinalproductauthorization_subject ON MedicinalProductAuthorization(subject);

-- MedicinalProductContraindication: 1 columns (0 complex skipped)
CREATE TABLE MedicinalProductContraindication (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_medicinalproductcontraindication_subject ON MedicinalProductContraindication(subject);

-- MedicinalProductIndication: 1 columns (0 complex skipped)
CREATE TABLE MedicinalProductIndication (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_medicinalproductindication_subject ON MedicinalProductIndication(subject);

-- MedicinalProductInteraction: 1 columns (0 complex skipped)
CREATE TABLE MedicinalProductInteraction (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_medicinalproductinteraction_subject ON MedicinalProductInteraction(subject);

-- MedicinalProductPackaged: 1 columns (0 complex skipped)
CREATE TABLE MedicinalProductPackaged (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_medicinalproductpackaged_subject ON MedicinalProductPackaged(subject);

-- MedicinalProductUndesirableEffect: 1 columns (0 complex skipped)
CREATE TABLE MedicinalProductUndesirableEffect (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_medicinalproductundesirableeffect_subject ON MedicinalProductUndesirableEffect(subject);

-- MessageDefinition: 15 columns (2 complex skipped)
CREATE TABLE MessageDefinition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  category TEXT GENERATED ALWAYS AS (resource ->> '$.category') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  event TEXT GENERATED ALWAYS AS (resource ->> '$.event') STORED,
  focus TEXT GENERATED ALWAYS AS (resource ->> '$.focus.code') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  parent TEXT GENERATED ALWAYS AS (resource ->> '$.parent.reference') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

CREATE INDEX idx_messagedefinition_parent ON MessageDefinition(parent);

-- MessageHeader: 14 columns (0 complex skipped)
CREATE TABLE MessageHeader (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
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

CREATE INDEX idx_messageheader_author ON MessageHeader(author);
CREATE INDEX idx_messageheader_enterer ON MessageHeader(enterer);
CREATE INDEX idx_messageheader_focus ON MessageHeader(focus);
CREATE INDEX idx_messageheader_receiver ON MessageHeader(receiver);
CREATE INDEX idx_messageheader_responsible ON MessageHeader(responsible);
CREATE INDEX idx_messageheader_sender ON MessageHeader(sender);
CREATE INDEX idx_messageheader_target ON MessageHeader(target);

-- MolecularSequence: 10 columns (0 complex skipped)
CREATE TABLE MolecularSequence (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  chromosome_variant_coordinate JSON GENERATED ALWAYS AS (resource ->> '$.variant') STORED,
  chromosome_window_coordinate JSON GENERATED ALWAYS AS (resource ->> '$.referenceSeq') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  referenceseqid_variant_coordinate JSON GENERATED ALWAYS AS (resource ->> '$.variant') STORED,
  referenceseqid_window_coordinate JSON GENERATED ALWAYS AS (resource ->> '$.referenceSeq') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  variant_end REAL GENERATED ALWAYS AS (resource ->> '$.variant.end') STORED,
  variant_start REAL GENERATED ALWAYS AS (resource ->> '$.variant.start') STORED,
  window_end REAL GENERATED ALWAYS AS (resource ->> '$.referenceSeq.windowEnd') STORED,
  window_start REAL GENERATED ALWAYS AS (resource ->> '$.referenceSeq.windowStart') STORED
);

CREATE INDEX idx_molecularsequence_patient ON MolecularSequence(patient);

-- NamingSystem: 15 columns (2 complex skipped)
CREATE TABLE NamingSystem (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  contact TEXT GENERATED ALWAYS AS (resource ->> '$.contact.name') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  id_type TEXT GENERATED ALWAYS AS (resource ->> '$.uniqueId.type') STORED,
  kind TEXT GENERATED ALWAYS AS (resource ->> '$.kind') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.uniqueId.period') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  responsible TEXT GENERATED ALWAYS AS (resource ->> '$.responsible') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  telecom TEXT GENERATED ALWAYS AS (resource ->> '$.contact.telecom') STORED,
  value TEXT GENERATED ALWAYS AS (resource ->> '$.uniqueId.value') STORED
);

-- NutritionOrder: 7 columns (0 complex skipped)
CREATE TABLE NutritionOrder (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  datetime TEXT GENERATED ALWAYS AS (resource ->> '$.dateTime') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  provider TEXT GENERATED ALWAYS AS (resource ->> '$.orderer.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_nutritionorder_encounter ON NutritionOrder(encounter);
CREATE INDEX idx_nutritionorder_instantiates_canonical ON NutritionOrder(instantiates_canonical);
CREATE INDEX idx_nutritionorder_patient ON NutritionOrder(patient);
CREATE INDEX idx_nutritionorder_provider ON NutritionOrder(provider);

-- Observation: 18 columns (16 complex skipped)
CREATE TABLE Observation (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  combo_code_value_concept JSON GENERATED ALWAYS AS (resource ->> '$.component') STORED,
  combo_code_value_quantity JSON GENERATED ALWAYS AS (resource ->> '$.component') STORED,
  combo_value_quantity REAL GENERATED ALWAYS AS (CAST(resource ->> '$.valueQuantity.value' AS REAL)) STORED,
  component_code_value_concept JSON GENERATED ALWAYS AS (resource ->> '$.component') STORED,
  component_code_value_quantity JSON GENERATED ALWAYS AS (resource ->> '$.component') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.effective') STORED,
  derived_from TEXT GENERATED ALWAYS AS (resource ->> '$.derivedFrom.reference') STORED,
  device TEXT GENERATED ALWAYS AS (resource ->> '$.device.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  focus TEXT GENERATED ALWAYS AS (resource ->> '$.focus.reference') STORED,
  has_member TEXT GENERATED ALWAYS AS (resource ->> '$.hasMember.reference') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  specimen TEXT GENERATED ALWAYS AS (resource ->> '$.specimen.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED,
  value_quantity REAL GENERATED ALWAYS AS (CAST(resource ->> '$.valueQuantity.value' AS REAL)) STORED
);

CREATE INDEX idx_observation_based_on ON Observation(based_on);
CREATE INDEX idx_observation_derived_from ON Observation(derived_from);
CREATE INDEX idx_observation_device ON Observation(device);
CREATE INDEX idx_observation_encounter ON Observation(encounter);
CREATE INDEX idx_observation_focus ON Observation(focus);
CREATE INDEX idx_observation_has_member ON Observation(has_member);
CREATE INDEX idx_observation_part_of ON Observation(part_of);
CREATE INDEX idx_observation_performer ON Observation(performer);
CREATE INDEX idx_observation_specimen ON Observation(specimen);
CREATE INDEX idx_observation_subject ON Observation(subject);

-- OperationDefinition: 19 columns (2 complex skipped)
CREATE TABLE OperationDefinition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  base TEXT GENERATED ALWAYS AS (resource ->> '$.base.reference') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  input_profile TEXT GENERATED ALWAYS AS (resource ->> '$.inputProfile.reference') STORED,
  instance TEXT GENERATED ALWAYS AS (resource ->> '$.instance') STORED,
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

CREATE INDEX idx_operationdefinition_base ON OperationDefinition(base);
CREATE INDEX idx_operationdefinition_input_profile ON OperationDefinition(input_profile);
CREATE INDEX idx_operationdefinition_output_profile ON OperationDefinition(output_profile);

-- Organization: 5 columns (0 complex skipped)
CREATE TABLE Organization (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  partof TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  phonetic TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED
);

CREATE INDEX idx_organization_endpoint ON Organization(endpoint);
CREATE INDEX idx_organization_partof ON Organization(partof);

-- OrganizationAffiliation: 8 columns (0 complex skipped)
CREATE TABLE OrganizationAffiliation (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  network TEXT GENERATED ALWAYS AS (resource ->> '$.network.reference') STORED,
  participating_organization TEXT GENERATED ALWAYS AS (resource ->> '$.participatingOrganization.reference') STORED,
  primary_organization TEXT GENERATED ALWAYS AS (resource ->> '$.organization.reference') STORED,
  service TEXT GENERATED ALWAYS AS (resource ->> '$.healthcareService.reference') STORED
);

CREATE INDEX idx_organizationaffiliation_endpoint ON OrganizationAffiliation(endpoint);
CREATE INDEX idx_organizationaffiliation_location ON OrganizationAffiliation(location);
CREATE INDEX idx_organizationaffiliation_network ON OrganizationAffiliation(network);
CREATE INDEX idx_organizationaffiliation_participating_organization ON OrganizationAffiliation(participating_organization);
CREATE INDEX idx_organizationaffiliation_primary_organization ON OrganizationAffiliation(primary_organization);
CREATE INDEX idx_organizationaffiliation_service ON OrganizationAffiliation(service);

-- Patient: 6 columns (4 complex skipped)
CREATE TABLE Patient (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  birthdate TEXT GENERATED ALWAYS AS (resource ->> '$.birthDate') STORED,
  gender TEXT GENERATED ALWAYS AS (resource ->> '$.gender') STORED,
  general_practitioner TEXT GENERATED ALWAYS AS (resource ->> '$.generalPractitioner.reference') STORED,
  link TEXT GENERATED ALWAYS AS (resource ->> '$.link.other.reference') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.managingOrganization.reference') STORED
);

CREATE INDEX idx_patient_general_practitioner ON Patient(general_practitioner);
CREATE INDEX idx_patient_link ON Patient(link);
CREATE INDEX idx_patient_organization ON Patient(organization);

-- PaymentNotice: 5 columns (0 complex skipped)
CREATE TABLE PaymentNotice (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  provider TEXT GENERATED ALWAYS AS (resource ->> '$.provider.reference') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.request.reference') STORED,
  response TEXT GENERATED ALWAYS AS (resource ->> '$.response.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_paymentnotice_provider ON PaymentNotice(provider);
CREATE INDEX idx_paymentnotice_request ON PaymentNotice(request);
CREATE INDEX idx_paymentnotice_response ON PaymentNotice(response);

-- PaymentReconciliation: 7 columns (0 complex skipped)
CREATE TABLE PaymentReconciliation (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  created TEXT GENERATED ALWAYS AS (resource ->> '$.created') STORED,
  disposition TEXT GENERATED ALWAYS AS (resource ->> '$.disposition') STORED,
  outcome TEXT GENERATED ALWAYS AS (resource ->> '$.outcome') STORED,
  payment_issuer TEXT GENERATED ALWAYS AS (resource ->> '$.paymentIssuer.reference') STORED,
  request TEXT GENERATED ALWAYS AS (resource ->> '$.request.reference') STORED,
  requestor TEXT GENERATED ALWAYS AS (resource ->> '$.requestor.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_paymentreconciliation_payment_issuer ON PaymentReconciliation(payment_issuer);
CREATE INDEX idx_paymentreconciliation_request ON PaymentReconciliation(request);
CREATE INDEX idx_paymentreconciliation_requestor ON PaymentReconciliation(requestor);

-- Person: 4 columns (3 complex skipped)
CREATE TABLE Person (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  birthdate TEXT GENERATED ALWAYS AS (resource ->> '$.birthDate') STORED,
  gender TEXT GENERATED ALWAYS AS (resource ->> '$.gender') STORED,
  link TEXT GENERATED ALWAYS AS (resource ->> '$.link.target.reference') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.managingOrganization.reference') STORED
);

CREATE INDEX idx_person_link ON Person(link);
CREATE INDEX idx_person_organization ON Person(organization);

-- PlanDefinition: 13 columns (7 complex skipped)
CREATE TABLE PlanDefinition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  definition TEXT GENERATED ALWAYS AS (resource ->> '$.action.definition.reference') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

CREATE INDEX idx_plandefinition_definition ON PlanDefinition(definition);

-- Practitioner: 2 columns (0 complex skipped)
CREATE TABLE Practitioner (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  gender TEXT GENERATED ALWAYS AS (resource ->> '$.gender') STORED
);

-- PractitionerRole: 7 columns (0 complex skipped)
CREATE TABLE PractitionerRole (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  endpoint TEXT GENERATED ALWAYS AS (resource ->> '$.endpoint.reference') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  organization TEXT GENERATED ALWAYS AS (resource ->> '$.organization.reference') STORED,
  practitioner TEXT GENERATED ALWAYS AS (resource ->> '$.practitioner.reference') STORED,
  service TEXT GENERATED ALWAYS AS (resource ->> '$.healthcareService.reference') STORED
);

CREATE INDEX idx_practitionerrole_endpoint ON PractitionerRole(endpoint);
CREATE INDEX idx_practitionerrole_location ON PractitionerRole(location);
CREATE INDEX idx_practitionerrole_organization ON PractitionerRole(organization);
CREATE INDEX idx_practitionerrole_practitioner ON PractitionerRole(practitioner);
CREATE INDEX idx_practitionerrole_service ON PractitionerRole(service);

-- Procedure: 11 columns (1 complex skipped)
CREATE TABLE Procedure (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.performed') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.actor.reference') STORED,
  reason_reference TEXT GENERATED ALWAYS AS (resource ->> '$.reasonReference.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_procedure_based_on ON Procedure(based_on);
CREATE INDEX idx_procedure_encounter ON Procedure(encounter);
CREATE INDEX idx_procedure_instantiates_canonical ON Procedure(instantiates_canonical);
CREATE INDEX idx_procedure_location ON Procedure(location);
CREATE INDEX idx_procedure_part_of ON Procedure(part_of);
CREATE INDEX idx_procedure_performer ON Procedure(performer);
CREATE INDEX idx_procedure_reason_reference ON Procedure(reason_reference);
CREATE INDEX idx_procedure_subject ON Procedure(subject);

-- Provenance: 6 columns (2 complex skipped)
CREATE TABLE Provenance (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  agent TEXT GENERATED ALWAYS AS (resource ->> '$.agent.who.reference') STORED,
  entity TEXT GENERATED ALWAYS AS (resource ->> '$.entity.what.reference') STORED,
  location TEXT GENERATED ALWAYS AS (resource ->> '$.location.reference') STORED,
  recorded TEXT GENERATED ALWAYS AS (resource ->> '$.recorded') STORED,
  signature_type TEXT GENERATED ALWAYS AS (resource ->> '$.signature.type') STORED,
  target TEXT GENERATED ALWAYS AS (resource ->> '$.target.reference') STORED
);

CREATE INDEX idx_provenance_agent ON Provenance(agent);
CREATE INDEX idx_provenance_entity ON Provenance(entity);
CREATE INDEX idx_provenance_location ON Provenance(location);
CREATE INDEX idx_provenance_target ON Provenance(target);

-- Questionnaire: 15 columns (2 complex skipped)
CREATE TABLE Questionnaire (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.item.code') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  definition TEXT GENERATED ALWAYS AS (resource ->> '$.item.definition') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject_type TEXT GENERATED ALWAYS AS (resource ->> '$.subjectType') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- QuestionnaireResponse: 9 columns (2 complex skipped)
CREATE TABLE QuestionnaireResponse (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  authored TEXT GENERATED ALWAYS AS (resource ->> '$.authored') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  questionnaire TEXT GENERATED ALWAYS AS (resource ->> '$.questionnaire.reference') STORED,
  source TEXT GENERATED ALWAYS AS (resource ->> '$.source.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_questionnaireresponse_author ON QuestionnaireResponse(author);
CREATE INDEX idx_questionnaireresponse_based_on ON QuestionnaireResponse(based_on);
CREATE INDEX idx_questionnaireresponse_encounter ON QuestionnaireResponse(encounter);
CREATE INDEX idx_questionnaireresponse_part_of ON QuestionnaireResponse(part_of);
CREATE INDEX idx_questionnaireresponse_questionnaire ON QuestionnaireResponse(questionnaire);
CREATE INDEX idx_questionnaireresponse_source ON QuestionnaireResponse(source);
CREATE INDEX idx_questionnaireresponse_subject ON QuestionnaireResponse(subject);

-- RelatedPerson: 4 columns (0 complex skipped)
CREATE TABLE RelatedPerson (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  birthdate TEXT GENERATED ALWAYS AS (resource ->> '$.birthDate') STORED,
  gender TEXT GENERATED ALWAYS AS (resource ->> '$.gender') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED
);

CREATE INDEX idx_relatedperson_patient ON RelatedPerson(patient);

-- RequestGroup: 10 columns (1 complex skipped)
CREATE TABLE RequestGroup (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  author TEXT GENERATED ALWAYS AS (resource ->> '$.author.reference') STORED,
  authored TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  intent TEXT GENERATED ALWAYS AS (resource ->> '$.intent') STORED,
  participant TEXT GENERATED ALWAYS AS (resource ->> '$.action.participant.reference') STORED,
  priority TEXT GENERATED ALWAYS AS (resource ->> '$.priority') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_requestgroup_author ON RequestGroup(author);
CREATE INDEX idx_requestgroup_encounter ON RequestGroup(encounter);
CREATE INDEX idx_requestgroup_instantiates_canonical ON RequestGroup(instantiates_canonical);
CREATE INDEX idx_requestgroup_participant ON RequestGroup(participant);
CREATE INDEX idx_requestgroup_subject ON RequestGroup(subject);

-- ResearchDefinition: 12 columns (7 complex skipped)
CREATE TABLE ResearchDefinition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- ResearchElementDefinition: 12 columns (7 complex skipped)
CREATE TABLE ResearchElementDefinition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- ResearchStudy: 8 columns (0 complex skipped)
CREATE TABLE ResearchStudy (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  partof TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  principalinvestigator TEXT GENERATED ALWAYS AS (resource ->> '$.principalInvestigator.reference') STORED,
  protocol TEXT GENERATED ALWAYS AS (resource ->> '$.protocol.reference') STORED,
  site TEXT GENERATED ALWAYS AS (resource ->> '$.site.reference') STORED,
  sponsor TEXT GENERATED ALWAYS AS (resource ->> '$.sponsor.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED
);

CREATE INDEX idx_researchstudy_partof ON ResearchStudy(partof);
CREATE INDEX idx_researchstudy_principalinvestigator ON ResearchStudy(principalinvestigator);
CREATE INDEX idx_researchstudy_protocol ON ResearchStudy(protocol);
CREATE INDEX idx_researchstudy_site ON ResearchStudy(site);
CREATE INDEX idx_researchstudy_sponsor ON ResearchStudy(sponsor);

-- ResearchSubject: 5 columns (0 complex skipped)
CREATE TABLE ResearchSubject (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.period') STORED,
  individual TEXT GENERATED ALWAYS AS (resource ->> '$.individual.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.individual.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  study TEXT GENERATED ALWAYS AS (resource ->> '$.study.reference') STORED
);

CREATE INDEX idx_researchsubject_individual ON ResearchSubject(individual);
CREATE INDEX idx_researchsubject_patient ON ResearchSubject(patient);
CREATE INDEX idx_researchsubject_study ON ResearchSubject(study);

-- RiskAssessment: 5 columns (2 complex skipped)
CREATE TABLE RiskAssessment (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  condition TEXT GENERATED ALWAYS AS (resource ->> '$.condition.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  probability REAL GENERATED ALWAYS AS (resource ->> '$.prediction.probability') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_riskassessment_condition ON RiskAssessment(condition);
CREATE INDEX idx_riskassessment_encounter ON RiskAssessment(encounter);
CREATE INDEX idx_riskassessment_performer ON RiskAssessment(performer);
CREATE INDEX idx_riskassessment_subject ON RiskAssessment(subject);

-- RiskEvidenceSynthesis: 12 columns (2 complex skipped)
CREATE TABLE RiskEvidenceSynthesis (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  effective TEXT GENERATED ALWAYS AS (resource ->> '$.effectivePeriod') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Schedule: 3 columns (0 complex skipped)
CREATE TABLE Schedule (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  active TEXT GENERATED ALWAYS AS (resource ->> '$.active') STORED,
  actor TEXT GENERATED ALWAYS AS (resource ->> '$.actor.reference') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.planningHorizon') STORED
);

CREATE INDEX idx_schedule_actor ON Schedule(actor);

-- SearchParameter: 16 columns (2 complex skipped)
CREATE TABLE SearchParameter (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  base TEXT GENERATED ALWAYS AS (resource ->> '$.base') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.code') STORED,
  component TEXT GENERATED ALWAYS AS (resource ->> '$.component.definition.reference') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  derived_from TEXT GENERATED ALWAYS AS (resource ->> '$.derivedFrom.reference') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  target TEXT GENERATED ALWAYS AS (resource ->> '$.target') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.type') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

CREATE INDEX idx_searchparameter_component ON SearchParameter(component);
CREATE INDEX idx_searchparameter_derived_from ON SearchParameter(derived_from);

-- ServiceRequest: 14 columns (1 complex skipped)
CREATE TABLE ServiceRequest (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  authored TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  instantiates_canonical TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesCanonical.reference') STORED,
  instantiates_uri TEXT GENERATED ALWAYS AS (resource ->> '$.instantiatesUri') STORED,
  intent TEXT GENERATED ALWAYS AS (resource ->> '$.intent') STORED,
  occurrence TEXT GENERATED ALWAYS AS (resource ->> '$.occurrence') STORED,
  performer TEXT GENERATED ALWAYS AS (resource ->> '$.performer.reference') STORED,
  priority TEXT GENERATED ALWAYS AS (resource ->> '$.priority') STORED,
  replaces TEXT GENERATED ALWAYS AS (resource ->> '$.replaces.reference') STORED,
  requester TEXT GENERATED ALWAYS AS (resource ->> '$.requester.reference') STORED,
  specimen TEXT GENERATED ALWAYS AS (resource ->> '$.specimen.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_servicerequest_based_on ON ServiceRequest(based_on);
CREATE INDEX idx_servicerequest_encounter ON ServiceRequest(encounter);
CREATE INDEX idx_servicerequest_instantiates_canonical ON ServiceRequest(instantiates_canonical);
CREATE INDEX idx_servicerequest_performer ON ServiceRequest(performer);
CREATE INDEX idx_servicerequest_replaces ON ServiceRequest(replaces);
CREATE INDEX idx_servicerequest_requester ON ServiceRequest(requester);
CREATE INDEX idx_servicerequest_specimen ON ServiceRequest(specimen);
CREATE INDEX idx_servicerequest_subject ON ServiceRequest(subject);

-- Slot: 3 columns (0 complex skipped)
CREATE TABLE Slot (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  schedule TEXT GENERATED ALWAYS AS (resource ->> '$.schedule.reference') STORED,
  start TEXT GENERATED ALWAYS AS (resource ->> '$.start') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_slot_schedule ON Slot(schedule);

-- Specimen: 5 columns (1 complex skipped)
CREATE TABLE Specimen (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  collected TEXT GENERATED ALWAYS AS (resource ->> '$.collection.collected') STORED,
  collector TEXT GENERATED ALWAYS AS (resource ->> '$.collection.collector.reference') STORED,
  parent TEXT GENERATED ALWAYS AS (resource ->> '$.parent.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.subject.reference') STORED
);

CREATE INDEX idx_specimen_collector ON Specimen(collector);
CREATE INDEX idx_specimen_parent ON Specimen(parent);
CREATE INDEX idx_specimen_subject ON Specimen(subject);

-- StructureDefinition: 22 columns (2 complex skipped)
CREATE TABLE StructureDefinition (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
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

CREATE INDEX idx_structuredefinition_base ON StructureDefinition(base);
CREATE INDEX idx_structuredefinition_valueset ON StructureDefinition(valueset);

-- StructureMap: 11 columns (2 complex skipped)
CREATE TABLE StructureMap (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- Subscription: 5 columns (0 complex skipped)
CREATE TABLE Subscription (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  criteria TEXT GENERATED ALWAYS AS (resource ->> '$.criteria') STORED,
  payload TEXT GENERATED ALWAYS AS (resource ->> '$.channel.payload') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  type_ TEXT GENERATED ALWAYS AS (resource ->> '$.channel.type') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.channel.endpoint') STORED
);

-- Substance: 2 columns (2 complex skipped)
CREATE TABLE Substance (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  expiry TEXT GENERATED ALWAYS AS (resource ->> '$.instance.expiry') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

-- SupplyDelivery: 4 columns (0 complex skipped)
CREATE TABLE SupplyDelivery (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  receiver TEXT GENERATED ALWAYS AS (resource ->> '$.receiver.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  supplier TEXT GENERATED ALWAYS AS (resource ->> '$.supplier.reference') STORED
);

CREATE INDEX idx_supplydelivery_patient ON SupplyDelivery(patient);
CREATE INDEX idx_supplydelivery_receiver ON SupplyDelivery(receiver);
CREATE INDEX idx_supplydelivery_supplier ON SupplyDelivery(supplier);

-- SupplyRequest: 5 columns (0 complex skipped)
CREATE TABLE SupplyRequest (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  requester TEXT GENERATED ALWAYS AS (resource ->> '$.requester.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.deliverTo.reference') STORED,
  supplier TEXT GENERATED ALWAYS AS (resource ->> '$.supplier.reference') STORED
);

CREATE INDEX idx_supplyrequest_requester ON SupplyRequest(requester);
CREATE INDEX idx_supplyrequest_subject ON SupplyRequest(subject);
CREATE INDEX idx_supplyrequest_supplier ON SupplyRequest(supplier);

-- Task: 13 columns (1 complex skipped)
CREATE TABLE Task (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  authored_on TEXT GENERATED ALWAYS AS (resource ->> '$.authoredOn') STORED,
  based_on TEXT GENERATED ALWAYS AS (resource ->> '$.basedOn.reference') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  focus TEXT GENERATED ALWAYS AS (resource ->> '$.focus.reference') STORED,
  intent TEXT GENERATED ALWAYS AS (resource ->> '$.intent') STORED,
  modified TEXT GENERATED ALWAYS AS (resource ->> '$.lastModified') STORED,
  owner TEXT GENERATED ALWAYS AS (resource ->> '$.owner.reference') STORED,
  part_of TEXT GENERATED ALWAYS AS (resource ->> '$.partOf.reference') STORED,
  period TEXT GENERATED ALWAYS AS (resource ->> '$.executionPeriod') STORED,
  priority TEXT GENERATED ALWAYS AS (resource ->> '$.priority') STORED,
  requester TEXT GENERATED ALWAYS AS (resource ->> '$.requester.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  subject TEXT GENERATED ALWAYS AS (resource ->> '$.for.reference') STORED
);

CREATE INDEX idx_task_based_on ON Task(based_on);
CREATE INDEX idx_task_encounter ON Task(encounter);
CREATE INDEX idx_task_focus ON Task(focus);
CREATE INDEX idx_task_owner ON Task(owner);
CREATE INDEX idx_task_part_of ON Task(part_of);
CREATE INDEX idx_task_requester ON Task(requester);
CREATE INDEX idx_task_subject ON Task(subject);

-- TerminologyCapabilities: 11 columns (2 complex skipped)
CREATE TABLE TerminologyCapabilities (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- TestReport: 5 columns (0 complex skipped)
CREATE TABLE TestReport (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  issued TEXT GENERATED ALWAYS AS (resource ->> '$.issued') STORED,
  participant TEXT GENERATED ALWAYS AS (resource ->> '$.participant.uri') STORED,
  result TEXT GENERATED ALWAYS AS (resource ->> '$.result') STORED,
  tester TEXT GENERATED ALWAYS AS (resource ->> '$.tester') STORED,
  testscript TEXT GENERATED ALWAYS AS (resource ->> '$.testScript.reference') STORED
);

CREATE INDEX idx_testreport_testscript ON TestReport(testscript);

-- TestScript: 12 columns (2 complex skipped)
CREATE TABLE TestScript (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  name TEXT GENERATED ALWAYS AS (resource ->> '$.name') STORED,
  publisher TEXT GENERATED ALWAYS AS (resource ->> '$.publisher') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED,
  testscript_capability TEXT GENERATED ALWAYS AS (resource ->> '$.metadata.capability.description') STORED,
  title TEXT GENERATED ALWAYS AS (resource ->> '$.title') STORED,
  url TEXT GENERATED ALWAYS AS (resource ->> '$.url') STORED,
  version TEXT GENERATED ALWAYS AS (resource ->> '$.version') STORED
);

-- ValueSet: 14 columns (2 complex skipped)
CREATE TABLE ValueSet (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  code TEXT GENERATED ALWAYS AS (resource ->> '$.expansion.contains.code') STORED,
  context_type TEXT GENERATED ALWAYS AS (resource ->> '$.useContext.code') STORED,
  context_type_quantity JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  context_type_value JSON GENERATED ALWAYS AS (resource ->> '$.useContext') STORED,
  date TEXT GENERATED ALWAYS AS (resource ->> '$.date') STORED,
  description TEXT GENERATED ALWAYS AS (resource ->> '$.description') STORED,
  expansion TEXT GENERATED ALWAYS AS (resource ->> '$.expansion.identifier') STORED,
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
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  target TEXT GENERATED ALWAYS AS (resource ->> '$.target.reference') STORED
);

CREATE INDEX idx_verificationresult_target ON VerificationResult(target);

-- VisionPrescription: 5 columns (0 complex skipped)
CREATE TABLE VisionPrescription (
  id TEXT PRIMARY KEY,
  resource JSON NOT NULL,
  versionId TEXT GENERATED ALWAYS AS (resource ->> '$.meta.versionId') STORED,
  lastUpdated TEXT GENERATED ALWAYS AS (resource ->> '$.meta.lastUpdated') STORED,
  profile JSON GENERATED ALWAYS AS (resource -> '$.meta.profile') STORED,
  datewritten TEXT GENERATED ALWAYS AS (resource ->> '$.dateWritten') STORED,
  encounter TEXT GENERATED ALWAYS AS (resource ->> '$.encounter.reference') STORED,
  patient TEXT GENERATED ALWAYS AS (resource ->> '$.patient.reference') STORED,
  prescriber TEXT GENERATED ALWAYS AS (resource ->> '$.prescriber.reference') STORED,
  status TEXT GENERATED ALWAYS AS (resource ->> '$.status') STORED
);

CREATE INDEX idx_visionprescription_encounter ON VisionPrescription(encounter);
CREATE INDEX idx_visionprescription_patient ON VisionPrescription(patient);
CREATE INDEX idx_visionprescription_prescriber ON VisionPrescription(prescriber);

-- Summary: 130 resources, 1084 columns
-- 211 complex expressions skipped (would need fhirpath UDF)

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

-- Address lookup table
CREATE TABLE Address (
  resourceType TEXT NOT NULL,
  resourceId TEXT NOT NULL,
  use TEXT,
  city TEXT,
  state TEXT,
  postalCode TEXT,
  country TEXT
);

CREATE INDEX idx_address_resource ON Address(resourceType, resourceId);
CREATE INDEX idx_address_city ON Address(resourceType, city);
CREATE INDEX idx_address_state ON Address(resourceType, state);
CREATE INDEX idx_address_postalcode ON Address(resourceType, postalCode);

-- ContactPoint lookup table (for telecom: email, phone, etc.)
CREATE TABLE ContactPoint (
  resourceType TEXT NOT NULL,
  resourceId TEXT NOT NULL,
  system TEXT,
  value TEXT,
  use TEXT
);

CREATE INDEX idx_contactpoint_resource ON ContactPoint(resourceType, resourceId);
CREATE INDEX idx_contactpoint_system_value ON ContactPoint(resourceType, system, value);
CREATE INDEX idx_contactpoint_value ON ContactPoint(resourceType, value);

-- Coding lookup table (for CodeableConcept: code, category, etc.)
CREATE TABLE Coding (
  resourceType TEXT NOT NULL,
  resourceId TEXT NOT NULL,
  path TEXT NOT NULL,
  system TEXT,
  code TEXT,
  display TEXT
);

CREATE INDEX idx_coding_resource ON Coding(resourceType, resourceId);
CREATE INDEX idx_coding_path_system_code ON Coding(resourceType, path, system, code);
CREATE INDEX idx_coding_path_code ON Coding(resourceType, path, code);

-- ObservationComponent table (for component-level composite search)
CREATE TABLE ObservationComponent (
  resourceId TEXT NOT NULL,
  codeSystem TEXT,
  code TEXT,
  codeDisplay TEXT,
  valueQuantity REAL,
  valueString TEXT,
  valueCodeSystem TEXT,
  valueCode TEXT
);

CREATE INDEX idx_obscomp_resource ON ObservationComponent(resourceId);
CREATE INDEX idx_obscomp_code ON ObservationComponent(codeSystem, code);
CREATE INDEX idx_obscomp_code_quantity ON ObservationComponent(codeSystem, code, valueQuantity);

CREATE TRIGGER Account_identifier_insert AFTER INSERT ON Account
BEGIN
  INSERT INTO Identifier (resourceType, resourceId, system, value)
  SELECT 'Account', NEW.id,
         json_extract(j.value, '$.system'),
         json_extract(j.value, '$.value')
  FROM json_each(NEW.resource, '$.identifier') AS j
  WHERE json_extract(j.value, '$.value') IS NOT NULL;
END;

CREATE TRIGGER Account_coding_insert AFTER INSERT ON Account
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Account', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ActivityDefinition_coding_insert AFTER INSERT ON ActivityDefinition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ActivityDefinition', NEW.id, 'subject[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.subject[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ActivityDefinition', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ActivityDefinition', NEW.id, 'topic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ActivityDefinition', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ActivityDefinition', NEW.id, 'bodySite',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.bodySite') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER AdverseEvent_coding_insert AFTER INSERT ON AdverseEvent
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'AdverseEvent', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'AdverseEvent', NEW.id, 'event',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.event.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'AdverseEvent', NEW.id, 'seriousness',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.seriousness.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'AdverseEvent', NEW.id, 'severity',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.severity.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'AdverseEvent', NEW.id, 'outcome',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.outcome.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER AllergyIntolerance_coding_insert AFTER INSERT ON AllergyIntolerance
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'AllergyIntolerance', NEW.id, 'clinicalStatus',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.clinicalStatus.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'AllergyIntolerance', NEW.id, 'verificationStatus',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.verificationStatus.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'AllergyIntolerance', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Appointment_coding_insert AFTER INSERT ON Appointment
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Appointment', NEW.id, 'cancelationReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.cancelationReason.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Appointment', NEW.id, 'serviceCategory',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.serviceCategory') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Appointment', NEW.id, 'serviceType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.serviceType') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Appointment', NEW.id, 'specialty',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.specialty') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Appointment', NEW.id, 'appointmentType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.appointmentType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Appointment', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER AppointmentResponse_coding_insert AFTER INSERT ON AppointmentResponse
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'AppointmentResponse', NEW.id, 'participantType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.participantType') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER AuditEvent_coding_insert AFTER INSERT ON AuditEvent
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'AuditEvent', NEW.id, 'purposeOfEvent',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.purposeOfEvent') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Basic_coding_insert AFTER INSERT ON Basic
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Basic', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER BodyStructure_coding_insert AFTER INSERT ON BodyStructure
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'BodyStructure', NEW.id, 'morphology',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.morphology.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'BodyStructure', NEW.id, 'location',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.location.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'BodyStructure', NEW.id, 'locationQualifier',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.locationQualifier') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER CapabilityStatement_coding_insert AFTER INSERT ON CapabilityStatement
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'CapabilityStatement', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER CarePlan_coding_insert AFTER INSERT ON CarePlan
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'CarePlan', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER CareTeam_coding_insert AFTER INSERT ON CareTeam
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'CareTeam', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'CareTeam', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ChargeItem_coding_insert AFTER INSERT ON ChargeItem
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ChargeItem', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ChargeItem', NEW.id, 'bodysite',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.bodysite') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ChargeItem', NEW.id, 'reason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reason') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ChargeItemDefinition_coding_insert AFTER INSERT ON ChargeItemDefinition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ChargeItemDefinition', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ChargeItemDefinition', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Claim_coding_insert AFTER INSERT ON Claim
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Claim', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Claim', NEW.id, 'subType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.subType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Claim', NEW.id, 'priority',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.priority.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Claim', NEW.id, 'fundsReserve',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.fundsReserve.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ClaimResponse_coding_insert AFTER INSERT ON ClaimResponse
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ClaimResponse', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ClaimResponse', NEW.id, 'subType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.subType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ClaimResponse', NEW.id, 'payeeType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.payeeType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ClaimResponse', NEW.id, 'fundsReserve',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.fundsReserve.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ClaimResponse', NEW.id, 'formCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.formCode.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ClinicalImpression_coding_insert AFTER INSERT ON ClinicalImpression
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ClinicalImpression', NEW.id, 'statusReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.statusReason.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ClinicalImpression', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ClinicalImpression', NEW.id, 'prognosisCodeableConcept',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.prognosisCodeableConcept') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER CodeSystem_coding_insert AFTER INSERT ON CodeSystem
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'CodeSystem', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Communication_coding_insert AFTER INSERT ON Communication
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Communication', NEW.id, 'statusReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.statusReason.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Communication', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Communication', NEW.id, 'medium',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.medium') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Communication', NEW.id, 'topic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Communication', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER CommunicationRequest_coding_insert AFTER INSERT ON CommunicationRequest
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'CommunicationRequest', NEW.id, 'statusReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.statusReason.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'CommunicationRequest', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'CommunicationRequest', NEW.id, 'medium',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.medium') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'CommunicationRequest', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Composition_coding_insert AFTER INSERT ON Composition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Composition', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Composition', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ConceptMap_coding_insert AFTER INSERT ON ConceptMap
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ConceptMap', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Condition_coding_insert AFTER INSERT ON Condition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Condition', NEW.id, 'clinicalStatus',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.clinicalStatus.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Condition', NEW.id, 'verificationStatus',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.verificationStatus.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Condition', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Condition', NEW.id, 'severity',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.severity.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Condition', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Condition', NEW.id, 'bodySite',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.bodySite') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Consent_coding_insert AFTER INSERT ON Consent
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Consent', NEW.id, 'scope',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.scope.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Consent', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Consent', NEW.id, 'policyRule',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.policyRule.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Contract_coding_insert AFTER INSERT ON Contract
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Contract', NEW.id, 'legalState',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.legalState.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Contract', NEW.id, 'contentDerivative',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.contentDerivative.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Contract', NEW.id, 'expirationType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.expirationType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Contract', NEW.id, 'scope',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.scope.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Contract', NEW.id, 'topic[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Contract', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Contract', NEW.id, 'subType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.subType') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Coverage_coding_insert AFTER INSERT ON Coverage
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Coverage', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Coverage', NEW.id, 'relationship',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.relationship.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER CoverageEligibilityRequest_coding_insert AFTER INSERT ON CoverageEligibilityRequest
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'CoverageEligibilityRequest', NEW.id, 'priority',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.priority.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER CoverageEligibilityResponse_coding_insert AFTER INSERT ON CoverageEligibilityResponse
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'CoverageEligibilityResponse', NEW.id, 'form',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.form.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER DetectedIssue_coding_insert AFTER INSERT ON DetectedIssue
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DetectedIssue', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Device_coding_insert AFTER INSERT ON Device
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Device', NEW.id, 'statusReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.statusReason') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Device', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Device', NEW.id, 'safety',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.safety') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER DeviceDefinition_coding_insert AFTER INSERT ON DeviceDefinition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DeviceDefinition', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DeviceDefinition', NEW.id, 'safety',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.safety') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DeviceDefinition', NEW.id, 'languageCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.languageCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER DeviceMetric_coding_insert AFTER INSERT ON DeviceMetric
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DeviceMetric', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DeviceMetric', NEW.id, 'unit',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.unit.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER DeviceRequest_coding_insert AFTER INSERT ON DeviceRequest
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DeviceRequest', NEW.id, 'performerType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.performerType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DeviceRequest', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER DeviceUseStatement_coding_insert AFTER INSERT ON DeviceUseStatement
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DeviceUseStatement', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DeviceUseStatement', NEW.id, 'bodySite',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.bodySite.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER DiagnosticReport_coding_insert AFTER INSERT ON DiagnosticReport
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DiagnosticReport', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DiagnosticReport', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DiagnosticReport', NEW.id, 'conclusionCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.conclusionCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER DocumentManifest_coding_insert AFTER INSERT ON DocumentManifest
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DocumentManifest', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER DocumentReference_coding_insert AFTER INSERT ON DocumentReference
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DocumentReference', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DocumentReference', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'DocumentReference', NEW.id, 'securityLabel',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.securityLabel') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER EffectEvidenceSynthesis_coding_insert AFTER INSERT ON EffectEvidenceSynthesis
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'EffectEvidenceSynthesis', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'EffectEvidenceSynthesis', NEW.id, 'topic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'EffectEvidenceSynthesis', NEW.id, 'synthesisType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.synthesisType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'EffectEvidenceSynthesis', NEW.id, 'studyType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.studyType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Encounter_coding_insert AFTER INSERT ON Encounter
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Encounter', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Encounter', NEW.id, 'serviceType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.serviceType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Encounter', NEW.id, 'priority',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.priority.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Encounter', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Endpoint_coding_insert AFTER INSERT ON Endpoint
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Endpoint', NEW.id, 'payloadType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.payloadType') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER EpisodeOfCare_coding_insert AFTER INSERT ON EpisodeOfCare
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'EpisodeOfCare', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER EventDefinition_coding_insert AFTER INSERT ON EventDefinition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'EventDefinition', NEW.id, 'subject[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.subject[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'EventDefinition', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'EventDefinition', NEW.id, 'topic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Evidence_coding_insert AFTER INSERT ON Evidence
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Evidence', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Evidence', NEW.id, 'topic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER EvidenceVariable_coding_insert AFTER INSERT ON EvidenceVariable
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'EvidenceVariable', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'EvidenceVariable', NEW.id, 'topic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ExampleScenario_coding_insert AFTER INSERT ON ExampleScenario
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ExampleScenario', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ExplanationOfBenefit_coding_insert AFTER INSERT ON ExplanationOfBenefit
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ExplanationOfBenefit', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ExplanationOfBenefit', NEW.id, 'subType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.subType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ExplanationOfBenefit', NEW.id, 'priority',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.priority.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ExplanationOfBenefit', NEW.id, 'fundsReserveRequested',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.fundsReserveRequested.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ExplanationOfBenefit', NEW.id, 'fundsReserve',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.fundsReserve.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ExplanationOfBenefit', NEW.id, 'formCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.formCode.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER FamilyMemberHistory_coding_insert AFTER INSERT ON FamilyMemberHistory
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'FamilyMemberHistory', NEW.id, 'dataAbsentReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.dataAbsentReason.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'FamilyMemberHistory', NEW.id, 'relationship',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.relationship.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'FamilyMemberHistory', NEW.id, 'sex',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.sex.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'FamilyMemberHistory', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Flag_coding_insert AFTER INSERT ON Flag
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Flag', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Flag', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Goal_coding_insert AFTER INSERT ON Goal
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Goal', NEW.id, 'achievementStatus',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.achievementStatus.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Goal', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Goal', NEW.id, 'priority',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.priority.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Goal', NEW.id, 'description',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.description.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Goal', NEW.id, 'outcomeCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.outcomeCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER GraphDefinition_coding_insert AFTER INSERT ON GraphDefinition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'GraphDefinition', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Group_coding_insert AFTER INSERT ON "Group"
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Group', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER GuidanceResponse_coding_insert AFTER INSERT ON GuidanceResponse
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'GuidanceResponse', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER HealthcareService_coding_insert AFTER INSERT ON HealthcareService
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'HealthcareService', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'HealthcareService', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'HealthcareService', NEW.id, 'specialty',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.specialty') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'HealthcareService', NEW.id, 'serviceProvisionCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.serviceProvisionCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'HealthcareService', NEW.id, 'program',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.program') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'HealthcareService', NEW.id, 'characteristic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.characteristic') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'HealthcareService', NEW.id, 'communication',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.communication') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'HealthcareService', NEW.id, 'referralMethod',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.referralMethod') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ImagingStudy_coding_insert AFTER INSERT ON ImagingStudy
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ImagingStudy', NEW.id, 'procedureCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.procedureCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ImagingStudy', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Immunization_coding_insert AFTER INSERT ON Immunization
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Immunization', NEW.id, 'statusReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.statusReason.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Immunization', NEW.id, 'vaccineCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.vaccineCode.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Immunization', NEW.id, 'reportOrigin',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reportOrigin.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Immunization', NEW.id, 'site',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.site.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Immunization', NEW.id, 'route',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.route.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Immunization', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Immunization', NEW.id, 'subpotentReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.subpotentReason') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Immunization', NEW.id, 'programEligibility',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.programEligibility') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Immunization', NEW.id, 'fundingSource',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.fundingSource.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ImmunizationEvaluation_coding_insert AFTER INSERT ON ImmunizationEvaluation
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ImmunizationEvaluation', NEW.id, 'targetDisease',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.targetDisease.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ImmunizationEvaluation', NEW.id, 'doseStatus',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.doseStatus.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ImmunizationEvaluation', NEW.id, 'doseStatusReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.doseStatusReason') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ImplementationGuide_coding_insert AFTER INSERT ON ImplementationGuide
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ImplementationGuide', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER InsurancePlan_coding_insert AFTER INSERT ON InsurancePlan
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'InsurancePlan', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Invoice_coding_insert AFTER INSERT ON Invoice
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Invoice', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Library_coding_insert AFTER INSERT ON Library
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Library', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Library', NEW.id, 'subject[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.subject[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Library', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Library', NEW.id, 'topic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER List_coding_insert AFTER INSERT ON List
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'List', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'List', NEW.id, 'orderedBy',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.orderedBy.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'List', NEW.id, 'emptyReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.emptyReason.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Location_address_insert AFTER INSERT ON Location
BEGIN
  INSERT INTO Address (resourceType, resourceId, use, city, state, postalCode, country)
  SELECT 'Location', NEW.id,
         json_extract(a.value, '$.use'),
         json_extract(a.value, '$.city'),
         json_extract(a.value, '$.state'),
         json_extract(a.value, '$.postalCode'),
         json_extract(a.value, '$.country')
  FROM json_each(NEW.resource, '$.address') AS a;
END;

CREATE TRIGGER Location_coding_insert AFTER INSERT ON Location
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Location', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Location', NEW.id, 'physicalType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.physicalType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Measure_coding_insert AFTER INSERT ON Measure
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Measure', NEW.id, 'subject[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.subject[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Measure', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Measure', NEW.id, 'topic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Measure', NEW.id, 'scoring',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.scoring.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Measure', NEW.id, 'compositeScoring',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.compositeScoring.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Measure', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Measure', NEW.id, 'improvementNotation',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.improvementNotation.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MeasureReport_coding_insert AFTER INSERT ON MeasureReport
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MeasureReport', NEW.id, 'improvementNotation',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.improvementNotation.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Media_coding_insert AFTER INSERT ON Media
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Media', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Media', NEW.id, 'modality',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.modality.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Media', NEW.id, 'view',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.view.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Media', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Media', NEW.id, 'bodySite',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.bodySite.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Medication_coding_insert AFTER INSERT ON Medication
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Medication', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Medication', NEW.id, 'form',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.form.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MedicationAdministration_coding_insert AFTER INSERT ON MedicationAdministration
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationAdministration', NEW.id, 'statusReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.statusReason') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationAdministration', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationAdministration', NEW.id, 'medication[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.medication[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationAdministration', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MedicationDispense_coding_insert AFTER INSERT ON MedicationDispense
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationDispense', NEW.id, 'statusReason[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.statusReason[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationDispense', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationDispense', NEW.id, 'medication[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.medication[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationDispense', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MedicationKnowledge_coding_insert AFTER INSERT ON MedicationKnowledge
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationKnowledge', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationKnowledge', NEW.id, 'doseForm',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.doseForm.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationKnowledge', NEW.id, 'productType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.productType') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationKnowledge', NEW.id, 'intendedRoute',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.intendedRoute') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MedicationRequest_coding_insert AFTER INSERT ON MedicationRequest
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationRequest', NEW.id, 'statusReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.statusReason.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationRequest', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationRequest', NEW.id, 'medication[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.medication[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationRequest', NEW.id, 'performerType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.performerType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationRequest', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationRequest', NEW.id, 'courseOfTherapyType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.courseOfTherapyType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MedicationStatement_coding_insert AFTER INSERT ON MedicationStatement
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationStatement', NEW.id, 'statusReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.statusReason') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationStatement', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationStatement', NEW.id, 'medication[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.medication[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicationStatement', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MedicinalProduct_coding_insert AFTER INSERT ON MedicinalProduct
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProduct', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProduct', NEW.id, 'combinedPharmaceuticalDoseForm',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.combinedPharmaceuticalDoseForm.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProduct', NEW.id, 'legalStatusOfSupply',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.legalStatusOfSupply.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProduct', NEW.id, 'additionalMonitoringIndicator',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.additionalMonitoringIndicator.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProduct', NEW.id, 'paediatricUseIndicator',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.paediatricUseIndicator.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProduct', NEW.id, 'productClassification',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.productClassification') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MedicinalProductAuthorization_coding_insert AFTER INSERT ON MedicinalProductAuthorization
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductAuthorization', NEW.id, 'country',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.country') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductAuthorization', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductAuthorization', NEW.id, 'status',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.status.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductAuthorization', NEW.id, 'legalBasis',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.legalBasis.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MedicinalProductContraindication_coding_insert AFTER INSERT ON MedicinalProductContraindication
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductContraindication', NEW.id, 'disease',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.disease.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductContraindication', NEW.id, 'diseaseStatus',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.diseaseStatus.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductContraindication', NEW.id, 'comorbidity',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.comorbidity') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MedicinalProductIndication_coding_insert AFTER INSERT ON MedicinalProductIndication
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductIndication', NEW.id, 'diseaseSymptomProcedure',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.diseaseSymptomProcedure.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductIndication', NEW.id, 'diseaseStatus',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.diseaseStatus.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductIndication', NEW.id, 'comorbidity',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.comorbidity') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductIndication', NEW.id, 'intendedEffect',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.intendedEffect.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MedicinalProductInteraction_coding_insert AFTER INSERT ON MedicinalProductInteraction
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductInteraction', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductInteraction', NEW.id, 'effect',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.effect.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductInteraction', NEW.id, 'incidence',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.incidence.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductInteraction', NEW.id, 'management',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.management.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MedicinalProductPackaged_coding_insert AFTER INSERT ON MedicinalProductPackaged
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductPackaged', NEW.id, 'legalStatusOfSupply',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.legalStatusOfSupply.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MedicinalProductUndesirableEffect_coding_insert AFTER INSERT ON MedicinalProductUndesirableEffect
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductUndesirableEffect', NEW.id, 'symptomConditionEffect',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.symptomConditionEffect.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductUndesirableEffect', NEW.id, 'classification',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.classification.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MedicinalProductUndesirableEffect', NEW.id, 'frequencyOfOccurrence',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.frequencyOfOccurrence.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MessageDefinition_coding_insert AFTER INSERT ON MessageDefinition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MessageDefinition', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER MessageHeader_coding_insert AFTER INSERT ON MessageHeader
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'MessageHeader', NEW.id, 'reason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reason.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER NamingSystem_coding_insert AFTER INSERT ON NamingSystem
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'NamingSystem', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'NamingSystem', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER NutritionOrder_coding_insert AFTER INSERT ON NutritionOrder
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'NutritionOrder', NEW.id, 'foodPreferenceModifier',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.foodPreferenceModifier') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'NutritionOrder', NEW.id, 'excludeFoodModifier',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.excludeFoodModifier') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Observation_coding_insert AFTER INSERT ON Observation
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Observation', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Observation', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Observation', NEW.id, 'dataAbsentReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.dataAbsentReason.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Observation', NEW.id, 'interpretation',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.interpretation') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Observation', NEW.id, 'bodySite',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.bodySite.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Observation', NEW.id, 'method',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.method.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
END;

CREATE TRIGGER Observation_component_insert AFTER INSERT ON Observation
BEGIN
  INSERT INTO ObservationComponent (resourceId, codeSystem, code, codeDisplay, valueQuantity, valueString, valueCodeSystem, valueCode)
  SELECT NEW.id,
         json_extract(coding.value, '$.system'),
         json_extract(coding.value, '$.code'),
         json_extract(coding.value, '$.display'),
         CAST(json_extract(comp.value, '$.valueQuantity.value') AS REAL),
         json_extract(comp.value, '$.valueString'),
         json_extract(valcode.value, '$.system'),
         json_extract(valcode.value, '$.code')
  FROM json_each(NEW.resource, '$.component') AS comp,
       json_each(json_extract(comp.value, '$.code.coding')) AS coding
       LEFT JOIN json_each(json_extract(comp.value, '$.valueCodeableConcept.coding')) AS valcode
  WHERE json_extract(coding.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER OperationDefinition_coding_insert AFTER INSERT ON OperationDefinition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'OperationDefinition', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Organization_address_insert AFTER INSERT ON Organization
BEGIN
  INSERT INTO Address (resourceType, resourceId, use, city, state, postalCode, country)
  SELECT 'Organization', NEW.id,
         json_extract(a.value, '$.use'),
         json_extract(a.value, '$.city'),
         json_extract(a.value, '$.state'),
         json_extract(a.value, '$.postalCode'),
         json_extract(a.value, '$.country')
  FROM json_each(NEW.resource, '$.address') AS a;
END;

CREATE TRIGGER Organization_coding_insert AFTER INSERT ON Organization
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Organization', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER OrganizationAffiliation_coding_insert AFTER INSERT ON OrganizationAffiliation
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'OrganizationAffiliation', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'OrganizationAffiliation', NEW.id, 'specialty',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.specialty') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Patient_address_insert AFTER INSERT ON Patient
BEGIN
  INSERT INTO Address (resourceType, resourceId, use, city, state, postalCode, country)
  SELECT 'Patient', NEW.id,
         json_extract(a.value, '$.use'),
         json_extract(a.value, '$.city'),
         json_extract(a.value, '$.state'),
         json_extract(a.value, '$.postalCode'),
         json_extract(a.value, '$.country')
  FROM json_each(NEW.resource, '$.address') AS a;
END;

CREATE TRIGGER Patient_contactpoint_insert AFTER INSERT ON Patient
BEGIN
  INSERT INTO ContactPoint (resourceType, resourceId, system, value, use)
  SELECT 'Patient', NEW.id,
         json_extract(t.value, '$.system'),
         json_extract(t.value, '$.value'),
         json_extract(t.value, '$.use')
  FROM json_each(NEW.resource, '$.telecom') AS t;
END;

CREATE TRIGGER Patient_coding_insert AFTER INSERT ON Patient
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Patient', NEW.id, 'maritalStatus',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.maritalStatus.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER PaymentNotice_coding_insert AFTER INSERT ON PaymentNotice
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'PaymentNotice', NEW.id, 'paymentStatus',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.paymentStatus.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER PaymentReconciliation_coding_insert AFTER INSERT ON PaymentReconciliation
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'PaymentReconciliation', NEW.id, 'formCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.formCode.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Person_address_insert AFTER INSERT ON Person
BEGIN
  INSERT INTO Address (resourceType, resourceId, use, city, state, postalCode, country)
  SELECT 'Person', NEW.id,
         json_extract(a.value, '$.use'),
         json_extract(a.value, '$.city'),
         json_extract(a.value, '$.state'),
         json_extract(a.value, '$.postalCode'),
         json_extract(a.value, '$.country')
  FROM json_each(NEW.resource, '$.address') AS a;
END;

CREATE TRIGGER Person_contactpoint_insert AFTER INSERT ON Person
BEGIN
  INSERT INTO ContactPoint (resourceType, resourceId, system, value, use)
  SELECT 'Person', NEW.id,
         json_extract(t.value, '$.system'),
         json_extract(t.value, '$.value'),
         json_extract(t.value, '$.use')
  FROM json_each(NEW.resource, '$.telecom') AS t;
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

CREATE TRIGGER PlanDefinition_coding_insert AFTER INSERT ON PlanDefinition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'PlanDefinition', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'PlanDefinition', NEW.id, 'subject[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.subject[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'PlanDefinition', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'PlanDefinition', NEW.id, 'topic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Practitioner_address_insert AFTER INSERT ON Practitioner
BEGIN
  INSERT INTO Address (resourceType, resourceId, use, city, state, postalCode, country)
  SELECT 'Practitioner', NEW.id,
         json_extract(a.value, '$.use'),
         json_extract(a.value, '$.city'),
         json_extract(a.value, '$.state'),
         json_extract(a.value, '$.postalCode'),
         json_extract(a.value, '$.country')
  FROM json_each(NEW.resource, '$.address') AS a;
END;

CREATE TRIGGER Practitioner_contactpoint_insert AFTER INSERT ON Practitioner
BEGIN
  INSERT INTO ContactPoint (resourceType, resourceId, system, value, use)
  SELECT 'Practitioner', NEW.id,
         json_extract(t.value, '$.system'),
         json_extract(t.value, '$.value'),
         json_extract(t.value, '$.use')
  FROM json_each(NEW.resource, '$.telecom') AS t;
END;

CREATE TRIGGER Practitioner_coding_insert AFTER INSERT ON Practitioner
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Practitioner', NEW.id, 'communication',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.communication') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER PractitionerRole_contactpoint_insert AFTER INSERT ON PractitionerRole
BEGIN
  INSERT INTO ContactPoint (resourceType, resourceId, system, value, use)
  SELECT 'PractitionerRole', NEW.id,
         json_extract(t.value, '$.system'),
         json_extract(t.value, '$.value'),
         json_extract(t.value, '$.use')
  FROM json_each(NEW.resource, '$.telecom') AS t;
END;

CREATE TRIGGER PractitionerRole_coding_insert AFTER INSERT ON PractitionerRole
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'PractitionerRole', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'PractitionerRole', NEW.id, 'specialty',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.specialty') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Procedure_coding_insert AFTER INSERT ON Procedure
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Procedure', NEW.id, 'statusReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.statusReason.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Procedure', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Procedure', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Procedure', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Procedure', NEW.id, 'bodySite',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.bodySite') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Procedure', NEW.id, 'outcome',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.outcome.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Procedure', NEW.id, 'complication',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.complication') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Procedure', NEW.id, 'followUp',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.followUp') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Procedure', NEW.id, 'usedCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.usedCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Provenance_coding_insert AFTER INSERT ON Provenance
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Provenance', NEW.id, 'reason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reason') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Provenance', NEW.id, 'activity',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.activity.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Questionnaire_coding_insert AFTER INSERT ON Questionnaire
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Questionnaire', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER RelatedPerson_address_insert AFTER INSERT ON RelatedPerson
BEGIN
  INSERT INTO Address (resourceType, resourceId, use, city, state, postalCode, country)
  SELECT 'RelatedPerson', NEW.id,
         json_extract(a.value, '$.use'),
         json_extract(a.value, '$.city'),
         json_extract(a.value, '$.state'),
         json_extract(a.value, '$.postalCode'),
         json_extract(a.value, '$.country')
  FROM json_each(NEW.resource, '$.address') AS a;
END;

CREATE TRIGGER RelatedPerson_contactpoint_insert AFTER INSERT ON RelatedPerson
BEGIN
  INSERT INTO ContactPoint (resourceType, resourceId, system, value, use)
  SELECT 'RelatedPerson', NEW.id,
         json_extract(t.value, '$.system'),
         json_extract(t.value, '$.value'),
         json_extract(t.value, '$.use')
  FROM json_each(NEW.resource, '$.telecom') AS t;
END;

CREATE TRIGGER RelatedPerson_coding_insert AFTER INSERT ON RelatedPerson
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'RelatedPerson', NEW.id, 'relationship',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.relationship') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER RequestGroup_coding_insert AFTER INSERT ON RequestGroup
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'RequestGroup', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'RequestGroup', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ResearchDefinition_coding_insert AFTER INSERT ON ResearchDefinition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchDefinition', NEW.id, 'subject[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.subject[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchDefinition', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchDefinition', NEW.id, 'topic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ResearchElementDefinition_coding_insert AFTER INSERT ON ResearchElementDefinition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchElementDefinition', NEW.id, 'subject[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.subject[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchElementDefinition', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchElementDefinition', NEW.id, 'topic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ResearchStudy_coding_insert AFTER INSERT ON ResearchStudy
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchStudy', NEW.id, 'primaryPurposeType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.primaryPurposeType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchStudy', NEW.id, 'phase',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.phase.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchStudy', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchStudy', NEW.id, 'focus',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.focus') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchStudy', NEW.id, 'condition',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.condition') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchStudy', NEW.id, 'keyword',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.keyword') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchStudy', NEW.id, 'location',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.location') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ResearchStudy', NEW.id, 'reasonStopped',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonStopped.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER RiskAssessment_coding_insert AFTER INSERT ON RiskAssessment
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'RiskAssessment', NEW.id, 'method',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.method.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'RiskAssessment', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'RiskAssessment', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER RiskEvidenceSynthesis_coding_insert AFTER INSERT ON RiskEvidenceSynthesis
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'RiskEvidenceSynthesis', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'RiskEvidenceSynthesis', NEW.id, 'topic',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.topic') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'RiskEvidenceSynthesis', NEW.id, 'synthesisType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.synthesisType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'RiskEvidenceSynthesis', NEW.id, 'studyType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.studyType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Schedule_coding_insert AFTER INSERT ON Schedule
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Schedule', NEW.id, 'serviceCategory',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.serviceCategory') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Schedule', NEW.id, 'serviceType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.serviceType') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Schedule', NEW.id, 'specialty',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.specialty') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER SearchParameter_coding_insert AFTER INSERT ON SearchParameter
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'SearchParameter', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ServiceRequest_coding_insert AFTER INSERT ON ServiceRequest
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ServiceRequest', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ServiceRequest', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ServiceRequest', NEW.id, 'orderDetail',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.orderDetail') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ServiceRequest', NEW.id, 'performerType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.performerType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ServiceRequest', NEW.id, 'locationCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.locationCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ServiceRequest', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ServiceRequest', NEW.id, 'bodySite',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.bodySite') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Slot_coding_insert AFTER INSERT ON Slot
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Slot', NEW.id, 'serviceCategory',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.serviceCategory') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Slot', NEW.id, 'serviceType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.serviceType') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Slot', NEW.id, 'specialty',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.specialty') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Slot', NEW.id, 'appointmentType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.appointmentType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Specimen_coding_insert AFTER INSERT ON Specimen
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Specimen', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Specimen', NEW.id, 'condition',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.condition') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER StructureDefinition_coding_insert AFTER INSERT ON StructureDefinition
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'StructureDefinition', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER StructureMap_coding_insert AFTER INSERT ON StructureMap
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'StructureMap', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Substance_coding_insert AFTER INSERT ON Substance
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Substance', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Substance', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER SupplyDelivery_coding_insert AFTER INSERT ON SupplyDelivery
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'SupplyDelivery', NEW.id, 'type',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.type.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER SupplyRequest_coding_insert AFTER INSERT ON SupplyRequest
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'SupplyRequest', NEW.id, 'category',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.category.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'SupplyRequest', NEW.id, 'item[x]',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.item[x].coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'SupplyRequest', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER Task_coding_insert AFTER INSERT ON Task
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Task', NEW.id, 'statusReason',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.statusReason.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Task', NEW.id, 'businessStatus',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.businessStatus.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Task', NEW.id, 'code',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.code.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Task', NEW.id, 'performerType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.performerType') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'Task', NEW.id, 'reasonCode',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.reasonCode.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER TerminologyCapabilities_coding_insert AFTER INSERT ON TerminologyCapabilities
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'TerminologyCapabilities', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER TestScript_coding_insert AFTER INSERT ON TestScript
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'TestScript', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER ValueSet_coding_insert AFTER INSERT ON ValueSet
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'ValueSet', NEW.id, 'jurisdiction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.jurisdiction') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

CREATE TRIGGER VerificationResult_coding_insert AFTER INSERT ON VerificationResult
BEGIN
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'VerificationResult', NEW.id, 'need',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.need.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'VerificationResult', NEW.id, 'validationType',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.validationType.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'VerificationResult', NEW.id, 'validationProcess',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.validationProcess') AS cc,
       json_each(json_extract(cc.value, '$.coding')) AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
  INSERT INTO Coding (resourceType, resourceId, path, system, code, display)
  SELECT 'VerificationResult', NEW.id, 'failureAction',
         json_extract(c.value, '$.system'),
         json_extract(c.value, '$.code'),
         json_extract(c.value, '$.display')
  FROM json_each(NEW.resource, '$.failureAction.coding') AS c
  WHERE json_extract(c.value, '$.code') IS NOT NULL;
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

