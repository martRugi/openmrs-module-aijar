alter table openmrs.active_list                modify column creator int(11);
alter table openmrs.active_list_type           modify column creator int(11);
alter table openmrs.cohort                     modify column creator int(11);
alter table openmrs.concept                    modify column creator int(11) null;
alter table openmrs.concept_answer             modify column creator int(11);
alter table openmrs.concept_class              modify column creator int(11);
alter table openmrs.concept_datatype           modify column creator int(11);
alter table openmrs.concept_description        modify column creator int(11);
alter table openmrs.concept_map_type           modify column creator int(11);
alter table openmrs.concept_name               modify column creator int(11);
alter table openmrs.concept_proposal           modify column creator int(11);
alter table openmrs.concept_reference_map      modify column creator int(11);
alter table openmrs.concept_reference_source   modify column creator int(11);
alter table openmrs.concept_reference_term     modify column creator int(11);
alter table openmrs.concept_reference_term_map modify column creator int(11);
alter table openmrs.concept_set                modify column creator int(11);
alter table openmrs.drug                       modify column creator int(11);
alter table openmrs.drug                       modify column route int(11);
alter table openmrs.encounter                  modify column creator int(11);
alter table openmrs.encounter_provider         modify column creator int(11);
alter table openmrs.encounter_role             modify column creator int(11);
alter table openmrs.encounter_type             modify column creator int(11);
alter table openmrs.field                      modify column creator int(11);
alter table openmrs.field_answer               modify column creator int(11);
alter table openmrs.field_type                 modify column creator int(11);
alter table openmrs.form                       modify column creator int(11);
alter table openmrs.form_field                 modify column creator int(11);
alter table openmrs.hl7_source                 modify column creator int(11);
alter table openmrs.location                   modify column creator int(11);
-- alter table openmrs.location_attribute         modify column creator int(11);
alter table openmrs.location_attribute_type    modify column creator int(11);
alter table openmrs.location_tag               modify column creator int(11);
alter table openmrs.note                       modify column creator int(11);
alter table openmrs.notification_alert         modify column creator int(11);
alter table openmrs.obs                        modify column creator int(11);
alter table openmrs.order_type                 modify column creator int(11);
alter table openmrs.orders                     modify column creator int(11);
alter table openmrs.patient                    modify column creator int(11);
alter table openmrs.patient_identifier         modify column creator int(11);
alter table openmrs.patient_identifier_type    modify column creator int(11);
alter table openmrs.patient_program            modify column creator int(11);
alter table openmrs.patient_state              modify column creator int(11);
alter table openmrs.person                     modify column creator int(11);
alter table openmrs.person_address             modify column creator int(11);
alter table openmrs.person_attribute           modify column creator int(11);
alter table openmrs.person_attribute_type      modify column creator int(11);
alter table openmrs.person_merge_log           modify column creator int(11);
alter table openmrs.person_name                modify column creator int(11);
alter table openmrs.program                    modify column creator int(11);
alter table openmrs.program_workflow           modify column creator int(11);
alter table openmrs.program_workflow_state     modify column creator int(11);
alter table openmrs.provider                   modify column creator int(11);
alter table openmrs.provider_attribute         modify column creator int(11);
alter table openmrs.provider_attribute_type    modify column creator int(11);
alter table openmrs.relationship               modify column creator int(11);
alter table openmrs.relationship_type          modify column creator int(11);
alter table openmrs.report_object              modify column creator int(11);
alter table openmrs.serialized_object          modify column creator int(11);
alter table openmrs.users                      modify column creator int(11);
alter table openmrs.visit                      modify column creator int(11);
alter table openmrs.visit_attribute            modify column creator int(11);
alter table openmrs.visit_attribute_type       modify column creator int(11);
alter table openmrs.visit_type                 modify column creator int(11);

delete from openmrs_backup.concept_name where openmrs_backup.concept_name.concept_id not in (select concept_id from openmrs_backup.concept);

INSERT INTO openmrs.role (role,description,uuid) select role,description,uuid from openmrs_backup.role where openmrs_backup.role.role not in (select role from openmrs.role);
INSERT INTO openmrs.role_role (parent_role,child_role) select parent_role,child_role from openmrs_backup.role_role where (openmrs_backup.role_role.parent_role not in (select parent_role from openmrs.role_role) and openmrs_backup.role_role.child_role not in (select child_role from openmrs.role_role));
INSERT INTO openmrs.privilege (privilege,description,uuid) select privilege,description,uuid from openmrs_backup.privilege where openmrs_backup.privilege.privilege not in (select privilege from openmrs.privilege);
INSERT INTO openmrs.role_privilege (role,privilege) select role,privilege from openmrs_backup.role_privilege where (openmrs_backup.role_privilege.role not in (select role from openmrs.role_privilege) and openmrs_backup.role_privilege.privilege not in (select privilege from openmrs.role_privilege));

