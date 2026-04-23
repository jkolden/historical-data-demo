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
--     PAGE: 6002
--   Manifest End
--   Version:         24.2.15
--

begin
null;
end;
/
prompt --application/pages/delete_06002
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>6002);
end;
/
prompt --application/pages/page_06002
begin
wwv_flow_imp_page.create_page(
 p_id=>6002
,p_name=>'Check History'
,p_alias=>'CHECK-HISTORY'
,p_step_title=>'Check History'
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
 p_id=>wwv_flow_imp.id(60020001000000001)
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
 p_id=>wwv_flow_imp.id(60020001000000010)
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
-- Region: KPI Cards
------------------------------------------------------------------------
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(60020001000000020)
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
'    to_char(fusion_amt, ''FM$999G999G999G990D00'') as card_subtitle,',
'    case',
'        when :P6002_FROM_DATE is not null then ''From '' || :P6002_FROM_DATE || '' To '' || :P6002_TO_DATE',
'    end as secondary_body,',
'    ''Checks: '' || to_char(fusion_cnt, ''FM999G999G999G990'')',
'        || chr(10) || ''Avg: '' || to_char(case when fusion_cnt > 0 then fusion_amt / fusion_cnt else 0 end, ''FM$999G999G999G990D00'')',
'        || case',
'            when :P6002_TOTAL_ROWS is not null',
'            and to_number(:P6002_TOTAL_ROWS) > fusion_cnt',
unistr('            then chr(10) || ''\26A0 Showing '' || to_char(fusion_cnt, ''FM999G999G999G990'')'),
unistr('                 || '' of '' || to_char(to_number(:P6002_TOTAL_ROWS), ''FM999G999G999G990'')'),
unistr('                 || '' \2014 please refine filters'''),
'        end as card_body,',
'    ''fa fa-cloud'' as card_icon,',
'    case',
'        when :P6002_TOTAL_ROWS is not null',
'        and to_number(:P6002_TOTAL_ROWS) > fusion_cnt then ''kpiCard kpiCard--fusion kpiCard--warn''',
'        else ''kpiCard kpiCard--fusion''',
'    end as css_class',
'from (',
'    select',
'        count(*)                                                                 as fusion_cnt,',
'        nvl(sum(json_value(c.clob001, ''$.PaymentAmount'' returning number)), 0)   as fusion_amt',
'    from apex_collections c',
'    where c.collection_name = ''FUSION_CHECK_ROWS''',
')',
'',
'/* ========================= 2) LEGACY ========================= */',
'union all',
'select',
'    2,',
'    ''Legacy'',',
'    to_char(chk_amt, ''FM$999G999G999G990D00''),',
'    null as secondary_body,',
'    ''Checks: '' || to_char(chk_cnt, ''FM999G999G999G990'')',
'        || chr(10) || ''Avg: '' || to_char(case when chk_cnt > 0 then chk_amt / chk_cnt else 0 end, ''FM$999G999G999G990D00''),',
'    ''fa fa-database'' as card_icon,',
'    ''kpiCard kpiCard--legacy kpiCard--infor'' as css_class',
'from (',
'    select',
'        count(*)                        as chk_cnt,',
'        nvl(sum(paymentamount), 0)      as chk_amt',
'    from demo_checks_hist',
'    where ( nullif(:P6002_PAYEE, '''') is null or payee = :P6002_PAYEE )',
'      and ( nullif(:P6002_STATUS, '''')   is null or paymentstatus = :P6002_STATUS )',
'      and sourcesystem = ''Legacy''',
')',
'',
'/* ========================= 3) EBS ========================= */',
'union all',
'select',
'    3,',
'    ''EBS'',',
'    to_char(chk_amt, ''FM$999G999G999G990D00''),',
'    null as secondary_body,',
'    ''Checks: '' || to_char(chk_cnt, ''FM999G999G999G990'')',
'        || chr(10) || ''Avg: '' || to_char(case when chk_cnt > 0 then chk_amt / chk_cnt else 0 end, ''FM$999G999G999G990D00''),',
'    ''fa fa-database'' as card_icon,',
'    ''kpiCard kpiCard--legacy kpiCard--lawson'' as css_class',
'from (',
'    select',
'        count(*)                        as chk_cnt,',
'        nvl(sum(paymentamount), 0)      as chk_amt',
'    from demo_checks_hist',
'    where ( nullif(:P6002_PAYEE, '''') is null or payee = :P6002_PAYEE )',
'      and ( nullif(:P6002_STATUS, '''')   is null or paymentstatus = :P6002_STATUS )',
'      and sourcesystem = ''EBS''',
')',
'',
'/* ========================= 4) TOTAL ========================= */',
'union all',
'select',
'    4,',
'    ''Total (Fusion + Legacy)'' as card_title,',
'    to_char(total_amt, ''FM$999G999G999G990D00'') as card_subtitle,',
'    null as secondary_body,',
'    ''Checks: '' || to_char(total_cnt, ''FM999G999G999G990'')',
'        || chr(10) || ''Avg: '' || to_char(case when total_cnt > 0 then total_amt / total_cnt else 0 end, ''FM$999G999G999G990D00'')',
'        || chr(10) || ''Spend mix: Fusion '' || to_char(fusion_spend_pct, ''FM990D0'') || ''% / Legacy '' || to_char(legacy_spend_pct, ''FM990D0'') || ''%''',
'        || case',
'            when :P6002_TOTAL_ROWS is not null',
'            and to_number(:P6002_TOTAL_ROWS) > fusion_cnt',
unistr('            then chr(10) || ''\26A0 Fusion results truncated'''),
'        end as card_body,',
'    ''fa fa-layers'' as card_icon,',
'    case',
'        when :P6002_TOTAL_ROWS is not null',
'        and to_number(:P6002_TOTAL_ROWS) > fusion_cnt then ''kpiCard kpiCard--total kpiCard--warn''',
'        else ''kpiCard kpiCard--total''',
'    end as css_class',
'from (',
'    with f as (',
'        select',
'            count(*)                                                                 as fusion_cnt,',
'            nvl(sum(json_value(c.clob001, ''$.PaymentAmount'' returning number)), 0)   as fusion_amt',
'        from apex_collections c',
'        where c.collection_name = ''FUSION_CHECK_ROWS''',
'    ),',
'    l as (',
'        select',
'            count(*)                        as legacy_cnt,',
'            nvl(sum(paymentamount), 0)      as legacy_amt',
'        from demo_checks_hist',
'        where ( nullif(:P6002_PAYEE, '''') is null or payee = :P6002_PAYEE )',
'          and ( nullif(:P6002_STATUS, '''')   is null or paymentstatus = :P6002_STATUS )',
'    )',
'    select',
'        f.fusion_cnt,',
'        (f.fusion_cnt + l.legacy_cnt)       as total_cnt,',
'        (f.fusion_amt + l.legacy_amt)       as total_amt,',
'        case when (f.fusion_amt + l.legacy_amt) = 0 then 0',
'             else round(100 * f.fusion_amt / (f.fusion_amt + l.legacy_amt), 1)',
'        end as fusion_spend_pct,',
'        case when (f.fusion_amt + l.legacy_amt) = 0 then 0',
'             else round(100 * l.legacy_amt / (f.fusion_amt + l.legacy_amt), 1)',
'        end as legacy_spend_pct',
'    from f cross join l',
');'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P6002_PAYEE,P6002_STATUS,P6002_FROM_DATE,P6002_TO_DATE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(60020001000000021)
,p_region_id=>wwv_flow_imp.id(60020001000000020)
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
-- Region: Check History (Interactive Report)
------------------------------------------------------------------------
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(60020001000000030)
,p_plug_name=>'Check History'
,p_region_name=>'checkHistory'
,p_parent_plug_id=>wwv_flow_imp.id(60020001000000001)
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
'  c.seq_id                                                                         as id,',
'  ''Fusion''                                                                         as SourceSystem,',
'  ''Fusion''                                                                         as SourceSystem_search,',
'  /* identifiers */',
'  json_value(c.clob001, ''$.CheckId'' returning number)                              as CheckId,',
'  json_value(c.clob001, ''$.PaymentId'' returning number)                            as PaymentId,',
'  json_value(c.clob001, ''$.PaymentReference'' returning number)                     as PaymentReference,',
'  json_value(c.clob001, ''$.PaperDocumentNumber'' returning number)                  as PaperDocumentNumber,',
'  json_value(c.clob001, ''$.PaymentNumber'' returning number)                        as PaymentNumber,',
'  json_value(c.clob001, ''$.PaymentFileReference'' returning number)                 as PaymentFileReference,',
'  /* core payment info */',
'  json_value(c.clob001, ''$.PaymentProcessRequest'')                                 as PaymentProcessRequest,',
'  json_value(c.clob001, ''$.PaymentAmount'' returning number)                        as PaymentAmount,',
'  to_date(json_value(c.clob001, ''$.PaymentDate''), ''YYYY-MM-DD'')                   as PaymentDate,',
'  to_date(json_value(c.clob001, ''$.AccountingDate''), ''YYYY-MM-DD'')                as AccountingDate,',
'  json_value(c.clob001, ''$.PaymentDescription'')                                    as PaymentDescription,',
'  /* clearing */',
'  to_date(json_value(c.clob001, ''$.ClearingDate''), ''YYYY-MM-DD'')                  as ClearingDate,',
'  json_value(c.clob001, ''$.ClearingAmount'' returning number)                       as ClearingAmount,',
'  /* stop / void */',
'  to_date(json_value(c.clob001, ''$.StopDate''), ''YYYY-MM-DD'')                      as StopDate,',
'  json_value(c.clob001, ''$.StopReason'')                                            as StopReason,',
'  json_value(c.clob001, ''$.StopReference'')                                         as StopReference,',
'  to_date(json_value(c.clob001, ''$.VoidDate''), ''YYYY-MM-DD'')                      as VoidDate,',
'  to_date(json_value(c.clob001, ''$.VoidAccountingDate''), ''YYYY-MM-DD'')             as VoidAccountingDate,',
'  /* statuses */',
'  json_value(c.clob001, ''$.PaymentStatus'')                                         as PaymentStatus,',
'  json_value(c.clob001, ''$.AccountingStatus'')                                      as AccountingStatus,',
'  json_value(c.clob001, ''$.ReconciledFlag'')                                        as ReconciledFlag,',
'  /* payment classification */',
'  json_value(c.clob001, ''$.PaymentType'')                                           as PaymentType,',
'  json_value(c.clob001, ''$.PaymentCurrency'')                                       as PaymentCurrency,',
'  json_value(c.clob001, ''$.PaymentBaseAmount'' returning number)                    as PaymentBaseAmount,',
'  json_value(c.clob001, ''$.PaymentBaseCurrency'')                                   as PaymentBaseCurrency,',
'  /* amounts */',
'  json_value(c.clob001, ''$.WithheldAmount'' returning number)                       as WithheldAmount,',
'  json_value(c.clob001, ''$.BankChargeAmount'' returning number)                     as BankChargeAmount,',
'  /* org / entity */',
'  json_value(c.clob001, ''$.LegalEntity'')                                           as LegalEntity,',
'  json_value(c.clob001, ''$.BusinessUnit'')                                          as BusinessUnit,',
'  json_value(c.clob001, ''$.ProcurementBU'')                                         as ProcurementBU,',
'  /* payee */',
'  json_value(c.clob001, ''$.Payee'')                                                 as Payee,',
'  json_value(c.clob001, ''$.PartyId'' returning number)                              as PartyId,',
'  json_value(c.clob001, ''$.PayeeSite'')                                             as PayeeSite,',
'  json_value(c.clob001, ''$.SupplierNumber'')                                        as SupplierNumber,',
'  json_value(c.clob001, ''$.ThirdPartySupplier'')                                    as ThirdPartySupplier,',
'  json_value(c.clob001, ''$.ThirdPartyAddressName'')                                 as ThirdPartyAddressName,',
'  /* bank accounts */',
'  json_value(c.clob001, ''$.RemitToAccountNumber'')                                  as RemitToAccountNumber,',
'  json_value(c.clob001, ''$.DisbursementBankAccountNumber'')                         as DisbursementBankAccountNumber,',
'  json_value(c.clob001, ''$.DisbursementBankAccountName'')                           as DisbursementBankAccountName,',
'  /* payment method / profile */',
'  json_value(c.clob001, ''$.PaymentMethodCode'')                                     as PaymentMethodCode,',
'  json_value(c.clob001, ''$.PaymentMethod'')                                         as PaymentMethod,',
'  json_value(c.clob001, ''$.PaymentDocument'')                                       as PaymentDocument,',
'  json_value(c.clob001, ''$.PaymentProcessProfileCode'')                             as PaymentProcessProfileCode,',
'  json_value(c.clob001, ''$.PaymentProcessProfile'')                                 as PaymentProcessProfile,',
'  /* document */',
'  json_value(c.clob001, ''$.VoucherNumber'' returning number)                        as VoucherNumber,',
'  /* address */',
'  json_value(c.clob001, ''$.AddressLine1'')                                          as AddressLine1,',
'  json_value(c.clob001, ''$.City'')                                                  as City,',
'  json_value(c.clob001, ''$.State'')                                                 as State,',
'  json_value(c.clob001, ''$.Country'')                                               as Country,',
'  json_value(c.clob001, ''$.Zip'')                                                   as Zip,',
'  /* audit */',
'  json_value(c.clob001, ''$.CreatedBy'')                                             as CreatedBy,',
'  json_value(c.clob001, ''$.CreationDate'')                                          as CreationDate,',
'  json_value(c.clob001, ''$.LastUpdatedBy'')                                         as LastUpdatedBy,',
'  json_value(c.clob001, ''$.LastUpdateDate'')                                        as LastUpdateDate',
'',
'from apex_collections c',
'where c.collection_name = ''FUSION_CHECK_ROWS''',
'',
'union all',
'',
'/* ======== Legacy + EBS (from local table) ======== */',
'select',
'  null                            as id,',
'  d.sourcesystem                  as SourceSystem,',
'  d.sourcesystem                  as SourceSystem_search,',
'  d.checkid                       as CheckId,',
'  d.paymentid                     as PaymentId,',
'  d.paymentreference              as PaymentReference,',
'  d.paperdocumentnumber           as PaperDocumentNumber,',
'  d.paymentnumber                 as PaymentNumber,',
'  d.paymentfilereference          as PaymentFileReference,',
'  d.paymentprocessrequest         as PaymentProcessRequest,',
'  d.paymentamount                 as PaymentAmount,',
'  d.paymentdate                   as PaymentDate,',
'  d.accountingdate                as AccountingDate,',
'  d.paymentdescription            as PaymentDescription,',
'  d.clearingdate                  as ClearingDate,',
'  d.clearingamount                as ClearingAmount,',
'  d.stopdate                      as StopDate,',
'  d.stopreason                    as StopReason,',
'  d.stopreference                 as StopReference,',
'  d.voiddate                      as VoidDate,',
'  d.voidaccountingdate            as VoidAccountingDate,',
'  d.paymentstatus                 as PaymentStatus,',
'  d.accountingstatus              as AccountingStatus,',
'  d.reconciledflag                as ReconciledFlag,',
'  d.paymenttype                   as PaymentType,',
'  d.paymentcurrency               as PaymentCurrency,',
'  d.paymentbaseamount             as PaymentBaseAmount,',
'  d.paymentbasecurrency           as PaymentBaseCurrency,',
'  d.withheldamount                as WithheldAmount,',
'  d.bankchargeamount              as BankChargeAmount,',
'  d.legalentity                   as LegalEntity,',
'  d.businessunit                  as BusinessUnit,',
'  d.procurementbu                 as ProcurementBU,',
'  d.payee                         as Payee,',
'  d.partyid                       as PartyId,',
'  d.payeesite                     as PayeeSite,',
'  d.suppliernumber                as SupplierNumber,',
'  d.thirdpartysupplier            as ThirdPartySupplier,',
'  d.thirdpartyaddressname         as ThirdPartyAddressName,',
'  d.remittoaccountnumber          as RemitToAccountNumber,',
'  d.disbursementbankaccountnumber as DisbursementBankAccountNumber,',
'  d.disbursementbankaccountname   as DisbursementBankAccountName,',
'  d.paymentmethodcode             as PaymentMethodCode,',
'  d.paymentmethod                 as PaymentMethod,',
'  d.paymentdocument               as PaymentDocument,',
'  d.paymentprocessprofilecode     as PaymentProcessProfileCode,',
'  d.paymentprocessprofile         as PaymentProcessProfile,',
'  d.vouchernumber                 as VoucherNumber,',
'  d.addressline1                  as AddressLine1,',
'  d.city                          as City,',
'  d.state                         as State,',
'  d.country                       as Country,',
'  d.zip                           as Zip,',
'  d.createdby                     as CreatedBy,',
'  to_char(d.creationdate, ''YYYY-MM-DD"T"HH24:MI:SS.FF3TZR'') as CreationDate,',
'  d.lastupdatedby                 as LastUpdatedBy,',
'  to_char(d.lastupdatedate, ''YYYY-MM-DD"T"HH24:MI:SS.FF3TZR'') as LastUpdateDate',
'',
'from demo_checks_hist d',
'where ( nullif(:P6002_PAYEE, '''') is null',
'        or d.payee = :P6002_PAYEE )',
'  and ( nullif(:P6002_STATUS, '''') is null',
'        or d.paymentstatus = :P6002_STATUS );',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P6002_PAYEE,P6002_STATUS,P6002_FROM_DATE,P6002_TO_DATE'
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
 p_id=>wwv_flow_imp.id(60020001000000031)
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
,p_internal_uid=>60020001000000031
);
------------------------------------------------------------------------
-- Worksheet columns
------------------------------------------------------------------------
-- A: ID (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000040)
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
 p_id=>wwv_flow_imp.id(60020001000000041)
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
 p_id=>wwv_flow_imp.id(60020001000000042)
