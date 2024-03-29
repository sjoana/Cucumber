--SQL uat3 para ddi, chamadas in e out ok

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4(),'3780f814-5543-4350-b65d-563512d1fe71',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'call-direction','  ','true',110,'true','1');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='1'),uuid_generate_v4(),'condition','${call_direction}','^(inbound|outbound|local)$',NULL,NULL,0,5),
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='1'),uuid_generate_v4(),'anti-action','set','call_direction=local',NULL,NULL,0,10);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4(),'5c845a13-de06-489d-a59c-2f7022b2cf82',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'transfer_on_fail_operator','',NULL,200,'true','2');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='2'),uuid_generate_v4(),'condition','destination_number','^transfer_on_fail_operator_(\d+)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='2'),uuid_generate_v4(),'action','fifo','operator|fifo|fail|${domain_name}|$1 in undef undef',NULL,NULL,0,10);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4(),'2eb032c5-c79d-4096-ac90-8a47fe40f411',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'user_status','*22','false',210,'false','3');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='3'),uuid_generate_v4(),'condition','destination_number','^\*22$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='3'),uuid_generate_v4(),'action','lua','app.lua user_status',NULL,NULL,0,10);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'59aff1f2-719c-403e-9306-5eb3a0cbd16c',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'global-intercept','*886',NULL,220,'false','4');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='4'),uuid_generate_v4(),'condition','destination_number','^\*886$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='4'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='4'),uuid_generate_v4(),'action','intercept','${hash(SELECT/${domain_name}-last_dial/global)}',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='4'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4(),'15332e83-12f5-44d3-8472-633736eb4b9b',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'group-intercept','*8',NULL,230,'true','5');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='5'),uuid_generate_v4(),'condition','destination_number','^\*8$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='5'),uuid_generate_v4(),'action','set','intercept_unbridged_only=true',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='5'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='5'),uuid_generate_v4(),'action','intercept','${hash(SELECT/${domain_name}-last_dial/${call_group})}',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='5'),uuid_generate_v4(),'action','sleep','500',NULL,NULL,0,25);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4(),'459da8c1-073a-458e-ae7e-8194342f9583',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'redial',' *870',NULL,240,'true','6');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='6'),uuid_generate_v4(),'condition','destination_number','^(redial|\*870)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='6'),uuid_generate_v4(),'action','transfer','${hash(SELECT/${domain_name}-last_dial/${caller_id_number})}',NULL,NULL,0,10);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'2011c518-696d-4878-a9b2-b217b6311311',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'page','*724',NULL,250,'false','7');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='7'),uuid_generate_v4(),'condition','destination_number','^\*724$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='7'),uuid_generate_v4(),'action','set','caller_id_name=Page',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='7'),uuid_generate_v4(),'action','set','caller_id_number=',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='7'),uuid_generate_v4(),'action','set','pin_number=',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='7'),uuid_generate_v4(),'action','set','extension_list=1001-1003,1005',NULL,NULL,0,25)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='7'),uuid_generate_v4(),'action','lua','page.lua',NULL,NULL,0,30);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'e944af7e-8fcc-429b-a32f-0dcdce1585d8',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'eavesdrop','*8827',NULL,260,'false','8');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='8'),uuid_generate_v4(),'condition','destination_number','^\*88(\d{2,7})$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='8'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='8'),uuid_generate_v4(),'action','set','pin_number=02078804',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='8'),uuid_generate_v4(),'action','lua','eavesdrop.lua $1',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'eb478e66-f637-4ae7-b1eb-9a7b87a1bd9e',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'call_privacy','*67',NULL,270,'true','9');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='9'),uuid_generate_v4(),'condition','destination_number','^\*67(\d+)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='9'),uuid_generate_v4(),'action','privacy','full',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='9'),uuid_generate_v4(),'action','set','sip_h_Privacy=id',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='9'),uuid_generate_v4(),'action','set','privacy=yes',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='9'),uuid_generate_v4(),'action','transfer','$1 XML ${context}',NULL,NULL,0,25);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'fa516204-920f-4802-8bb1-04c6a010bfe1',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'call_return','*69 ',NULL,280,'true','10');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='10'),uuid_generate_v4(),'condition','destination_number','^\*69$|^lcr$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='10'),uuid_generate_v4(),'action','transfer','${hash(SELECT/${domain_name}-call_return/${caller_id_number})}',NULL,NULL,0,10);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'2b7b2f82-edfe-4339-8cc5-7d0cf36e1e68',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'intercept-ext','**',NULL,290,'true','11');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='11'),uuid_generate_v4(),'condition','destination_number','^\*\*(\d+)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='11'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='11'),uuid_generate_v4(),'action','intercept','${hash(SELECT/${domain_name}-last_dial_ext/$1)}',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='11'),uuid_generate_v4(),'action','sleep','500',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'ddcf7740-78ca-4035-8c19-e2df10cebf67',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'dx','',NULL,300,'false','12');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='12'),uuid_generate_v4(),'condition','destination_number','^dx$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='12'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='12'),uuid_generate_v4(),'action','read','11 11 ''tone_stream://%(10000,0,350,440)'' digits 5000 #',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='12'),uuid_generate_v4(),'action','execute_extension','is_transfer XML ${context}',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'1b224444-de8b-448d-b2d1-19feaac3effa',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'extension-intercom','*827',NULL,300,'false','13');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='13'),uuid_generate_v4(),'condition','destination_number','^\*8(\d{2,7})$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='13'),uuid_generate_v4(),'action','set','extension_list=$1',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='13'),uuid_generate_v4(),'action','set','pin_number=',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='13'),uuid_generate_v4(),'action','set','mute=true',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='13'),uuid_generate_v4(),'action','lua','page.lua',NULL,NULL,0,25);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'7bd7a113-0afc-406a-b4a7-33077c22ac39',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'att_xfer','',NULL,310,'true','14');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='14'),uuid_generate_v4(),'condition','destination_number','^att_xfer$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='14'),uuid_generate_v4(),'action','read','2 6 ''tone_stream://%(10000,0,350,440)'' digits 30000 #',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='14'),uuid_generate_v4(),'action','set','origination_cancel_key=#',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='14'),uuid_generate_v4(),'action','set','domain_name=${transfer_context}',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='14'),uuid_generate_v4(),'action','att_xfer','user/${digits}@${transfer_context}',NULL,NULL,0,25);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'001d5dab-e0c6-4352-8f06-e9986ee7b0d8',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'send_to_voicemail','*9927',NULL,310,'true','15');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='15'),uuid_generate_v4(),'condition','destination_number','^\*99(\d{2,7})$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='15'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='15'),uuid_generate_v4(),'action','sleep','1000',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='15'),uuid_generate_v4(),'action','voicemail','default ${domain_name} $1',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4(),'d085a1e3-c53a-4480-9ca6-6a362899a681',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'vmain',' *4000 *98',NULL,320,'true','16');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='16'),uuid_generate_v4(),'condition','destination_number','^vmain$|^\*4000$|^\*98$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='16'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='16'),uuid_generate_v4(),'action','sleep','1000',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='16'),uuid_generate_v4(),'action','voicemail','check default ${domain_name}',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'44a4b26d-9e13-41dc-8405-7ff2e4a215e0',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'xfer_vm','',NULL,320,'true','17');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='17'),uuid_generate_v4(),'condition','destination_number','^xfer_vm$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='17'),uuid_generate_v4(),'action','read','2 6 ''tone_stream://%(10000,0,350,440)'' digits 30000 #',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='17'),uuid_generate_v4(),'action','set','origination_cancel_key=#',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='17'),uuid_generate_v4(),'action','set','domain_name=${transfer_context}',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='17'),uuid_generate_v4(),'action','export','domain_name=${transfer_context}',NULL,NULL,0,25)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='17'),uuid_generate_v4(),'action','transfer','-bleg *99${digits} XML ${transfer_context}',NULL,NULL,0,30);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'da8e22c7-9e07-4ff5-a28b-faf35ba8d411',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'is_transfer','',NULL,330,'true','18');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='18'),uuid_generate_v4(),'condition','destination_number','^is_transfer$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='18'),uuid_generate_v4(),'condition','${digits}','^(\d+)$',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='18'),uuid_generate_v4(),'action','transfer','-aleg ${digits} XML ${context}',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='18'),uuid_generate_v4(),'anti-action','eval','cancel transfer',NULL,NULL,0,20);


INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'5d47ab13-f25d-4f62-a68e-2a7d945d05b7',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'vmain_user','*97',NULL,330,'true','19');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='19'),uuid_generate_v4(),'condition','destination_number','^\*97$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='19'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='19'),uuid_generate_v4(),'action','sleep','1000',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='19'),uuid_generate_v4(),'action','voicemail','check default ${domain_name} ${caller_id_number}',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'f13df3df-bfb4-4c11-bee1-6548cd983729',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'cf','',NULL,340,'true','20');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='20'),uuid_generate_v4(),'condition','destination_number','^cf$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='20'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='20'),uuid_generate_v4(),'action','transfer','-both 30${dialed_extension:2} XML ${context}',NULL,NULL,0,15);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'fe638409-b347-46d7-9aca-489561df8b35',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'delay_echo','*9195',NULL,340,'true','21');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='21'),uuid_generate_v4(),'condition','destination_number','^\*9195$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='21'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='21'),uuid_generate_v4(),'action','delay_echo','5000',NULL,NULL,0,15);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'1f894dfb-0567-4e20-9026-d538bbaa5261',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'echo','*9196',NULL,350,'true','22');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='22'),uuid_generate_v4(),'condition','destination_number','^\*9196$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='22'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='22'),uuid_generate_v4(),'action','echo',NULL,NULL,NULL,0,15);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'c3ea29d1-db41-421e-91b7-b0984e50bcae',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'please_hold','100109',NULL,350,'false','23');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='23'),uuid_generate_v4(),'condition','destination_number','^(10[01][0-9])$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='23'),uuid_generate_v4(),'action','set','transfer_ringback=$${hold_music}',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='23'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='23'),uuid_generate_v4(),'action','sleep','1500',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='23'),uuid_generate_v4(),'action','playback','ivr/ivr-hold_connect_call.wav',NULL,NULL,0,25)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='23'),uuid_generate_v4(),'action','transfer','$1 XML ${context}',NULL,NULL,0,30);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'951808c2-b778-404d-bd17-50b5df4b88f4',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'is_zrtp_secure','','true',360,'false','24');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='24'),uuid_generate_v4(),'condition','${zrtp_secure_media_confirmed}','^true$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='24'),uuid_generate_v4(),'action','sleep','1000',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='24'),uuid_generate_v4(),'action','playback','misc/call_secured.wav',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='24'),uuid_generate_v4(),'anti-action','eval','not_secure',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'296acca3-d30f-42a0-ba90-5af2208ad7f8',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'milliwatt','*9197',NULL,360,'true','25');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='25'),uuid_generate_v4(),'condition','destination_number','^\*9197$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='25'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='25'),uuid_generate_v4(),'action','playback','{loops=-1}tone_stream://%(251,0,1004)',NULL,NULL,0,15);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'b57306e0-36df-4048-b182-7ad0f69d8c03',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'is_secure','','true',370,'false','26');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='26'),uuid_generate_v4(),'condition','${sip_via_protocol}','tls',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='26'),uuid_generate_v4(),'condition','${sip_secure_media_confirmed}','^true$',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='26'),uuid_generate_v4(),'action','sleep','1000',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='26'),uuid_generate_v4(),'action','playback','misc/call_secured.wav',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='26'),uuid_generate_v4(),'anti-action','eval','not_secure',NULL,NULL,0,25);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'98ccdb0b-c074-4f74-b28a-9528372faa7d',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'tone_stream','*9198',NULL,370,'true','27');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='27'),uuid_generate_v4(),'condition','destination_number','^\*9198$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='27'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='27'),uuid_generate_v4(),'action','playback','{loops=10}tone_stream://path=${base_dir}/conf/tetris.ttml',NULL,NULL,0,15);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'b824b88a-e6da-486e-9f17-7b93cbaa318e',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'hold_music','*9664',NULL,380,'true','28');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='28'),uuid_generate_v4(),'condition','destination_number','^\*9664$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='28'),uuid_generate_v4(),'condition','${sip_has_crypto}','^(AES_CM_128_HMAC_SHA1_32|AES_CM_128_HMAC_SHA1_80)$',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='28'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='28'),uuid_generate_v4(),'action','execute_extension','is_secure XML features',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='28'),uuid_generate_v4(),'action','playback','${hold_music}',NULL,NULL,0,25)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='28'),uuid_generate_v4(),'anti-action','set','zrtp_secure_media=true',NULL,NULL,0,30)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='28'),uuid_generate_v4(),'anti-action','answer',NULL,NULL,NULL,0,35)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='28'),uuid_generate_v4(),'anti-action','playback','silence_stream://2000',NULL,NULL,0,40)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='28'),uuid_generate_v4(),'anti-action','execute_extension','is_zrtp_secure XML features',NULL,NULL,0,45)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='28'),uuid_generate_v4(),'anti-action','playback','${hold_music}',NULL,NULL,0,50);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4(),'6933099a-db6a-415d-bc6d-b1d9b56a54f2',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'extension_login','** ',NULL,390,'false','29');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='29'),uuid_generate_v4(),'condition','destination_number','^\#\*(\s*|\d+)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='29'),uuid_generate_v4(),'action','lua','fscloud-extension-login.lua $1',NULL,NULL,0,10);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'430737df-5385-42d1-b933-22600d3fb79e',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'recordings','*732',NULL,400,'true','30');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='30'),uuid_generate_v4(),'condition','destination_number','^\*(732)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='30'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='30'),uuid_generate_v4(),'action','sleep','500',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='30'),uuid_generate_v4(),'action','play_AND_get_digits','3 9 3 10000 # voicemail/8000/vm-enter_id.wav /error.wav recording_file_number \d+',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='30'),uuid_generate_v4(),'action','playback','custom/8000/begin_recording.wav',NULL,NULL,0,25)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='30'),uuid_generate_v4(),'action','record','$${recordings_dir}/${domain_name}/${recording_file_number}.wav 180',NULL,NULL,0,30);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'8e3ad78e-4b48-4d36-af7e-4920a9757043',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'freeswitch_conference','*9888 8888 1616 3232',NULL,410,'false','31');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='31'),uuid_generate_v4(),'condition','destination_number','^\*9(888|8888|1616|3232)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='31'),uuid_generate_v4(),'action','export','hold_music=silence',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='31'),uuid_generate_v4(),'action','bridge','sofia/${use_profile}/$1@conference.freeswitch.org',NULL,NULL,0,15);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'3ade2d9a-f55d-4240-bb60-b4a3ab36951c',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'disa','*3472',NULL,420,'false','32');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='32'),uuid_generate_v4(),'condition','destination_number','^\*(3472)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='32'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='32'),uuid_generate_v4(),'action','set','pin_number=05512917',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='32'),uuid_generate_v4(),'action','set','dialplan_context=${context}',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='32'),uuid_generate_v4(),'action','lua','disa.lua',NULL,NULL,0,25);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'a223dc70-28a1-4979-834e-8af813cd8ea6',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'directory','*411',NULL,430,'false','33');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='33'),uuid_generate_v4(),'condition','destination_number','^\*411$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='33'),uuid_generate_v4(),'action','lua','directory.lua',NULL,NULL,0,10);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'e27abe68-41c0-4188-bb0f-67d93de0c610',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'wake-up','*925',NULL,440,'false','34');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='34'),uuid_generate_v4(),'condition','destination_number','^\*(925)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='34'),uuid_generate_v4(),'action','answer',NULL,NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='34'),uuid_generate_v4(),'action','set','pin_number=85302809',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='34'),uuid_generate_v4(),'action','set','time_zone_offset=-7',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='34'),uuid_generate_v4(),'action','lua','wakeup.lua',NULL,NULL,0,25);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'ffb30da6-30e4-43b8-9847-2ed40e232f89',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'park_in','*5900',NULL,450,'false','35');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='35'),uuid_generate_v4(),'condition','destination_number','^\*5900$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='35'),uuid_generate_v4(),'action','set','park_direction=in',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='35'),uuid_generate_v4(),'action','set','park_extension=\*5901',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='35'),uuid_generate_v4(),'action','set','park_range=3',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='35'),uuid_generate_v4(),'action','set','park_announce=true',NULL,NULL,0,25)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='35'),uuid_generate_v4(),'action','set','park_timeout_seconds=70',NULL,NULL,0,30)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='35'),uuid_generate_v4(),'action','set','park_timeout_destination=1000',NULL,NULL,0,35)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='35'),uuid_generate_v4(),'action','set','park_music=$${hold_music}',NULL,NULL,0,40)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='35'),uuid_generate_v4(),'action','set','park_caller_id_prefix=',NULL,NULL,0,45)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='35'),uuid_generate_v4(),'action','lua','park.lua',NULL,NULL,0,50);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'cf8234b6-a039-4ec2-87bd-3db0799a3f75',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'park_out','*5901 *5902 *5903',NULL,455,'false','36');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='36'),uuid_generate_v4(),'condition','destination_number','(^\*5901$|^\*5902$|^\*5903$)',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='36'),uuid_generate_v4(),'action','set','park_direction=out',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='36'),uuid_generate_v4(),'action','set','park_extension=$1',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='36'),uuid_generate_v4(),'action','lua','park.lua',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'f096f899-c78e-409c-8290-00f6d423b31c',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'park_slots','*5901 *5902 *5903',NULL,460,'false','37');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='37'),uuid_generate_v4(),'condition','destination_number','(^\*5901$|^\*5902$|^\*5903$)',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='37'),uuid_generate_v4(),'action','set','park_extension=$1',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='37'),uuid_generate_v4(),'action','set','park_direction=both',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='37'),uuid_generate_v4(),'action','set','park_announce=true',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='37'),uuid_generate_v4(),'action','set','park_timeout_seconds=250',NULL,NULL,0,25)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='37'),uuid_generate_v4(),'action','set','park_timeout_destination=1000',NULL,NULL,0,30)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='37'),uuid_generate_v4(),'action','set','park_music=$${hold_music}',NULL,NULL,0,35)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='37'),uuid_generate_v4(),'action','set','park_caller_id_prefix=',NULL,NULL,0,40)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='37'),uuid_generate_v4(),'action','lua','park.lua',NULL,NULL,0,45);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'3cc8363d-5ce3-48aa-8ac1-143cf297c4f7',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'valet_park','*590909','true',470,'true','38');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'condition','destination_number','^(park\+)?(\*59[0-9][0-9])$','never',NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'condition','${sip_h_Referred-By}','sip:(.*)@.*','never',NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'action','set','referred_by_user=$1',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'condition','destination_number','^(park\+)?(\*59[0-9][0-9])$','never',NULL,1,25)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'action','set','park_in_use=false',NULL,'true',1,30)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'action','set','park_lot=$2',NULL,'true',1,35)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'condition','destination_number','^(park\+)?(\*59[0-9][0-9])$',NULL,NULL,2,45)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'condition','${cond ${sip_h_Referred-By} == 0 ? false : true}','true','never',NULL,2,50)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'action','set','park_in_use=${regex ${valet_info park@${domain_name}}|${park_lot}}',NULL,'true',2,55)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'condition','${park_in_use}','true','never',NULL,3,65)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'action','transfer','${referred_by_user} XML ${context}',NULL,NULL,3,70)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'anti-action','set','valet_parking_timeout=90',NULL,NULL,3,75)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'anti-action','set','valet_parking_orbit_exten=${referred_by_user}',NULL,NULL,3,80)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='38'),uuid_generate_v4(),'anti-action','valet_park','park@${domain_name} ${park_lot}',NULL,NULL,3,85);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'0e1cd2d7-9d84-4959-8b6c-0cb23de4de59',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'operator','0 ','false',480,'true','39');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='39'),uuid_generate_v4(),'condition','destination_number','^0$|^operator$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='39'),uuid_generate_v4(),'action','bind_meta_app','4 ab s execute_extension::att_xfer XML features',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='39'),uuid_generate_v4(),'action','bind_meta_app','5 ab s execute_extension::xfer_vm XML features',NULL,NULL,0,20);


INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'a90d3639-3b82-4905-a65d-85f58b6c4a19',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'operator-forward','*000',NULL,485,'true','40');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='40'),uuid_generate_v4(),'condition','destination_number','^\*000$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='40'),uuid_generate_v4(),'action','set','direction=both',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='40'),uuid_generate_v4(),'action','set','extension=true',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='40'),uuid_generate_v4(),'action','lua','dial_string.lua',NULL,NULL,0,25);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'539beece-a8ef-4b2a-aea3-60df1c21b72a',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'activate-dnd','*78',NULL,490,'true','41');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='41'),uuid_generate_v4(),'condition','destination_number','^\*78$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='41'),uuid_generate_v4(),'action','lua','fscloud-extension-features.lua ${username}@${domain_name} dnd true',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='41'),uuid_generate_v4(),'action','answer','',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='41'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'5ccc60b4-7c0f-4b06-baa9-038a52d26f2e',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'deactivate-dnd','*79',NULL,491,'true','42');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='42'),uuid_generate_v4(),'condition','destination_number','^\*79$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='42'),uuid_generate_v4(),'action','lua','fscloud-extension-features.lua ${username}@${domain_name} dnd false',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='42'),uuid_generate_v4(),'action','answer','',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='42'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'b32b6cb8-ced4-4af8-b8f5-2e839592d67a',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'activate-forward_all','*72',NULL,492,'true','43');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='43'),uuid_generate_v4(),'condition','destination_number','^\*72(\d+)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='43'),uuid_generate_v4(),'action','lua','fscloud-extension-features.lua ${username}@${domain_name} forward all $1',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='43'),uuid_generate_v4(),'action','answer','',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='43'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'ac10137c-e5a2-4317-a299-7891e00ddd5f',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'deactivate-forward_all','*73',NULL,493,'true','44');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='44'),uuid_generate_v4(),'condition','destination_number','^\*73$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='44'),uuid_generate_v4(),'action','lua','fscloud-extension-features.lua ${username}@${domain_name} forward all',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='44'),uuid_generate_v4(),'action','answer','',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='44'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'35fa07bc-6194-4307-ba56-dd5ccad4a6ec',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'activate-forward_busy','*62',NULL,494,'true','45');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='45'),uuid_generate_v4(),'condition','destination_number','^\*62(\d+)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='45'),uuid_generate_v4(),'action','lua','fscloud-extension-features.lua ${username}@${domain_name} forward busy $1',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='45'),uuid_generate_v4(),'action','answer','',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='45'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'5eeb1764-244a-4d13-aabe-a2dbe7f6f9c1',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'deactivate-forward_busy','*63',NULL,495,'true','46');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='46'),uuid_generate_v4(),'condition','destination_number','^\*63$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='46'),uuid_generate_v4(),'action','lua','fscloud-extension-features.lua ${username}@${domain_name} forward busy',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='46'),uuid_generate_v4(),'action','answer','',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='46'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'4b5a12d4-71ce-4091-ac61-2dfada8fc940',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'activate-forward_no_answer','*52',NULL,496,'true','47');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='47'),uuid_generate_v4(),'condition','destination_number','^\*52(\d+)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='47'),uuid_generate_v4(),'action','lua','fscloud-extension-features.lua ${username}@${domain_name} forward no_answer $1',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='47'),uuid_generate_v4(),'action','answer','',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='47'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'17b788f1-2906-446a-b59e-51eb033e3109',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'deactivate-forward_no_answer','*53',NULL,497,'true','48');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='48'),uuid_generate_v4(),'condition','destination_number','^\*53$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='48'),uuid_generate_v4(),'action','lua','fscloud-extension-features.lua ${username}@${domain_name} forward no_answer',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='48'),uuid_generate_v4(),'action','answer','',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='48'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'1b652766-b024-463c-a7de-97cc483d689b',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'deactivate-forward','*90',NULL,498,'true','49');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='49'),uuid_generate_v4(),'condition','destination_number','^\*90$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='49'),uuid_generate_v4(),'action','lua','fscloud-extension-features.lua ${username}@${domain_name} forward disable',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='49'),uuid_generate_v4(),'action','answer','',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='49'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'a22422a6-52bb-4589-a74b-34b3fbd637b3',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'activate-secretary','*58',NULL,499,'true','50');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='50'),uuid_generate_v4(),'condition','destination_number','^\*58(\d+)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='50'),uuid_generate_v4(),'action','lua','fscloud-extension-features.lua ${username}@${domain_name} secretary $1 on',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='50'),uuid_generate_v4(),'action','answer','',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='50'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'fa4eb2af-e7cc-4d93-a218-3d17ae74dfef',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'deactivate-secretary','*59',NULL,500,'true','51');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='51'),uuid_generate_v4(),'condition','destination_number','^\*59(\d+)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='51'),uuid_generate_v4(),'action','lua','fscloud-extension-features.lua ${username}@${domain_name} secretary $1 off',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='51'),uuid_generate_v4(),'action','answer','',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='51'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'2af9d5e3-2d3d-4e94-a08a-9d5b231fc0e0',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'activate-deactivate-secretary','*60',NULL,501,'true','52');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='52'),uuid_generate_v4(),'condition','destination_number','^\*60(\d+)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='52'),uuid_generate_v4(),'action','lua','fscloud-extension-features.lua ${username}@${domain_name} secretary $1',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='52'),uuid_generate_v4(),'action','answer','',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='52'),uuid_generate_v4(),'action','sleep','2000',NULL,NULL,0,20);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'3f8843cd-6738-4650-be8e-9c278a256e81',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'verto','',NULL,997,'true','53');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='53'),uuid_generate_v4(),'condition','${sip_h_X-FS-Verto-Session}','^(.+)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='53'),uuid_generate_v4(),'action','bridge','verto.rtc/u:$1',NULL,NULL,0,10);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'71cf1310-b6e3-415b-8745-3cbdc8e15212',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'local_extension','',NULL,999,'true','54');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'condition','${user_exists(id ${destination_number} ${domain_name})}','^(true)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'action','export','dialed_extension=${destination_number}',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'action','LIMIT','hash ${domain_name} ${destination_number} ${LIMIT_max} ${LIMIT_destination}',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'action','bind_meta_app','1 b s execute_extension::dx XML ${context}',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'action','bind_meta_app','2 ab s record_session::$${recordings_dir}/archive/${strftime(%Y)}/${strftime(%b)}/${strftime(%d)}/${uuid}.wav',NULL,NULL,0,25)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'action','bind_meta_app','3 b s execute_extension::cf XML ${context}',NULL,NULL,0,30)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'action','bind_meta_app','4 b s execute_extension::att_xfer XML ${context}',NULL,NULL,0,35)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'action','hash','insert/${domain_name}-call_return/${dialed_extension}/${caller_id_number}',NULL,NULL,0,40)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'action','hash','insert/${domain_name}-last_dial_ext/${dialed_extension}/${uuid}',NULL,NULL,0,45)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'action','hash','insert/${domain_name}-last_dial/global/${uuid}',NULL,NULL,0,50)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'action','set','called_party_call_group=${user_data(${dialed_extension}@${domain_name} var call_group)}',NULL,NULL,0,55)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'action','hash','insert/${domain_name}-last_dial/${called_party_call_group}/${uuid}',NULL,NULL,0,60)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='54'),uuid_generate_v4(),'action','lua','fscloud-local-extension.lua',NULL,NULL,0,65);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'8c914ec3-9fc0-8ab5-4cda-6c9288bdc9a3',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'outside','*',NULL,999,'true','55');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='55'),uuid_generate_v4(),'condition','destination_number','^(.*)$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='55'),uuid_generate_v4(),'action','lua','fscloud-outbound.lua',NULL,NULL,0,10);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'34dd307b-fffe-4ead-990c-3d070e288126',(SELECT domain_name FROM public.v_domains WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'global','','true',0,'true','56');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='56'),uuid_generate_v4(),'condition',NULL,NULL,'never',NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='56'),uuid_generate_v4(),'action','export','origination_callee_id_name=${destination_number}',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='56'),uuid_generate_v4(),'action','set','RFC2822_DATE=${strftime(%a, %d %b %Y %T %z)}',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='56'),uuid_generate_v4(),'condition','${user_name}','^.+$','never',NULL,1,25)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='56'),uuid_generate_v4(),'action','LIMIT','hash ${domain_name} ${user_name} ${LIMIT_max}',NULL,NULL,1,30);