INSERT INTO openmrs.concept_class (concept_class_id,name ,description,date_created,retired,date_retired,retire_reason,uuid) select concept_class_id,name ,description,date_created,retired,date_retired,retire_reason,uuid from openmrs_backup.concept_class where openmrs_backup.concept_class.concept_class_id not in (select concept_class_id from openmrs.concept_class);
INSERT INTO openmrs.concept_datatype (concept_datatype_id,name,hl7_abbreviation ,description,date_created,retired,date_retired,retire_reason,uuid) select concept_datatype_id,name,hl7_abbreviation ,description,date_created,retired,date_retired,retire_reason,uuid from openmrs_backup.concept_datatype where openmrs_backup.concept_datatype.concept_datatype_id not in (select concept_datatype_id from openmrs.concept_datatype);
-- INSERT INTO openmrs.concept_map_type (concept_map_type_id,name,description,date_created,date_changed,is_hidden,retired,date_retired,retire_reason,uuid) select concept_map_type_id,name,description,date_created,date_changed,is_hidden,retired,date_retired,retire_reason,uuid from openmrs_backup.concept_map_type where openmrs_backup.concept_map_type.concept_map_type_id not in (select concept_map_type_id from openmrs.concept_map_type);
INSERT INTO openmrs.concept_name_tag (concept_name_tag_id,tag,description,date_created,voided,date_voided,void_reason,uuid) select concept_name_tag_id,tag,description,date_created,voided,date_voided,void_reason,uuid from openmrs_backup.concept_name_tag where openmrs_backup.concept_name_tag.concept_name_tag_id not in (select concept_name_tag_id from openmrs.concept_name_tag);
-- INSERT INTO openmrs.concept_reference_source (concept_source_id,name,description,hl7_code,date_created,retired,date_retired,retire_reason,uuid) select concept_source_id,name,description,hl7_code,date_created,retired,date_retired,retire_reason,uuid from openmrs_backup.concept_reference_source where openmrs_backup.concept_reference_source.concept_source_id not in (select concept_source_id from openmrs.concept_reference_source);
-- INSERT INTO openmrs.concept_reference_term (concept_reference_term_id,concept_source_id,name,code,version,description,date_created,date_changed,retired,date_retired,retire_reason,uuid) select concept_reference_term_id,concept_source_id,name,code,version,description,date_created,date_changed,retired,date_retired,retire_reason,uuid from openmrs_backup.concept_reference_term where openmrs_backup.concept_reference_term.concept_reference_term_id not in (select concept_reference_term_id from openmrs.concept_reference_term);
INSERT INTO openmrs.concept (concept_id,retired,short_name,description,form_text,datatype_id,class_id,is_set,date_created,version,date_changed,date_retired,retire_reason,uuid) select concept_id,retired,short_name,description,form_text,datatype_id,class_id,is_set,date_created,version,date_changed,date_retired,retire_reason,uuid from openmrs_backup.concept where openmrs_backup.concept.concept_id not in (select concept_id from openmrs.concept);
INSERT INTO openmrs.concept_description (concept_description_id,concept_id,description,locale,date_created,date_changed,uuid) select concept_description_id,concept_id,description,locale,date_created,date_changed,uuid from openmrs_backup.concept_description where openmrs_backup.concept_description.concept_description_id not in (select concept_description_id from openmrs.concept_description);
INSERT INTO openmrs.concept_name (concept_name_id,concept_id,name,locale,date_created,voided,date_voided,void_reason,uuid) select concept_name_id,concept_id,name,locale,date_created,voided,date_voided,void_reason,uuid from openmrs_backup.concept_name where openmrs_backup.concept_name.concept_name_id not in (select concept_name_id from openmrs.concept_name) and openmrs_backup.concept_name.concept_id in (select concept_id from openmrs_backup.concept);
-- INSERT INTO openmrs.concept_reference_map (concept_map_id,concept_reference_term_id,concept_map_type_id,date_created,concept_id,date_changed,uuid) select concept_map_id,concept_reference_term_id,concept_map_type_id,date_created,concept_id,date_changed,uuid from openmrs_backup.concept_reference_map where openmrs_backup.concept_reference_map.concept_map_id not in (select concept_map_id from openmrs.concept_reference_map);
-- INSERT INTO openmrs.concept_reference_term_map (concept_reference_term_map_id,term_a_id,term_b_id,a_is_to_b_id,date_created,date_changed,uuid) select concept_reference_term_map_id,term_a_id,term_b_id,a_is_to_b_id,date_created,date_changed,uuid from openmrs_backup.concept_reference_term_map where openmrs_backup.concept_reference_term_map.concept_reference_term_map_id not in (select concept_reference_term_map_id from openmrs.concept_reference_term_map);
INSERT INTO openmrs.concept_name_tag_map (concept_name_id,concept_name_tag_id) select concept_name_id,concept_name_tag_id from openmrs_backup.concept_name_tag_map where( openmrs_backup.concept_name_tag_map.concept_name_id not in (select concept_name_id from openmrs.concept_name_tag_map) and openmrs_backup.concept_name_tag_map.concept_name_tag_id not in (select concept_name_tag_id from openmrs.concept_name_tag_map));
INSERT INTO openmrs.concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise) select concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise from openmrs_backup.concept_numeric where openmrs_backup.concept_numeric.concept_id not in (select concept_id from openmrs.concept_numeric);
INSERT INTO openmrs.concept_complex (concept_id,handler) select concept_id,handler from openmrs_backup.concept_complex where openmrs_backup.concept_complex.concept_id not in (select concept_id from openmrs.concept_complex);
INSERT INTO openmrs.drug (drug_id,concept_id,name,combination,dosage_form,strength,maximum_daily_dose,minimum_daily_dose,date_created,retired,date_retired,retire_reason,uuid) select drug_id,concept_id,name,combination,dosage_form,dose_strength,maximum_daily_dose,minimum_daily_dose,date_created,retired,date_retired,retire_reason,uuid from openmrs_backup.drug where openmrs_backup.drug.drug_id not in (select drug_id from openmrs.drug) and openmrs_backup.drug.uuid not in (select uuid from openmrs.drug);
INSERT INTO openmrs.concept_answer (concept_answer_id,concept_id,answer_concept,answer_drug,date_created,uuid) select concept_answer_id,concept_id,answer_concept,answer_drug,date_created,uuid from openmrs_backup.concept_answer where openmrs_backup.concept_answer.concept_answer_id not in (select concept_answer_id from openmrs.concept_answer);
-- INSERT INTO openmrs.drug_ingredient (drug_id,ingredient_id,uuid) select concept_id,ingredient_id,uuid from openmrs_backup.drug_ingredient where ( openmrs_backup.drug_ingredient.ingredient_id not in (select ingredient_id from openmrs.drug_ingredient) and openmrs_backup.drug_ingredient.concept_id not in (select concept_id from openmrs.drug_ingredient));
-- INSERT INTO openmrs.concept_stop_word (concept_stop_word_id,word,locale,uuid) select concept_stop_word_id,word,locale,uuid from openmrs_backup.concept_stop_word where openmrs_backup.concept_stop_word.concept_stop_word_id not in (select concept_stop_word_id from openmrs.concept_stop_word);
INSERT INTO openmrs.concept_set (concept_set_id,concept_id,concept_set,sort_weight,date_created,uuid) select concept_set_id,concept_id,concept_set,sort_weight,date_created,uuid from openmrs_backup.concept_set where openmrs_backup.concept_set.concept_set_id not in (select concept_set_id from openmrs.concept_set);


