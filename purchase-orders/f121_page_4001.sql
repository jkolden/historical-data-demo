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
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>8325564762610682
,p_default_application_id=>121
,p_default_id_offset=>0
,p_default_owner=>'WKSP_FREEDEMO'
);
end;
/

prompt APPLICATION 121 - Fusion Integrated Sample App (ecga-test)
--
-- Application Export:
--   Application:     121
--   Name:            Fusion Integrated Sample App (ecga-test)
--   Exported By:     JOHN.KOLDEN@SIERRA-CEDAR.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 4001
--   Manifest End
--   Version:         24.2.15
--   Instance ID:     8325348246048613
--

begin
null;
end;
/
prompt --application/pages/delete_04001
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>4001);
end;
/
prompt --application/pages/page_04001
begin
wwv_flow_imp_page.create_page(
 p_id=>4001
,p_name=>'HR Assignment History'
,p_alias=>'HR-ASSIGNMENTS'
,p_step_title=>'HR Assignment History'
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
'#kpiBySource li.a-CardView-item[data-rownum="1"] .a-CardView::before{ background: #2563eb; }',
'#kpiBySource li.a-CardView-item[data-rownum="2"] .a-CardView::before{ background: #9333ea; }',
'#kpiBySource li.a-CardView-item[data-rownum="3"] .a-CardView::before{ background: #16a34a; }',
'',
'#kpiBySource li.a-CardView-item[data-rownum="1"] .a-CardView-header .a-CardView-icon{',
'  background: rgba(37, 99, 235, .14) !important;',
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
'#kpiBySource .a-CardView-icon{',
'  width: 40px;',
'  height: 40px;',
'  border-radius: 12px;',
'  display: grid;',
'  place-items: center;',
'}',
'',
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
-- ============================================================
-- Region: region display  (Display Selector)
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(700000001000001)
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
-- ============================================================
-- Region: Analytics  (Tabs container)
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(700000001000002)
,p_plug_name=>'Analytics'
,p_parent_plug_id=>wwv_flow_imp.id(700000001000001)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
-- ============================================================
-- Chart 1: Assignments by Department  (bar, horizontal)
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(700000001000003)
,p_plug_name=>'Assignments by Department'
,p_parent_plug_id=>wwv_flow_imp.id(700000001000002)
,p_region_css_classes=>'charts'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(700000001000004)
,p_region_id=>wwv_flow_imp.id(700000001000003)
,p_chart_type=>'bar'
,p_height=>'200'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'on'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(700000001000005)
,p_chart_id=>wwv_flow_imp.id(700000001000004)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  nvl(c.c006, ''(none)'') as dept_name,',
'  count(*)              as asgn_cnt',
'from apex_collections c',
'where c.collection_name = ''FUSION_ASSIGNMENT_ROWS''',
'group by nvl(c.c006, ''(none)'')',
'order by asgn_cnt desc;',
''))
,p_items_value_column_name=>'ASGN_CNT'
,p_items_label_column_name=>'DEPT_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(700000001000006)
,p_chart_id=>wwv_flow_imp.id(700000001000004)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(700000001000007)
,p_chart_id=>wwv_flow_imp.id(700000001000004)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
-- ============================================================
-- Chart 2: Assignments by Job  (donut)
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(700000001000008)
,p_plug_name=>'Assignments by Job'
,p_parent_plug_id=>wwv_flow_imp.id(700000001000002)
,p_region_css_classes=>'charts'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(700000001000009)
,p_region_id=>wwv_flow_imp.id(700000001000008)
,p_chart_type=>'donut'
,p_height=>'200'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(700000001000010)
,p_chart_id=>wwv_flow_imp.id(700000001000009)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  nvl(c.c007, ''(none)'') as job_name,',
'  count(*)               as asgn_cnt',
'from apex_collections c',
'where c.collection_name = ''FUSION_ASSIGNMENT_ROWS''',
'group by nvl(c.c007, ''(none)'')',
'order by asgn_cnt desc;',
''))
,p_items_value_column_name=>'ASGN_CNT'
,p_items_label_column_name=>'JOB_NAME'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
-- ============================================================
-- Chart 3: Assignments by Location  (pie)
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(700000001000011)
,p_plug_name=>'Assignments by Location'
,p_parent_plug_id=>wwv_flow_imp.id(700000001000002)
,p_region_css_classes=>'charts'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(700000001000012)
,p_region_id=>wwv_flow_imp.id(700000001000011)
,p_chart_type=>'pie'
,p_height=>'200'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(700000001000013)
,p_chart_id=>wwv_flow_imp.id(700000001000012)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  nvl(c.c010, ''(none)'') as loc_name,',
'  count(*)               as asgn_cnt',
'from apex_collections c',
'where c.collection_name = ''FUSION_ASSIGNMENT_ROWS''',
'group by nvl(c.c010, ''(none)'')',
'order by asgn_cnt desc;',
''))
,p_items_value_column_name=>'ASGN_CNT'
,p_items_label_column_name=>'LOC_NAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
);
-- ============================================================
-- Chart 4: Service Years Distribution  (bar)
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(700000001000014)
,p_plug_name=>'Service Years'
,p_parent_plug_id=>wwv_flow_imp.id(700000001000002)
,p_region_css_classes=>'charts'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(700000001000015)
,p_region_id=>wwv_flow_imp.id(700000001000014)
,p_chart_type=>'bar'
,p_height=>'200'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(700000001000016)
,p_chart_id=>wwv_flow_imp.id(700000001000015)
,p_seq=>10
,p_name=>'Count'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  case',
'    when c.n003 < 5  then ''0-4 yrs''',
'    when c.n003 < 10 then ''5-9 yrs''',
'    when c.n003 < 15 then ''10-14 yrs''',
'    when c.n003 < 20 then ''15-19 yrs''',
'    when c.n003 < 25 then ''20-24 yrs''',
'    else ''25+ yrs''',
'  end as svc_band,',
'  count(*) as asgn_cnt',
'from apex_collections c',
'where c.collection_name = ''FUSION_ASSIGNMENT_ROWS''',
'  and c.n003 is not null',
'group by',
'  case',
'    when c.n003 < 5  then ''0-4 yrs''',
'    when c.n003 < 10 then ''5-9 yrs''',
'    when c.n003 < 15 then ''10-14 yrs''',
'    when c.n003 < 20 then ''15-19 yrs''',
'    when c.n003 < 25 then ''20-24 yrs''',
'    else ''25+ yrs''',
'  end',
'order by min(c.n003);',
''))
,p_items_value_column_name=>'ASGN_CNT'
,p_items_label_column_name=>'SVC_BAND'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(700000001000017)
,p_chart_id=>wwv_flow_imp.id(700000001000015)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(700000001000018)
,p_chart_id=>wwv_flow_imp.id(700000001000015)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
-- ============================================================
-- Region: Interactive Report - HR Assignments
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(700000001000019)
,p_plug_name=>'HR Assignments'
,p_region_name=>'hr_assignments'
,p_parent_plug_id=>wwv_flow_imp.id(700000001000001)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  c.seq_id             as id,',
'  ''Fusion''             as SourceSystem,',
'  ''Fusion''             as SourceSystem_search,',
'  c.n001               as PersonId,',
'  c.c001               as PersonNumber,',
'  c.c002               as DisplayName,',
'  c.n002               as AssignmentId,',
'  c.c003               as AssignmentNumber,',
'  c.c004               as AssignmentName,',
'  c.c005               as WorkerType,',
'  c.d001               as StartDate,',
'  c.c006               as DepartmentName,',
'  c.c007               as JobName,',
'  c.c008               as PositionName,',
'  c.c009               as GradeName,',
'  c.c010               as LocationName,',
'  c.c011               as BusinessUnit,',
'  c.c012               as LegalEmployer,',
'  c.c013               as ManagerName,',
'  c.c014               as FullPartTime,',
'  c.n003               as ServiceYears,',
'  cast(null as varchar2(100)) as AssignmentStatus,',
'  cast(null as varchar2(100)) as ActionCode',
'from apex_collections c',
'where c.collection_name = ''FUSION_ASSIGNMENT_ROWS''',
'union all',
'select',
'  null                 as id,',
'  d.sourcesystem       as SourceSystem,',
'  d.sourcesystem       as SourceSystem_search,',
'  d.personid           as PersonId,',
'  d.personnumber       as PersonNumber,',
'  d.displayname        as DisplayName,',
'  d.assignmentid       as AssignmentId,',
'  d.assignmentnumber   as AssignmentNumber,',
'  null                 as AssignmentName,',
'  d.workertype         as WorkerType,',
'  d.effectivestartdate as StartDate,',
'  d.departmentname     as DepartmentName,',
'  d.jobname            as JobName,',
'  d.positionname       as PositionName,',
'  d.gradename          as GradeName,',
'  d.locationname       as LocationName,',
'  d.businessunit       as BusinessUnit,',
'  null                 as LegalEmployer,',
'  null                 as ManagerName,',
'  d.assignmentcategory as FullPartTime,',
'  null                 as ServiceYears,',
'  d.assignmentstatus   as AssignmentStatus,',
'  d.actioncode         as ActionCode',
'from demo_assignment_hist d',
'where upper(d.displayname) like ''%'' || upper(:P4001_LAST_NAME) || ''%''',
'  and ( nullif(:P4001_DEPARTMENT,'''') is null',
'        or d.departmentname = :P4001_DEPARTMENT );',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P4001_LAST_NAME,P4001_DEPARTMENT'
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
-- ---- Worksheet ----
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(700000001000020)
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
,p_internal_uid=>700000001000020
);
-- ---- IR Columns ----
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000040)
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
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000060)
,p_db_column_name=>'SOURCESYSTEM'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Source'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="srcBadge" data-src="#SOURCESYSTEM#">#SOURCESYSTEM#</span>',
''))
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000041)
,p_db_column_name=>'PERSONID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Person Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000042)
,p_db_column_name=>'PERSONNUMBER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Person #'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000043)
,p_db_column_name=>'DISPLAYNAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000044)
,p_db_column_name=>'ASSIGNMENTID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Assignment Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000045)
,p_db_column_name=>'ASSIGNMENTNUMBER'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Asgn #'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000046)
,p_db_column_name=>'ASSIGNMENTNAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Title'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000047)
,p_db_column_name=>'WORKERTYPE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000048)
,p_db_column_name=>'STARTDATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000049)
,p_db_column_name=>'DEPARTMENTNAME'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000050)
,p_db_column_name=>'JOBNAME'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Job'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000051)
,p_db_column_name=>'POSITIONNAME'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000052)
,p_db_column_name=>'GRADENAME'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Grade'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000053)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000054)
,p_db_column_name=>'BUSINESSUNIT'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Business Unit'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000055)
,p_db_column_name=>'LEGALEMPLOYER'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Legal Employer'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000056)
,p_db_column_name=>'MANAGERNAME'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Manager'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000057)
,p_db_column_name=>'FULLPARTTIME'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'FT/PT'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000058)
,p_db_column_name=>'SERVICEYEARS'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Svc Yrs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000059)
,p_db_column_name=>'ASSIGNMENTSTATUS'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000061)
,p_db_column_name=>'ACTIONCODE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Action'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(700000001000062)
,p_db_column_name=>'SOURCESYSTEM_SEARCH'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Source Search'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- ---- Default Report ----
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(700000001000063)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'ASGN4001'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SOURCESYSTEM:PERSONNUMBER:DISPLAYNAME:STARTDATE:DEPARTMENTNAME:JOBNAME:POSITIONNAME:GRADENAME:LOCATIONNAME:MANAGERNAME:SERVICEYEARS:ASSIGNMENTSTATUS:ACTIONCODE'
);
-- ============================================================
-- Region: filters
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(700000001000021)
,p_plug_name=>'filters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
-- ============================================================
-- Region: KPI Cards
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(700000001000022)
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
'    to_char(fusion_people, ''FM999G999G999G990'') || '' Employees'' as card_subtitle,',
'    null as secondary_body,',
'    ''Assignments: '' || to_char(fusion_cnt, ''FM999G999G999G990'')',
'        || case',
'            when :P4001_TOTAL_ROWS is not null',
unistr('            and to_number(:P4001_TOTAL_ROWS) > fusion_people then chr(10) || ''\26A0 Showing '' || to_char(fusion_people, ''FM999G999G999G990'') || '' of '' || to_char(to_number(:P4001_TOTAL_ROWS), ''FM999G999G999G990'') || '' \2014 refine search'''),
'        end as card_body,',
'    ''fa fa-cloud'' as card_icon,',
'    case',
'        when :P4001_TOTAL_ROWS is not null',
'        and to_number(:P4001_TOTAL_ROWS) > fusion_people then ''kpiCard kpiCard--fusion kpiCard--warn''',
'        else ''kpiCard kpiCard--fusion''',
'    end as css_class',
'from',
'    (',
'        select',
'            count(*) as fusion_cnt,',
'            count(distinct c.n001) as fusion_people',
'        from',
'            apex_collections c',
'        where',
'            c.collection_name = ''FUSION_ASSIGNMENT_ROWS''',
'    )',
'union all',
'/* ========================= 2) LEGACY ========================= */',
'select',
'    2,',
'    ''Legacy'',',
'    to_char(asgn_cnt, ''FM999G999G999G990'') || '' Records'',',
'    null,',
'    ''People: '' || to_char(people_cnt, ''FM999G999G999G990'') || chr(10) || ''All Historical'',',
'    ''fa fa-database'',',
'    ''kpiCard kpiCard--legacy kpiCard--infor''',
'from',
'    (',
'        select',
'            count(*) asgn_cnt,',
'            count(distinct personid) people_cnt',
'        from',
'            demo_assignment_hist',
'        where',
'            upper(displayname) like ''%'' || upper(:P4001_LAST_NAME) || ''%''',
'            and (',
'                nullif(:P4001_DEPARTMENT, '''') is null',
'                or departmentname = :P4001_DEPARTMENT',
'            )',
'            and sourcesystem = ''Legacy''',
'    )',
'union all',
'/* ========================= 3) EBS ========================= */',
'select',
'    3,',
'    ''EBS'',',
'    to_char(asgn_cnt, ''FM999G999G999G990'') || '' Records'',',
'    null,',
'    ''People: '' || to_char(people_cnt, ''FM999G999G999G990'') || chr(10) || ''All Historical'',',
'    ''fa fa-database'',',
'    ''kpiCard kpiCard--legacy kpiCard--lawson''',
'from',
'    (',
'        select',
'            count(*) asgn_cnt,',
'            count(distinct personid) people_cnt',
'        from',
'            demo_assignment_hist',
'        where',
'            upper(displayname) like ''%'' || upper(:P4001_LAST_NAME) || ''%''',
'            and (',
'                nullif(:P4001_DEPARTMENT, '''') is null',
'                or departmentname = :P4001_DEPARTMENT',
'            )',
'            and sourcesystem = ''EBS''',
'    )',
'union all',
'/* ========================= 4) TOTAL ========================= */',
'select',
'    4,',
'    ''Total (All Systems)'',',
'    to_char(total_cnt, ''FM999G999G999G990'') || '' Records'',',
'    null,',
'    ''People: '' || to_char(total_people, ''FM999G999G999G990'') || chr(10)',
'        || ''Record mix: Fusion '' || to_char(fusion_pct, ''FM990D0'') || ''% / Legacy '' || to_char(legacy_pct, ''FM990D0'') || ''%''',
'        || case',
'            when :P4001_TOTAL_ROWS is not null',
unistr('            and to_number(:P4001_TOTAL_ROWS) > fusion_people then chr(10) || ''\26A0 Fusion results truncated \2014 totals/mix based on returned rows'''),
'        end,',
'    ''fa fa-layers'',',
'    case',
'        when :P4001_TOTAL_ROWS is not null',
'        and to_number(:P4001_TOTAL_ROWS) > fusion_people then ''kpiCard kpiCard--total kpiCard--warn''',
'        else ''kpiCard kpiCard--total''',
'    end',
'from',
'    (',
'        with f as (',
'            select count(*) as fusion_cnt, count(distinct c.n001) as fusion_people',
'            from apex_collections c',
'            where c.collection_name = ''FUSION_ASSIGNMENT_ROWS''',
'        ),',
'        l as (',
'            select count(*) as legacy_cnt, count(distinct personid) as legacy_people',
'            from demo_assignment_hist',
'            where upper(displayname) like ''%'' || upper(:P4001_LAST_NAME) || ''%''',
'              and (nullif(:P4001_DEPARTMENT, '''') is null or departmentname = :P4001_DEPARTMENT)',
'        )',
'        select f.fusion_cnt, f.fusion_people, l.legacy_cnt, l.legacy_people,',
'            (f.fusion_cnt + l.legacy_cnt) as total_cnt,',
'            (f.fusion_people + l.legacy_people) as total_people,',
'            case when (f.fusion_cnt + l.legacy_cnt) = 0 then 0',
'                 else round(100 * f.fusion_cnt / (f.fusion_cnt + l.legacy_cnt), 1) end as fusion_pct,',
'            case when (f.fusion_cnt + l.legacy_cnt) = 0 then 0',
'                 else round(100 * l.legacy_cnt / (f.fusion_cnt + l.legacy_cnt), 1) end as legacy_pct',
'        from f cross join l',
'    );'))
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P4001_LAST_NAME,P4001_DEPARTMENT,P4001_TOTAL_ROWS'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(700000001000023)
,p_region_id=>wwv_flow_imp.id(700000001000022)
,p_layout_type=>'GRID'
,p_grid_column_count=>4
,p_title_adv_formatting=>false
,p_title_column_name=>'CARD_TITLE'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'CARD_SUBTITLE'
,p_body_adv_formatting=>false
,p_body_column_name=>'CARD_BODY'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'SECONDARY_BODY'
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_class_column_name=>'CARD_ICON'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
);
-- ============================================================
-- Page Items
-- ============================================================
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(700000001000030)
,p_name=>'P4001_LAST_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(700000001000021)
,p_prompt=>'Last Name'
,p_placeholder=>'Enter last name and press Tab...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2526760407498498498
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(700000001000031)
,p_name=>'P4001_DEPARTMENT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(700000001000021)
,p_prompt=>'Department'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760407498498498
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(700000001000033)
,p_name=>'P4001_TOTAL_ROWS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(700000001000021)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
-- ============================================================
-- Dynamic Action: load_assignments
-- ============================================================
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(700000001000071)
,p_name=>'load_assignments'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4001_LAST_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
-- Step 1: Execute PL/SQL
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(700000001000072)
,p_event_id=>wwv_flow_imp.id(700000001000071)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'call assignment_pkg'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  assignment_pkg.load_assignments(',
'    p_last_name  => :P4001_LAST_NAME,',
'    p_department => :P4001_DEPARTMENT',
'  );',
'  :P4001_TOTAL_ROWS := assignment_pkg.g_total_rows;',
'end;'))
,p_attribute_02=>'P4001_LAST_NAME,P4001_DEPARTMENT'
,p_attribute_03=>'P4001_TOTAL_ROWS'
,p_attribute_04=>'N'
,p_wait_for_result=>'Y'
);
-- Step 2: Refresh KPI
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(700000001000073)
,p_event_id=>wwv_flow_imp.id(700000001000071)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'refresh KPI'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(700000001000022)
,p_attribute_01=>'N'
);
-- Step 3: Refresh IR
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(700000001000074)
,p_event_id=>wwv_flow_imp.id(700000001000071)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'refresh IR'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(700000001000019)
,p_attribute_01=>'N'
);
-- Step 4-7: Refresh Charts
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(700000001000075)
,p_event_id=>wwv_flow_imp.id(700000001000071)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'refresh chart dept'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(700000001000003)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(700000001000076)
,p_event_id=>wwv_flow_imp.id(700000001000071)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'refresh chart job'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(700000001000008)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(700000001000077)
,p_event_id=>wwv_flow_imp.id(700000001000071)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'refresh chart location'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(700000001000011)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(700000001000078)
,p_event_id=>wwv_flow_imp.id(700000001000071)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'refresh chart svc yrs'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(700000001000014)
,p_attribute_01=>'N'
);
-- ============================================================
-- DA: refresh on department change (legacy table filter only)
-- ============================================================
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(700000001000081)
,p_name=>'filter_change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4001_DEPARTMENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(700000001000082)
,p_event_id=>wwv_flow_imp.id(700000001000081)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'refresh KPI'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(700000001000022)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(700000001000083)
,p_event_id=>wwv_flow_imp.id(700000001000081)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'refresh IR'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(700000001000019)
,p_attribute_01=>'N'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
