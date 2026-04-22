------------------------------------------------------------------------
--  PO History page – KPI Cards source
--  4 cards: Fusion | Legacy | EBS | Total (Fusion + Legacy)
--
--  Same card_title / card_subtitle / card_body / card_icon / css_class
--  column contract as Page 3 AP Invoices.
--
--  Page items (adjust P<n> prefix to match your page number):
--    :P_SUPPLIER_NAME,  :P_STATUS
--    :P_FROM_DATE,      :P_TO_DATE
--    :P_TOTAL_ROWS      (hidden, set by process after po_pkg call)
------------------------------------------------------------------------

/* ========================= 1) FUSION (from shredded collection) ========================= */
select
    1 as sort_order,
    'Fusion' as card_title,
    to_char(fusion_amt, 'FM$999G999G999G990D00') as card_subtitle,
    case
        when :P_FROM_DATE is not null then 'From ' || :P_FROM_DATE || ' To ' || :P_TO_DATE
    end as secondary_body,
    'POs: ' || to_char(fusion_cnt, 'FM999G999G999G990') || chr(10) || 'Open: ' || to_char(fusion_open_cnt, 'FM999G999G999G990') || ' (' || to_char(fusion_open_amt, 'FM$999G999G999G990D00') || ')' || case
        when :P_TOTAL_ROWS is not null
        and to_number(:P_TOTAL_ROWS) > fusion_cnt then chr(10) || unistr('\26A0') || ' Showing ' || to_char(fusion_cnt, 'FM999G999G999G990') || ' of ' || to_char(to_number(:P_TOTAL_ROWS), 'FM999G999G999G990') || unistr(' \2014 please refine filters to see full data set')
    end as card_body,
    'fa fa-cloud' as card_icon,
    case
        when :P_TOTAL_ROWS is not null
        and to_number(:P_TOTAL_ROWS) > fusion_cnt then 'kpiCard kpiCard--fusion kpiCard--warn'
        else 'kpiCard kpiCard--fusion'
    end as css_class
from
    (
        select
            count(*) as fusion_cnt,
            nvl(sum(c.n002), 0) as fusion_amt,
            sum(
                case
                    when c.c005 = 'Open' then 1
                    else 0
                end
            ) as fusion_open_cnt,
            nvl(
                sum(
                    case
                        when c.c005 = 'Open' then c.n002
                        else 0
                    end
                ),
                0
            ) as fusion_open_amt
        from
            apex_collections c
        where
            c.collection_name = 'FUSION_PO_ROWS'
    ) f
    /* ========================= 2) LEGACY ========================= */
union
all
select
    2,
    'Legacy',
    to_char(po_amt, 'FM$999G999G999G990D00'),
    null as secondary_body,
    'POs: ' || to_char(po_cnt, 'FM999G999G999G990') || chr(10) || 'Closed',
    'fa fa-database' as card_icon,
    'kpiCard kpiCard--legacy kpiCard--infor' as css_class
from
    (
        select
            count(*) po_cnt,
            nvl(sum(ordered), 0) po_amt
        from
            demo_po_hist
        where
            supplier = :P_SUPPLIER_NAME
            and (
                nullif(:P_STATUS, '') is null
                or status = :P_STATUS
            )
            and sourcesystem = 'Legacy'
    )
    /* ========================= 3) EBS ========================= */
union
all
select
    3,
    'EBS',
    to_char(po_amt, 'FM$999G999G999G990D00'),
    null as secondary_body,
    'POs: ' || to_char(po_cnt, 'FM999G999G999G990') || chr(10) || 'Closed',
    'fa fa-database' as card_icon,
    'kpiCard kpiCard--legacy kpiCard--lawson' as css_class