INSERT INTO openmrs.person (person_id,gender,birthdate,birthdate_estimated,dead,death_date,cause_of_death,date_created,date_changed,voided,date_voided,void_reason,uuid) select person_id,gender,birthdate,birthdate_estimated,dead,death_date,cause_of_death,date_created,date_changed,voided,date_voided,void_reason,uuid from openmrs_backup.person where openmrs_backup.person.person_id not in (select person_id from openmrs.person);
INSERT INTO openmrs.person_address (person_address_id,person_id,preferred,address1,address2,city_village,state_province,postal_code,country,latitude,longitude,date_created,voided,date_voided,void_reason,county_district,uuid) select person_address_id,person_id,preferred,address1,address2,city_village,state_province,postal_code,country,latitude,longitude,date_created,voided,date_voided,void_reason,county_district,uuid from openmrs_backup.person_address where openmrs_backup.person_address.person_address_id not in (select person_address_id from openmrs.person_address);
INSERT INTO openmrs.person_attribute (person_attribute_id,person_id,value,person_attribute_type_id,date_created,date_changed,voided,date_voided,void_reason,uuid) select person_attribute_id,person_id,value,person_attribute_type_id,date_created,date_changed,voided,date_voided,void_reason,uuid from openmrs_backup.person_attribute where openmrs_backup.person_attribute.person_attribute_id not in (select person_attribute_id from openmrs.person_attribute);
INSERT INTO openmrs.person_attribute_type (person_attribute_type_id,name,description,format,foreign_key,searchable,date_created,date_changed,retired,date_retired,retire_reason,edit_privilege,sort_weight,uuid) select person_attribute_type_id,name,description,format,foreign_key,searchable,date_created,date_changed,retired,date_retired,retire_reason,edit_privilege,sort_weight,uuid from openmrs_backup.person_attribute_type where openmrs_backup.person_attribute_type.person_attribute_type_id not in (select person_attribute_type_id from openmrs.person_attribute_type);
INSERT INTO openmrs.person_name (person_name_id,preferred,person_id,prefix,given_name,middle_name,family_name_prefix,family_name,family_name2,family_name_suffix,degree,date_created,voided,date_voided,void_reason,date_changed,uuid) select person_name_id,preferred,person_id,prefix,given_name,middle_name,family_name_prefix,family_name,family_name2,family_name_suffix,degree,date_created,voided,date_voided,void_reason,date_changed,uuid from openmrs_backup.person_name where openmrs_backup.person_name.person_name_id not in (select person_name_id from openmrs.person_name);
-- INSERT INTO openmrs.person_merge_log (person_merge_log_id,winner_person_id,loser_person_id,date_created,merged_data,uuid,date_changed,voided,date_voided,void_reason) select person_merge_log_id,winner_person_id,loser_person_id,date_created,merged_data,uuid,date_changed,voided,date_voided,void_reason from openmrs_backup.person_merge_log where openmrs_backup.person_merge_log.person_merge_log_id not in (select person_merge_log_id from openmrs.person_merge_log);

INSERT INTO openmrs.users (user_id,system_id,username,password,salt,secret_question,secret_answer,date_created,date_changed,person_id,retired,date_retired,retire_reason,uuid) select user_id,system_id,username,password,salt,secret_question,secret_answer,date_created,date_changed,person_id,retired,date_retired,retire_reason,uuid from openmrs_backup.users where openmrs_backup.users.user_id not in (select user_id from openmrs.users) and person_id in (select person_id from openmrs.person);
INSERT INTO openmrs.user_role (user_id,role) select user_id,role from openmrs_backup.user_role where (openmrs_backup.user_role.user_id not in (select user_id from openmrs.user_role) and openmrs_backup.user_role.role not in (select role from openmrs.user_role)) and openmrs_backup.user_role.user_id <> 1;
INSERT INTO openmrs.user_property (user_id,property,property_value) select user_id,property,property_value from openmrs_backup.user_property where openmrs_backup.user_property.user_id not in (select user_id from openmrs.user_property);

INSERT INTO openmrs.relationship_type (relationship_type_id,a_is_to_b,b_is_to_a,preferred,weight,description,date_created,retired,date_retired,retire_reason,uuid) select relationship_type_id,a_is_to_b,b_is_to_a,preferred,weight,description,date_created,retired,date_retired,retire_reason,uuid from openmrs_backup.relationship_type where openmrs_backup.relationship_type.relationship_type_id not in (select relationship_type_id from openmrs.relationship_type);
INSERT INTO openmrs.relationship (relationship_id,person_a,relationship,person_b,date_created,voided,date_voided,void_reason,uuid) select relationship_id,person_a,relationship,person_b,date_created,voided,date_voided,void_reason,uuid from openmrs_backup.relationship where openmrs_backup.relationship.relationship_id not in (select relationship_id from openmrs.relationship);

INSERT INTO openmrs.patient (patient_id,date_created,date_changed,voided,date_voided,void_reason) select patient_id,date_created,date_changed,voided,date_voided,void_reason from openmrs_backup.patient where openmrs_backup.patient.patient_id not in (select patient_id from openmrs.patient);
INSERT INTO openmrs.patient_identifier_type (patient_identifier_type_id,name,description,format,check_digit,date_created,required,format_description,validator,retired,date_retired,retire_reason,uuid) select patient_identifier_type_id,name,description,format,check_digit,date_created,required,format_description,validator,retired,date_retired,retire_reason,uuid from openmrs_backup.patient_identifier_type where openmrs_backup.patient_identifier_type.patient_identifier_type_id not in (select patient_identifier_type_id from openmrs.patient_identifier_type);
-- INSERT INTO openmrs.location (location_id,name,description,address1,address2,city_village,state_province,postal_code,country,latitude,longitude,date_created,county_district,retired,date_retired,retire_reason,parent_location,uuid) select location_id,name,description,address1,address2,city_village,state_province,postal_code,country,latitude,longitude,date_created,county_district,retired,date_retired,retire_reason,parent_location,uuid from openmrs_backup.location where openmrs_backup.location.location_id not in (select location_id from openmrs.location);

