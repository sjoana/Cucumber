INSERT INTO fscontact.campaigns ("domain", active, deleted, "name", description, callback_default, callback_self_LIMIT, callback_anyone_LIMIT, dialer_type, dialer_timeout, dialer_ddi, dialer_max_drop, allow_dtmf, allow_manual_dial, allow_user_search, allow_call_transfer, call_recording, automatic_call_distribution, script_id, id, total_sms, sent_sms, dialer_gateway, domain_name, dial_prefix, allow_agent_hangup, dialer_ratio, dialer_lead_order, dial_first, dial_second, dial_third, use_external_script, external_script_path, max_wrap_up_time, max_wrap_up_time_seconds, onhold_music_files, play_onhold, dialer_lead_order_field, dialer_max_drop_active, blacklist_ids, blacklist_fields, allow_callback_self, allow_redial, average_talk_time_warning, hold_time_warning, private_number, recording_leg, record_full_call, voicemail_detection, uuid, dialer_database_priority, dial_first_active, dial_second_active, dial_third_active, abANDon_rate_time, error_correction_coefficient, stats_collection_preference, stats_collection_interval, default_tab, dialer_NOT_in, dialer_AND_or, dialer_lead_order_field_type, preview_dial_timeout, automatic_callback_delivery, dialer_ddis_uuid, sounds, recording_name, global_max_tries, callbacks_other_agents, min_wrap_up_time, min_wrap_up_time_seconds, sysuser, sysdate, allow_inactive_search)
VALUES('99992222-3333-4444-5555-666677778888', true, false, 'ATCampaign001', NULL, 'anyone', 0, 300, 'manual', 30, 'private', 0, true, true, true, true, 'never', 'wait', NULL, 2, 0, 0, NULL, (SELECT domain_name FROM public.v_domains WHERE domain_uuid='99992222-3333-4444-5555-666677778888' LIMIT 1), '', true, 1, 'desc', 'callback', 'recycle', 'new', false, '', false, 30, NULL, NULL, 'load_date', false, '', '', 1, 1, 0, 0, false, 'customer', false, true, uuid_generate_v4(), false, true, true, true, 'daily', 3, 'mixed', 30, 'script', 'in', 'AND', 'text', 0, true, (SELECT jsonb_build_array(domain_did_uuid) FROM public.v_gateway_dids WHERE domain_uuid='99992222-3333-4444-5555-666677778888' LIMIT 1), '{"newCall": "/opt/freeswitch/sounds//general/new-call.wav", "holdMusic": "/opt/freeswitch/sounds//music/8000/suite-espanola-op-47-leyenda.wav", "hangupCall": "/opt/freeswitch/sounds//general/hang-up.wav"}', '§timestamp§_§ownerType§_§ownerId§_§username§_§recordingType§', 0, true, false, 30, (SELECT id FROM fscontact.users WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1), NOW(), false);

INSERT INTO fscontact.inbound_groups ("name",max_queue_time,max_queue_time_action,max_queue_time_action_target,after_hours_action,after_hours_action_target,after_hours_message_file,play_welcome_message,welcome_message_files,play_place_in_line,play_wait_time,acd,call_recording,deleted,"domain",active,priority,max_queue_time_message_files,no_agents_action,no_agents_action_target,no_agents_message_files,onhold_music_files,play_onhold,allow_agent_hangup,use_external_script,external_script_path,max_wrap_up_time,max_wrap_up_time_seconds,queue_language,ignore_no_logged_agents,average_talk_time_warning,hold_time_warning,recording_leg,record_full_call,uuid,default_tab,sounds,recording_name,min_callback_queue_agents,callbacks_other_agents,min_wrap_up_time,min_wrap_up_time_seconds,inbound_ddi_on_outbound_queue) VALUES
('ATInbound001',30,'hangup',NULL,'hangup',NULL,'',false,'',false,false,NULL,'never',false,'99992222-3333-4444-5555-666677778888',true,5,'','hangup',NULL,'',NULL,NULL,true,false,'',false,30,'pt',false,0,0,'customer',false,uuid_generate_v4(),'script','{"digits": "/opt/freeswitch/sounds//pt/pt/silvia/digits/8000", "inLine": "/opt/freeswitch/sounds//pt/pt/silvia/ivr/8000/ivr-in_line.wav", "minute": "/opt/freeswitch/sounds//pt/pt/silvia/time/8000/minute.wav", "minutes": "/opt/freeswitch/sounds//pt/pt/silvia/time/8000/minutes.wav", "newCall": "/opt/freeswitch/sounds//general/new-call.wav", "holdMusic": "/opt/freeswitch/sounds//music/8000/suite-espanola-op-47-leyenda.wav", "hangupCall": "/opt/freeswitch/sounds//general/hang-up.wav", "ifNOTPress": "/opt/freeswitch/sounds//pt/pt/silvia/ivr/8000/ivr-if_NOT_press.wav", "youEntered": "/opt/freeswitch/sounds//pt/pt/silvia/ivr/8000/ivr-you_entered.wav", "yourAreThe": "/opt/freeswitch/sounds//pt/pt/silvia/ivr/8000/ivr-you_are_the.wav", "ifCorrectPress": "/opt/freeswitch/sounds//pt/pt/silvia/ivr/8000/ivr-if_correct_press.wav", "estimatedHoldTime": "/opt/freeswitch/sounds//pt/pt/silvia/ivr/8000/ivr-estimated_hold_time.wav", "thankYouForCalling": "/opt/freeswitch/sounds//pt/pt/silvia/ivr/8000/ivr-thank_you_for_calling.wav", "youAreTheNumberOne": "/opt/freeswitch/sounds//pt/pt/silvia/ivr/8000/ivr-you_are_number_one.wav", "beginVoiceMailRecording": "/opt/freeswitch/sounds//pt/pt/silvia/custom/8000/begin_recording.wav", "voiceMailRecordingSignal": "/opt/freeswitch/sounds//general/new-call.wav"}','§timestamp§_§ownerType§_§ownerId§_§username§_§recordingType§',3,true,false,30,false);