from
    (
        select
            count(*) po_cnt,
            nvl(sum(ordered), 0) po_amt
        from
            demo_po_hist
        where
            supplier = :P_SUPPLIER_NAME
            and (
                nullif(:P_STATUS, '') is null
                or status = :P_STATUS
            )
            and sourcesystem = 'EBS'
    )
    /* ========================= 4) TOTAL (Fusion + Legacy) ========================= */
union
all
select
    4,
    'Total (Fusion + Legacy)' as card_title,
    to_char(total_amt, 'FM$999G999G999G990D00') as card_subtitle,
    null as secondary_body,
    'POs: ' || to_char(total_cnt, 'FM999G999G999G990') || chr(10)
        || 'Spend mix: Fusion ' || to_char(fusion_spend_pct, 'FM990D0') || '% / Legacy ' || to_char(legacy_spend_pct, 'FM990D0') || '%' || chr(10)
        || 'PO mix: Fusion ' || to_char(fusion_cnt_pct, 'FM990D0') || '% / Legacy ' || to_char(legacy_cnt_pct, 'FM990D0') || '%' || chr(10)
        || 'Fusion open: ' || to_char(fusion_open_cnt, 'FM999G999G999G990') || ' (' || to_char(fusion_open_amt, 'FM$999G999G999G990D00') || ')' || case
        when :P_TOTAL_ROWS is not null
        and to_number(:P_TOTAL_ROWS) > fusion_cnt then chr(10) || unistr('\26A0') || ' Fusion results truncated' || unistr(' \2014') || ' totals/mix based on returned rows'
    end as card_body,
    'fa fa-layers' as card_icon,
    case
        when :P_TOTAL_ROWS is not null
        and to_number(:P_TOTAL_ROWS) > fusion_cnt then 'kpiCard kpiCard--total kpiCard--warn'
        else 'kpiCard kpiCard--total'
    end as css_class
from
    (
        with f as (
            select
                count(*) as fusion_cnt,
                nvl(sum(c.n002), 0) as fusion_amt,
                sum(
                    case
                        when c.c005 = 'Open' then 1
                        else 0
                    end
                ) as fusion_open_cnt,
                nvl(
                    sum(
                        case
                            when c.c005 = 'Open' then c.n002
                            else 0
                        end
                    ),
                    0
                ) as fusion_open_amt
            from
                apex_collections c
            where
                c.collection_name = 'FUSION_PO_ROWS'
        ),
        l as (
            select
                count(*) as legacy_cnt,
                nvl(sum(ordered), 0) as legacy_amt
            from
                demo_po_hist
            where
                supplier = :P_SUPPLIER_NAME
                and (
                    nullif(:P_STATUS, '') is null
                    or status = :P_STATUS
                )
        )
        select
            f.fusion_cnt,
            l.legacy_cnt,
            f.fusion_amt,
            l.legacy_amt,
            (f.fusion_cnt + l.legacy_cnt) as total_cnt,
            (f.fusion_amt + l.legacy_amt) as total_amt,
            case
                when (f.fusion_amt + l.legacy_amt) = 0 then 0
                else round(
                    100 * f.fusion_amt / (f.fusion_amt + l.legacy_amt),
                    1
                )
            end as fusion_spend_pct,
            case
                when (f.fusion_amt + l.legacy_amt) = 0 then 0
                else round(
                    100 * l.legacy_amt / (f.fusion_amt + l.legacy_amt),
                    1
                )
            end as legacy_spend_pct,
            case
                when (f.fusion_cnt + l.legacy_cnt) = 0 then 0
                else round(
                    100 * f.fusion_cnt / (f.fusion_cnt + l.legacy_cnt),
                    1
                )
            end as fusion_cnt_pct,
            case
                when (f.fusion_cnt + l.legacy_cnt) = 0 then 0
                else round(
                    100 * l.legacy_cnt / (f.fusion_cnt + l.legacy_cnt),
                    1
                )
            end as legacy_cnt_pct,
            f.fusion_open_cnt,
            f.fusion_open_amt
        from
            f
            cross join l
    )
;