-- Removed the transfer of locations only updating the main location with the values from the old database
UPDATE openmrs.location  AS c1, openmrs_backup.location AS c2
SET c1.location_id = c1.location_id,
c1.name= c2.name,
c1.description = c2.description,
c1.address1 = c2.address1,
c1.address2 = c2.address2,
c1.city_village = c2.city_village,
c1.state_province = c2.state_province,
c1.postal_code =c1.postal_code,
c1.country = c2.country,
c1.latitude = c2.latitude,
c1.longitude = c2.longitude ,
c1.date_created = c2.date_created,
c1.county_district = c2.county_district,
c1.retired = c2.retired,
c1.date_retired =c1.date_retired,
c1.retire_reason = c2.retire_reason
WHERE c2.location_id = 1  AND c1.location_id = 2;


INSERT INTO openmrs.patient_identifier (patient_identifier_id,patient_id,identifier,identifier_type,preferred,location_id,date_created,voided,date_voided,void_reason,uuid) select patient_identifier_id,patient_id,identifier,identifier_type,preferred,2,date_created,voided,date_voided,void_reason,uuid from openmrs_backup.patient_identifier where openmrs_backup.patient_identifier.patient_identifier_id not in (select patient_identifier_id from openmrs.patient_identifier);
INSERT INTO openmrs.patient_state (patient_state_id,patient_program_id,state,start_date,end_date,date_created,date_changed,voided,date_voided,void_reason,uuid) select patient_state_id,patient_program_id,state,start_date,end_date,date_created,date_changed,voided,date_voided,void_reason,uuid from openmrs_backup.patient_state where openmrs_backup.patient_state.patient_state_id not in (select patient_state_id from openmrs.patient_state);
INSERT INTO openmrs.program (program_id,concept_id,date_created,date_changed,retired,name,description,uuid) select program_id,concept_id,date_created,date_changed,retired,name,description,uuid from openmrs_backup.program where openmrs_backup.program.program_id not in (select program_id from openmrs.program);
INSERT INTO openmrs.patient_program (patient_program_id,patient_id,program_id,date_enrolled,date_completed,date_created,date_changed,voided,date_voided,void_reason,uuid) select patient_program_id,patient_id,program_id,date_enrolled,date_completed,date_created,date_changed,voided,date_voided,void_reason,uuid from openmrs_backup.patient_program where openmrs_backup.patient_program.patient_program_id not in (select patient_program_id from openmrs.patient_program);

INSERT INTO openmrs.program_workflow (program_workflow_id,program_id,concept_id,date_created,retired,date_changed,uuid) select program_workflow_id,program_id,concept_id,date_created,retired,date_changed,uuid from openmrs_backup.program_workflow where openmrs_backup.program_workflow.program_workflow_id not in (select program_workflow_id from openmrs.program_workflow);
INSERT INTO openmrs.program_workflow_state (program_workflow_state_id,program_workflow_id,concept_id,initial,terminal,date_created,retired,date_changed,uuid) select program_workflow_state_id,program_workflow_id,concept_id,initial,terminal,date_created,retired,date_changed,uuid from openmrs_backup.program_workflow_state where openmrs_backup.program_workflow_state.program_workflow_state_id not in (select program_workflow_state_id from openmrs.program_workflow_state);

INSERT INTO openmrs.concept_state_conversion (concept_state_conversion_id,concept_id,program_workflow_id,program_workflow_state_id,uuid) select concept_state_conversion_id,concept_id,program_workflow_id,program_workflow_state_id,uuid from openmrs_backup.concept_state_conversion where openmrs_backup.concept_state_conversion.concept_state_conversion_id not in (select concept_state_conversion_id from openmrs.concept_state_conversion);


-- INSERT INTO openmrs.location_attribute_type (location_attribute_type_id,name,description,datatype,datatype_config,preferred_handler,handler_config,min_occurs,max_occurs,date_created,date_changed,retired,date_retired,retire_reason,uuid) select location_attribute_type_id,name,description,datatype,datatype_config,preferred_handler,handler_config,min_occurs,max_occurs,date_created,date_changed,retired,date_retired,retire_reason,uuid from openmrs_backup.location_attribute_type where openmrs_backup.location_attribute_type.location_attribute_type_id not in (select location_attribute_type_id from openmrs.location_attribute_type);
-- INSERT INTO openmrs.location_attribute (location_attribute_id,location_id,attribute_type_id,value_reference,uuid,date_created,date_changed,voided,date_voided,void_reason) select location_attribute_id,location_id,attribute_type_id,value_reference,uuid,date_created,date_changed,voided,date_voided,void_reason from openmrs_backup.location_attribute where openmrs_backup.location_attribute.location_attribute_id not in (select location_attribute_id from openmrs.location_attribute);
INSERT INTO openmrs.location_tag (location_tag_id,description,date_created,retired,date_retired,retire_reason,uuid) select location_tag_id,description,date_created,retired,date_retired,retire_reason,uuid from openmrs_backup.location_tag where openmrs_backup.location_tag.location_tag_id not in (select location_tag_id from openmrs.location_tag);
INSERT INTO openmrs.location_tag_map (location_id,location_tag_id) select 2,location_tag_id from openmrs_backup.location_tag_map where( openmrs_backup.location_tag_map.location_tag_id not in (select location_tag_id from openmrs.location_tag_map) and openmrs_backup.location_tag_map.location_id not in (select location_id from openmrs.location_tag_map));


