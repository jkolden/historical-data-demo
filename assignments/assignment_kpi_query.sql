------------------------------------------------------------------------
--  HR Assignment History page - KPI Cards source
--  4 cards: Fusion | Legacy | EBS | Total (All Systems)
--
--  Page items:
--    :P4001_LAST_NAME,  :P4001_DEPARTMENT
--    :P4001_TOTAL_ROWS  (hidden, set by process after pkg call)
--
--  publicWorkers only returns current/active assignments,
--  so Fusion card shows employee count + assignment count.
--  Legacy/EBS cards show historical record counts.
------------------------------------------------------------------------

/* ========================= 1) FUSION (from shredded collection) ========================= */
select
    1 as sort_order,
    'Fusion' as card_title,
    to_char(fusion_people, 'FM999G999G999G990') || ' Employees' as card_subtitle,
    null as secondary_body,
    'Assignments: ' || to_char(fusion_cnt, 'FM999G999G999G990')
        || case
            when :P4001_TOTAL_ROWS is not null
            and to_number(:P4001_TOTAL_ROWS) > fusion_people then chr(10) || unistr('\26A0') || ' Showing ' || to_char(fusion_people, 'FM999G999G999G990') || ' of ' || to_char(to_number(:P4001_TOTAL_ROWS), 'FM999G999G999G990') || unistr(' \2014 refine search')
        end as card_body,
    'fa fa-cloud' as card_icon,
    case
        when :P4001_TOTAL_ROWS is not null
        and to_number(:P4001_TOTAL_ROWS) > fusion_people then 'kpiCard kpiCard--fusion kpiCard--warn'
        else 'kpiCard kpiCard--fusion'
    end as css_class
from
    (
        select
            count(*) as fusion_cnt,
            count(distinct c.n001) as fusion_people
        from
            apex_collections c
        where
            c.collection_name = 'FUSION_ASSIGNMENT_ROWS'
    )
    /* ========================= 2) LEGACY ========================= */
union all
select
    2,
    'Legacy',
    to_char(asgn_cnt, 'FM999G999G999G990') || ' Records',
    null as secondary_body,
    'People: ' || to_char(people_cnt, 'FM999G999G999G990') || chr(10) || 'All Historical',
    'fa fa-database' as card_icon,
    'kpiCard kpiCard--legacy kpiCard--infor' as css_class
from
    (
        select
            count(*) asgn_cnt,
            count(distinct personid) people_cnt
        from
            demo_assignment_hist
        where
            upper(displayname) like '%' || upper(:P4001_LAST_NAME) || '%'
            and (
                nullif(:P4001_DEPARTMENT, '') is null
                or departmentname = :P4001_DEPARTMENT
            )
            and sourcesystem = 'Legacy'
    )
    /* ========================= 3) EBS ========================= */
union all
select
    3,
    'EBS',
    to_char(asgn_cnt, 'FM999G999G999G990') || ' Records',
    null as secondary_body,
    'People: ' || to_char(people_cnt, 'FM999G999G999G990') || chr(10) || 'All Historical',
    'fa fa-database' as card_icon,
    'kpiCard kpiCard--legacy kpiCard--lawson' as css_class
from
    (
        select
            count(*) asgn_cnt,
            count(distinct personid) people_cnt
        from
            demo_assignment_hist
        where
            upper(displayname) like '%' || upper(:P4001_LAST_NAME) || '%'
            and (
                nullif(:P4001_DEPARTMENT, '') is null
                or departmentname = :P4001_DEPARTMENT
            )
            and sourcesystem = 'EBS'
    )
    /* ========================= 4) TOTAL (All Systems) ========================= */
union all
select
    4,
    'Total (All Systems)' as card_title,
    to_char(total_cnt, 'FM999G999G999G990') || ' Records' as card_subtitle,
    null as secondary_body,
    'People: ' || to_char(total_people, 'FM999G999G999G990') || chr(10)
        || 'Record mix: Fusion ' || to_char(fusion_pct, 'FM990D0') || '% / Legacy ' || to_char(legacy_pct, 'FM990D0') || '%'
        || case
            when :P4001_TOTAL_ROWS is not null
            and to_number(:P4001_TOTAL_ROWS) > fusion_people then chr(10) || unistr('\26A0') || ' Fusion results truncated' || unistr(' \2014') || ' totals/mix based on returned rows'
        end as card_body,
    'fa fa-layers' as card_icon,
    case
        when :P4001_TOTAL_ROWS is not null
        and to_number(:P4001_TOTAL_ROWS) > fusion_people then 'kpiCard kpiCard--total kpiCard--warn'
        else 'kpiCard kpiCard--total'
    end as css_class
from
    (
        with f as (
            select
                count(*) as fusion_cnt,
                count(distinct c.n001) as fusion_people
            from
                apex_collections c
            where
                c.collection_name = 'FUSION_ASSIGNMENT_ROWS'
        ),
        l as (
            select
                count(*) as legacy_cnt,
                count(distinct personid) as legacy_people
            from
                demo_assignment_hist
            where
                upper(displayname) like '%' || upper(:P4001_LAST_NAME) || '%'
                and (
                    nullif(:P4001_DEPARTMENT, '') is null
                    or departmentname = :P4001_DEPARTMENT
                )
        )
        select
            f.fusion_cnt,
            f.fusion_people,
            l.legacy_cnt,
            l.legacy_people,
            (f.fusion_cnt + l.legacy_cnt) as total_cnt,
            (f.fusion_people + l.legacy_people) as total_people,
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
