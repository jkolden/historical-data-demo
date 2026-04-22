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
--     PAGE: 3001
--   Manifest End
--   Version:         24.2.15
--   Instance ID:     8325348246048613
--

begin
null;
end;
/
prompt --application/pages/delete_03001
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>3001);
end;
/
prompt --application/pages/page_03001
begin
wwv_flow_imp_page.create_page(
 p_id=>3001
,p_name=>'Purchase Orders'
,p_alias=>'PURCHASE-ORDERS'
,p_step_title=>'Purchase Orders'
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
'#kpiBySource li.a-CardView-item[data-rownum="2"] .a-CardView::before{ background: #9333ea; }',
'#kpiBySource li.a-CardView-item[data-rownum="3"] .a-CardView::before{ background: #16a34a; }',
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
-- ============================================================
-- Region: region display  (Display Selector)
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600000001000001)
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
-- Region: Analytics  (Tabs container – child of region display)
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600000001000002)
,p_plug_name=>'Analytics'
,p_parent_plug_id=>wwv_flow_imp.id(600000001000001)
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
-- Chart 1: Fusion POs by Status  (bar, horizontal)
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600000001000003)
,p_plug_name=>'Fusion POs by Status'
,p_parent_plug_id=>wwv_flow_imp.id(600000001000002)
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
 p_id=>wwv_flow_imp.id(600000001000004)
,p_region_id=>wwv_flow_imp.id(600000001000003)
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
 p_id=>wwv_flow_imp.id(600000001000005)
,p_chart_id=>wwv_flow_imp.id(600000001000004)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  nvl(c.c005, ''Unknown'') as po_status,',
'  count(*)              as po_cnt,',
'  nvl(sum(c.n002), 0)   as po_amt',
'from apex_collections c',
'where c.collection_name = ''FUSION_PO_ROWS''',
'group by nvl(c.c005, ''Unknown'')',
'order by po_amt desc;',
''))
,p_items_value_column_name=>'PO_CNT'
,p_items_label_column_name=>'PO_STATUS'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(600000001000006)
,p_chart_id=>wwv_flow_imp.id(600000001000004)
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
 p_id=>wwv_flow_imp.id(600000001000007)
,p_chart_id=>wwv_flow_imp.id(600000001000004)
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
-- Chart 2: Fusion POs by Funds Status  (donut)
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600000001000008)
,p_plug_name=>'Fusion POs by Funds Status'
,p_parent_plug_id=>wwv_flow_imp.id(600000001000002)
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
 p_id=>wwv_flow_imp.id(600000001000009)
,p_region_id=>wwv_flow_imp.id(600000001000008)
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
 p_id=>wwv_flow_imp.id(600000001000010)
,p_chart_id=>wwv_flow_imp.id(600000001000009)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  nvl(c.c012, ''Unknown'') as funds_status,',
'  count(*)               as po_cnt,',
'  nvl(sum(c.n002), 0)    as po_amt',
'from apex_collections c',
'where c.collection_name = ''FUSION_PO_ROWS''',
'group by nvl(c.c012, ''Unknown'')',
'order by po_amt desc;',
''))
,p_items_value_column_name=>'PO_CNT'
,p_items_label_column_name=>'FUNDS_STATUS'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
-- ============================================================
-- Chart 3: Fusion POs by Buyer  (pie)
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600000001000011)
,p_plug_name=>'Fusion POs by Buyer'
,p_parent_plug_id=>wwv_flow_imp.id(600000001000002)
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
 p_id=>wwv_flow_imp.id(600000001000012)
,p_region_id=>wwv_flow_imp.id(600000001000011)
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
 p_id=>wwv_flow_imp.id(600000001000013)
,p_chart_id=>wwv_flow_imp.id(600000001000012)
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  buyer_name,',
'  po_cnt,',
'  po_amt',
'from (',
'  select',
'    nvl(c.c006, ''Unknown'') as buyer_name,',
'    count(*)               as po_cnt,',
'    nvl(sum(c.n002), 0)    as po_amt',
'  from apex_collections c',
'  where c.collection_name = ''FUSION_PO_ROWS''',
'  group by nvl(c.c006, ''Unknown'')',
'  order by po_amt desc',
')',
''))
,p_items_value_column_name=>'PO_AMT'
,p_items_label_column_name=>'BUYER_NAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
);
-- ============================================================
-- Chart 4: Fusion POs by Month  (line)
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600000001000014)
,p_plug_name=>'Fusion POs by Month'
,p_parent_plug_id=>wwv_flow_imp.id(600000001000002)
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
 p_id=>wwv_flow_imp.id(600000001000015)