-- INSERT INTO openmrs.encounter_type (encounter_type_id,name,description,date_created,retired,date_retired,retire_reason,uuid) select encounter_type_id,name,description,date_created,retired,date_retired,retire_reason,uuid from openmrs_backup.encounter_type where openmrs_backup.encounter_type.encounter_type_id not in (select encounter_type_id from openmrs.encounter_type);
-- INSERT INTO openmrs.encounter_role (encounter_role_id,name,description,date_created,date_changed,retired,date_retired,retire_reason,uuid) select encounter_role_id,name,description,date_created,date_changed,retired,date_retired,retire_reason,uuid from openmrs_backup.encounter_role where openmrs_backup.encounter_role.encounter_role_id not in (select encounter_role_id from openmrs.encounter_role);
-- INSERT INTO openmrs.form (form_id,name,version,build,published,xslt,template,description,encounter_type,date_created,date_changed,retired,date_retired,retired_reason,uuid) select form_id,name,version,build,published,xslt,template,description,encounter_type,date_created,date_changed,retired,date_retired,retired_reason,uuid from openmrs_backup.form where openmrs_backup.form.form_id not in (select form_id from openmrs.form) AND uuid not in (select uuid from form);
-- INSERT INTO openmrs.form_resource (form_resource_id,form_id,name,value_reference,datatype,datatype_config,preferred_handler,handler_config,uuid) select form_resource_id,form_id,name,value_reference,datatype,datatype_config,preferred_handler,handler_config,uuid from openmrs_backup.form_resource where openmrs_backup.form_resource.form_resource_id not in (select form_resource_id from openmrs.form_resource);
INSERT INTO openmrs.field_type (field_type_id,name,description,is_set,date_created,uuid) select field_type_id,name,description,is_set,date_created,uuid from openmrs_backup.field_type where openmrs_backup.field_type.field_type_id not in (select field_type_id from openmrs.field_type);
INSERT INTO openmrs.field (field_id,name,description,field_type,concept_id,table_name,attribute_name,default_value,select_multiple,date_created,date_changed,retired,date_retired,retire_reason,uuid) select field_id,name,description,field_type,concept_id,table_name,attribute_name,default_value,select_multiple,date_created,date_changed,retired,date_retired,retire_reason,uuid from openmrs_backup.field where openmrs_backup.field.field_id not in (select field_id from openmrs.field);
-- INSERT INTO openmrs.form_field (form_field_id,form_id,field_id,field_number,field_part,page_number,parent_form_field,min_occurs,max_occurs,required,date_changed,date_created,sort_weight,uuid) select form_field_id,if(form_id in (27,36),12,if(form_id in (28,35),14,if(form_id in (34,37),13,form_id))),field_id,field_number,field_part,page_number,parent_form_field,min_occurs,max_occurs,required,date_changed,date_created,sort_weight,uuid from openmrs_backup.form_field where openmrs_backup.form_field.form_field_id not in (select form_field_id from openmrs.form_field) and openmrs_backup.form_field.form_field_id >= 27;
INSERT INTO openmrs.field_answer (field_id,answer_id,date_created,uuid) select field_id,answer_id,date_created,uuid from openmrs_backup.field_answer where openmrs_backup.field_answer.field_id not in (select field_id from openmrs.field_answer);
-- Replaced the encounter table with the default location_id of 2 as per aijar
INSERT INTO openmrs.encounter (encounter_id,encounter_type,patient_id,location_id,form_id,encounter_datetime,date_created,voided,date_voided,void_reason,date_changed,uuid) select encounter_id,encounter_type,patient_id,2,form_id,encounter_datetime,date_created,voided,date_voided,void_reason,date_changed,uuid from openmrs_backup.encounter where openmrs_backup.encounter.encounter_id not in (select encounter_id from openmrs.encounter) and openmrs_backup.encounter.encounter_type in (8,9,11) and openmrs_backup.encounter.form_id in (12,13,14);
-- INSERT INTO openmrs.provider (provider_id,person_id,name,identifier,date_created,date_changed,retired,date_retired,retire_reason,uuid) select provider_id,person_id,name,identifier,date_created,date_changed,retired,date_retired,retire_reason,uuid from openmrs_backup.provider where openmrs_backup.provider.provider_id not in (select provider_id from openmrs.provider);
-- INSERT INTO openmrs.provider_attribute_type (provider_attribute_type_id,name,description,datatype,datatype_config,preferred_handler,handler_config,min_occurs,max_occurs,date_created,date_changed,retired,date_retired,retire_reason,uuid) select provider_attribute_type_id,name,description,datatype,datatype_config,preferred_handler,handler_config,min_occurs,max_occurs,date_created,date_changed,retired,date_retired,retire_reason,uuid from openmrs_backup.provider_attribute_type where openmrs_backup.provider_attribute_type.provider_attribute_type_id not in (select provider_attribute_type_id from openmrs.provider_attribute_type);
-- INSERT INTO openmrs.provider_attribute (provider_attribute_id,provider_id,attribute_type_id,value_reference,uuid,date_created,date_changed,voided,date_voided,void_reason) select provider_attribute_id,provider_id,attribute_type_id,value_reference,uuid,date_created,date_changed,voided,date_voided,void_reason from openmrs_backup.provider_attribute where openmrs_backup.provider_attribute.provider_attribute_id not in (select provider_attribute_id from openmrs.provider_attribute);
-- INSERT INTO openmrs.encounter_provider (encounter_provider_id,encounter_id,provider_id,encounter_role_id,date_created,date_changed,voided,date_voided,void_reason,uuid) select encounter_provider_id,encounter_id,provider_id,encounter_role_id,date_created,date_changed,voided,date_voided,void_reason,uuid from openmrs_backup.encounter_provider where openmrs_backup.encounter_provider.encounter_provider_id not in (select encounter_provider_id from openmrs.encounter_provider);