INSERT INTO public.v_dialplans
(domain_uuid, dialplan_uuid, app_uuid, dialplan_context, dialplan_name, dialplan_number, dialplan_continue, dialplan_order, dialplan_enabled, dialplan_description)
VALUES('99992222-3333-4444-5555-666677778888', uuid_generate_v4(), 'c03b422e-13a8-bd1b-e42b-b6b9b4d27ce4', 'public', 'internal_app_loopback', '', NULL, 100, 'true', '57');

INSERT INTO public.v_dialplan_details
(domain_uuid, dialplan_uuid, dialplan_detail_uuid, dialplan_detail_tag, dialplan_detail_type, dialplan_detail_data, dialplan_detail_break, dialplan_detail_inline, dialplan_detail_group, dialplan_detail_order)
VALUES('99992222-3333-4444-5555-666677778888', (SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='57'), uuid_generate_v4(), 'condition', '${sip_h_X-FS-internal_app_generate}', '^true$', NULL, NULL, 0, 5)
,('99992222-3333-4444-5555-666677778888', (SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='57'), uuid_generate_v4(), 'action', 'export', 'disable_voicemail=true', NULL, NULL, 0, 10)
,('99992222-3333-4444-5555-666677778888', (SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='57'), uuid_generate_v4(), 'action', 'transfer', '${destination_number} XML ${domain_name}', NULL, NULL, 0, 15);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4(),'c03b422e-13a8-bd1b-e42b-b6b9b4d27ce4','public','survey_call_back','','true',998,'false','58');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='58'),uuid_generate_v4(),'condition','${destination_number}','^.+$',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='58'),uuid_generate_v4(),'action','set','call-back-action-sleep_seconds=30',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='58'),uuid_generate_v4(),'action','set','call-back-action-retention_days=30',NULL,NULL,0,15)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='58'),uuid_generate_v4(),'action','set','call-back-action-probability=100',NULL,NULL,0,20)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='58'),uuid_generate_v4(),'action','lua','fscloud-call-back-action.lua {survey_app}',NULL,NULL,0,25);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4(),'c03b422e-13a8-bd1b-e42b-b6b9b4d27ce4','public','inbound_did_route','',NULL,999,'true','59');

