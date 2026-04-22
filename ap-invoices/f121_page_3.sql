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
,p_default_workspace_id=><insert workspace id here>
,p_default_application_id=>121
,p_default_id_offset=>0
,p_default_owner=>'WKSP_FREEDEMO'
);
end;
/
 
prompt APPLICATION 121 - Fusion Integrated Sample App (your-instance)
--
-- Application Export:
--   Application:     121
--   Name:            Fusion Integrated Sample App (your-instance)
--   Exported By:     JOHN.KOLDEN@SIERRA-CEDAR.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 3
--   Manifest End
--   Version:         24.2.15
--   Instance ID:     8325348246048613
--

begin
null;
end;
/
prompt --application/pages/delete_00003
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>3);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'Suppliers'
,p_alias=>'SUPPLIERS1'
,p_step_title=>'Suppliers'
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
'  white-space: pre-line !important; /* this makes \n show as line breaks */',
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
'/* Color by rownum (this is stable as long as your query ORDER BY is stable) */',
'#kpiBySource li.a-CardView-item[data-rownum="1"] .a-CardView::before{ background: #2563eb; }',
'#kpiBySource li.a-CardView-item[data-rownum="2"] .a-CardView::before{ background: #9333ea; } /* Infor */',
'#kpiBySource li.a-CardView-item[data-rownum="3"] .a-CardView::before{ background: #16a34a; } /* Lawson */',
'',
'/* Make the icon pill pick up the same accent color */',
'#kpiBySource li.a-CardView-item[data-rownum="1"] .a-CardView-header .a-CardView-icon{',
'background: rgba(37, 99, 235, .14) !important;',
'  color: #2563eb !important;',
'}',
'#kpiBySource li.a-CardView-item[data-rownum="2"] .a-CardView-header .a-CardView-icon {',
'  background: rgba(147, 51, 234, .14) !important; /* Infor */',
'  color: #9333ea !important;',
'}',
'#kpiBySource li.a-CardView-item[data-rownum="3"] .a-CardView-header .a-CardView-icon {',
'  background: rgba(22, 163, 74, .14) !important;  /* Lawson */',
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
'#kpiBySource li.a-CardView-item[data-rownum="4"] .a-CardView::before{ background: #f59e0b; } /* amber */',
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
'/* Ideally scope to your region Static ID, example: #P7_CARDS */',
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32606095953228649)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32605929167228648)
,p_plug_name=>'Analytics'
,p_parent_plug_id=>wwv_flow_imp.id(32606095953228649)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45095403637929801)
,p_plug_name=>'Fusion invoices by Validation Status '
,p_parent_plug_id=>wwv_flow_imp.id(32605929167228648)
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
 p_id=>wwv_flow_imp.id(45095671851929803)
,p_region_id=>wwv_flow_imp.id(45095403637929801)
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
 p_id=>wwv_flow_imp.id(45095794060929804)
,p_chart_id=>wwv_flow_imp.id(45095671851929803)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  nvl(c.c006, ''Unknown'') as validation_status,',
'  count(*)              as invoice_cnt,',
'  nvl(sum(c.n002), 0)   as invoice_amt',
'from apex_collections c',
'where c.collection_name = ''FUSION_INVOICE_ROWS''',
'group by nvl(c.c006, ''Unknown'')',
'order by invoice_amt desc;',
''))
,p_items_value_column_name=>'INVOICE_CNT'
,p_items_label_column_name=>'VALIDATION_STATUS'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(45095898273929805)
,p_chart_id=>wwv_flow_imp.id(45095671851929803)
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
 p_id=>wwv_flow_imp.id(45095965759929806)
,p_chart_id=>wwv_flow_imp.id(45095671851929803)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45096116487929808)
,p_plug_name=>'Fusion invoices by Paid Status'
,p_parent_plug_id=>wwv_flow_imp.id(32605929167228648)
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
 p_id=>wwv_flow_imp.id(45096204024929809)
,p_region_id=>wwv_flow_imp.id(45096116487929808)
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
 p_id=>wwv_flow_imp.id(45096353858929810)