INSERT INTO openmrs.order_type (order_type_id,name,description,date_created,retired,date_retired,retire_reason,uuid) select order_type_id,name,description,date_created,retired,date_retired,retire_reason,uuid from openmrs_backup.order_type where openmrs_backup.order_type.order_type_id not in (select order_type_id from openmrs.order_type);
-- INSERT INTO openmrs.orders (order_id,order_type_id,concept_id,orderer,encounter_id,instructions,start_date,auto_expire_date,discontinued,discontinued_date,discontinued_by,discontinued_reason,discontinued_reason_non_coded,date_created,voided,date_voided,void_reason,patient_id,accession_number,uuid,urgency) select order_id,order_type_id,concept_id,orderer,encounter_id,instructions,start_date,auto_expire_date,discontinued,discontinued_date,discontinued_by,discontinued_reason,discontinued_reason_non_coded,date_created,voided,date_voided,void_reason,patient_id,accession_number,uuid,urgency from openmrs_backup.orders where openmrs_backup.orders.order_id not in (select order_id from openmrs.orders);
-- INSERT INTO openmrs.test_order (order_id,specimen_source,laterality,clinical_history) select order_id,specimen_source,laterality,clinical_history from openmrs_backup.test_order where openmrs_backup.test_order.order_id not in (select order_id from openmrs.test_order);
-- Replaced the obs table with the default location_id of 2
INSERT INTO openmrs.obs(obs_id,person_id,concept_id,encounter_id,order_id,obs_datetime,location_id,obs_group_id,accession_number,value_group_id,value_boolean,value_coded,value_coded_name_id,value_drug,value_datetime,value_numeric,value_modifier,value_text,value_complex,comments,date_created,voided,date_voided,void_reason,uuid) select obs_id,person_id,concept_id,encounter_id,order_id,obs_datetime,2,obs_group_id,accession_number,value_group_id,value_boolean,value_coded,value_coded_name_id,value_drug,value_datetime,value_numeric,value_modifier,value_text,value_complex,comments,date_created,voided,date_voided,void_reason,uuid from openmrs_backup.obs where openmrs_backup.obs.obs_id not in (select obs_id from openmrs.obs) and obs_group_id is null order by obs_id;
INSERT INTO openmrs.obs(obs_id,person_id,concept_id,encounter_id,order_id,obs_datetime,location_id,obs_group_id,accession_number,value_group_id,value_boolean,value_coded,value_coded_name_id,value_drug,value_datetime,value_numeric,value_modifier,value_text,value_complex,comments,date_created,voided,date_voided,void_reason,uuid) select obs_id,person_id,concept_id,encounter_id,order_id,obs_datetime,2,obs_group_id,accession_number,value_group_id,value_boolean,value_coded,value_coded_name_id,value_drug,value_datetime,value_numeric,value_modifier,value_text,value_complex,comments,date_created,voided,date_voided,void_reason,uuid from openmrs_backup.obs where openmrs_backup.obs.obs_id not in (select obs_id from openmrs.obs) order by obs_id;

INSERT INTO openmrs.concept_proposal (concept_proposal_id,concept_id,encounter_id,original_text,final_text,obs_id,obs_concept_id,state,comments,date_created,date_changed,locale,uuid) select concept_proposal_id,concept_id,encounter_id,original_text,final_text,obs_id,obs_concept_id,state,comments,date_created,date_changed,locale,uuid from openmrs_backup.concept_proposal where openmrs_backup.concept_proposal.concept_proposal_id not in (select concept_proposal_id from openmrs.concept_proposal);
INSERT INTO openmrs.concept_proposal_tag_map (concept_proposal_id,concept_name_tag_id) select concept_proposal_id,concept_name_tag_id from openmrs_backup.concept_proposal_tag_map where (openmrs_backup.concept_proposal_tag_map.concept_proposal_id not in (select concept_proposal_id from openmrs.concept_proposal_tag_map) and openmrs_backup.concept_proposal_tag_map.concept_name_tag_id not in (select concept_name_tag_id from openmrs.concept_proposal_tag_map));

-- INSERT INTO openmrs.visit_attribute_type (visit_attribute_type_id,name,description,datatype,datatype_config,preferred_handler,handler_config,min_occurs,max_occurs,date_created,date_changed,retired,date_retired,retire_reason,uuid) select visit_attribute_type_id,name,description,datatype,datatype_config,preferred_handler,handler_config,min_occurs,max_occurs,date_created,date_changed,retired,date_retired,retire_reason,uuid from openmrs_backup.visit_attribute_type where openmrs_backup.visit_attribute_type.visit_attribute_type_id not in (select visit_attribute_type_id from openmrs.visit_attribute_type);
-- INSERT INTO openmrs.visit_type (visit_type_id,name,description,date_created,date_changed,retired,date_retired,retire_reason,uuid) select visit_type_id,name,description,date_created,date_changed,retired,date_retired,retire_reason,uuid from openmrs_backup.visit_type where openmrs_backup.visit_type.visit_type_id not in (select visit_type_id from openmrs.visit_type);
-- INSERT INTO openmrs.visit (visit_id,patient_id,visit_type_id,date_started,date_stopped,indication_concept_id,location_id,date_created,date_changed,voided,date_voided,void_reason,uuid) select visit_id,patient_id,visit_type_id,date_started,date_stopped,indication_concept_id,location_id,date_created,date_changed,voided,date_voided,void_reason,uuid from openmrs_backup.visit where openmrs_backup.visit.visit_id not in (select visit_id from openmrs.visit);
-- INSERT INTO openmrs.visit_attribute (visit_attribute_id,visit_id,attribute_type_id,value_reference,uuid,date_created,date_changed,voided,date_voided,void_reason) select visit_attribute_id,visit_id,attribute_type_id,value_reference,uuid,date_created,date_changed,voided,date_voided,void_reason from openmrs_backup.visit_attribute where openmrs_backup.visit_attribute.visit_attribute_id not in (select visit_attribute_id from openmrs.visit_attribute);