INSERT INTO public.v_dialplan_details (domain_uuid,dialplan_uuid,dialplan_detail_uuid,dialplan_detail_tag,dialplan_detail_type,dialplan_detail_data,dialplan_detail_break,dialplan_detail_inline,dialplan_detail_group,dialplan_detail_order) VALUES
('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='59'),uuid_generate_v4(),'condition','context','public',NULL,NULL,0,5)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='59'),uuid_generate_v4(),'condition','${domain_name}','^(.*)$',NULL,NULL,0,10)
,('99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid='99992222-3333-4444-5555-666677778888' AND dialplan_description ='59'),uuid_generate_v4(),'action','lua','fscloud-inbound-did.lua',NULL,NULL,0,15);

INSERT INTO public.v_dialplans (domain_uuid,dialplan_uuid,app_uuid,dialplan_context,dialplan_name,dialplan_number,dialplan_continue,dialplan_order,dialplan_enabled,dialplan_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4() ,'a5788e9b-58bc-bd1b-df59-fff5d51253ab',(SELECT domain_name FROM public.v_domains WHERE domain_uuid='99992222-3333-4444-5555-666677778888'),'ATIVR001','12345',NULL,333,'true','60');

INSERT INTO public.v_domain_settings (domain_uuid,domain_setting_uuid,domain_setting_category,domain_setting_subcategory,domain_setting_name,domain_setting_value,domain_setting_enabled,domain_setting_description) VALUES
('99992222-3333-4444-5555-666677778888',uuid_generate_v4(),'provision_security','provision_key','var','83BiKqWWeRTBXUa9','true','Default Generate')
,('99992222-3333-4444-5555-666677778888',uuid_generate_v4(),'Authentication','ldap_authentication','','false','true','Default Generate')
,('99992222-3333-4444-5555-666677778888',uuid_generate_v4(),'Authentication','fallback_local_login','','true','true','Default Generate');

INSERT INTO public.v_extensions (extension_uuid,domain_uuid,"extension",number_alias,"password",provisioning_list,accountcode,effective_caller_id_name,effective_caller_id_number,outbound_caller_id_name,outbound_caller_id_number,emergency_caller_id_number,directory_full_name,directory_visible,directory_exten_visible,limit_max,limit_destination,user_context,toll_allow,call_timeout,call_group,hold_music,auth_acl,cidr,sip_force_contact,nibble_account,sip_force_expires,mwi_account,sip_bypass_media,unique_id,dial_string,dial_user,dial_domain,do_not_disturb,forward_all_destination,forward_all_enabled,forward_busy_destination,forward_busy_enabled,follow_me_uuid,enabled,extension_profile,description,roaming,roaming_enabled,follow_me,follow_me_enabled,contacts_prefs,secretary,voicemail,email,"forward") VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','fscontact','','nIcfambNL-9E',NULL,'','','','','','','','true',NULL,5,'',NULL,uuid_generate_v4(),30,'','','','',NULL,NULL,NULL,'','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'true','','',NULL,NULL,NULL,NULL,NULL,'{"destination":"","direct":[]}','{"attach":"true","keep":"true","enable":"false","auth":"false"}',NULL,'[]')
,(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','100','','tLJC$z*MpjJV',NULL,'','','','','300501602','','','true',NULL,5,'',(SELECT domain_name FROM public.v_domains WHERE domain_uuid='99992222-3333-4444-5555-666677778888'),'9c195390-5565-43f4-bd44-6b2f310c4d73',30,'','','','',NULL,NULL,NULL,'','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'true','','',NULL,NULL,NULL,NULL,NULL,'{"destination":"","direct":[]}','{"attach":"true","keep":"true","enable":"true","auth":"false"}',NULL,'[]');

INSERT INTO public.v_gateways (gateway_uuid,domain_uuid,gateway,username,"password",distinct_to,auth_username,realm,from_user,from_domain,proxy,register_proxy,outbound_proxy,expire_seconds,register,register_transport,retry_seconds,"extension",default_did,ping,caller_id_in_from,supress_cng,sip_cid_type,codec_prefs,channels,extension_in_contact,context,profile,enabled,description,validate_cid_number,prefix_number,country_code_prefix,gateway_order,custom_variables,disable_permissions,tariff_plan) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','uat03','uat03','BZRa5qtVhqId','false','','uat03','uat03','dev-gocontact.govoice.pt','cloud.govoice.pt','','',800,'true','udp',30,'','','','false','false','pid','pcma',5,'false','public','external','true','','false','','','999','','false',NULL);

INSERT INTO public.v_gateway_dids (domain_did_uuid,domain_uuid,domain_did,domain_did_aplication,domain_did_data,gateway_uuid,default_did,domain_did_description) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','300501602','Extensions','100',(select gateway_uuid from public.v_gateways where domain_uuid = '99992222-3333-4444-5555-666677778888'),'','Description for DID Automated Tests');

INSERT INTO public.v_outbound_prefixes (outbound_prefixes_uuid,domain_uuid,outbound_prefix,outbound_name,outbound_maximum_calls,outbound_maximum_minutes,outbound_gateways) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','707','707','50','150',NULL)
,(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','80[08]','800/808','50','150',NULL)
,(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','1[0-9]{2,4}','infonumbers','30','90',NULL)
,(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','00','international','40','120',NULL)
,(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','9','mobile','50','150',NULL)
,(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','[23]','landline','60','180',NULL)
,(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888','760','added_value','20','60',NULL);

INSERT INTO public.v_ivr_menus (ivr_menu_uuid,domain_uuid,dialplan_uuid,ivr_menu_name,ivr_menu_extension,ivr_menu_greet_long,ivr_menu_greet_short,ivr_menu_invalid_sound,ivr_menu_exit_sound,ivr_menu_confirm_macro,ivr_menu_confirm_key,ivr_menu_tts_engine,ivr_menu_tts_voice,ivr_menu_confirm_attempts,ivr_menu_timeout,ivr_menu_exit_app,ivr_menu_exit_data,ivr_menu_inter_digit_timeout,ivr_menu_max_failures,ivr_menu_max_timeouts,ivr_menu_digit_len,ivr_menu_direct_dial,ivr_menu_ringback,ivr_menu_cid_prefix,ivr_menu_enabled,ivr_menu_description,ivr_toll_allow) VALUES
(uuid_generate_v4(),'99992222-3333-4444-5555-666677778888',(SELECT dialplan_uuid FROM public.v_dialplans WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' AND dialplan_description = '60' LIMIT 1),'ATIVR001','12345','/opt/freeswitch/sounds/general/new-call.wav','/opt/freeswitch/sounds/en/us/callie/ivr/8000/ivr-please_try_again.wav','/opt/freeswitch/sounds/en/us/callie/ivr/8000/ivr-accept_reject.wav','/opt/freeswitch/sounds/en/us/callie/ivr/8000/ivr-youre_doing_it_wrong.wav',NULL,NULL,'flite','rms',3,30,'hangup',NULL,2000,3,3,1,'true','${uk-ring}',NULL,'true',NULL,NULL);

INSERT INTO public.v_ivr_menu_options (ivr_menu_option_uuid,ivr_menu_uuid,domain_uuid,ivr_menu_option_digits,ivr_menu_option_action,ivr_menu_option_param,ivr_menu_option_order,ivr_menu_option_description) VALUES
(uuid_generate_v4(),(SELECT ivr_menu_uuid FROM public.v_ivr_menus WHERE domain_uuid = '99992222-3333-4444-5555-666677778888' LIMIT 1),'99992222-3333-4444-5555-666677778888','0','menu-exec-app','hangup',0,'');

INSERT INTO finesource.security_profiles (security_profile_uuid, domain_uuid, security_profile_name, security_profile_value, security_profile_enabled, security_profile_description, created_date, created_by, last_modified_date, last_modified_by) values
(uuid_generate_v4(), '99992222-3333-4444-5555-666677778888', 'nacional', 'lANDline;mobile', 'true', 'National destinations', now(), 'superadmin', now(), 'superadmin')
,(uuid_generate_v4(), '99992222-3333-4444-5555-666677778888', 'all', '707;lANDline;mobile;international;infonumbers;800/808;added_value', 'true', 'All destinations', now(), 'superadmin', now(), 'superadmin');


SELECT array_to_json(array_agg(row_to_json(a))) AS v_ivr_menus
FROM (
  SELECT * FROM public.v_ivr_menus WHERE "domain_uuid"='99992222-3333-4444-5555-666677778888' ORDER BY ivr_menu_name ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS v_extensions
FROM (
  SELECT * FROM public.v_extensions WHERE "domain_uuid"='99992222-3333-4444-5555-666677778888' ORDER BY extension ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS v_gateway_dids
FROM (
  SELECT * FROM public.v_gateway_dids WHERE "domain_uuid"='99992222-3333-4444-5555-666677778888' ORDER BY domain_did ASC
) a;

SELECT array_to_json(array_agg(row_to_json(a))) AS v_ivr_menu_options
FROM (
  SELECT * FROM public.v_ivr_menu_options WHERE "domain_uuid"='99992222-3333-4444-5555-666677778888' ORDER BY ivr_menu_option_order ASC
) a;
