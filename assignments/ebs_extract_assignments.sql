/*===========================================================
  EBS R12 Extraction: HR Assignment History
  Target table: DEMO_ASSIGNMENT_HIST

  Source: Oracle E-Business Suite R12
  Tables: PER_ALL_ASSIGNMENTS_F + PER_ALL_PEOPLE_F + lookups

  Usage:
    Run against an EBS R12 database instance.
    Output column aliases match DEMO_ASSIGNMENT_HIST exactly.
    The identity PK (assignment_hist_id) is auto-generated on
    INSERT — do not include it in the extraction.

  Bind variables — adjust per customer:
    :p_business_group_id  - Business group to extract
    :p_start_date         - Effective date range start
    :p_end_date           - Effective date range end

  Notes:
    - Date-effective tables: each row is one version of the
      assignment between effective_start_date and effective_end_date
    - ActionCode is derived from EBS action types where available
    - Manager is resolved via supervisor_id self-join
    - Organization hierarchy: legal entity (BG), business unit
      (via org_id), department (via organization_id)
    - Length of service is calculated from original_date_of_hire
===========================================================*/

SELECT
    -- === Source tag ===
    'EBS'                                       AS sourcesystem,

    -- === Person-level fields ===
    papf.person_id                              AS personid,
    papf.employee_number                        AS personnumber,
    TRIM(papf.first_name || ' ' || papf.last_name)
                                                AS displayname,
    papf.last_name || ', ' || papf.first_name   AS listname,
    papf.last_name || ' ' || papf.first_name    AS ordername,
    papf.last_name                              AS lastname,
    papf.first_name                             AS firstname,
    papf.middle_names                           AS middlenames,
    papf.title                                  AS title,
    papf.suffix                                 AS suffix,
    papf.honors                                 AS honors,
    papf.known_as                               AS knownas,
    papf.email_address                          AS workemail,
    fu.user_name                                AS username,

    -- === Assignment identifiers ===
    paaf.assignment_id                          AS assignmentid,
    paaf.assignment_number                      AS assignmentnumber,
    pj.name                                     AS assignmentname,       -- job name as assignment name

    -- === Assignment status / action ===
    CASE past.per_system_status
        WHEN 'ACTIVE_ASSIGN'    THEN 'ACTIVE'
        WHEN 'SUSP_ASSIGN'      THEN 'INACTIVE'
        WHEN 'TERM_ASSIGN'      THEN 'INACTIVE'
        ELSE 'INACTIVE'
    END                                         AS assignmentstatus,
    CASE
        WHEN paaf.effective_start_date = papf.start_date
            THEN 'HIRE'
        WHEN past.per_system_status = 'TERM_ASSIGN'
            THEN 'TERMINATION'
        WHEN paaf.change_reason = 'PROMOTION'
            THEN 'PROMOTION'
        WHEN paaf.change_reason = 'TRANSFER'
            THEN 'TRANSFER'
        WHEN paaf.change_reason IS NOT NULL
            THEN paaf.change_reason
        ELSE 'ASG_CHANGE'
    END                                         AS actioncode,

    -- === Dates ===
    paaf.effective_start_date                   AS effectivestartdate,
    paaf.effective_end_date                     AS effectiveenddate,
    papf.start_date                             AS startdate,            -- person start = assignment start

    -- === Organization ===
    hou_bg.name                                 AS legalemployername,     -- business group as legal employer
    hou_org.name                                AS businessunit,         -- assignment org as business unit
    hou_dept.name                               AS departmentname,       -- organization_id = department
    pj.attribute1                               AS jobcode,              -- job code (may be in flexfield)
    pj.name                                     AS jobname,
    hap.name                                    AS positioncode,         -- position name as code
    hap.name                                    AS positionname,
    pg.name                                     AS gradecode,            -- grade name as code
    pg.name                                     AS gradename,
    TRIM(mgr.first_name || ' ' || mgr.last_name)
                                                AS managername,

    -- === Location ===
    hla.location_code                           AS locationcode,
    hla.description                             AS locationname,
    hla.address_line_1                          AS locationaddressline1,
    hla.address_line_2                          AS locationaddressline2,
    hla.address_line_3                          AS locationaddressline3,
    NULL                                        AS locationaddressline4,  -- EBS has 3 address lines
    hla.region_1                                AS locationregion1,
    hla.region_2                                AS locationregion2,
    hla.region_3                                AS locationregion3,
    hla.town_or_city                            AS locationtownorcity,
    hla.postal_code                             AS locationpostalcode,
    hla.country                                 AS locationcountry,
    hla.timezone_code                           AS locationtimezonecode,
    TRIM(
        hla.address_line_1
        || CASE WHEN hla.address_line_2 IS NOT NULL THEN ', ' || hla.address_line_2 END
        || CASE WHEN hla.town_or_city   IS NOT NULL THEN ', ' || hla.town_or_city   END
        || CASE WHEN hla.region_1       IS NOT NULL THEN ', ' || hla.region_1        END
        || CASE WHEN hla.postal_code    IS NOT NULL THEN ' '  || hla.postal_code     END
        || CASE WHEN hla.country        IS NOT NULL THEN ', ' || hla.country         END
    )                                           AS locationsinglelineaddress,

    -- === Internal workspace ===
    paaf.internal_address_line                  AS internalbuilding,
    NULL                                        AS internalfloor,        -- Fusion-only granularity
    paaf.office_number                          AS internalofficenumber,
    paaf.mailstop                               AS internalmailstop,

    -- === Worker classification ===
    paaf.employment_category                    AS assignmentcategory,    -- FR, FT, PR, PT
    CASE paaf.employee_category
        WHEN 'E'  THEN 'E'
        WHEN 'CW' THEN 'C'
        ELSE
            CASE WHEN papf.current_employee_flag = 'Y' THEN 'E'
                 WHEN papf.current_npw_flag      = 'Y' THEN 'C'
                 ELSE 'E'
            END
    END                                         AS workertype,
    CASE paaf.frequency
        WHEN 'W' THEN
            CASE WHEN paaf.normal_hours >= 35 THEN 'FULL_TIME'
                 ELSE 'PART_TIME'
            END
        ELSE
            CASE WHEN paaf.employment_category IN ('FR','FT') THEN 'FULL_TIME'
                 ELSE 'PART_TIME'
            END
    END                                         AS fullparttime,
    NVL(paaf.work_at_home, 'N')                 AS workathomeflag,
    paaf.primary_flag                           AS primaryflag,
    paaf.primary_flag                           AS primaryassignmentflag, -- same in EBS

    -- === Length of service (calculated) ===
    TRUNC(
        MONTHS_BETWEEN(
            LEAST(paaf.effective_end_date, SYSDATE),
            NVL(papf.original_date_of_hire, papf.start_date)
        ) / 12
    )                                           AS lengthofserviceyears,
    MOD(
        TRUNC(
            MONTHS_BETWEEN(
                LEAST(paaf.effective_end_date, SYSDATE),
                NVL(papf.original_date_of_hire, papf.start_date)
            )
        ), 12
    )                                           AS lengthofservicemonths,
    LEAST(paaf.effective_end_date, SYSDATE)
        - ADD_MONTHS(
            NVL(papf.original_date_of_hire, papf.start_date),
            TRUNC(
                MONTHS_BETWEEN(
                    LEAST(paaf.effective_end_date, SYSDATE),
                    NVL(papf.original_date_of_hire, papf.start_date)
                )
            )
          )                                     AS lengthofservicedays