INSERT INTO openmrs.cohort (cohort_id,name,description,date_created,voided,date_voided,void_reason,date_changed,uuid) select cohort_id,name,description,date_created,voided,date_voided,void_reason,date_changed,uuid from openmrs_backup.cohort where openmrs_backup.cohort.cohort_id not in (select cohort_id from openmrs.cohort);
INSERT INTO openmrs.cohort_member (cohort_id,patient_id) select cohort_id,patient_id from openmrs_backup.cohort_member where (openmrs_backup.cohort_member.cohort_id not in (select cohort_id from openmrs.cohort_member) and openmrs_backup.cohort_member.patient_id not in (select patient_id from openmrs.cohort_member));


-- INSERT INTO openmrs.active_list_problem (active_list_id,status,sort_weight) select active_list_id,status,sort_weight from openmrs_backup.active_list_problem where openmrs_backup.active_list_problem.active_list_id not in (select active_list_id from openmrs.active_list_problem);
-- INSERT INTO openmrs.active_list_allergy (active_list_id,allergy_type,reaction_concept_id,severity) select active_list_id,allergy_type,reaction_concept_id,severity from openmrs_backup.active_list_allergy where openmrs_backup.active_list_allergy.active_list_id not in (select active_list_id from openmrs.active_list_allergy);
-- INSERT INTO openmrs.active_list_type (active_list_type_id,name,description,date_created,retired,date_retired,retire_reason,uuid) select active_list_type_id,name,description,date_created,retired,date_retired,retire_reason,uuid from openmrs_backup.active_list_type where openmrs_backup.active_list_type.active_list_type_id not in (select active_list_type_id from openmrs.active_list_type);
-- INSERT INTO openmrs.active_list (active_list_id,active_list_type_id,person_id,concept_id,start_obs_id,stop_obs_id,start_date,end_date,comments,date_created,voided,date_voided,void_reason,uuid) select active_list_id,active_list_type_id,person_id,concept_id,start_obs_id,stop_obs_id,start_date,end_date,comments,date_created,voided,date_voided,void_reason,uuid from openmrs_backup.active_list where openmrs_backup.active_list.active_list_id not in (select active_list_id from openmrs.active_list);

-- INSERT INTO openmrs.clob_datatype_storage (id,uuid,value) select id,uuid,value from openmrs_backup.clob_datatype_storage where openmrs_backup.clob_datatype_storage.id not in (select id from openmrs.clob_datatype_storage);

INSERT INTO openmrs.note (note_id,note_type,patient_id,obs_id,encounter_id,text,priority,parent,date_created,date_changed,uuid) select note_id,note_type,patient_id,obs_id,encounter_id,text,priority,parent,date_created,date_changed,uuid from openmrs_backup.note where openmrs_backup.note.note_id not in (select note_id from openmrs.note);

INSERT INTO openmrs.notification_alert (alert_id,text,satisfied_by_any,alert_read,date_to_expire,date_created,date_changed,uuid) select alert_id,text,satisfied_by_any,alert_read,date_to_expire,date_created,date_changed,uuid from openmrs_backup.notification_alert where openmrs_backup.notification_alert.alert_id not in (select alert_id from openmrs.notification_alert);
INSERT INTO openmrs.notification_template (template_id,name,template,subject,sender,recipients,ordinal,uuid) select template_id,name,template,subject,sender,recipients,ordinal,uuid from openmrs_backup.notification_template where openmrs_backup.notification_template.template_id not in (select template_id from openmrs.notification_template);
INSERT INTO openmrs.notification_alert_recipient (alert_id,user_id,alert_read,date_changed,uuid) select alert_id,user_id,alert_read,date_changed,uuid from openmrs_backup.notification_alert_recipient where openmrs_backup.notification_alert_recipient.alert_id not in (select alert_id from openmrs.notification_alert_recipient);

INSERT INTO openmrs.hl7_in_archive (hl7_in_archive_id,hl7_source,hl7_source_key,hl7_data,date_created,message_state,uuid) select hl7_in_archive_id,hl7_source,hl7_source_key,hl7_data,date_created,message_state,uuid from openmrs_backup.hl7_in_archive where openmrs_backup.hl7_in_archive.hl7_in_archive_id not in (select hl7_in_archive_id from openmrs.hl7_in_archive);
INSERT INTO openmrs.hl7_in_error (hl7_in_error_id,hl7_source,hl7_source_key,hl7_data,error,error_details,date_created,uuid) select hl7_in_error_id,hl7_source,hl7_source_key,hl7_data,error,error_details,date_created,uuid from openmrs_backup.hl7_in_error where openmrs_backup.hl7_in_error.hl7_in_error_id not in (select hl7_in_error_id from openmrs.hl7_in_error);
INSERT INTO openmrs.hl7_source (hl7_source_id,name,description,date_created,uuid) select hl7_source_id,name,description,date_created,uuid from openmrs_backup.hl7_source where openmrs_backup.hl7_source.hl7_source_id not in (select hl7_source_id from openmrs.hl7_source);
INSERT INTO openmrs.hl7_in_queue (hl7_in_queue_id,hl7_source,hl7_source_key,hl7_data,message_state,date_processed,error_msg,date_created,uuid) select hl7_in_queue_id,hl7_source,hl7_source_key,hl7_data,message_state,date_processed,error_msg,date_created,uuid from openmrs_backup.hl7_in_queue where openmrs_backup.hl7_in_queue.hl7_in_queue_id not in (select hl7_in_queue_id from openmrs.hl7_in_queue);

INSERT INTO openmrs.report_schema_xml (report_schema_id,name,description,xml_data,uuid) select report_schema_id,name,description,xml_data,uuid from openmrs_backup.report_schema_xml where openmrs_backup.report_schema_xml.report_schema_id not in (select report_schema_id from openmrs.report_schema_xml);
INSERT INTO openmrs.report_object (report_object_id,name,description,report_object_type,report_object_sub_type,xml_data,date_created,date_changed,voided,date_voided,void_reason,uuid) select report_object_id,name,description,report_object_type,report_object_sub_type,xml_data,date_created,date_changed,voided,date_voided,void_reason,uuid from openmrs_backup.report_object where openmrs_backup.report_object.report_object_id not in (select report_object_id from openmrs.report_object);

