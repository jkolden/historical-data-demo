------------------------------------------------------------------------
--  Absence History page - KPI Cards source
--  4 cards: Fusion | Legacy | EBS | Total (All Systems)
--
--  Page items:
--    :P5001_PERSON_NUMBER,  :P5001_FROM_DATE,  :P5001_TO_DATE
--    :P5001_TOTAL_ROWS  (hidden, set by process after pkg call)
------------------------------------------------------------------------

/* ========================= 1) FUSION (from shredded collection) ========================= */
select
    1 as sort_order,
    'Fusion' as card_title,
    to_char(fusion_cnt, 'FM999G999G999G990') || ' Records' as card_subtitle,
    null as secondary_body,
    'Total Days: ' || to_char(fusion_days, 'FM999G999G999G990')
        || case
            when :P5001_TOTAL_ROWS is not null
            and to_number(:P5001_TOTAL_ROWS) > fusion_cnt then chr(10) || unistr('\26A0') || ' Showing ' || to_char(fusion_cnt, 'FM999G999G999G990') || ' of ' || to_char(to_number(:P5001_TOTAL_ROWS), 'FM999G999G999G990') || unistr(' \2014 refine search')
        end as card_body,
    'fa fa-cloud' as card_icon,
    case
        when :P5001_TOTAL_ROWS is not null
        and to_number(:P5001_TOTAL_ROWS) > fusion_cnt then 'kpiCard kpiCard--fusion kpiCard--warn'
        else 'kpiCard kpiCard--fusion'
    end as css_class
from
    (
        select
            count(*) as fusion_cnt,
            nvl(sum(c.n003), 0) as fusion_days
        from
            apex_collections c
        where
            c.collection_name = 'FUSION_ABSENCE_ROWS'
    )
    /* ========================= 2) LEGACY ========================= */
union all
select
    2,
    'Legacy',
    to_char(abs_cnt, 'FM999G999G999G990') || ' Records',
    null as secondary_body,
    'Total Days: ' || to_char(total_days, 'FM999G999G999G990') || chr(10) || 'All Historical',
    'fa fa-database' as card_icon,
    'kpiCard kpiCard--legacy kpiCard--infor' as css_class
from
    (
        select
            count(*) abs_cnt,
            nvl(sum(duration), 0) total_days
        from
            demo_absence_hist
        where
            personnumber like '%' || :P5001_PERSON_NUMBER || '%'
            and ( nullif(:P5001_FROM_DATE, '') is null
                  or startdate >= to_date(:P5001_FROM_DATE, 'YYYY-MM-DD') )
            and ( nullif(:P5001_TO_DATE, '') is null
                  or startdate <= to_date(:P5001_TO_DATE, 'YYYY-MM-DD') )
            and sourcesystem = 'Legacy'
    )
    /* ========================= 3) EBS ========================= */
union all
select
    3,
    'EBS',
    to_char(abs_cnt, 'FM999G999G999G990') || ' Records',
    null as secondary_body,
    'Total Days: ' || to_char(total_days, 'FM999G999G999G990') || chr(10) || 'All Historical',
    'fa fa-database' as card_icon,
    'kpiCard kpiCard--legacy kpiCard--lawson' as css_class
from
    (
        select
            count(*) abs_cnt,
            nvl(sum(duration), 0) total_days
        from
            demo_absence_hist
        where
            personnumber like '%' || :P5001_PERSON_NUMBER || '%'
            and ( nullif(:P5001_FROM_DATE, '') is null
                  or startdate >= to_date(:P5001_FROM_DATE, 'YYYY-MM-DD') )
            and ( nullif(:P5001_TO_DATE, '') is null
                  or startdate <= to_date(:P5001_TO_DATE, 'YYYY-MM-DD') )
            and sourcesystem = 'EBS'
    )
    /* ========================= 4) TOTAL (All Systems) ========================= */
union all
select
    4,
    'Total (All Systems)' as card_title,
    to_char(total_cnt, 'FM999G999G999G990') || ' Records' as card_subtitle,
    null as secondary_body,
    'Total Days: ' || to_char(total_days, 'FM999G999G999G990') || chr(10)
        || 'Record mix: Fusion ' || to_char(fusion_pct, 'FM990D0') || '% / Legacy ' || to_char(legacy_pct, 'FM990D0') || '%'
        || case
            when :P5001_TOTAL_ROWS is not null
            and to_number(:P5001_TOTAL_ROWS) > fusion_cnt then chr(10) || unistr('\26A0') || ' Fusion results truncated' || unistr(' \2014') || ' totals/mix based on returned rows'
        end as card_body,
    'fa fa-layers' as card_icon,
    case
        when :P5001_TOTAL_ROWS is not null
        and to_number(:P5001_TOTAL_ROWS) > fusion_cnt then 'kpiCard kpiCard--total kpiCard--warn'
        else 'kpiCard kpiCard--total'
    end as css_class
from
    (
        with f as (
            select
                count(*) as fusion_cnt,
                nvl(sum(c.n003), 0) as fusion_days
            from
                apex_collections c
            where
                c.collection_name = 'FUSION_ABSENCE_ROWS'
        ),
        l as (
            select
                count(*) as legacy_cnt,
                nvl(sum(duration), 0) as legacy_days
            from
                demo_absence_hist
            where
                personnumber like '%' || :P5001_PERSON_NUMBER || '%'
                and ( nullif(:P5001_FROM_DATE, '') is null
                      or startdate >= to_date(:P5001_FROM_DATE, 'YYYY-MM-DD') )
                and ( nullif(:P5001_TO_DATE, '') is null
                      or startdate <= to_date(:P5001_TO_DATE, 'YYYY-MM-DD') )
        )
        select
            f.fusion_cnt,
            f.fusion_days,
            l.legacy_cnt,
            l.legacy_days,
            (f.fusion_cnt + l.legacy_cnt) as total_cnt,
            (f.fusion_days + l.legacy_days) as total_days,
            case
                when (f.fusion_cnt + l.legacy_cnt) = 0 then 0
                else round(
                    100 * f.fusion_cnt / (f.fusion_cnt + l.legacy_cnt),
                    1
                )
            end as fusion_pct,
            case
                when (f.fusion_cnt + l.legacy_cnt) = 0 then 0
                else round(
                    100 * l.legacy_cnt / (f.fusion_cnt + l.legacy_cnt),
                    1
                )
            end as legacy_pct
        from
            f
            cross join l
    )
;