,p_chart_id=>wwv_flow_imp.id(45096204024929809)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  nvl(c.c008, ''Unknown'') as paid_status,',
'  count(*)               as invoice_cnt,',
'  nvl(sum(c.n002), 0)    as invoice_amt',
'from apex_collections c',
'where c.collection_name = ''FUSION_INVOICE_ROWS''',
'group by nvl(c.c008, ''Unknown'')',
'order by invoice_amt desc;',
''))
,p_items_value_column_name=>'INVOICE_CNT'
,p_items_label_column_name=>'PAID_STATUS'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45096743335929814)
,p_plug_name=>'Fusion invoices by Type'
,p_parent_plug_id=>wwv_flow_imp.id(32605929167228648)
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
 p_id=>wwv_flow_imp.id(45096825287929815)
,p_region_id=>wwv_flow_imp.id(45096743335929814)
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
 p_id=>wwv_flow_imp.id(45096914127929816)
,p_chart_id=>wwv_flow_imp.id(45096825287929815)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  invoice_type,',
'  invoice_cnt,',
'  invoice_amt',
'from (',
'  select',
'    nvl(c.c010, ''Unknown'') as invoice_type,',
'    count(*)               as invoice_cnt,',
'    nvl(sum(c.n002), 0)    as invoice_amt',
'  from apex_collections c',
'  where c.collection_name = ''FUSION_INVOICE_ROWS''',
'  group by nvl(c.c010, ''Unknown'')',
'  order by invoice_amt desc',
')',
''))
,p_items_value_column_name=>'INVOICE_AMT'
,p_items_label_column_name=>'INVOICE_TYPE'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45097024631929817)
,p_plug_name=>'Fusion invoices by Month'
,p_parent_plug_id=>wwv_flow_imp.id(32605929167228648)
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
 p_id=>wwv_flow_imp.id(45097126985929818)
,p_region_id=>wwv_flow_imp.id(45097024631929817)
,p_chart_type=>'line'
,p_height=>'200'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'smooth'
,p_hide_and_show_behavior=>'withRescale'
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
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(45097268218929819)
,p_chart_id=>wwv_flow_imp.id(45097126985929818)
,p_seq=>10
,p_name=>'Count'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  trunc(c.d001, ''MM'')     as month_start,',
'  to_char(trunc(c.d001,''MM''), ''YYYY-MM'') as month_label,',
'  count(*)                as invoice_cnt,',
'  nvl(sum(c.n002), 0)     as invoice_amt',
'from apex_collections c',
'where c.collection_name = ''FUSION_INVOICE_ROWS''',
'  and c.d001 is not null',
'group by trunc(c.d001, ''MM'')',
'order by month_start;',
''))
,p_items_value_column_name=>'INVOICE_CNT'
,p_items_label_column_name=>'MONTH_LABEL'
,p_line_style=>'solid'
,p_line_type=>'curved'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(45097355992929820)
,p_chart_id=>wwv_flow_imp.id(45097126985929818)
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
 p_id=>wwv_flow_imp.id(45097424742929821)