,p_db_column_name=>'SOURCESYSTEM_SEARCH'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Sourcesystem Search'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- D: CHECKID (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000043)
,p_db_column_name=>'CHECKID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Check Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
-- E: PAYMENTID (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000044)
,p_db_column_name=>'PAYMENTID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Payment Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
-- F: PAYMENTREFERENCE (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000045)
,p_db_column_name=>'PAYMENTREFERENCE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Payment Reference'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
-- G: PAPERDOCUMENTNUMBER (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000046)
,p_db_column_name=>'PAPERDOCUMENTNUMBER'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Check Number'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
-- H: PAYMENTNUMBER (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000047)
,p_db_column_name=>'PAYMENTNUMBER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Payment Number'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
-- I: PAYMENTFILEREFERENCE (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000048)
,p_db_column_name=>'PAYMENTFILEREFERENCE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'File Reference'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
-- J: PAYMENTPROCESSREQUEST (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000049)
,p_db_column_name=>'PAYMENTPROCESSREQUEST'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Payment Process Request'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- K: PAYMENTAMOUNT (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000050)
,p_db_column_name=>'PAYMENTAMOUNT'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
-- L: PAYMENTDATE (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000051)
,p_db_column_name=>'PAYMENTDATE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Payment Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
-- M: ACCOUNTINGDATE (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000052)
,p_db_column_name=>'ACCOUNTINGDATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Accounting Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
-- N: PAYMENTDESCRIPTION (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000053)
,p_db_column_name=>'PAYMENTDESCRIPTION'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- O: CLEARINGDATE (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000054)
,p_db_column_name=>'CLEARINGDATE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Clearing Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
-- P: CLEARINGAMOUNT (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000055)
,p_db_column_name=>'CLEARINGAMOUNT'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Clearing Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
-- Q: STOPDATE (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000056)
,p_db_column_name=>'STOPDATE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Stop Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
-- R: STOPREASON (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000057)
,p_db_column_name=>'STOPREASON'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Stop Reason'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- S: STOPREFERENCE (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000058)
,p_db_column_name=>'STOPREFERENCE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Stop Reference'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- T: VOIDDATE (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000059)
,p_db_column_name=>'VOIDDATE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Void Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
-- U: VOIDACCOUNTINGDATE (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000060)
,p_db_column_name=>'VOIDACCOUNTINGDATE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Void Accounting Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
-- V: PAYMENTSTATUS (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000061)
,p_db_column_name=>'PAYMENTSTATUS'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Payment Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- W: ACCOUNTINGSTATUS (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000062)
,p_db_column_name=>'ACCOUNTINGSTATUS'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Accounting Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- X: RECONCILEDFLAG (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000063)
,p_db_column_name=>'RECONCILEDFLAG'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Reconciled'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- Y: PAYMENTTYPE (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000064)
,p_db_column_name=>'PAYMENTTYPE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Payment Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- Z: PAYMENTCURRENCY (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000065)
,p_db_column_name=>'PAYMENTCURRENCY'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Currency'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- AA: PAYMENTBASEAMOUNT (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000066)
,p_db_column_name=>'PAYMENTBASEAMOUNT'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Base Amount'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
-- AB: PAYMENTBASECURRENCY (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000067)
,p_db_column_name=>'PAYMENTBASECURRENCY'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Base Currency'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AC: WITHHELDAMOUNT (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000068)
,p_db_column_name=>'WITHHELDAMOUNT'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Withheld Amount'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
-- AD: BANKCHARGEAMOUNT (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000069)
,p_db_column_name=>'BANKCHARGEAMOUNT'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Bank Charge Amount'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
-- AE: LEGALENTITY (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000100)
,p_db_column_name=>'LEGALENTITY'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Legal Entity'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- AF: BUSINESSUNIT (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000101)
,p_db_column_name=>'BUSINESSUNIT'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Business Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- AG: PROCUREMENTBU (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000102)
,p_db_column_name=>'PROCUREMENTBU'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Procurement BU'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AH: PAYEE (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000103)
,p_db_column_name=>'PAYEE'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Payee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- AI: PARTYID (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000104)
,p_db_column_name=>'PARTYID'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Party Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
-- AJ: PAYEESITE (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000105)
,p_db_column_name=>'PAYEESITE'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Payee Site'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- AK: SUPPLIERNUMBER (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000106)
,p_db_column_name=>'SUPPLIERNUMBER'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Supplier Number'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- AL: THIRDPARTYSUPPLIER (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000107)
,p_db_column_name=>'THIRDPARTYSUPPLIER'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Third Party Supplier'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AM: THIRDPARTYADDRESSNAME (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000108)
,p_db_column_name=>'THIRDPARTYADDRESSNAME'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Third Party Address'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AN: REMITTOACCOUNTNUMBER (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000109)
,p_db_column_name=>'REMITTOACCOUNTNUMBER'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Remit-To Account'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AO: DISBURSEMENTBANKACCOUNTNUMBER (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000110)
,p_db_column_name=>'DISBURSEMENTBANKACCOUNTNUMBER'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Bank Account Number'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AP: DISBURSEMENTBANKACCOUNTNAME (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000111)
,p_db_column_name=>'DISBURSEMENTBANKACCOUNTNAME'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Bank Account'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- AQ: PAYMENTMETHODCODE (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000112)
,p_db_column_name=>'PAYMENTMETHODCODE'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Method Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AR: PAYMENTMETHOD (visible)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000113)
,p_db_column_name=>'PAYMENTMETHOD'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Payment Method'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
-- AS_: PAYMENTDOCUMENT (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000114)
,p_db_column_name=>'PAYMENTDOCUMENT'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Payment Document'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AT: PAYMENTPROCESSPROFILECODE (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000115)
,p_db_column_name=>'PAYMENTPROCESSPROFILECODE'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Process Profile Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AU: PAYMENTPROCESSPROFILE (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000116)
,p_db_column_name=>'PAYMENTPROCESSPROFILE'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Process Profile'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AV: VOUCHERNUMBER (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000117)
,p_db_column_name=>'VOUCHERNUMBER'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Voucher Number'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
-- AW: ADDRESSLINE1 (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000118)
,p_db_column_name=>'ADDRESSLINE1'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Address'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AX: CITY (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000119)
,p_db_column_name=>'CITY'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'City'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AY: STATE (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000120)
,p_db_column_name=>'STATE'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'State'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- AZ: COUNTRY (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000121)
,p_db_column_name=>'COUNTRY'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Country'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- BA: ZIP (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000122)
,p_db_column_name=>'ZIP'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Zip'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- BB: CREATEDBY (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000123)
,p_db_column_name=>'CREATEDBY'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- BC: CREATIONDATE (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000124)
,p_db_column_name=>'CREATIONDATE'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Creation Date'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- BD: LASTUPDATEDBY (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000125)
,p_db_column_name=>'LASTUPDATEDBY'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Last Updated By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
-- BE: LASTUPDATEDATE (hidden)
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60020001000000126)
,p_db_column_name=>'LASTUPDATEDATE'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Last Update Date'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
------------------------------------------------------------------------
-- Default IR report
------------------------------------------------------------------------
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(60020001000000070)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'600200'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SOURCESYSTEM:PAPERDOCUMENTNUMBER:PAYEE:PAYMENTAMOUNT:PAYMENTDATE:ACCOUNTINGDATE:CLEARINGDATE:PAYMENTSTATUS:PAYMENTMETHOD:PAYMENTTYPE:BUSINESSUNIT:PAYMENTCURRENCY:SUPPLIERNUMBER:DISBURSEMENTBANKACCOUNTNAME'
);
------------------------------------------------------------------------
-- Page items
------------------------------------------------------------------------
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60020001000000080)
,p_name=>'P6002_PAYEE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(60020001000000010)
,p_prompt=>'Payee'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'STATIC2:ABC Supplies;ABC Supplies,CHM Corp;CHM Corp,Dell Inc.;Dell Inc.,Lee Supplies;Lee Supplies,Liberty Electric;Liberty Electric,Marx Extrusion and Fabrication;Marx Extrusion and Fabrication,US Financial Svcs;US Financial Svcs,Windsor Inc;Windsor Inc'
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
 p_id=>wwv_flow_imp.id(60020001000000081)