FROM
    per_all_assignments_f           paaf
    -- Person master (date-effective)
    JOIN per_all_people_f           papf
        ON papf.person_id = paaf.person_id
        AND paaf.effective_start_date BETWEEN papf.effective_start_date
                                          AND papf.effective_end_date
    -- Assignment status
    JOIN per_assignment_status_types past
        ON past.assignment_status_type_id = paaf.assignment_status_type_id
    -- Department (organization_id)
    LEFT JOIN hr_all_organization_units hou_dept
        ON hou_dept.organization_id = paaf.organization_id
    -- Business unit (via operating unit / org_id in certain configs)
    LEFT JOIN hr_all_organization_units hou_org
        ON hou_org.organization_id = NVL(paaf.business_group_id, paaf.organization_id)
    -- Legal employer (business group)
    LEFT JOIN hr_all_organization_units hou_bg
        ON hou_bg.organization_id = paaf.business_group_id
    -- Job
    LEFT JOIN per_jobs              pj
        ON pj.job_id = paaf.job_id
    -- Grade
    LEFT JOIN per_grades            pg
        ON pg.grade_id = paaf.grade_id
    -- Position (R12: hr_all_positions; 11i: per_all_positions)
    LEFT JOIN hr_all_positions      hap
        ON hap.position_id = paaf.position_id
    -- Work location
    LEFT JOIN hr_locations_all      hla
        ON hla.location_id = paaf.location_id
    -- Manager (self-join via supervisor_id)
    LEFT JOIN per_all_people_f      mgr
        ON mgr.person_id = paaf.supervisor_id
        AND paaf.effective_start_date BETWEEN mgr.effective_start_date
                                          AND mgr.effective_end_date
    -- FND user (for username column)
    LEFT JOIN fnd_user              fu
        ON fu.employee_id = papf.person_id
        AND paaf.effective_start_date BETWEEN NVL(fu.start_date, paaf.effective_start_date)
                                          AND NVL(fu.end_date, paaf.effective_end_date)

WHERE
    paaf.business_group_id = :p_business_group_id
    AND paaf.effective_start_date <= :p_end_date
    AND paaf.effective_end_date   >= :p_start_date
    -- Employees and contingent workers only
    AND paaf.assignment_type IN ('E', 'C')

ORDER BY
    papf.employee_number,
    paaf.effective_start_date;
