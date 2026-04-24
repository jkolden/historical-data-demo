prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=> 8325564762610682
,p_default_application_id=>121
,p_default_id_offset=>0
,p_default_owner=>'WKSP_FREEDEMO'
);
end;
/

prompt APPLICATION 121 - Fusion Integrated Sample App
--
-- Application Export:
--   Application:     121
--   Name:            Fusion Integrated Sample App (your-instance)
--   Exported By:     JOHN.KOLDEN@SIERRA-CEDAR.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 6003
--   Manifest End
--   Version:         24.2.15
--

begin
null;
end;
/
prompt --application/pages/delete_06003
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>6003);
end;
/
prompt --application/pages/page_06003
begin
wwv_flow_imp_page.create_page(
 p_id=>6003
,p_name=>'Learning History'
,p_alias=>'LEARNING-HISTORY'
,p_step_title=>'Learning History'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.u-Processing {',
'    display: none !important;',
'}',
'',
'/* Region wrapper */',
'#kpiBySource {',
'  margin-bottom: 10px;',
'}',
'',
'/* Each card container */',
'#kpiBySource li.a-CardView-item .a-CardView {',
'  border-radius: 16px !important;',
'  box-shadow: 0 8px 18px rgba(0,0,0,.08) !important;',
'  border: 1px solid rgba(0,0,0,.06) !important;',
'  overflow: hidden;',
'}',
'',
'/* Padding */',
'#kpiBySource .a-CardView-header,',
'#kpiBySource .a-CardView-body {',
'  padding-left: 18px !important;',
'  padding-right: 18px !important;',
'}',
'',
'#kpiBySource .a-CardView-header {',
'  padding-top: 16px !important;',
'  padding-bottom: 6px !important;',
'}',
'',
'#kpiBySource .a-CardView-body {',
'  padding-top: 0 !important;',
'  padding-bottom: 16px !important;',
'}',
'',
'/* Title */',
'#kpiBySource .a-CardView-title {',
'  font-size: 18px !important;',
'  font-weight: 800 !important;',
'  letter-spacing: .2px;',
'}',
'',
'/* Big number (subtitle) */',
'#kpiBySource .a-CardView-subTitle {',
'  margin-top: 10px !important;',
'  font-size: 30px !important;',
'  line-height: 1.05 !important;',
'  font-weight: 900 !important;',
'}',
'',
'/* Body: render \n as line breaks */',
'#kpiBySource .a-CardView-mainContent {',
'  margin-top: 10px !important;',
'  white-space: pre-line !important;',
'  font-size: 13px !important;',
'  opacity: .82;',
'}',
'',
'/* Make sure each card can host an accent bar */',
'#kpiBySource li.a-CardView-item .a-CardView{',
'  position: relative;',
'}',
'',
'/* Default: no accent */',
'#kpiBySource li.a-CardView-item .a-CardView::before{',
'  content: "";',
'  position: absolute;',
'  left: 0;',
'  top: 0;',
'  bottom: 0;',
'  width: 6px;',
'  background: transparent;',
'  border-top-left-radius: 16px;',
'  border-bottom-left-radius: 16px;',
'}',
'',
'/* Color by rownum */',
'#kpiBySource li.a-CardView-item[data-rownum="1"] .a-CardView::before{ background: #2563eb; }',
'#kpiBySource li.a-CardView-item[data-rownum="2"] .a-CardView::before{ background: #9333ea; } /* Legacy */',
'#kpiBySource li.a-CardView-item[data-rownum="3"] .a-CardView::before{ background: #16a34a; } /* EBS */',
'',
'/* Make the icon pill pick up the same accent color */',
'#kpiBySource li.a-CardView-item[data-rownum="1"] .a-CardView-header .a-CardView-icon{',
'background: rgba(37, 99, 235, .14) !important;',
'  color: #2563eb !important;',
'}',
'#kpiBySource li.a-CardView-item[data-rownum="2"] .a-CardView-header .a-CardView-icon {',
'  background: rgba(147, 51, 234, .14) !important;',
'  color: #9333ea !important;',
'}',
'#kpiBySource li.a-CardView-item[data-rownum="3"] .a-CardView-header .a-CardView-icon {',
'  background: rgba(22, 163, 74, .14) !important;',
'  color: #16a34a !important;',
'}',
'',
'/* Ensure the icon pill shape is consistent */',
'#kpiBySource .a-CardView-icon{',
'  width: 40px;',
'  height: 40px;',
'  border-radius: 12px;',
'  display: grid;',
'  place-items: center;',
'}',
'',
'/* 4th card accent + icon tint (All systems) */',
'#kpiBySource li.a-CardView-item[data-rownum="4"] .a-CardView::before{ background: #f59e0b; }',
'#kpiBySource li.a-CardView-item[data-rownum="4"] .a-CardView-header .a-CardView-icon{',
'  background: rgba(245, 158, 11, .16) !important;',
'  color: #f59e0b !important;',
'}',
'',
'.srcBadge{',
'  display:inline-flex;',
'  align-items:center;',
'  justify-content:center;',
'  padding:2px 10px;',
'  border-radius:999px;',
'  font-size:12px;',
'  font-weight:800;',
'  letter-spacing:.2px;',
'  line-height:18px;',
'  white-space:nowrap;',
'}',
'',
'.srcBadge[data-src="Fusion"]  { background: rgba(37, 99, 235, .16); color:#2563eb; }',
'.srcBadge[data-src="Legacy"]   { background: rgba(147, 51, 234, .16); color:#9333ea; }',
'.srcBadge[data-src="EBS"]  { background: rgba(22, 163, 74, .16);  color:#16a34a; }',
'.srcBadge[data-src="Other"]   { background: rgba(0,0,0,.10);         color:rgba(0,0,0,.70); }',
'',
'#kpiBySource .a-CardView-mainContent::first-line{',
'  font-size: 1.3em;',
'  font-weight: 600;',
'}',
'',
'#kpiBySource .a-CardView-subContent {',
'    font-weight: bolder;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
------------------------------------------------------------------------
-- Region: region display (Display Selector)
------------------------------------------------------------------------
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(60030001000000001)
,p_plug_name=>'region display'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
------------------------------------------------------------------------
-- Region: filters
------------------------------------------------------------------------
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(60030001000000010)
,p_plug_name=>'filters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
------------------------------------------------------------------------
-- Region: KPI Cards (count-based, no dollar amounts)
------------------------------------------------------------------------
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(60030001000000020)
,p_plug_name=>'KPI'
,p_region_name=>'kpiBySource'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* ========================= 1) FUSION ========================= */',
'select',
'    1 as sort_order,',
'    ''Fusion'' as card_title,',
'    to_char(fusion_cnt, ''FM999G999G990'') || '' Records'' as card_subtitle,',
'    case',
'        when :P6003_FROM_DATE is not null then ''From '' || :P6003_FROM_DATE || '' To '' || :P6003_TO_DATE',
'    end as secondary_body,',
'    case when fusion_completed > 0 then ''Completed: '' || fusion_completed end',
'        || case when fusion_active > 0 then chr(10) || ''Active: '' || fusion_active end',
'        || case when fusion_other > 0 then chr(10) || ''Other: '' || fusion_other end',
'        || case',
'            when :P6003_TOTAL_ROWS is not null',
'            and to_number(:P6003_TOTAL_ROWS) > fusion_cnt',
unistr('            then chr(10) || ''\26A0 Showing '' || to_char(fusion_cnt, ''FM999G999G990'')'),
unistr('                 || '' of '' || to_char(to_number(:P6003_TOTAL_ROWS), ''FM999G999G990'')'),
unistr('                 || '' \2014 please refine filters'''),
'        end as card_body,',
'    ''fa fa-cloud'' as card_icon,',
'    case',
'        when :P6003_TOTAL_ROWS is not null',
'        and to_number(:P6003_TOTAL_ROWS) > fusion_cnt then ''kpiCard kpiCard--fusion kpiCard--warn''',
'        else ''kpiCard kpiCard--fusion''',
'    end as css_class',
'from (',
'    select',
'        count(*) as fusion_cnt,',
'        count(case when json_value(c.clob001, ''$.assignmentStatusMeaning'') = ''Completed'' then 1 end) as fusion_completed,',
'        count(case when json_value(c.clob001, ''$.assignmentStatusMeaning'') = ''Active'' then 1 end) as fusion_active,',
'        count(case when json_value(c.clob001, ''$.assignmentStatusMeaning'') not in (''Completed'',''Active'') then 1 end) as fusion_other',
'    from apex_collections c',
'    where c.collection_name = ''FUSION_LEARNING_ROWS''',
')',
'',
'/* ========================= 2) LEGACY ========================= */',
'union all',
'select',
'    2,',
'    ''Legacy'',',
'    to_char(leg_cnt, ''FM999G999G990'') || '' Records'',',
'    null as secondary_body,',
'    case when leg_completed > 0 then ''Completed: '' || leg_completed end',
'        || case when leg_active > 0 then chr(10) || ''Active: '' || leg_active end',
'        || case when leg_other > 0 then chr(10) || ''Other: '' || leg_other end,',
'    ''fa fa-database'' as card_icon,',
'    ''kpiCard kpiCard--legacy kpiCard--infor'' as css_class',
'from (',
'    select',
'        count(*) as leg_cnt,',
'        count(case when assignmentstatusmeaning = ''Completed'' then 1 end) as leg_completed,',
'        count(case when assignmentstatusmeaning = ''Active'' then 1 end) as leg_active,',
'        count(case when assignmentstatusmeaning not in (''Completed'',''Active'') then 1 end) as leg_other',
'    from demo_learning_hist',
'    where ( nullif(:P6003_LEARNER, '''') is null or assignedtonumber = :P6003_LEARNER )',
'      and ( nullif(:P6003_STATUS, '''') is null or assignmentstatus = :P6003_STATUS )',
'      and ( nullif(:P6003_TYPE, '''') is null or learningitemtype = :P6003_TYPE )',
'      and sourcesystem = ''Legacy''',
')',
'',
'/* ========================= 3) EBS ========================= */',
'union all',
'select',
'    3,',
'    ''EBS'',',
'    to_char(ebs_cnt, ''FM999G999G990'') || '' Records'',',
'    null as secondary_body,',
'    case when ebs_completed > 0 then ''Completed: '' || ebs_completed end',
'        || case when ebs_active > 0 then chr(10) || ''Active: '' || ebs_active end',
'        || case when ebs_other > 0 then chr(10) || ''Other: '' || ebs_other end,',
'    ''fa fa-database'' as card_icon,',
'    ''kpiCard kpiCard--legacy kpiCard--lawson'' as css_class',
'from (',
'    select',
'        count(*) as ebs_cnt,',
'        count(case when assignmentstatusmeaning = ''Completed'' then 1 end) as ebs_completed,',
'        count(case when assignmentstatusmeaning = ''Active'' then 1 end) as ebs_active,',
'        count(case when assignmentstatusmeaning not in (''Completed'',''Active'') then 1 end) as ebs_other',
'    from demo_learning_hist',
'    where ( nullif(:P6003_LEARNER, '''') is null or assignedtonumber = :P6003_LEARNER )',
'      and ( nullif(:P6003_STATUS, '''') is null or assignmentstatus = :P6003_STATUS )',
'      and ( nullif(:P6003_TYPE, '''') is null or learningitemtype = :P6003_TYPE )',
'      and sourcesystem = ''EBS''',
')',
'',
'/* ========================= 4) TOTAL ========================= */',
'union all',
'select',
'    4,',
'    ''Total (All Systems)'' as card_title,',
'    to_char(total_cnt, ''FM999G999G990'') || '' Records'' as card_subtitle,',
'    null as secondary_body,',
'    ''Completed: '' || total_completed',
'        || case when total_active > 0 then chr(10) || ''Active: '' || total_active end',
'        || case when total_other > 0 then chr(10) || ''Other: '' || total_other end',
'        || case',
'            when :P6003_TOTAL_ROWS is not null',
'            and to_number(:P6003_TOTAL_ROWS) > fusion_cnt',
unistr('            then chr(10) || ''\26A0 Fusion results truncated'''),
'        end as card_body,',
'    ''fa fa-layers'' as card_icon,',
'    case',
'        when :P6003_TOTAL_ROWS is not null',
'        and to_number(:P6003_TOTAL_ROWS) > fusion_cnt then ''kpiCard kpiCard--total kpiCard--warn''',
'        else ''kpiCard kpiCard--total''',
'    end as css_class',
'from (',
'    with f as (',
'        select',
'            count(*) as fusion_cnt,',
'            count(case when json_value(c.clob001, ''$.assignmentStatusMeaning'') = ''Completed'' then 1 end) as fusion_completed,',
'            count(case when json_value(c.clob001, ''$.assignmentStatusMeaning'') = ''Active'' then 1 end) as fusion_active,',
'            count(case when json_value(c.clob001, ''$.assignmentStatusMeaning'') not in (''Completed'',''Active'') then 1 end) as fusion_other',
'        from apex_collections c',
'        where c.collection_name = ''FUSION_LEARNING_ROWS''',
'    ),',
'    l as (',
'        select',
'            count(*) as legacy_cnt,',
'            count(case when assignmentstatusmeaning = ''Completed'' then 1 end) as legacy_completed,',
'            count(case when assignmentstatusmeaning = ''Active'' then 1 end) as legacy_active,',
'            count(case when assignmentstatusmeaning not in (''Completed'',''Active'') then 1 end) as legacy_other',
'        from demo_learning_hist',
'        where ( nullif(:P6003_LEARNER, '''') is null or assignedtonumber = :P6003_LEARNER )',
'          and ( nullif(:P6003_STATUS, '''') is null or assignmentstatus = :P6003_STATUS )',
'          and ( nullif(:P6003_TYPE, '''') is null or learningitemtype = :P6003_TYPE )',
'    )',
'    select',
'        f.fusion_cnt,',
'        (f.fusion_cnt + l.legacy_cnt) as total_cnt,',
'        (f.fusion_completed + l.legacy_completed) as total_completed,',
'        (f.fusion_active + l.legacy_active) as total_active,',
'        (f.fusion_other + l.legacy_other) as total_other',
'    from f cross join l',
');'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P6003_LEARNER,P6003_STATUS,P6003_TYPE,P6003_FROM_DATE,P6003_TO_DATE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(60030001000000021)
,p_region_id=>wwv_flow_imp.id(60030001000000020)
,p_layout_type=>'GRID'
,p_grid_column_count=>4
,p_card_css_classes=>'&CSS_CLASS.'
,p_title_adv_formatting=>false
,p_title_column_name=>'CARD_TITLE'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'CARD_SUBTITLE'
,p_body_adv_formatting=>false
,p_body_column_name=>'CARD_BODY'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'SECONDARY_BODY'
,p_second_body_css_classes=>'bold'
,p_icon_source_type=>'DYNAMIC_CLASS'
,p_icon_class_column_name=>'CARD_ICON'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
);
------------------------------------------------------------------------
-- Region: Learning History (Interactive Report)
------------------------------------------------------------------------
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(60030001000000030)
,p_plug_name=>'Learning History'
,p_region_name=>'learningHistory'
,p_parent_plug_id=>wwv_flow_imp.id(60030001000000001)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* ======== Fusion (from collection, raw JSON in clob001) ======== */',
'select',
'  c.seq_id                                                                              as id,',
'  ''Fusion''                                                                              as SourceSystem,',
'  ''Fusion''                                                                              as SourceSystem_search,',
'  /* identifiers */',
'  json_value(c.clob001, ''$.assignmentRecordNumber'')                                     as AssignmentRecordNumber,',
'  /* learner */',
'  json_value(c.clob001, ''$.assignedToNumber'')                                           as AssignedToNumber,',
'  json_value(c.clob001, ''$.assignedToDisplayName'')                                      as AssignedToDisplayName,',
'  json_value(c.clob001, ''$.assignedToPersonPrimaryEmailAddress'')                        as AssignedToEmail,',
'  /* assigner */',
'  json_value(c.clob001, ''$.assignerDisplayName'')                                        as AssignerDisplayName,',
'  /* learning item */',
'  json_value(c.clob001, ''$.learningItemNumber'')                                         as LearningItemNumber,',
'  json_value(c.clob001, ''$.learningItemTitle'')                                          as LearningItemTitle,',
'  json_value(c.clob001, ''$.learningItemType'')                                           as LearningItemType,',
'  json_value(c.clob001, ''$.learningItemTypeMeaning'')                                    as LearningItemTypeMeaning,',
'  /* status */',
'  json_value(c.clob001, ''$.assignmentStatus'')                                           as AssignmentStatus,',
'  json_value(c.clob001, ''$.assignmentStatusMeaning'')                                    as AssignmentStatusMeaning,',
'  json_value(c.clob001, ''$.assignmentTypeMeaning'')                                      as AssignmentTypeMeaning,',
'  /* effort */',
'  json_value(c.clob001, ''$.expectedEffortInHours'')                                      as ExpectedEffortInHours,',
'  json_value(c.clob001, ''$.actualEffortInHours'')                                        as ActualEffortInHours,',
'  /* dates */',
'  to_date(substr(json_value(c.clob001, ''$.assignedDate''), 1, 10), ''YYYY-MM-DD'')        as AssignedDate,',
'  to_date(substr(json_value(c.clob001, ''$.completedDate''), 1, 10), ''YYYY-MM-DD'')       as CompletedDate,',
'  to_date(substr(json_value(c.clob001, ''$.startedDate''), 1, 10), ''YYYY-MM-DD'')         as StartedDate,',
'  to_date(substr(json_value(c.clob001, ''$.withdrawnDate''), 1, 10), ''YYYY-MM-DD'')       as WithdrawnDate,',
'  /* score */',
'  json_value(c.clob001, ''$.actualScore'' returning number)                                as ActualScore',
'',
'from apex_collections c',
'where c.collection_name = ''FUSION_LEARNING_ROWS''',
'',
'union all',
'',
'/* ======== Legacy + EBS (from local table) ======== */',
'select',
'  null                                    as id,',
'  d.sourcesystem                          as SourceSystem,',
'  d.sourcesystem                          as SourceSystem_search,',
'  d.assignmentrecordnumber                as AssignmentRecordNumber,',
'  d.assignedtonumber                      as AssignedToNumber,',
'  d.assignedtodisplayname                 as AssignedToDisplayName,',
'  d.assignedtopersonprimaryemailaddress   as AssignedToEmail,',
'  d.assignerdisplayname                   as AssignerDisplayName,',
'  d.learningitemnumber                    as LearningItemNumber,',
'  d.learningitemtitle                     as LearningItemTitle,',
'  d.learningitemtype                      as LearningItemType,',
'  d.learningitemtypemeaning               as LearningItemTypeMeaning,',
'  d.assignmentstatus                      as AssignmentStatus,',
'  d.assignmentstatusmeaning               as AssignmentStatusMeaning,',
'  d.assignmenttypemeaning                 as AssignmentTypeMeaning,',
'  d.expectedeffortinhours                 as ExpectedEffortInHours,',
'  d.actualeffortinhours                   as ActualEffortInHours,',
'  cast(d.assigneddate as date)            as AssignedDate,',
'  cast(d.completeddate as date)           as CompletedDate,',
'  cast(d.starteddate as date)             as StartedDate,',
'  cast(d.withdrawndate as date)           as WithdrawnDate,',
'  d.actualscore                           as ActualScore',
'',
'from demo_learning_hist d',
'where ( nullif(:P6003_LEARNER, '''') is null',
'        or d.assignedtonumber = :P6003_LEARNER )',
'  and ( nullif(:P6003_STATUS, '''') is null',
'        or d.assignmentstatus = :P6003_STATUS )',
'  and ( nullif(:P6003_TYPE, '''') is null',
'        or d.learningitemtype = :P6003_TYPE );',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P6003_LEARNER,P6003_STATUS,P6003_TYPE,P6003_FROM_DATE,P6003_TO_DATE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
------------------------------------------------------------------------
-- Worksheet definition
------------------------------------------------------------------------
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(60030001000000031)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JOHN.KOLDEN@SIERRA-CEDAR.COM'
,p_internal_uid=>60030001000000031
);
------------------------------------------------------------------------
-- Worksheet columns
------------------------------------------------------------------------
-- A: ID (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000040)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
-- B: SOURCESYSTEM (visible, badge)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000041)
,p_db_column_name=>'SOURCESYSTEM'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Source System'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="srcBadge" data-src="#SOURCESYSTEM#">#SOURCESYSTEM#</span>',
'',
''))
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- C: SOURCESYSTEM_SEARCH (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000042)
,p_db_column_name=>'SOURCESYSTEM_SEARCH'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Sourcesystem Search'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- D: ASSIGNMENTRECORDNUMBER (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000043)
,p_db_column_name=>'ASSIGNMENTRECORDNUMBER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Record Number'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- E: ASSIGNEDTONUMBER (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000044)
,p_db_column_name=>'ASSIGNEDTONUMBER'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Person Number'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- F: ASSIGNEDTODISPLAYNAME (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000045)
,p_db_column_name=>'ASSIGNEDTODISPLAYNAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Learner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- G: ASSIGNEDTOEMAIL (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000046)
,p_db_column_name=>'ASSIGNEDTOEMAIL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Learner Email'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- H: ASSIGNERDISPLAYNAME (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000047)
,p_db_column_name=>'ASSIGNERDISPLAYNAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Assigner'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- I: LEARNINGITEMNUMBER (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000048)
,p_db_column_name=>'LEARNINGITEMNUMBER'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Item Number'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- J: LEARNINGITEMTITLE (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000049)
,p_db_column_name=>'LEARNINGITEMTITLE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Learning Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- K: LEARNINGITEMTYPE (hidden, code value)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000050)
,p_db_column_name=>'LEARNINGITEMTYPE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Item Type Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- L: LEARNINGITEMTYPEMEANING (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000051)
,p_db_column_name=>'LEARNINGITEMTYPEMEANING'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- M: ASSIGNMENTSTATUS (hidden, code value)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000052)
,p_db_column_name=>'ASSIGNMENTSTATUS'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Status Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- N: ASSIGNMENTSTATUSMEANING (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000053)
,p_db_column_name=>'ASSIGNMENTSTATUSMEANING'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- O: ASSIGNMENTTYPEMEANING (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000054)
,p_db_column_name=>'ASSIGNMENTTYPEMEANING'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Assignment Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- P: EXPECTEDEFFORTINHOURS (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000055)
,p_db_column_name=>'EXPECTEDEFFORTINHOURS'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Expected Hours'
,p_column_type=>'STRING'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
-- Q: ACTUALEFFORTINHOURS (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000056)
,p_db_column_name=>'ACTUALEFFORTINHOURS'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Actual Hours'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
-- R: ASSIGNEDDATE (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000057)
,p_db_column_name=>'ASSIGNEDDATE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Assigned Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
-- S: COMPLETEDDATE (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000058)
,p_db_column_name=>'COMPLETEDDATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Completed Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
-- T: STARTEDDATE (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000059)
,p_db_column_name=>'STARTEDDATE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Started Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
-- U: WITHDRAWNDATE (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000060)
,p_db_column_name=>'WITHDRAWNDATE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Withdrawn Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
-- V: ACTUALSCORE (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60030001000000061)
,p_db_column_name=>'ACTUALSCORE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Score'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
------------------------------------------------------------------------
-- Default IR report
------------------------------------------------------------------------
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(60030001000000070)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'600300'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SOURCESYSTEM:ASSIGNEDTODISPLAYNAME:LEARNINGITEMTITLE:LEARNINGITEMTYPEMEANING:ASSIGNMENTSTATUSMEANING:ASSIGNEDDATE:COMPLETEDDATE:ACTUALSCORE:EXPECTEDEFFORTINHOURS'
);
------------------------------------------------------------------------
-- Page items
------------------------------------------------------------------------
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60030001000000080)
,p_name=>'P6003_LEARNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(60030001000000010)
,p_prompt=>'Learner'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'STATIC2:Denise Cooper;10020,Linda Cairns;90004,Marcia Brooks;10077,Marie Archer;10087,Philip Peters;10078,Robert Johnson;90001'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60030001000000081)
,p_name=>'P6003_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(60030001000000010)
,p_prompt=>'Status (Optional)'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Active;ORA_ASSN_REC_ACTIVE,Completed;ORA_ASSN_REC_COMPLETED,Withdrawn;ORA_ASSN_REC_WITHDRAWN,Requested;ORA_ASSN_REC_REQUESTED,Pending Fulfillment;ORA_ASSN_REC_PEND_FULFL'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60030001000000082)
,p_name=>'P6003_TYPE'
,p_item_sequence=>25
,p_item_plug_id=>wwv_flow_imp.id(60030001000000010)
,p_prompt=>'Type (Optional)'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Course;ORA_COURSE,Specialization;ORA_SPECIALIZATION,Noncatalog Item;ORA_NONCATALOG'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60030001000000083)
,p_name=>'P6003_FROM_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(60030001000000010)
,p_prompt=>'From'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(y) d, to_char(y) r',
'from (',
'  select extract(year from add_months(trunc(current_date,''YYYY''), -12*(level-1))) as y',
'  from dual',
'  connect by level <= 10',
')',
'order by y asc',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60030001000000084)
,p_name=>'P6003_TO_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(60030001000000010)
,p_prompt=>'To'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(y) d, to_char(y) r',
'from (',
'  select (from_y + level - 1) as y',
'  from (',
'    select',
'      case',
'        when :P6003_FROM_DATE is null then extract(year from trunc(current_date,''YYYY'')) - 9',
'        else to_number(:P6003_FROM_DATE)',
'      end as from_y,',
'      extract(year from trunc(current_date,''YYYY'')) as to_y',
'    from dual',
'  )',
'  connect by level <= (to_y - from_y + 1)',
')',
'order by y',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P6003_FROM_DATE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60030001000000085)
,p_name=>'P6003_TOTAL_ROWS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(60030001000000010)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
------------------------------------------------------------------------
-- Dynamic action: on change of filters -> reload Fusion data + refresh
------------------------------------------------------------------------
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(60030001000000090)
,p_name=>'on change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6003_LEARNER, P6003_STATUS, P6003_TYPE, P6003_FROM_DATE, P6003_TO_DATE'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
-- Action 1: Execute PL/SQL to call learning_history_pkg
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60030001000000091)
,p_event_id=>wwv_flow_imp.id(60030001000000090)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_start_date date;',
'  l_end_date   date;',
'begin',
'  if :P6003_FROM_DATE is not null then',
'    l_start_date := to_date(:P6003_FROM_DATE || ''-01-01'', ''YYYY-MM-DD'');',
'  end if;',
'  if :P6003_TO_DATE is not null then',
'    l_end_date := add_months(to_date(:P6003_TO_DATE || ''-01-01'', ''YYYY-MM-DD''), 12) - 1;',
'  end if;',
'',
'  learning_history_pkg.load_learning(',
'    p_learner    => :P6003_LEARNER,',
'    p_status     => :P6003_STATUS,',
'    p_type       => :P6003_TYPE,',
'    p_start_date => l_start_date,',
'    p_end_date   => l_end_date',
'  );',
'',
'  :P6003_TOTAL_ROWS := learning_history_pkg.g_total_rows;',
'end;',
''))
,p_attribute_02=>'P6003_LEARNER,P6003_STATUS,P6003_TYPE,P6003_FROM_DATE,P6003_TO_DATE'
,p_attribute_03=>'P6003_TOTAL_ROWS'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
-- Action 2: Refresh the Interactive Report region
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60030001000000092)
,p_event_id=>wwv_flow_imp.id(60030001000000090)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(60030001000000030)
,p_attribute_01=>'N'
);
-- Action 3: Refresh the KPI cards region
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60030001000000093)
,p_event_id=>wwv_flow_imp.id(60030001000000090)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(60030001000000020)
,p_attribute_01=>'N'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