,p_name=>'P6002_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(60020001000000010)
,p_prompt=>'Payment Status (Optional)'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Negotiable;Negotiable,Voided;Voided,Cleared;Cleared,Reconciled;Reconciled,Spoiled;Spoiled,Stop Initiated;Stop Initiated,Stopped;Stopped'
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
 p_id=>wwv_flow_imp.id(60020001000000082)
,p_name=>'P6002_FROM_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(60020001000000010)
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
 p_id=>wwv_flow_imp.id(60020001000000083)
,p_name=>'P6002_TO_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(60020001000000010)
,p_prompt=>'To'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(y) d, to_char(y) r',
'from (',
'  select (from_y + level - 1) as y',
'  from (',
'    select',
'      case',
'        when :P6002_FROM_DATE is null then extract(year from trunc(current_date,''YYYY'')) - 9',
'        else to_number(:P6002_FROM_DATE)',
'      end as from_y,',
'      extract(year from trunc(current_date,''YYYY'')) as to_y',
'    from dual',
'  )',
'  connect by level <= (to_y - from_y + 1)',
')',
'order by y',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P6002_FROM_DATE'
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
 p_id=>wwv_flow_imp.id(60020001000000084)
,p_name=>'P6002_TOTAL_ROWS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(60020001000000010)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
------------------------------------------------------------------------
-- Dynamic action: on change of filters -> reload Fusion data + refresh
------------------------------------------------------------------------
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(60020001000000090)
,p_name=>'on change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6002_FROM_DATE, P6002_TO_DATE, P6002_PAYEE, P6002_STATUS'
,p_condition_element=>'P6002_TO_DATE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
-- Action 1: Execute PL/SQL to call check_history_pkg
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60020001000000091)
,p_event_id=>wwv_flow_imp.id(60020001000000090)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_start_date date;',
'  l_end_date   date;',
'begin',
'  l_start_date := to_date(:P6002_FROM_DATE || ''-01-01'', ''YYYY-MM-DD'');',
'  l_end_date   := add_months(to_date(:P6002_TO_DATE || ''-01-01'', ''YYYY-MM-DD''), 12) - 1; -- Dec 31',
'',
'  check_history_pkg.load_checks(',
'    p_start_date => l_start_date,',
'    p_end_date   => l_end_date,',
'    p_payee      => :P6002_PAYEE,',
'    p_status     => :P6002_STATUS',
'  );',
'',
'  :P6002_TOTAL_ROWS := check_history_pkg.g_total_rows;',
'end;',
''))
,p_attribute_02=>'P6002_PAYEE,P6002_FROM_DATE,P6002_TO_DATE,P6002_STATUS'
,p_attribute_03=>'P6002_TOTAL_ROWS'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
-- Action 2: Refresh the Interactive Report region
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60020001000000092)
,p_event_id=>wwv_flow_imp.id(60020001000000090)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(60020001000000030)
,p_attribute_01=>'N'
);
-- Action 3: Refresh the KPI cards region
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(60020001000000093)
,p_event_id=>wwv_flow_imp.id(60020001000000090)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(60020001000000020)
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