--- 2 dbs in e out ---
INSERT INTO fscontact.databases ("domain",active,deleted,"name",manual_call_db,owner_id,owner_type,created_at,updated_at,dialer_priority,owner_uuid,sysuser,sysdate,uuid,ddi,private_number,ddis_uuid,global_max_tries,affect_outcome) VALUES
('99992222-3333-4444-5555-666677778888',true,false,'ATDatabaseOut001',true,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'campaign',NULL,NOW(),3,NULL,-1,NOW(),uuid_generate_v4(),NULL,NULL,'[]',0,true)
,('99992222-3333-4444-5555-666677778888',true,false,'ATDatabaseIn001',true,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'queue',NULL,NOW(),3,NULL,-1,NOW(),uuid_generate_v4(),NULL,NULL,'[]',0,true);

INSERT INTO fscontact.allowed_users ("domain",owner_id,priority,user_id,owner_type) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),0,(SELECT id FROM fscontact.users WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'campaign')
,('99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),50,(SELECT id FROM fscontact.users WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'queue');

--- DB Out ---
INSERT INTO fscontact.outcomes ("domain",active,deleted,owner_id,"name",callback,human_answer,success,black_list,positive,negative,finished_contact,group_name,owner_type,validate) VALUES
('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Closed Contact',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Submitted by Portable Agent',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'API Callback',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Answered IVR',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Invalid Number',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Protocol Failure',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Network Failure',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Incomplete Logging',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Blacklisted',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Auto Wrap Up',false,false,false,false,false,false,false,'System','campaign',false);

INSERT INTO fscontact.outcomes ("domain",active,deleted,owner_id,"name",callback,human_answer,success,black_list,positive,negative,finished_contact,group_name,owner_type,validate) VALUES
('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Fax',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'NOT Assigned',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Voicemail',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Disconnected',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Drop',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'No Answer',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Cancel',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Busy',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Program Error',false,false,false,false,false,false,false,'System','campaign',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Merged Contact',false,false,false,false,false,false,false,'System','campaign',false);

INSERT INTO fscontact.outcomes ("domain",active,deleted,owner_id,"name",callback,human_answer,success,black_list,positive,negative,finished_contact,group_name,owner_type,validate) VALUES
('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'ATOutcome001',false,true,false,false,false,false,false,'Call Again Later','campaign',false);

--- DB IN ---
INSERT INTO fscontact.outcomes ("domain",active,deleted,owner_id,"name",callback,human_answer,success,black_list,positive,negative,finished_contact,group_name,owner_type,validate) VALUES
('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Closed Contact',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Submitted by Portable Agent',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'API Callback',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Answered IVR',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Invalid Number',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Protocol Failure',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Network Failure',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Incomplete Logging',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Blacklisted',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Auto Wrap Up',false,false,false,false,false,false,false,'System','queue',false);

INSERT INTO fscontact.outcomes ("domain",active,deleted,owner_id,"name",callback,human_answer,success,black_list,positive,negative,finished_contact,group_name,owner_type,validate) VALUES
('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Fax',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'NOT Assigned',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Voicemail',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Disconnected',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Drop',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'No Answer',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Cancel',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Busy',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Program Error',false,false,false,false,false,false,false,'System','queue',false)
,('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'Merged Contact',false,false,false,false,false,false,false,'System','queue',false);

INSERT INTO fscontact.outcomes ("domain",active,deleted,owner_id,"name",callback,human_answer,success,black_list,positive,negative,finished_contact,group_name,owner_type,validate) VALUES
('99992222-3333-4444-5555-666677778888',true,false,(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'ATOutcome001',false,true,false,false,false,false,false,'Call Again Later','queue',false);

--- Out ---
INSERT INTO fscontact.system_schedules (dayofweek,start_time,end_time,"domain",owner_type,owner_id,active) VALUES
(0,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','campaign',(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),false)
,(1,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','campaign',(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),true)
,(2,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','campaign',(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),true)
,(3,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','campaign',(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),true)
,(4,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','campaign',(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),true)
,(5,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','campaign',(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),true)
,(6,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','campaign',(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),false);

--- In ---
INSERT INTO fscontact.system_schedules (dayofweek,start_time,end_time,"domain",owner_type,owner_id,active) VALUES
(0,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','queue',(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),false)
,(1,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','queue',(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),true)
,(2,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','queue',(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),true)
,(3,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','queue',(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),true)
,(4,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','queue',(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),true)
,(5,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','queue',(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),true)
,(6,'09:00:00','19:00:00','99992222-3333-4444-5555-666677778888','queue',(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),false);

INSERT INTO fscontact.database_owners ("domain", owner_type, owner_id, owner_uuid, database_id)
VALUES('99992222-3333-4444-5555-666677778888', 'queue', (SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1), NULL, (SELECT id FROM fscontact.databases WHERE domain='99992222-3333-4444-5555-666677778888' AND owner_id = (SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1) LIMIT 1));

INSERT INTO fscontact.database_owners ("domain", owner_type, owner_id, owner_uuid, database_id)
VALUES('99992222-3333-4444-5555-666677778888', 'campaign', (SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1), NULL, (SELECT id FROM fscontact.databases WHERE domain='99992222-3333-4444-5555-666677778888' AND owner_id = (SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1) LIMIT 1));

INSERT INTO fscontact.contact_fields_templates (uuid,"domain",template_name,template_fields,max_index,creation_date,deleted,sysuser,sysdate) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','ATContactFieldsTemplate002','{"city": {"field_label": "City", "field_order": 13, "system_field": true, "field_visible": true, "field_editable": true}, "email": {"field_label": "Email", "field_order": 10, "system_field": true, "field_visible": true, "field_editable": true}, "address": {"field_label": "Address", "field_order": 12, "system_field": true, "field_visible": true, "field_editable": true}, "contact": {"field_label": "Contact Name", "field_order": 1, "system_field": true, "field_visible": true, "field_editable": true}, "country": {"field_label": "Country", "field_order": 14, "system_field": true, "field_visible": true, "field_editable": true}, "fifth_phone": {"field_label": "5th phone", "field_order": 6, "system_field": true, "field_visible": true, "field_editable": true}, "first_phone": {"field_label": "1st phone", "field_order": 2, "system_field": true, "field_visible": true, "field_editable": true}, "postal_code": {"field_label": "Postal Code", "field_order": 11, "system_field": true, "field_visible": true, "field_editable": true}, "sixth_phone": {"field_label": "6th phone", "field_order": 7, "system_field": true, "field_visible": true, "field_editable": true}, "third_phone": {"field_label": "3rd phone", "field_order": 4, "system_field": true, "field_visible": true, "field_editable": true}, "eighth_phone": {"field_label": "8th phone", "field_order": 9, "system_field": true, "field_visible": true, "field_editable": true}, "fourth_phone": {"field_label": "4th phone", "field_order": 5, "system_field": true, "field_visible": true, "field_editable": true}, "second_phone": {"field_label": "2nd phone", "field_order": 3, "system_field": true, "field_visible": true, "field_editable": true}, "seventh_phone": {"field_label": "7th phone", "field_order": 8, "system_field": true, "field_visible": true, "field_editable": true}}',0,NOW(),false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fscontact.contact_fields_owners (uuid,"domain",template_uuid,owner_uuid,owner_type,sysuser,sysdate) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888',(SELECT uuid FROM fscontact.contact_fields_templates WHERE domain='99992222-3333-4444-5555-666677778888' AND template_name = 'ATContactFieldsTemplate002' LIMIT 1),(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'queue',(SELECT id FROM fscontact.users WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fscontact.contact_fields_owners (uuid,"domain",template_uuid,owner_uuid,owner_type,sysuser,sysdate) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888',(SELECT uuid FROM fscontact.contact_fields_templates WHERE domain='99992222-3333-4444-5555-666677778888' AND template_name = 'ATContactFieldsTemplate002' LIMIT 1),(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'campaign',(SELECT id FROM fscontact.users WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fscontact.ivr_menus ("name",uuid,"extension","domain",submenus) VALUES
('ATIVR001',uuid_generate_v4() ,'12345','99992222-3333-4444-5555-666677778888','');

INSERT INTO fstickets.sla_templates (uuid,"name",objective,threshold,comments,deleted,created_at,updated_at,"domain",sla_minutes,user_id,sysuser,sysdate) VALUES
(uuid_generate_v4(),'ATSLATemplate001',90,30,'',false,NOW(),NOW(),'99992222-3333-4444-5555-666677778888',0,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fstickets.sla_weekly_schedule (sla_uuid,schedule,user_id,uuid,sysuser,sysdate,"domain") VALUES
((SELECT uuid FROM fstickets.sla_templates WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),'{"monday":{"time":["0","24"],"hours":"24"},"tuesday":{"time":["0","24"],"hours":"24"},"wednesday":{"time":["0","24"],"hours":"24"},"thursday":{"time":["0","24"],"hours":"24"},"friday":{"time":["0","24"],"hours":"24"},"saturday":{"time":["12","12"],"hours":"0"},"sunday":{"time":["12","12"],"hours":"0"}}',(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),uuid_generate_v4(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),'99992222-3333-4444-5555-666677778888');

INSERT INTO fscontact.ivr_campaigns ("domain", active, deleted, "name", ivr_uuid, ivr_extension, call_delay, dids, max_call_age, call_percentage, schedule_uuid, concurrent_calls, dialer_gateway, filters, dial_prefix, ddis_uuid, advance_filter, max_call_age_recycle, tts_config)
VALUES('99992222-3333-4444-5555-666677778888', false, false, 'ATIVRCampaign001', (SELECT uuid FROM fscontact.ivr_menus WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1), 10000, 1, NULL, 43800, 100, (SELECT sla_uuid FROM fstickets.sla_weekly_schedule WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1), 5, NULL, '', '', (SELECT json_build_array(domain_did_uuid) FROM public.v_gateway_dids WHERE domain_uuid='99992222-3333-4444-5555-666677778888' LIMIT 1), '', 43800, '{}');

INSERT INTO fscontact.ivr_campaigns_options (ivr_campaign_id, ivr_uuid, option_uuid, "extension", digit, score, callback, callback_owner_id, callback_owner_type, ticket, success, transfer_to_queue, queue, "domain")
VALUES((SELECT id FROM fscontact.ivr_campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1), (SELECT uuid FROM fscontact.ivr_menus WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1), uuid_generate_v4(), 10000, 0, 0, true, (SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1), 'campaign', false, false, false, (SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1), '99992222-3333-4444-5555-666677778888');

INSERT INTO fscontact.ivr_campaigns_outcomes (ivr_campaign_id, owner_id, owner_type, outcome_id, "domain")
VALUES((SELECT id FROM fscontact.ivr_campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1), (SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1), 'campaign', 0, '99992222-3333-4444-5555-666677778888');

--- script com 3 elementos: legend, text input e one response ---
INSERT INTO fscontact.script_dinamico_master ("name","domain",group_id,form_type,start_date,end_date,deleted,save_hidden_fields) VALUES
('ATScript001','99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'normal',NULL,NULL,false,true)
,('ATScriptQuality001','99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'quality',NULL,NULL,false,true)
,('ATScriptElearning001','99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'elearning',NOW(),NOW(),false,true);

INSERT INTO fscontact.script_assoc (id_script,"domain",owner_id,owner_type,database_id) VALUES
((SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'normal' LIMIT 1),'99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'queue',NULL)
,((SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'normal' LIMIT 1),'99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'campaign',NULL)
,((SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'quality' LIMIT 1),'99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'queue',NULL)
,((SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'quality' LIMIT 1),'99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'campaign',NULL)
,((SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'elearning' LIMIT 1),'99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'queue',NULL)
,((SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'elearning' LIMIT 1),'99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'campaign',NULL);

INSERT INTO fscontact.script_dinamico_pages (id_script,"name",pos,"domain","type") VALUES
((SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'normal' LIMIT 1),'1',1,'99992222-3333-4444-5555-666677778888',NULL)
,((SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'quality' LIMIT 1),'1',1,'99992222-3333-4444-5555-666677778888',NULL)
,((SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'elearning' LIMIT 1),'1',1,'99992222-3333-4444-5555-666677778888',NULL);

INSERT INTO fscontact.script_dinamico (tag,id_script,id_page,"type",ordem,dispo,texto,placeholder,max_length,values_text,default_value,required,hidden,param1,"domain",validation,others_settings,min_length,math_formula,element_settings) VALUES
(0,(SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'quality' LIMIT 1),(SELECT id FROM fscontact.script_dinamico_pages WHERE domain='99992222-3333-4444-5555-666677778888' AND id_script = (SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'quality' LIMIT 1) LIMIT 1),'textarea',0,'h','Question here?','"0"',0,'"0"','0',false,false,'1','99992222-3333-4444-5555-666677778888',NULL,NULL,0,NULL,NULL)
,(1,(SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'quality' LIMIT 1),(SELECT id FROM fscontact.script_dinamico_pages WHERE domain='99992222-3333-4444-5555-666677778888' AND id_script = (SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'quality' LIMIT 1) LIMIT 1),'checkbox',1,'h','Water with?','"0"',0,'["bubble","sugar"]','0',false,false,'0','99992222-3333-4444-5555-666677778888',NULL,NULL,0,NULL,NULL)
,(0,(SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'elearning' LIMIT 1),(SELECT id FROM fscontact.script_dinamico_pages WHERE domain='99992222-3333-4444-5555-666677778888' AND id_script = (SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'elearning' LIMIT 1) LIMIT 1),'texto',0,'h','Label here.','""',100,'"0"','0',false,false,'none','99992222-3333-4444-5555-666677778888',NULL,NULL,0,NULL,NULL)
,(0,(SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'normal' LIMIT 1),(SELECT id FROM fscontact.script_dinamico_pages WHERE domain='99992222-3333-4444-5555-666677778888' AND id_script = (SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'normal' LIMIT 1) LIMIT 1),'legend',0,'h','legend','"0"',0,'"I''m a Legend!"','0',false,false,'0','99992222-3333-4444-5555-666677778888',NULL,NULL,0,NULL,NULL)
,(1,(SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'normal' LIMIT 1),(SELECT id FROM fscontact.script_dinamico_pages WHERE domain='99992222-3333-4444-5555-666677778888' AND id_script = (SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'normal' LIMIT 1) LIMIT 1),'texto',1,'h','Label here.','""',100,'"0"','0',false,false,'none','99992222-3333-4444-5555-666677778888',NULL,NULL,0,NULL,NULL)
,(2,(SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'normal' LIMIT 1),(SELECT id FROM fscontact.script_dinamico_pages WHERE domain='99992222-3333-4444-5555-666677778888' AND id_script = (SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'normal' LIMIT 1) LIMIT 1),'radio',2,'h','Are you ok?','"0"',0,'["Yes","Kinda","No"]','0',false,false,'0','99992222-3333-4444-5555-666677778888',NULL,NULL,0,NULL,NULL);

INSERT INTO fscontact.script_agents_assoc (id_script,"domain",agent_id,agent_type) VALUES
((SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'elearning' LIMIT 1),'99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.users WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'agent')
,((SELECT id FROM fscontact.script_dinamico_master WHERE domain='99992222-3333-4444-5555-666677778888' AND form_type = 'elearning' LIMIT 1),'99992222-3333-4444-5555-666677778888',(SELECT id FROM fscontact.groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'group');

--- template para report de queues ---
INSERT INTO fscontact.report_sheet_order (elements,template_name,owner_id,"domain",owner_type) VALUES
('[{"editedText":"Contact ID","id":"id","originalText":"Contact ID","type":"database","attr":[]},{"editedText":"Contact Name","id":"contact","originalText":"Contact Name","type":"database","attr":[]},{"editedText":"First phone number","id":"first_phone","originalText":"First phone number","type":"database","attr":[]},{"editedText":"Agent ID","id":"user_id","originalText":"Agent ID","type":"system","attr":[]},{"editedText":"Agent User Name","id":"user_name","originalText":"Agent User Name","type":"system","attr":[]},{"editedText":"Call Type","id":"call_type","originalText":"Call Type","type":"system","attr":[]},{"editedText":"Call uuid","id":"uuid","originalText":"Call uuid","type":"system","attr":[]},{"editedText":"Contact ID","id":"contact_id","originalText":"Contact ID","type":"system","attr":[]},{"editedText":"Phone","id":"contact_phone","originalText":"Phone","type":"system","attr":[]},{"editedText":"Database id","id":"database_id","originalText":"Database id","type":"system","attr":[]},{"editedText":"Owner ID","id":"owner_id","originalText":"Owner ID","type":"system","attr":[]},{"editedText":"Owner Type","id":"owner_type","originalText":"Owner Type","type":"system","attr":[]},{"editedText":"Queue Name","id":"owner_name","originalText":"Queue Name","type":"system","attr":[]},{"editedText":"Script ID","id":"id_script","originalText":"Script ID","type":"system","attr":[]},{"editedText":"Term Reason","id":"term_reason","originalText":"Term Reason","type":"system","attr":[]}]','ATTemplateReport001                ',(SELECT array_to_json(array_agg(id::integer)::text[]) AS id FROM fscontact.inbound_groups WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'99992222-3333-4444-5555-666677778888','queue');

INSERT INTO fscontact.report_sheet_order (elements,template_name,owner_id,"domain",owner_type) VALUES
('[{"editedText":"Contact ID","id":"id","originalText":"Contact ID","type":"database","attr":[]},{"editedText":"Contact Name","id":"contact","originalText":"Contact Name","type":"database","attr":[]},{"editedText":"First phone number","id":"first_phone","originalText":"First phone number","type":"database","attr":[]},{"editedText":"Agent ID","id":"user_id","originalText":"Agent ID","type":"system","attr":[]},{"editedText":"Agent User Name","id":"user_name","originalText":"Agent User Name","type":"system","attr":[]},{"editedText":"Call Type","id":"call_type","originalText":"Call Type","type":"system","attr":[]},{"editedText":"Call uuid","id":"uuid","originalText":"Call uuid","type":"system","attr":[]},{"editedText":"Contact ID","id":"contact_id","originalText":"Contact ID","type":"system","attr":[]},{"editedText":"Phone","id":"contact_phone","originalText":"Phone","type":"system","attr":[]},{"editedText":"Database id","id":"database_id","originalText":"Database id","type":"system","attr":[]},{"editedText":"Owner ID","id":"owner_id","originalText":"Owner ID","type":"system","attr":[]},{"editedText":"Owner Type","id":"owner_type","originalText":"Owner Type","type":"system","attr":[]},{"editedText":"Queue Name","id":"owner_name","originalText":"Queue Name","type":"system","attr":[]},{"editedText":"Script ID","id":"id_script","originalText":"Script ID","type":"system","attr":[]},{"editedText":"Term Reason","id":"term_reason","originalText":"Term Reason","type":"system","attr":[]}]','ATTemplateReport002                ',(SELECT array_to_json(array_agg(id::integer)::text[]) AS id FROM fscontact.campaigns WHERE domain='99992222-3333-4444-5555-666677778888' LIMIT 1),'99992222-3333-4444-5555-666677778888','campaign');

INSERT INTO fscontact.group_breaks (active,deleted,"name",max_time,start_time,end_time,billable,group_id,"domain",agent_permission,comments,sysuser,sysdate) VALUES
(true,false,'ATBreak001',60,'09:00:00','17:00:00',false,(SELECT id FROM fscontact."groups" WHERE "domain" = '99992222-3333-4444-5555-666677778888' LIMIT 1),'99992222-3333-4444-5555-666677778888',false,false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fstickets.mailbox (uuid,"domain","name","type",protocol,server,port,username,password,ssl,enable,queue_uuid,mailbox_uuid,email,deleted,sysuser,sysdate) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','ATMailboxOut001','OUTBOUND','SMTP','smtp.gmail.com',587,'qa.gocontact@gmail.com','n0telecom',true,true,NULL,NULL,NULL,false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW())
,(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','ATMailboxIn001','INBOUND','IMAP','imap.gmail.com',993,'qa.gocontact@gmail.com','n0telecom',true,true,NULL,NULL,'qa.gocontact@gmail.com',false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fstickets.queue (uuid,"domain","name",sla_uuid,enable,reply_wait_status,reply_close_status,forward_wait_status,forward_close_status,closed_ticket_reentry_action_old,deleted,sender_name,sender_email,reply_to,signature,reply_status,forward_status,reply_to_post_fb_status,reply_to_message_fb_status,ticket_default_open_tab,ticket_actions,check_duplicated,close_tickets_without_tpl,use_external_script,external_script_path,sysuser,sysdate) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','ATTicketQueue001',(SELECT uuid FROM fstickets.sla_templates WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),true,true,true,true,true,'set_state_new',false,'Automated Tests','qa.gocontact@gmail.com','qa.gocontact@gmail.com','',true,true,true,true,'ticket-info-history','{"action_type":"create_new_ticket","search_type":"search_in_queue","search_all_queue":"ticket_move","reuse_ticket_data":false}',true,true,false,'',(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fstickets.queue_autoreply_configuration (uuid,queue_uuid,template_uuid,exception_text,exception_filter,exception_active,sysuser,sysdate,"domain",trigger_on_create_ticket,send_episode_body) VALUES
(uuid_generate_v4(),(SELECT uuid FROM fstickets.queue WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT uuid FROM fstickets.template WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),'','',false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),'99992222-3333-4444-5555-666677778888',true,false);

INSERT INTO fstickets.queue_forwardreply_configuration (uuid,queue_uuid,template_uuid,exception_text,exception_filter,exception_active,sysuser,sysdate,"domain") VALUES
(uuid_generate_v4(),(SELECT uuid FROM fstickets.queue WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT uuid FROM fstickets.template WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),'','',false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),'99992222-3333-4444-5555-666677778888');

INSERT INTO fstickets.queue_mailbox (uuid,queue_uuid,mailbox_uuid,"type","domain",outbound_default,sysuser,sysdate) VALUES
(uuid_generate_v4(),(SELECT uuid FROM fstickets.queue WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT uuid FROM fstickets.mailbox WHERE domain = '99992222-3333-4444-5555-666677778888' AND type = 'INBOUND' LIMIT 1),'INBOUND','99992222-3333-4444-5555-666677778888',false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW())
,(uuid_generate_v4(),(SELECT uuid FROM fstickets.queue WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT uuid FROM fstickets.mailbox WHERE domain = '99992222-3333-4444-5555-666677778888' AND type = 'OUTBOUND' LIMIT 1),'OUTBOUND','99992222-3333-4444-5555-666677778888',true,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOw());

INSERT INTO fstickets.subject (id,parent,"domain",label,force_description,is_container,"load",allow_discard,"show",sla_uuid,deleted,old_uuid,old_queue_uuid,subject_uuid,reply_review,sysuser,sysdate) VALUES
(uuid_generate_v4(),NULL,'99992222-3333-4444-5555-666677778888','ATSubjectTree001',false,false,0,false,true,NULL,false,NULL,NULL,NULL,false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fstickets.subject (id,parent,"domain",label,force_description,is_container,"load",allow_discard,"show",sla_uuid,deleted,old_uuid,old_queue_uuid,subject_uuid,reply_review,sysuser,sysdate) VALUES
(uuid_generate_v4(),(SELECT id FROM fstickets.subject WHERE domain = '99992222-3333-4444-5555-666677778888' AND load = 0 LIMIT 1),'99992222-3333-4444-5555-666677778888','ATSubjectParent001',false,false,1,false,true,NULL,false,NULL,NULL,NULL,false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fstickets.subject (id,parent,"domain",label,force_description,is_container,"load",allow_discard,"show",sla_uuid,deleted,old_uuid,old_queue_uuid,subject_uuid,reply_review,sysuser,sysdate) VALUES
(uuid_generate_v4(),(SELECT id FROM fstickets.subject WHERE domain = '99992222-3333-4444-5555-666677778888' AND load = 1 LIMIT 1),'99992222-3333-4444-5555-666677778888','ATSubjectChild001',true,false,2,false,true,NULL,false,NULL,NULL,NULL,false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fstickets.template (uuid,"domain","name",body,deleted,sysuser,sysdate) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','ATTicketsTemplate001','<p>Bom dia Sr(a) {{ client.name }},</p><p><br></p><p>está a falar com&nbsp;{{ agent.name }}</p>',false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fstickets.subject_contact (uuid,"domain",subject_uuid,cc_contact,to_contact,deleted,sysuser,sysdate) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888',(SELECT id FROM fstickets.subject WHERE domain = '99992222-3333-4444-5555-666677778888' AND load = 1 LIMIT 1),'{}','{}',false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fstickets.subject_template (uuid,"domain",subject_uuid,template_uuid,deleted,sysuser,sysdate) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888',(SELECT id FROM fstickets.subject WHERE domain = '99992222-3333-4444-5555-666677778888' AND load = 1 LIMIT 1),(SELECT uuid FROM fstickets.template WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),true,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fstickets.tag (uuid,"domain","name",deleted,sysuser,sysdate) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','ATTicketsTag001',false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fstickets.queue_subject (uuid,queue_uuid,subject_uuid,"type",sysuser,sysdate,"domain") VALUES
(uuid_generate_v4(),(SELECT uuid FROM fstickets.queue WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT id FROM fstickets.subject WHERE domain = '99992222-3333-4444-5555-666677778888' AND load = 0 LIMIT 1),0,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),'99992222-3333-4444-5555-666677778888')
,(uuid_generate_v4(),(SELECT uuid FROM fstickets.queue WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT id FROM fstickets.subject WHERE domain = '99992222-3333-4444-5555-666677778888' AND load = 0 LIMIT 1),1,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),'99992222-3333-4444-5555-666677778888');

INSERT INTO fstickets.queue_tag (uuid,queue_uuid,tag_uuid,sysuser,sysdate,"domain") VALUES
(uuid_generate_v4(),(SELECT uuid FROM fstickets.queue WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT uuid FROM fstickets.tag WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),'99992222-3333-4444-5555-666677778888');

INSERT INTO fstickets.queue_user (uuid,queue_uuid,user_id,"role",reply_review,sysuser,sysdate,"domain") VALUES
(uuid_generate_v4(),(SELECT uuid FROM fstickets.queue WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NULL,false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),'99992222-3333-4444-5555-666677778888');

INSERT INTO fstickets.sla_automatic_delivery (sla_uuid,schedule,user_id,uuid,sysuser,sysdate,"domain") VALUES
((SELECT uuid FROM fstickets.sla_templates WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),'{"monday":{"time":["0","24"],"hours":"24"},"tuesday":{"time":["0","24"],"hours":"24"},"wednesday":{"time":["0","24"],"hours":"24"},"thursday":{"time":["0","24"],"hours":"24"},"friday":{"time":["0","24"],"hours":"24"},"saturday":{"time":["0","24"],"hours":"24"},"sunday":{"time":["0","24"],"hours":"24"}}',(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),uuid_generate_v4(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),'99992222-3333-4444-5555-666677778888');

INSERT INTO fstickets.sla_exceptions (uuid,"date",recurrent,sla_uuid,schedule,user_id,sysuser,sysdate,"domain") VALUES
(uuid_generate_v4(),'2020-06-10',true,(SELECT uuid FROM fstickets.sla_templates WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),'{"time":["0","24"],"hours":24}',(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),'99992222-3333-4444-5555-666677778888');


INSERT INTO fswebchat.mailbox (uuid,"domain","name",server,port,ssl,username,password,sender,address,reply_to,sysdate,sysuser) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','ATWebchatMailbox001','smtp.gmail.com',993,true,'qa.gocontact@gmail.com','n0telecom','AutomatedTests','qa.gocontact@gmail.com','qa.gocontact@gmail.com',NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1));

INSERT INTO fswebchat.subject (id,parent,"domain",label,force_description,"load",deleted,sysuser,sysdate) VALUES
(uuid_generate_v4(),NULL,'99992222-3333-4444-5555-666677778888','ATWebchatParent001',false,0,false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fswebchat.subject (id,parent,"domain",label,force_description,"load",deleted,sysuser,sysdate) VALUES
(uuid_generate_v4(),(SELECT id FROM fswebchat.subject WHERE domain = '99992222-3333-4444-5555-666677778888' AND load = 0 LIMIT 1),'99992222-3333-4444-5555-666677778888','ATWebchatChild001',false,1,false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fswebchat.subject (id,parent,"domain",label,force_description,"load",deleted,sysuser,sysdate) VALUES
(uuid_generate_v4(),(SELECT id FROM fswebchat.subject WHERE domain = '99992222-3333-4444-5555-666677778888' AND load = 0 LIMIT 1),'99992222-3333-4444-5555-666677778888','ATWebchatChild002',false,1,false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fswebchat.template (uuid,"domain","name",body,"option",option_type,sysdate,sysuser) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','ATWebchatTemplate001','Isto é um template de webchat','{sim,não}',1,NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1))
,(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','ATFacebookTemplate001','ola','{}',NULL,NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1));

INSERT INTO fswebchat.webchat (uuid,"domain","name",dns,"key",config,default_lang,enabled,deleted,sysdate,sysuser,mailbox_uuid,subject,queue_uuid,inbound_uuid,theme_uuid,server_url,channel,use_external_script,external_script_path,dns_subfolder) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','ATWebchatChannel001','www.gocontact.com','838032635fe111386299e4d18eb2db06b4556838','{"title":"Conversa AT","size":"MEDIUM","NOTifications":"false","popups":"false","popupTime":"","sound":"false","position":"BOTTOM-RIGHT","ticket_integration":"false","show_chat_offline":"false","NOTification_sound":"false","start_chat_withoutmsg":"false","theme_name":"theme-blue","allow_rating_request":"false","allow_self_rating":"false","show_client_view":"false","show_chat_id":"false","allow_send_email":"false","allow_send_files":"false","allow_send_files_options":{"size_LIMIT":"0"},"mailbox_integration_contact_request":"false","mailbox_integration_auto_send":"false","webchat_custom_theme":{"active":"false"},"loginFields":[{"label":"Name","field":"contact","searchable":"false","require":"true","extrafieldlabel":"Contact Name","isExtraField":"false"},{"label":"Email","field":"email","searchable":"true","require":"true","extrafieldlabel":"E-mail","isExtraField":"false"}],"allowGeolocation":"false"}','en',true,false,NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NULL,NULL,NULL,NULL,'7b5e16e7-7e3d-43d8-812d-457b24b55e5a','','webchat',false,'','');

INSERT INTO fswebchat.webchat (uuid,"domain","name",dns,"key",config,default_lang,enabled,deleted,sysdate,sysuser,mailbox_uuid,subject,queue_uuid,inbound_uuid,theme_uuid,server_url,channel,use_external_script,external_script_path,dns_subfolder) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','ATFacebookChannel001',NULL,NULL,'{"theme_name":"theme-blue","ticket_integration":"true","no_agents_action":{"action":"none"},"out_schedule_action":{"action":"none"}}','en',true,false,NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NULL,NULL,NULL,NULL,'7b5e16e7-7e3d-43d8-812d-457b24b55e5a',NULL,'facebook',false,'','');

INSERT INTO fswebchat.webchat_queue (uuid,"domain",webchat_uuid,queue_name,queue_path,queue_main,deleted,sysuser,sysdate) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888',(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'webchat' AND NOT deleted LIMIT 1),'default','',true,false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fswebchat.webchat_queue (uuid,"domain",webchat_uuid,queue_name,queue_path,queue_main,deleted,sysuser,sysdate) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888',(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'facebook' AND NOT deleted LIMIT 1),'default','',true,false,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW());

INSERT INTO fswebchat.webchat_subject (uuid,webchat_uuid,subject_uuid,"type",sysuser,sysdate,"domain") VALUES
(uuid_generate_v4(),(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'webchat' LIMIT 1),(SELECT id FROM fswebchat.subject WHERE domain = '99992222-3333-4444-5555-666677778888' AND load = 0 LIMIT 1),0,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),'99992222-3333-4444-5555-666677778888');

INSERT INTO fswebchat.webchat_subject (uuid,webchat_uuid,subject_uuid,"type",sysuser,sysdate,"domain") VALUES
(uuid_generate_v4(),(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'facebook' LIMIT 1),(SELECT id FROM fswebchat.subject WHERE domain = '99992222-3333-4444-5555-666677778888' AND load = 0 LIMIT 1),0,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),'99992222-3333-4444-5555-666677778888');

INSERT INTO fswebchat.webchat_template (uuid,webchat_uuid,template_uuid,sysdate,sysuser,edit,"domain") VALUES
(uuid_generate_v4(),(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'webchat' LIMIT 1),(SELECT uuid FROM fswebchat.template WHERE domain = '99992222-3333-4444-5555-666677778888' AND name = 'ATWebchatTemplate001' LIMIT 1),NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),false,'99992222-3333-4444-5555-666677778888');

INSERT INTO fswebchat.webchat_template (uuid,webchat_uuid,template_uuid,sysdate,sysuser,edit,"domain") VALUES
(uuid_generate_v4(),(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'facebook' LIMIT 1),(SELECT uuid FROM fswebchat.template WHERE domain = '99992222-3333-4444-5555-666677778888' AND name = 'ATFacebookTemplate001' LIMIT 1),NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),false,'99992222-3333-4444-5555-666677778888');

INSERT INTO fswebchat.webchat_trigger (uuid,webchat_uuid,"name",description,trigger_startafter,trigger_action,delayms,display_name,msg,editable,sysdate,sysuser,default_trigger_id,locked,"domain") VALUES
(uuid_generate_v4(),(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'webchat' LIMIT 1),'clientinactivity','No messages FROM client to server',1,2,1800,'','',false,NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),2,false,'99992222-3333-4444-5555-666677778888')
,(uuid_generate_v4(),(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'webchat' LIMIT 1),'welcomemsg','Welcome message',2,3,10,'Customer Service','Esta quase a ser atendido :)',true,NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),3,false,'99992222-3333-4444-5555-666677778888')
,(uuid_generate_v4(),(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'webchat' LIMIT 1),'disconnected','Customer loses connection',3,1,300,'','',false,NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),1,true,'99992222-3333-4444-5555-666677778888');

INSERT INTO fswebchat.webchat_user (uuid,webchat_uuid,user_id,sysdate,sysuser,webchat_queue_uuid,"domain") VALUES
(uuid_generate_v4(),(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'webchat' LIMIT 1),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT uuid FROM fswebchat.webchat_queue WHERE "domain" ='99992222-3333-4444-5555-666677778888' AND webchat_uuid = (SELECT uuid FROM fswebchat.webchat WHERE "domain" = '99992222-3333-4444-5555-666677778888' AND channel ='webchat' AND NOT deleted LIMIT 1) LIMIT 1),'99992222-3333-4444-5555-666677778888');

INSERT INTO fswebchat.webchat_user (uuid,webchat_uuid,user_id,sysdate,sysuser,webchat_queue_uuid,"domain") VALUES
(uuid_generate_v4(),(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'facebook' LIMIT 1),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT uuid FROM fswebchat.webchat_queue WHERE "domain" ='99992222-3333-4444-5555-666677778888' AND webchat_uuid = (SELECT uuid FROM fswebchat.webchat WHERE "domain" = '99992222-3333-4444-5555-666677778888' AND channel ='facebook' LIMIT 1)),'99992222-3333-4444-5555-666677778888');

INSERT INTO fswebchat.webchat_weekly_schedule (uuid,webchat_uuid,schedule,sysdate,sysuser,"domain") VALUES
(uuid_generate_v4(),(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'webchat' LIMIT 1),'{"monday":{"time":["0","24"],"hours":"24"},"tuesday":{"time":["0","24"],"hours":"24"},"wednesday":{"time":["0","24"],"hours":"24"},"thursday":{"time":["0","24"],"hours":"24"},"friday":{"time":["0","24"],"hours":"24"},"saturday":{"time":["0","24"],"hours":"24"},"sunday":{"time":["0","24"],"hours":"24"}}',NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),'99992222-3333-4444-5555-666677778888')
,(uuid_generate_v4(),(SELECT uuid FROM fswebchat.webchat WHERE domain = '99992222-3333-4444-5555-666677778888' AND channel = 'facebook' LIMIT 1),'{"monday":{"time":["0","24"],"hours":"24"},"tuesday":{"time":["0","24"],"hours":"24"},"wednesday":{"time":["0","24"],"hours":"24"},"thursday":{"time":["0","24"],"hours":"24"},"friday":{"time":["0","24"],"hours":"24"},"saturday":{"time":["0","24"],"hours":"24"},"sunday":{"time":["0","24"],"hours":"24"}}',NOW(),(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),'99992222-3333-4444-5555-666677778888');

--INSERT INTO fssocialnetworks.facebook (uuid,"domain",tickets_queue_uuid,webchat_queue_uuid,"name",social_id,auto_reply_post,auto_reply_message,sysuser,sysdate,enabled,deleted,social_user_id,events_fb_message,events_fb_page) VALUES
--(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888',(SELECT uuid FROM fstickets.queue WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),(SELECT uuid FROM fswebchat.webchat_queue WHERE domain = '99992222-3333-4444-5555-666677778888' AND webchat_uuid = (SELECT uuid FROM fswebchat.webchat w WHERE domain='99992222-3333-4444-5555-666677778888' AND channel = 'facebook' AND NOT deleted LIMIT 1) LIMIT 1),'ATFacebook001',NULL,false,NULL,(SELECT id FROM fscontact.users WHERE domain = '99992222-3333-4444-5555-666677778888' LIMIT 1),NOW(),false,false,NULL,NULL,NULL);

--- SELECTS ---

SELECT array_to_json(array_agg(row_to_json(a))) AS campaigns
FROM (
  SELECT * FROM fscontact.campaigns WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY id ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS inbound_queues
FROM (
  SELECT * FROM fscontact.inbound_groups WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY id ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS databases
FROM (
  SELECT * FROM fscontact.databases WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY id ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS allowed_users
FROM (
  SELECT * FROM fscontact.allowed_users WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY user_id ASC
) a;

--- Ter atenção que aqui estão todos os outcomes out (sistema + 1 para a campanha) ---
SELECT array_to_json(array_agg(row_to_json(a))) AS outcomes_out
FROM (
  SELECT * FROM fscontact.outcomes WHERE "domain"='99992222-3333-4444-5555-666677778888' AND owner_type = 'campaign' ORDER BY id ASC
) a;

--- Ter atenção que aqui estão todos os outcomes in (sistema + 1 para a inbound queue) ---
SELECT array_to_json(array_agg(row_to_json(a))) AS outcomes_in
FROM (
  SELECT * FROM fscontact.outcomes WHERE "domain"='99992222-3333-4444-5555-666677778888' AND owner_type = 'queue'  ORDER BY id ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS system_schedule_out
FROM (
  SELECT * FROM fscontact.system_schedules WHERE "domain"='99992222-3333-4444-5555-666677778888' AND owner_type = 'campaign' ORDER BY id ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS system_schedule_in
FROM (
  SELECT * FROM fscontact.system_schedules WHERE "domain"='99992222-3333-4444-5555-666677778888' AND owner_type = 'queue' ORDER BY id ASC
) a;

--- Vai listar todas as relações cujos owners são campanhas e depois todas as relações cujos owners sejam queues ---
SELECT array_to_json(array_agg(row_to_json(a))) AS db_owners
FROM (
  SELECT * FROM fscontact.database_owners WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY owner_type ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS template_fields
FROM (
  SELECT * FROM fscontact.contact_fields_templates WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY template_name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS contact_fields_owners
FROM (
  SELECT * FROM fscontact.contact_fields_owners WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY owner_type ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS ivr_menus
FROM (
  SELECT * FROM fscontact.ivr_menus WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS sla_templates
FROM (
  SELECT * FROM fstickets.sla_templates WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS sla_weekly_schedule
FROM (
  SELECT * FROM fstickets.sla_weekly_schedule WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY sysdate ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS ivr_campaigns
FROM (
  SELECT * FROM fscontact.ivr_campaigns WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY id ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS ivr_campaigns_options
FROM (
  SELECT * FROM fscontact.ivr_campaigns_options WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY ivr_campaign_id ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS ivr_campaigns_outcomes
FROM (
  SELECT * FROM fscontact.ivr_campaigns_outcomes WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY ivr_campaign_id ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS script_dinamico_master
FROM (
  SELECT * FROM fscontact.script_dinamico_master WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY id ASC
) a;

--- seleciona todos os elementos por script ---
SELECT array_to_json(array_agg(row_to_json(a))) AS script_dinamico
FROM (
  SELECT * FROM fscontact.script_dinamico WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY id_script ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS script_dinamico_pages
FROM (
  SELECT * FROM fscontact.script_dinamico_pages WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY id_script ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS script_assoc
FROM (
  SELECT * FROM fscontact.script_assoc WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY id_script ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS script_agents_assoc
FROM (
  SELECT * FROM fscontact.script_agents_assoc WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY id_script ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS report_sheet_order
FROM (
  SELECT * FROM fscontact.report_sheet_order WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY template_name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS group_breaks
FROM (
  SELECT * FROM fscontact.group_breaks WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS maibox
FROM (
  SELECT * FROM fstickets.mailbox WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS ticketqueue
FROM (
  SELECT * FROM fstickets.queue WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS queue_autoreply_config
FROM (
  SELECT * FROM fstickets.queue_autoreply_configuration WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY sysuser ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS queue_forwardreply_config
FROM (
  SELECT * FROM fstickets.queue_forwardreply_configuration WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY sysuser ASC
) a;

--- seleciona as relações por tipo ascendente, i.e., inbound primeiro e depois outbound ---
SELECT array_to_json(array_agg(row_to_json(a))) AS queue_mailbox
FROM (
  SELECT * FROM fstickets.queue_mailbox WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY "type" ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS subject
FROM (
  SELECT * FROM fstickets.subject WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY label ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS ticket_template
FROM (
  SELECT * FROM fstickets.template WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS subject_contact
FROM (
  SELECT * FROM fstickets.subject_contact WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY sysuser ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS subject_template
FROM (
  SELECT * FROM fstickets.subject_template WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY sysuser ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS tag
FROM (
  SELECT * FROM fstickets.tag WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS queue_subject
FROM (
  SELECT * FROM fstickets.queue_subject WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY type ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS queue_tag
FROM (
  SELECT * FROM fstickets.queue_tag WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY sysuser ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS queue_user
FROM (
  SELECT * FROM fstickets.queue_user WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY user_id ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS sla_auto_delivery
FROM (
  SELECT * FROM fstickets.sla_automatic_delivery WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY user_id ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS sla_exceptions
FROM (
  SELECT * FROM fstickets.sla_exceptions WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY date ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS w_mailbox
FROM (
  SELECT * FROM fswebchat.mailbox WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS w_subject
FROM (
  SELECT * FROM fswebchat.subject WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY label ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS w_template
FROM (
  SELECT * FROM fswebchat.template WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS webchat
FROM (
  SELECT * FROM fswebchat.webchat WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS webchat_queue
FROM (
  SELECT * FROM fswebchat.webchat_queue WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY queue_name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS webchat_subject
FROM (
  SELECT * FROM fswebchat.webchat_subject WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY type ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS webchat_template
FROM (
  SELECT * FROM fswebchat.webchat_template WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY sysuser ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS webchat_trigger
FROM (
  SELECT * FROM fswebchat.webchat_trigger WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY default_trigger_id ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS webchat_user
FROM (
  SELECT * FROM fswebchat.webchat_user WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY user_id ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS webchat_weekly_schedule
FROM (
  SELECT * FROM fswebchat.webchat_weekly_schedule WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY sysuser ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS facebook
FROM (
  SELECT * FROM fssocialnetworks.facebook WHERE "domain"='99992222-3333-4444-5555-666677778888' ORDER BY name ASC
) a;
