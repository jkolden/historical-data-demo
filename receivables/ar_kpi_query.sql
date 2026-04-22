------------------------------------------------------------------------
--  AR Receivables History page – KPI Cards source
--  4 cards: Fusion | Legacy | EBS | Total
--
--  Page items (adjust P<n> prefix to match your page number):
--    :P_CUSTOMER,  :P_STATUS
--    :P_FROM_DATE, :P_TO_DATE
--    :P_TOTAL_ROWS  (hidden, set by process after receivables_pkg call)
------------------------------------------------------------------------

/* ========================= 1) FUSION ========================= */
select
    1 as sort_order,
    'Fusion' as card_title,
    to_char(fusion_amt, 'FM$999G999G999G990D00') as card_subtitle,
    case
        when :P_FROM_DATE is not null then 'From ' || :P_FROM_DATE || ' To ' || :P_TO_DATE
    end as secondary_body,
    'Invoices: ' || to_char(fusion_cnt, 'FM999G999G999G990')
        || chr(10) || 'Balance: ' || to_char(fusion_balance, 'FM$999G999G999G990D00')
        || case
            when :P_TOTAL_ROWS is not null
            and to_number(:P_TOTAL_ROWS) > fusion_cnt
            then chr(10) || unistr('\26A0') || ' Showing ' || to_char(fusion_cnt, 'FM999G999G999G990')
                 || ' of ' || to_char(to_number(:P_TOTAL_ROWS), 'FM999G999G999G990')
                 || unistr(' \2014 please refine filters')
        end as card_body,
    'fa fa-cloud' as card_icon,
    case
        when :P_TOTAL_ROWS is not null
        and to_number(:P_TOTAL_ROWS) > fusion_cnt then 'kpiCard kpiCard--fusion kpiCard--warn'
        else 'kpiCard kpiCard--fusion'
    end as css_class
from (
    select
        count(*)                                                                as fusion_cnt,
        nvl(sum(json_value(c.clob001, '$.EnteredAmount' returning number)), 0)  as fusion_amt,
        nvl(sum(json_value(c.clob001, '$.InvoiceBalanceAmount' returning number)), 0) as fusion_balance
    from apex_collections c
    where c.collection_name = 'FUSION_AR_ROWS'
)

/* ========================= 2) LEGACY ========================= */
union all
select
    2,
    'Legacy',
    to_char(inv_amt, 'FM$999G999G999G990D00'),
    null as secondary_body,
    'Invoices: ' || to_char(inv_cnt, 'FM999G999G999G990')
        || chr(10) || 'Balance: ' || to_char(inv_balance, 'FM$999G999G999G990D00'),
    'fa fa-database' as card_icon,
    'kpiCard kpiCard--legacy kpiCard--infor' as css_class
from (
    select
        count(*)                        as inv_cnt,
        nvl(sum(enteredamount), 0)      as inv_amt,
        nvl(sum(invoicebalanceamount), 0) as inv_balance
    from demo_ar_invoices_hist
    where ( nullif(:P_CUSTOMER, '') is null or billtocustomername = :P_CUSTOMER )
      and ( nullif(:P_STATUS, '')   is null or invoicestatus = :P_STATUS )
      and sourcesystem = 'Legacy'
)

/* ========================= 3) EBS ========================= */
union all
select
    3,
    'EBS',
    to_char(inv_amt, 'FM$999G999G999G990D00'),
    null as secondary_body,
    'Invoices: ' || to_char(inv_cnt, 'FM999G999G999G990')
        || chr(10) || 'Balance: ' || to_char(inv_balance, 'FM$999G999G999G990D00'),
    'fa fa-database' as card_icon,
    'kpiCard kpiCard--legacy kpiCard--lawson' as css_class
from (
    select
        count(*)                        as inv_cnt,
        nvl(sum(enteredamount), 0)      as inv_amt,
        nvl(sum(invoicebalanceamount), 0) as inv_balance
    from demo_ar_invoices_hist
    where ( nullif(:P_CUSTOMER, '') is null or billtocustomername = :P_CUSTOMER )
      and ( nullif(:P_STATUS, '')   is null or invoicestatus = :P_STATUS )
      and sourcesystem = 'EBS'
)

/* ========================= 4) TOTAL ========================= */
union all
select
    4,
    'Total (Fusion + Legacy)' as card_title,
    to_char(total_amt, 'FM$999G999G999G990D00') as card_subtitle,
    null as secondary_body,
    'Invoices: ' || to_char(total_cnt, 'FM999G999G999G990')
        || chr(10) || 'Balance: ' || to_char(total_balance, 'FM$999G999G999G990D00')
        || chr(10) || 'Spend mix: Fusion ' || to_char(fusion_spend_pct, 'FM990D0') || '% / Legacy ' || to_char(legacy_spend_pct, 'FM990D0') || '%'
        || case
            when :P_TOTAL_ROWS is not null
            and to_number(:P_TOTAL_ROWS) > fusion_cnt
            then chr(10) || unistr('\26A0') || ' Fusion results truncated'
        end as card_body,
    'fa fa-layers' as card_icon,
    case
        when :P_TOTAL_ROWS is not null
        and to_number(:P_TOTAL_ROWS) > fusion_cnt then 'kpiCard kpiCard--total kpiCard--warn'
        else 'kpiCard kpiCard--total'
    end as css_class
from (
    with f as (
        select
            count(*)                                                                as fusion_cnt,
            nvl(sum(json_value(c.clob001, '$.EnteredAmount' returning number)), 0)  as fusion_amt,
            nvl(sum(json_value(c.clob001, '$.InvoiceBalanceAmount' returning number)), 0) as fusion_balance
        from apex_collections c
        where c.collection_name = 'FUSION_AR_ROWS'
    ),
    l as (
        select
            count(*)                        as legacy_cnt,
            nvl(sum(enteredamount), 0)      as legacy_amt,
            nvl(sum(invoicebalanceamount), 0) as legacy_balance
        from demo_ar_invoices_hist
        where ( nullif(:P_CUSTOMER, '') is null or billtocustomername = :P_CUSTOMER )
          and ( nullif(:P_STATUS, '')   is null or invoicestatus = :P_STATUS )
    )
    select
        f.fusion_cnt,
        (f.fusion_cnt + l.legacy_cnt)       as total_cnt,
        (f.fusion_amt + l.legacy_amt)       as total_amt,
        (f.fusion_balance + l.legacy_balance) as total_balance,
        case when (f.fusion_amt + l.legacy_amt) = 0 then 0
             else round(100 * f.fusion_amt / (f.fusion_amt + l.legacy_amt), 1)
        end as fusion_spend_pct,
        case when (f.fusion_amt + l.legacy_amt) = 0 then 0
             else round(100 * l.legacy_amt / (f.fusion_amt + l.legacy_amt), 1)
        end as legacy_spend_pct
    from f cross join l
)
;