INSERT INTO openmrs.serialized_object (serialized_object_id,name,description,type,subtype,serialization_class,serialized_data,date_created,date_changed,retired,date_retired,retire_reason,uuid) select serialized_object_id,name,description,type,subtype,serialization_class,serialized_data,date_created,date_changed,retired,date_retired,retire_reason,uuid from openmrs_backup.serialized_object where openmrs_backup.serialized_object.serialized_object_id not in (select serialized_object_id from openmrs.serialized_object);


-- UPDATE openmrs.active_list                AS c1, openmrs_backup.active_list AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.active_list_type           AS c1, openmrs_backup.active_list_type AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.cohort                     AS c1, openmrs_backup.cohort AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.concept                    AS c1, openmrs_backup.concept AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.concept_answer             AS c1, openmrs_backup.concept_answer AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.concept_class              AS c1, openmrs_backup.concept_class AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.concept_datatype           AS c1, openmrs_backup.concept_datatype AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.concept_description        AS c1, openmrs_backup.concept_description AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.concept_map_type           AS c1, openmrs_backup.concept_map_type AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.concept_name               AS c1, openmrs_backup.concept_name AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.concept_proposal           AS c1, openmrs_backup.concept_proposal AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.concept_reference_map      AS c1, openmrs_backup.concept_reference_map AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.concept_reference_source   AS c1, openmrs_backup.concept_reference_source AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.concept_reference_term     AS c1, openmrs_backup.concept_reference_term AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.concept_reference_term_map AS c1, openmrs_backup.concept_reference_term_map AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.concept_set                AS c1, openmrs_backup.concept_set AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.drug                       AS c1, openmrs_backup.drug AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.encounter                  AS c1, openmrs_backup.encounter AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.encounter_provider         AS c1, openmrs_backup.encounter_provider AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.encounter_role             AS c1, openmrs_backup.encounter_role AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.encounter_type             AS c1, openmrs_backup.encounter_type AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.field                      AS c1, openmrs_backup.field AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.field_answer               AS c1, openmrs_backup.field_answer AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.field_type                 AS c1, openmrs_backup.field_type AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.form                       AS c1, openmrs_backup.form AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.form_field                 AS c1, openmrs_backup.form_field AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.hl7_source                 AS c1, openmrs_backup.hl7_source AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.location                   AS c1, openmrs_backup.location AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.location_attribute         AS c1, openmrs_backup.location_attribute AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.location_attribute_type    AS c1, openmrs_backup.location_attribute_type AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.location_tag               AS c1, openmrs_backup.location_tag AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.note                       AS c1, openmrs_backup.note AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.notification_alert         AS c1, openmrs_backup.notification_alert AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.obs                        AS c1, openmrs_backup.obs AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.order_type                 AS c1, openmrs_backup.order_type AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.orders                     AS c1, openmrs_backup.orders AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.patient                    AS c1, openmrs_backup.patient AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.patient_id = c1.patient_id;
UPDATE openmrs.patient_identifier         AS c1, openmrs_backup.patient_identifier AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.patient_identifier_type    AS c1, openmrs_backup.patient_identifier_type AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.patient_program            AS c1, openmrs_backup.patient_program AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.patient_state              AS c1, openmrs_backup.patient_state AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.person                     AS c1, openmrs_backup.person AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.person_address             AS c1, openmrs_backup.person_address AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.person_attribute           AS c1, openmrs_backup.person_attribute AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.person_attribute_type      AS c1, openmrs_backup.person_attribute_type AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.person_merge_log           AS c1, openmrs_backup.person_merge_log AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.person_name                AS c1, openmrs_backup.person_name AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.program                    AS c1, openmrs_backup.program AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.program_workflow           AS c1, openmrs_backup.program_workflow AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.program_workflow_state     AS c1, openmrs_backup.program_workflow_state AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.provider                   AS c1, openmrs_backup.provider AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.provider_attribute         AS c1, openmrs_backup.provider_attribute AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.provider_attribute_type    AS c1, openmrs_backup.provider_attribute_type AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.relationship               AS c1, openmrs_backup.relationship AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.relationship_type          AS c1, openmrs_backup.relationship_type AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.report_object              AS c1, openmrs_backup.report_object AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
UPDATE openmrs.serialized_object          AS c1, openmrs_backup.serialized_object AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.users                      AS c1, openmrs_backup.users AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.visit                      AS c1, openmrs_backup.visit AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.visit_attribute            AS c1, openmrs_backup.visit_attribute AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.visit_attribute_type       AS c1, openmrs_backup.visit_attribute_type AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;
-- UPDATE openmrs.visit_type                 AS c1, openmrs_backup.visit_type AS c2 SET c1.creator = if((select user_id from openmrs_backup.users where user_id = c2.creator),c2.creator,1) WHERE c2.uuid = c1.uuid;


-- add Provider role to all users with Data Entry and Data Manager Role
INSERT INTO provider (person_id, creator, date_created, uuid)
  SELECT
    person_id,
    2,
    NOW(),
    UUID()
  FROM users u
  WHERE user_id NOT IN (SELECT user_id
                        FROM user_role
                        WHERE role = 'Provider') AND
        u.user_id IN (SELECT user_id
                      FROM user_role
                      WHERE (role = 'Data Manager' OR role = 'Data Entry'));

INSERT INTO user_role (user_id, role)
  SELECT
    user_id,
    'Provider'
  FROM users u
  WHERE user_id NOT IN (SELECT user_id
                        FROM user_role
                        WHERE role = 'Provider') AND
        u.user_id IN (SELECT user_id
                      FROM user_role
                      WHERE (role = 'Data Manager' OR role = 'Data Entry'))