,p_region_id=>wwv_flow_imp.id(600000001000014)
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
 p_id=>wwv_flow_imp.id(600000001000016)
,p_chart_id=>wwv_flow_imp.id(600000001000015)
,p_seq=>10
,p_name=>'Count'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  trunc(c.d001, ''MM'')     as month_start,',
'  to_char(trunc(c.d001,''MM''), ''YYYY-MM'') as month_label,',
'  count(*)                as po_cnt,',
'  nvl(sum(c.n002), 0)     as po_amt',
'from apex_collections c',
'where c.collection_name = ''FUSION_PO_ROWS''',
'  and c.d001 is not null',
'group by trunc(c.d001, ''MM'')',
'order by month_start;',
''))
,p_items_value_column_name=>'PO_CNT'
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
 p_id=>wwv_flow_imp.id(600000001000017)
,p_chart_id=>wwv_flow_imp.id(600000001000015)
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
 p_id=>wwv_flow_imp.id(600000001000018)
,p_chart_id=>wwv_flow_imp.id(600000001000015)
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
-- Region: Interactive Report – Purchase Orders
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600000001000019)
,p_plug_name=>'Purchase Orders'
,p_region_name=>'purchase_orders'
,p_parent_plug_id=>wwv_flow_imp.id(600000001000001)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  c.seq_id           as id,',
'  ''Fusion''           as SourceSystem,',
'  ''Fusion''           as SourceSystem_search,',
'',
'  c.n001             as POHeaderId,',
'  c.c001             as OrderNumber,',
'  c.n002             as Ordered,',
'  c.n003             as Total,',
'  c.n004             as Revision,',
'  c.d001             as OrderDate,',
'  c.d002             as CreationDate,',
'  case when c.c002 = ''Greenville County Schools'' then ''Main BU'' end as ProcurementBU,',
'  c.c003             as Supplier,',
'  c.c004             as SupplierSite,',
'  c.c005             as Status,',
'  c.c006             as Buyer,',
'  c.c007             as CurrencyCode,',
'  c.c008             as PaymentTerms,',
'  c.c009             as Description,',
'  c.c010             as ShipToLocationCode,',
'  c.c011             as BillToLocation,',
'  c.c012             as FundsStatus,',
'  c.c013             as Requisition',
'',
'from apex_collections c',
'where c.collection_name = ''FUSION_PO_ROWS''',
'',
'union all',
'',
'select',
'  null               as id,',
'  d.sourcesystem     as SourceSystem,',
'  d.sourcesystem     as SourceSystem_search,',
'',
'  d.poheaderid       as POHeaderId,',
'  d.ordernumber      as OrderNumber,',
'  d.ordered          as Ordered,',
'  d.total            as Total,',
'  d.revision         as Revision,',
'  d.orderdate        as OrderDate,',
'  d.creationdate     as CreationDate,',
'  case when d.procurementbu = ''Greenville County Schools'' then ''Main BU'' end as ProcurementBU,',
'  d.supplier         as Supplier,',
'  d.suppliersite     as SupplierSite,',
'  d.status           as Status,',
'  d.buyer            as Buyer,',
'  d.currencycode     as CurrencyCode,',
'  d.paymentterms     as PaymentTerms,',
'  d.description      as Description,',
'  d.shiptolocationcode as ShipToLocationCode,',
'  d.billtolocation   as BillToLocation,',
'  d.fundsstatus      as FundsStatus,',
'  d.requisition      as Requisition',
'',
'from demo_po_hist d',
'where d.supplier = :P3001_SUPPLIER_NAME',
'  and ( nullif(:P3001_STATUS,'''') is null',
'        or d.status = :P3001_STATUS );',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P3001_SUPPLIER_NAME,P3001_STATUS,P3001_FROM_DATE'
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
 p_id=>wwv_flow_imp.id(600000001000020)
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
,p_internal_uid=>600000001000020
);
-- ---- IR Columns ----
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000040)
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
 p_id=>wwv_flow_imp.id(600000001000060)
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
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000041)
,p_db_column_name=>'POHEADERID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'PO Header Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000042)
,p_db_column_name=>'ORDERNUMBER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Order Number'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000043)
,p_db_column_name=>'ORDERED'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Ordered'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000044)
,p_db_column_name=>'TOTAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Total'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000045)
,p_db_column_name=>'REVISION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Rev'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000046)
,p_db_column_name=>'ORDERDATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Order Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000047)
,p_db_column_name=>'CREATIONDATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Creation Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000048)
,p_db_column_name=>'PROCUREMENTBU'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Procurement BU'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000049)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000050)
,p_db_column_name=>'SUPPLIERSITE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Supplier Site'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000051)
,p_db_column_name=>'STATUS'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000052)
,p_db_column_name=>'BUYER'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Buyer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000053)
,p_db_column_name=>'CURRENCYCODE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Currency'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000054)
,p_db_column_name=>'PAYMENTTERMS'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Payment Terms'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000055)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000056)
,p_db_column_name=>'SHIPTOLOCATIONCODE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Ship To'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000057)
,p_db_column_name=>'BILLTOLOCATION'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Bill To'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000058)
,p_db_column_name=>'FUNDSSTATUS'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Funds Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000059)
,p_db_column_name=>'REQUISITION'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Requisition'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600000001000061)
,p_db_column_name=>'SOURCESYSTEM_SEARCH'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Sourcesystem Search'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- ---- Default Report ----
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(600000001000062)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'PO3001'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SOURCESYSTEM:ORDERNUMBER:ORDERED:TOTAL:ORDERDATE:PROCUREMENTBU:SUPPLIER:SUPPLIERSITE:STATUS:BUYER:DESCRIPTION:SHIPTOLOCATIONCODE:FUNDSSTATUS:REQUISITION'
);
-- ============================================================
-- Region: filters
-- ============================================================
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(600000001000021)
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
 p_id=>wwv_flow_imp.id(600000001000022)
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
'        when :P3001_FROM_DATE is not null then ''From '' || :P3001_FROM_DATE || '' To '' || :P3001_TO_DATE',
'    end as secondary_body,',
'    ''POs: '' || to_char(fusion_cnt, ''FM999G999G999G990'') || chr(10) || ''Open: '' || to_char(fusion_open_cnt, ''FM999G999G999G990'') || '' ('' || to_char(fusion_open_amt, ''FM$999G999G999G990D00'') || '')'' || case',
'        when :P3001_TOTAL_ROWS is not null',
unistr('        and to_number(:P3001_TOTAL_ROWS) > fusion_cnt then chr(10) || ''\26A0 Showing '' || to_char(fusion_cnt, ''FM999G999G999G990'') || '' of '' || to_char(to_number(:P3001_TOTAL_ROWS), ''FM999G999G999G990'') || '' \2014 please refine filters to see full data set'''),
'    end as card_body,',
'    ''fa fa-cloud'' as card_icon,',
'    case',
'        when :P3001_TOTAL_ROWS is not null',
'        and to_number(:P3001_TOTAL_ROWS) > fusion_cnt then ''kpiCard kpiCard--fusion kpiCard--warn''',
'        else ''kpiCard kpiCard--fusion''',
'    end as css_class',
'from',
'    (',
'        select',
'            count(*) as fusion_cnt,',
'            nvl(sum(c.n002), 0) as fusion_amt,',
'            sum(',
'                case',
'                    when c.c005 = ''Open'' then 1',
'                    else 0',
'                end',
'            ) as fusion_open_cnt,',
'            nvl(',
'                sum(',
'                    case',
'                        when c.c005 = ''Open'' then c.n002',
'                        else 0',
'                    end',
'                ),',
'                0',
'            ) as fusion_open_amt',
'        from',
'            apex_collections c',
'        where',
'            c.collection_name = ''FUSION_PO_ROWS''',
'    ) f',
'    /* ========================= 2) LEGACY ========================= */',
'union',
'all',
'select',
'    2,',
'    ''Legacy'',',
'    to_char(po_amt, ''FM$999G999G999G990D00''),',
'    null as secondary_body,',
'    ''POs: '' || to_char(po_cnt, ''FM999G999G999G990'') || chr(10) || ''Closed'',',
'    ''fa fa-database'' as card_icon,',
'    ''kpiCard kpiCard--legacy kpiCard--infor'' as css_class',
'from',
'    (',
'        select',
'            count(*) po_cnt,',
'            nvl(sum(ordered), 0) po_amt',
'        from',
'            demo_po_hist',
'        where',
'            supplier = :P3001_SUPPLIER_NAME',
'            and (',
'                nullif(:P3001_STATUS, '''') is null',
'                or status = :P3001_STATUS',
'            )',
'            and sourcesystem = ''Legacy''',
'    )',
'    /* ========================= 3) EBS ========================= */',
'union',
'all',
'select',
'    3,',
'    ''EBS'',',
'    to_char(po_amt, ''FM$999G999G999G990D00''),',
'    null as secondary_body,',
'    ''POs: '' || to_char(po_cnt, ''FM999G999G999G990'') || chr(10) || ''Closed'',',
'    ''fa fa-database'' as card_icon,',
'    ''kpiCard kpiCard--legacy kpiCard--lawson'' as css_class',
'from',
'    (',
'        select',
'            count(*) po_cnt,',
'            nvl(sum(ordered), 0) po_amt',
'        from',
'            demo_po_hist',
'        where',
'            supplier = :P3001_SUPPLIER_NAME',
'            and (',
'                nullif(:P3001_STATUS, '''') is null',
'                or status = :P3001_STATUS',
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
'    ''POs: '' || to_char(total_cnt, ''FM999G999G999G990'') || chr(10)',
'        || ''Spend mix: Fusion '' || to_char(fusion_spend_pct, ''FM990D0'') || ''% / Legacy '' || to_char(legacy_spend_pct, ''FM990D0'') || ''%'' || chr(10)',
'        || ''PO mix: Fusion '' || to_char(fusion_cnt_pct, ''FM990D0'') || ''% / Legacy '' || to_char(legacy_cnt_pct, ''FM990D0'') || ''%'' || chr(10)',
'        || ''Fusion open: '' || to_char(fusion_open_cnt, ''FM999G999G999G990'') || '' ('' || to_char(fusion_open_amt, ''FM$999G999G999G990D00'') || '')'' || case',
'        when :P3001_TOTAL_ROWS is not null',
unistr('        and to_number(:P3001_TOTAL_ROWS) > fusion_cnt then chr(10) || ''\26A0 Fusion results truncated \2014 totals/mix based on returned rows'''),
'    end as card_body,',
'    ''fa fa-layers'' as card_icon,',
'    case',
'        when :P3001_TOTAL_ROWS is not null',
'        and to_number(:P3001_TOTAL_ROWS) > fusion_cnt then ''kpiCard kpiCard--total kpiCard--warn''',
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
'                        when c.c005 = ''Open'' then 1',
'                        else 0',
'                    end',
'                ) as fusion_open_cnt,',
'                nvl(',
'                    sum(',
'                        case',
'                            when c.c005 = ''Open'' then c.n002',
'                            else 0',
'                        end',
'                    ),',
'                    0',
'                ) as fusion_open_amt',
'            from',
'                apex_collections c',
'            where',
'                c.collection_name = ''FUSION_PO_ROWS''',
'        ),',
'        l as (',
'            select',
'                count(*) as legacy_cnt,',
'                nvl(sum(ordered), 0) as legacy_amt',
'            from',
'                demo_po_hist',
'            where',
'                supplier = :P3001_SUPPLIER_NAME',
'                and (',
'                    nullif(:P3001_STATUS, '''') is null',
'                    or status = :P3001_STATUS',
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
'            f.fusion_open_cnt,',
'            f.fusion_open_amt',
'        from',
'            f',
'            cross join l',
'    );'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P3001_SUPPLIER_NAME,P3001_STATUS,P3001_FROM_DATE,P3001_TO_DATE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(600000001000023)
,p_region_id=>wwv_flow_imp.id(600000001000022)
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
-- ============================================================
-- Page Items
-- ============================================================
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600000001000024)
,p_name=>'P3001_TOTAL_ROWS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(600000001000021)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600000001000025)
,p_name=>'P3001_TO_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(600000001000021)
,p_prompt=>'To'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(y) d, to_char(y) r',
'from (',
'  select (from_y + level - 1) as y',
'  from (',
'    select',
'      case',
'        when :P3001_FROM_DATE is null then extract(year from trunc(current_date,''YYYY'')) - 9',
'        else to_number(:P3001_FROM_DATE)',
'      end as from_y,',
'      extract(year from trunc(current_date,''YYYY'')) as to_y',
'    from dual',
'  )',
'  connect by level <= (to_y - from_y + 1)',
')',
'order by y',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P3001_FROM_DATE'
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
 p_id=>wwv_flow_imp.id(600000001000026)
,p_name=>'P3001_FUSION_TOTAL_RESULTS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(600000001000019)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600000001000027)
,p_name=>'P3001_SUPPLIER_NAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(600000001000021)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600000001000028)
,p_name=>'P3001_SUPPLIERS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(600000001000021)
,p_prompt=>'Suppliers'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SUPPLIERS'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'SUPPLIERNAME:P3001_SUPPLIER_NAME',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(600000001000029)
,p_name=>'P3001_STATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(600000001000021)
,p_prompt=>'PO Status (Optional)'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Open;Open,Closed;Closed,Cancelled;Cancelled,On Hold;On Hold,Incomplete;Incomplete'
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
 p_id=>wwv_flow_imp.id(600000001000030)
,p_name=>'P3001_FROM_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(600000001000021)
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
-- ============================================================
-- Dynamic Action: on change  (fires PL/SQL + refreshes)
-- ============================================================
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600000001000031)
,p_name=>'on change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3001_FROM_DATE, P3001_TO_DATE, P3001_SUPPLIER_NAME, P3001_STATUS'
,p_condition_element=>'P3001_TO_DATE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
-- Action 1: Execute PL/SQL (call po_pkg)
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600000001000032)
,p_event_id=>wwv_flow_imp.id(600000001000031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_start_date date;',
'  l_end_date   date;',
'begin',
'  l_start_date := to_date(:P3001_FROM_DATE || ''-01-01'', ''YYYY-MM-DD'');',
'  l_end_date   := add_months(to_date(:P3001_TO_DATE || ''-01-01'', ''YYYY-MM-DD''), 12) - 1; -- Dec 31',
'',
'  po_pkg.load_purchase_orders(',
'    p_start_date => l_start_date,',
'    p_end_date   => l_end_date,',
'    p_supplier   => :P3001_SUPPLIER_NAME,',
'    p_status     => :P3001_STATUS',
'  );',
'',
'  :P3001_TOTAL_ROWS := po_pkg.g_total_rows;',
'end;',
''))
,p_attribute_02=>'P3001_SUPPLIER_NAME,P3001_FROM_DATE,P3001_TO_DATE,P3001_STATUS,P3001_SUPPLIERS'
,p_attribute_03=>'P3001_TOTAL_ROWS'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
-- Action 2: Refresh IR
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600000001000033)
,p_event_id=>wwv_flow_imp.id(600000001000031)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600000001000019)
,p_attribute_01=>'N'
);
-- Action 3: Refresh KPI
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600000001000034)
,p_event_id=>wwv_flow_imp.id(600000001000031)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600000001000022)
,p_attribute_01=>'N'
);
-- Action 4: Refresh Chart 1 (Status)
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600000001000035)
,p_event_id=>wwv_flow_imp.id(600000001000031)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600000001000003)
,p_attribute_01=>'N'
);
-- Action 5: Refresh Chart 2 (Funds Status)
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600000001000036)
,p_event_id=>wwv_flow_imp.id(600000001000031)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600000001000008)
,p_attribute_01=>'N'
);
-- Action 6: Refresh Chart 4 (by Month)
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600000001000037)
,p_event_id=>wwv_flow_imp.id(600000001000031)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600000001000014)
,p_attribute_01=>'N'
);
-- Action 7: Refresh Chart 3 (by Buyer)
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600000001000038)
,p_event_id=>wwv_flow_imp.id(600000001000031)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(600000001000011)
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