,p_chart_id=>wwv_flow_imp.id(45097126985929818)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(105568481669575214)
,p_plug_name=>'Invoices'
,p_region_name=>'invoices'
,p_parent_plug_id=>wwv_flow_imp.id(32606095953228649)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  /* Collection seq_id is a nice stable id within the session */',
'  c.seq_id as id,',
'  ''Fusion'' as SourceSystem,',
'  ''Fusion'' as SourceSystem_search,',
'',
'  c.n001 as InvoiceId,',
'  c.c001 as InvoiceNumber,',
'  c.n002 as InvoiceAmount,',
'  c.d001 as InvoiceDate,',
'  c.d002 as AccountingDate,',
'  case when c.c002 = ''Greenville County Schools'' then ''Main BU'' end as BusinessUnit,',
'  c.c003 as Supplier,',
'  c.c004 as SupplierNumber,',
'  c.c005 as SupplierSite,',
'  c.c006 as ValidationStatus,',
'  c.c007 as ApprovalStatus,',
'  c.c008 as PaidStatus,',
'  c.c009 as AccountingStatus,',
'  c.c010 as InvoiceType,',
'  c.c011 as PaymentTerms,',
'  c.c012 as InvoiceSource,',
'  c.c013 as Description,',
'  c.c014 as PurchaseOrderNumber,',
'',
'  apex_page.get_url(',
'    p_page        => 410,',
'    p_clear_cache => 410,',
'    p_items       => ''P410_INVOICE_ID'',',
'    p_values      => c.n001',
'  ) as invoice_lines_url',
'from apex_collections c',
'where c.collection_name = ''FUSION_INVOICE_ROWS''',
'',
'union all',
'',
'select',
'  null as id,',
'  d.SourceSystem,',
'  d.SourceSystem as SourceSystem_search,',
'  d.InvoiceId,',
'  d.InvoiceNumber,',
'  d.InvoiceAmount,',
'  d.InvoiceDate,',
'  d.AccountingDate,',
'  case when d.businessunit = ''Greenville County Schools'' then ''Main BU'' end as BusinessUnit,',
'  d.Supplier,',
'  d.SupplierNumber,',
'  d.SupplierSite,',
'  d.ValidationStatus,',
'  d.ApprovalStatus,',
'  d.PaidStatus,',
'  d.AccountingStatus,',
'  d.InvoiceType,',
'  d.PaymentTerms,',
'  d.InvoiceSource,',
'  d.Description,',
'  d.PurchaseOrderNumber,',
'',
'  apex_page.get_url(',
'    p_page        => 420,',
'    p_clear_cache => 420,',
'    p_items       => ''P420_INVOICE_ID'',',
'    p_values      => d.InvoiceId',
'  ) as invoice_lines_url',
'from demo_ap_invoices_hist d',
'where d.Supplier = :P3_SUPPLIER_NAME',
'  and ( nullif(:P3_VALIDATION,'''') is null',
'        or d.ValidationStatus = :P3_VALIDATION );',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P3_SUPPLIER_NAME,P3_VALIDATION,P3_FROM_DATE'
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
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(105568624714575215)
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
,p_internal_uid=>105568624714575215
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105568769167575217)
,p_db_column_name=>'INVOICEID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Invoiceid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105568939204575218)
,p_db_column_name=>'INVOICENUMBER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Invoice Number'
,p_column_link=>'#INVOICE_LINES_URL#'
,p_column_linktext=>'#INVOICENUMBER#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105569240779575221)
,p_db_column_name=>'INVOICEAMOUNT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105569342815575222)
,p_db_column_name=>'INVOICEDATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105569365861575223)
,p_db_column_name=>'BUSINESSUNIT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Business Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105569484061575224)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105569637909575225)
,p_db_column_name=>'SUPPLIERNUMBER'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Supplier Number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105569815335575227)
,p_db_column_name=>'SUPPLIERSITE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Supplier Site'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105570553272575234)
,p_db_column_name=>'ACCOUNTINGDATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Accounting Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105570574424575235)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105571232031575241)
,p_db_column_name=>'INVOICETYPE'
,p_display_order=>260
,p_column_identifier=>'U'
,p_column_label=>'Invoice Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(105572103397575250)
,p_db_column_name=>'PAYMENTTERMS'
,p_display_order=>350
,p_column_identifier=>'AD'
,p_column_label=>'Paymentterms'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(106646829514661615)
,p_db_column_name=>'APPROVALSTATUS'
,p_display_order=>500
,p_column_identifier=>'AM'
,p_column_label=>'Approval Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(106646904860661616)
,p_db_column_name=>'PAIDSTATUS'
,p_display_order=>510
,p_column_identifier=>'AN'
,p_column_label=>'Paid Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(106647002893661617)
,p_db_column_name=>'ACCOUNTINGSTATUS'
,p_display_order=>520
,p_column_identifier=>'AO'
,p_column_label=>'Accounting Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(106647546446661622)
,p_db_column_name=>'PURCHASEORDERNUMBER'
,p_display_order=>570
,p_column_identifier=>'AT'
,p_column_label=>'PO Number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(106651930824661716)
,p_db_column_name=>'SOURCESYSTEM'
,p_display_order=>590
,p_column_identifier=>'BV'
,p_column_label=>'Source System'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="srcBadge" data-src="#SOURCESYSTEM#">#SOURCESYSTEM#</span>',
'',
''))
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(106652031687661717)
,p_db_column_name=>'VALIDATIONSTATUS'
,p_display_order=>600
,p_column_identifier=>'BW'
,p_column_label=>'Validation Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(106652127205661718)
,p_db_column_name=>'INVOICESOURCE'
,p_display_order=>610
,p_column_identifier=>'BX'
,p_column_label=>'Source'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(106809610589263207)
,p_db_column_name=>'SOURCESYSTEM_SEARCH'
,p_display_order=>620
,p_column_identifier=>'BY'
,p_column_label=>'Sourcesystem Search'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(77390166236400592)
,p_db_column_name=>'INVOICE_LINES_URL'
,p_display_order=>630
,p_column_identifier=>'BZ'
,p_column_label=>'Invoice Lines Url'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(32605604969228645)
,p_db_column_name=>'ID'
,p_display_order=>640
,p_column_identifier=>'CA'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(106679660892679548)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'296015'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SOURCESYSTEM:INVOICENUMBER:INVOICEAMOUNT:INVOICEDATE:BUSINESSUNIT:SUPPLIER:SUPPLIERNUMBER:SUPPLIERSITE:ACCOUNTINGDATE:DESCRIPTION:INVOICETYPE:APPROVALSTATUS:PAIDSTATUS:ACCOUNTINGSTATUS:VALIDATIONSTATUS:PURCHASEORDERNUMBER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32606179079228650)
,p_plug_name=>'filters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(106652204458661719)
,p_plug_name=>'KPI'
,p_region_name=>'kpiBySource'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* ========================= 1) FUSION (from shredded collection) ========================= */',
'select',
'    1 as sort_order,',
'    ''Fusion'' as card_title,',
'    to_char(fusion_amt, ''FM$999G999G999G990D00'') as card_subtitle,',
'    case',
'        when :P3_FROM_DATE is not null then ''From '' || :P3_FROM_DATE || '' To '' || :P3_TO_DATE',
'    end as secondary_body,',
'    ''Invoices: '' || to_char(fusion_cnt, ''FM999G999G999G990'') || chr(10) || ''Unpaid: '' || to_char(fusion_unpaid_cnt, ''FM999G999G999G990'') || '' ('' || to_char(fusion_unpaid_amt, ''FM$999G999G999G990D00'') || '')'' || case',
'        when :P3_TOTAL_ROWS is not null',
unistr('        and to_number(:P3_TOTAL_ROWS) > fusion_cnt then chr(10) || ''\26A0 Showing '' || to_char(fusion_cnt, ''FM999G999G999G990'') || '' of '' || to_char(to_number(:P3_TOTAL_ROWS), ''FM999G999G999G990'') || '' \2014 please refine filters to see full data set'''),
'    end as card_body,',
'    ''fa fa-cloud'' as card_icon,',
'    case',
'        when :P3_TOTAL_ROWS is not null',
'        and to_number(:P3_TOTAL_ROWS) > fusion_cnt then ''kpiCard kpiCard--fusion kpiCard--warn''',
'        else ''kpiCard kpiCard--fusion''',
'    end as css_class',
'from',
'    (',
'        select',
'            count(*) as fusion_cnt,',
'            nvl(sum(c.n002), 0) as fusion_amt,',
'            sum(',
'                case',
'                    when c.c008 = ''Unpaid'' then 1',
'                    else 0',
'                end',
'            ) as fusion_unpaid_cnt,',
'            nvl(',
'                sum(',
'                    case',
'                        when c.c008 = ''Unpaid'' then c.n002',
'                        else 0',
'                    end',
'                ),',
'                0',
'            ) as fusion_unpaid_amt,',
'            sum(',
'                case',
'                    when c.c007 = ''Required'' then 1',
'                    else 0',
'                end',
'            ) as fusion_req_appr_cnt',
'        from',
'            apex_collections c',
'        where',
'            c.collection_name = ''FUSION_INVOICE_ROWS''',
'    ) f',
'    /* ========================= 2) INFOR ========================= */',
'union',
'all',
'select',
'    2,',
'    ''Legacy'',',
'    to_char(inv_amt, ''FM$999G999G999G990D00''),',
'    null as secondary_body,',
'    ''Invoices: '' || to_char(inv_cnt, ''FM999G999G999G990'') || chr(10) || ''Closed (Paid/Approved)'',',
'    ''fa fa-database'' as card_icon,',
'    ''kpiCard kpiCard--legacy kpiCard--infor'' as css_class',
'from',
'    (',
'        select',
'            count(*) inv_cnt,',
'            nvl(sum(invoiceamount), 0) inv_amt',
'        from',
'            demo_ap_invoices_hist',
'        where',
'            supplier = :P3_SUPPLIER_NAME',
'            and (',
'                nullif(:P3_VALIDATION, '''') is null',
'                or ValidationStatus = :P3_VALIDATION',
'            )',
'            and sourcesystem = ''Legacy''',
'    )',
'    /* ========================= 3) LAWSON ========================= */',
'union',
'all',
'select',
'    3,',
'    ''EBS'',',
'    to_char(inv_amt, ''FM$999G999G999G990D00''),',
'    null as secondary_body,',
'    ''Invoices: '' || to_char(inv_cnt, ''FM999G999G999G990'') || chr(10) || ''Closed (Paid/Approved)'',',
'    ''fa fa-database'' as card_icon,',
'    ''kpiCard kpiCard--legacy kpiCard--lawson'' as css_class',
'from',
'    (',
'        select',
'            count(*) inv_cnt,',
'            nvl(sum(invoiceamount), 0) inv_amt',
'        from',
'            demo_ap_invoices_hist',
'        where',
'            supplier = :P3_SUPPLIER_NAME',
'            and (',
'                nullif(:P3_VALIDATION, '''') is null',
'                or ValidationStatus = :P3_VALIDATION',
'            )',
'            and sourcesystem = ''EBS''',
'    )',
'    /* ========================= 4) TOTAL (Fusion + Legacy) ========================= */',
'union',
'all',
'select',
'    4,',
'    ''Total (Fusion + Legacy)'' as card_title,',
'    to_char(total_amt, ''FM$999G999G999G990D00'') as card_subtitle,',
'    null as secondary_body,',
'    ''Invoices: '' || to_char(total_cnt, ''FM999G999G999G990'') || chr(10) || ''Spend mix: Fusion '' || to_char(fusion_spend_pct, ''FM990D0'') || ''% / Legacy '' || to_char(legacy_spend_pct, ''FM990D0'') || ''%'' || chr(10) || ''Invoice mix: Fusion '' || to_char(fus'
||'ion_cnt_pct, ''FM990D0'') || ''% / Legacy '' || to_char(legacy_cnt_pct, ''FM990D0'') || ''%'' || chr(10) || ''Fusion unpaid: '' || to_char(fusion_unpaid_cnt, ''FM999G999G999G990'') || '' ('' || to_char(fusion_unpaid_amt, ''FM$999G999G999G990D00'') || '')'' || case',
'        when :P3_TOTAL_ROWS is not null',
unistr('        and to_number(:P3_TOTAL_ROWS) > fusion_cnt then chr(10) || ''\26A0 Fusion results truncated \2014 totals/mix based on returned rows'''),
'    end as card_body,',
'    ''fa fa-layers'' as card_icon,',
'    case',
'        when :P3_TOTAL_ROWS is not null',
'        and to_number(:P3_TOTAL_ROWS) > fusion_cnt then ''kpiCard kpiCard--total kpiCard--warn''',
'        else ''kpiCard kpiCard--total''',
'    end as css_class',
'from',
'    (',
'        with f as (',
'            select',
'                count(*) as fusion_cnt,',
'                nvl(sum(c.n002), 0) as fusion_amt,',
'                sum(',
'                    case',
'                        when c.c008 = ''Unpaid'' then 1',
'                        else 0',
'                    end',
'                ) as fusion_unpaid_cnt,',
'                nvl(',
'                    sum(',
'                        case',
'                            when c.c008 = ''Unpaid'' then c.n002',
'                            else 0',
'                        end',
'                    ),',
'                    0',
'                ) as fusion_unpaid_amt',
'            from',
'                apex_collections c',
'            where',
'                c.collection_name = ''FUSION_INVOICE_ROWS''',
'        ),',
'        l as (',
'            select',
'                count(*) as legacy_cnt,',
'                nvl(sum(invoiceamount), 0) as legacy_amt',
'            from',
'                demo_ap_invoices_hist',
'            where',
'                supplier = :P3_SUPPLIER_NAME',
'                and (',
'                    nullif(:P3_VALIDATION, '''') is null',
'                    or ValidationStatus = :P3_VALIDATION',
'                )',
'        )',
'        select',
'            f.fusion_cnt,',
'            l.legacy_cnt,',
'            f.fusion_amt,',
'            l.legacy_amt,',
'            (f.fusion_cnt + l.legacy_cnt) as total_cnt,',
'            (f.fusion_amt + l.legacy_amt) as total_amt,',
'            case',
'                when (f.fusion_amt + l.legacy_amt) = 0 then 0',
'                else round(',
'                    100 * f.fusion_amt / (f.fusion_amt + l.legacy_amt),',
'                    1',
'                )',
'            end as fusion_spend_pct,',
'            case',
'                when (f.fusion_amt + l.legacy_amt) = 0 then 0',
'                else round(',
'                    100 * l.legacy_amt / (f.fusion_amt + l.legacy_amt),',
'                    1',
'                )',
'            end as legacy_spend_pct,',
'            case',
'                when (f.fusion_cnt + l.legacy_cnt) = 0 then 0',
'                else round(',
'                    100 * f.fusion_cnt / (f.fusion_cnt + l.legacy_cnt),',
'                    1',
'                )',
'            end as fusion_cnt_pct,',
'            case',
'                when (f.fusion_cnt + l.legacy_cnt) = 0 then 0',
'                else round(',
'                    100 * l.legacy_cnt / (f.fusion_cnt + l.legacy_cnt),',
'                    1',
'                )',
'            end as legacy_cnt_pct,',
'            f.fusion_unpaid_cnt,',
'            f.fusion_unpaid_amt',
'        from',
'            f',
'            cross join l',
'    );'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P3_SUPPLIER_NAME,P3_VALIDATION,P3_FROM_DATE,P3_TO_DATE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(44883499065098995)
,p_region_id=>wwv_flow_imp.id(106652204458661719)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32604559027228634)
,p_name=>'P3_TOTAL_ROWS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(32606179079228650)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(32604663029228635)
,p_name=>'P3_TO_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(32606179079228650)
,p_prompt=>'To'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(y) d, to_char(y) r',
'from (',
'  select (from_y + level - 1) as y',
'  from (',
'    select',
'      case',
'        when :P3_FROM_DATE is null then extract(year from trunc(current_date,''YYYY'')) - 9',
'        else to_number(:P3_FROM_DATE)',
'      end as from_y,',
'      extract(year from trunc(current_date,''YYYY'')) as to_y',
'    from dual',
'  )',
'  connect by level <= (to_y - from_y + 1)',
')',
'order by y',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P3_FROM_DATE'
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
 p_id=>wwv_flow_imp.id(77401991752400648)
,p_name=>'P3_FUSION_TOTAL_RESULTS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(105568481669575214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(105590913347575304)
,p_name=>'P3_SUPPLIER_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(32606179079228650)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(105591920220575321)
,p_name=>'P3_SUPPLIERS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(32606179079228650)
,p_prompt=>'Suppliers'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SUPPLIERS'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'SUPPLIERNAME:P3_SUPPLIER_NAME',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(106833481397263319)
,p_name=>'P3_VALIDATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(32606179079228650)
,p_prompt=>'Validation Status (Optional)'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Validated;Validated,Not Validated;Not validated,Needs Revalidation;Needs revalidation,Canceled;Canceled'
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
 p_id=>wwv_flow_imp.id(106833829566263323)
,p_name=>'P3_FROM_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(32606179079228650)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(44898912824099038)
,p_name=>'on change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_FROM_DATE, P3_TO_DATE, P3_SUPPLIER_NAME, P3_VALIDATION'
,p_condition_element=>'P3_TO_DATE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(32604789389228636)
,p_event_id=>wwv_flow_imp.id(44898912824099038)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_start_date date;',
'  l_end_date   date;',
'begin',
'  l_start_date := to_date(:P3_FROM_DATE || ''-01-01'', ''YYYY-MM-DD'');',
'  l_end_date   := add_months(to_date(:P3_TO_DATE || ''-01-01'', ''YYYY-MM-DD''), 12) - 1; -- Dec 31',
'',
'  invoice_pkg.load_invoices(',
'    p_start_date => l_start_date,',
'    p_end_date   => l_end_date,',
'    p_supplier   => :P3_SUPPLIER_NAME,',
'    p_status     => :P3_VALIDATION',
'  );',
'',
'  :P3_TOTAL_ROWS := invoice_pkg.g_total_rows;',
'end;',
''))
,p_attribute_02=>'P3_SUPPLIER_NAME,P3_FROM_DATE,P3_TO_DATE,P3_VALIDATION,P3_SUPPLIERS'
,p_attribute_03=>'P3_TOTAL_ROWS'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(44899975824099039)
,p_event_id=>wwv_flow_imp.id(44898912824099038)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(105568481669575214)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(44899475442099038)
,p_event_id=>wwv_flow_imp.id(44898912824099038)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(106652204458661719)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45096016448929807)
,p_event_id=>wwv_flow_imp.id(44898912824099038)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(45095403637929801)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45096632214929813)
,p_event_id=>wwv_flow_imp.id(44898912824099038)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(45096116487929808)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45097541024929822)
,p_event_id=>wwv_flow_imp.id(44898912824099038)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(45097024631929817)
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
