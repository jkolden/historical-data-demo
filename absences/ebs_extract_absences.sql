/*===========================================================
  EBS R12 Extraction: Absences
  Target table: DEMO_ABSENCE_HIST

  Source: Oracle E-Business Suite R12
  Tables: PER_ABSENCE_ATTENDANCES + lookups

  Usage:
    Run against an EBS R12 database instance.
    Output column aliases match DEMO_ABSENCE_HIST exactly.
    The identity PK (absence_hist_id) is auto-generated on INSERT.

  Bind variables — adjust per customer:
    :p_business_group_id  - Business group to extract
    :p_start_date         - Absence start date range start
    :p_end_date           - Absence start date range end

  Notes:
    - EBS absence model (PER_ABSENCE_ATTENDANCES) is simpler than
      Fusion's; many Fusion workflow/approval fields are NULL
    - Absence types live in PER_ABSENCE_ATTENDANCE_TYPES
    - Duration is stored directly on the absence record in EBS
    - Several Fusion-only fields (agreement, flags) have no equivalent
===========================================================*/

SELECT
    -- === Source tag ===
    'EBS'                                       AS sourcesystem,

    -- === Core identifiers ===
    paa.absence_attendance_id                   AS personabsenceentryid,
    papf.person_id                              AS personid,
    papf.employee_number                        AS personnumber,
    TRIM(papf.first_name || ' ' || papf.last_name)
                                                AS displayname,

    -- === Absence type / reason ===
    paat.absence_attendance_type_id             AS absencetypeid,
    paat.name                                   AS absencetype,
    paa.abs_attendance_reason_id                AS absencetypereasonid,
    par.name                                    AS absencereason,
    NULL                                        AS absencepatterncd,     -- Fusion-only

    -- === Dates ===
    paa.date_start                              AS startdate,
    paa.date_end                                AS enddate,
    TO_CHAR(paa.time_start, 'HH24:MI')         AS starttime,
    TO_CHAR(paa.time_end, 'HH24:MI')           AS endtime,
    NULL                                        AS startdateduration,    -- Fusion partial-day
    NULL                                        AS enddateduration,      -- Fusion partial-day
    paa.sickness_start_date                     AS conditionstartdate,
    paa.date_notification                       AS confirmeddate,
    paa.date_notification                       AS notificationdate,
    NULL                                        AS establishmentdate,    -- Fusion-only
    paa.date_notification                       AS submitteddate,
    paa.date_projected_end                      AS plannedenddate,

    -- === Duration ===
    paa.absence_days                            AS duration,
    CASE
        WHEN paa.absence_days IS NOT NULL
            THEN TO_CHAR(paa.absence_days) || ' Days'
        WHEN paa.absence_hours IS NOT NULL
            THEN TO_CHAR(paa.absence_hours) || ' Hours'
        ELSE NULL
    END                                         AS formattedduration,
    CASE
        WHEN paa.absence_days IS NOT NULL THEN 'D'
        WHEN paa.absence_hours IS NOT NULL THEN 'H'
        ELSE NULL
    END                                         AS unitofmeasure,
    CASE
        WHEN paa.absence_days IS NOT NULL THEN 'Days'
        WHEN paa.absence_hours IS NOT NULL THEN 'Hours'
        ELSE NULL
    END                                         AS unitofmeasuremeaning,

    -- === Status ===
    CASE paa.absence_status
        WHEN 'CONFIRMED'   THEN 'COMPLETED'
        WHEN 'PROJECTED'   THEN 'SUBMITTED'
        WHEN 'PLAN'        THEN 'SUBMITTED'
        ELSE NVL(paa.absence_status, 'COMPLETED')
    END                                         AS absencestatuscd,
    CASE paa.authorising_person_id
        WHEN NULL THEN 'AUTO_APPROVED'
        ELSE 'APPROVED'
    END                                         AS approvalstatuscd,
    CASE paa.absence_status
        WHEN 'CONFIRMED'   THEN 'COMPLETED'
        WHEN 'PROJECTED'   THEN 'SUBMITTED'
        WHEN 'PLAN'        THEN 'SUBMITTED'
        ELSE NVL(paa.absence_status, 'COMPLETED')
    END                                         AS absencedispstatus,
    CASE paa.absence_status
        WHEN 'CONFIRMED'   THEN 'Completed'
        WHEN 'PROJECTED'   THEN 'Submitted'
        WHEN 'PLAN'        THEN 'Submitted'
        ELSE NVL(INITCAP(paa.absence_status), 'Completed')
    END                                         AS absencedispstatusmeaning,
    NULL                                        AS processingstatus,     -- Fusion payroll processing

    -- === Approval ===
    NULL                                        AS approvaldatetime,     -- Fusion workflow
    paa.date_notification                       AS authstatusupdatedate,

    -- === Employer / Legal ===
    hou_bg.name                                 AS employer,
    NULL                                        AS legalentityid,        -- Fusion legal entity
    paat.legislation_code                       AS legislationcode,
    NULL                                        AS legislativedatagroupid, -- Fusion-only

    -- === Assignment ===
    paaf.assignment_id                          AS assignmentid,
    paaf.assignment_number                      AS assignmentnumber,
    NULL                                        AS assignmentname,       -- Fusion-only

    -- === Agreement (Fusion-only) ===
    NULL                                        AS agreementid,
    NULL                                        AS agreementname,
    NULL                                        AS paymentdetail,

    -- === Flags ===
    NULL                                        AS absenceentrybasicflag, -- Fusion-only
    CASE WHEN paa.date_end IS NULL
         THEN 'Y' ELSE 'N'
    END                                         AS openendedflag,
    CASE WHEN paa.date_start = paa.date_end
         THEN 'Y' ELSE 'N'
    END                                         AS singledayflag,
    CASE WHEN paa.occurrence IS NOT NULL
         THEN 'Y' ELSE 'N'
    END                                         AS overridden,
    NULL                                        AS latenotifyflag,       -- Fusion-only
    'N'                                         AS absenceupdatableflag, -- historical = not updatable

    -- === Misc ===
    paa.attribute1                              AS comments,             -- or use a dedicated comments field
    'EBS'                                       AS source,
    NULL                                        AS frequency,            -- Fusion recurring absences
    NULL                                        AS usermode,             -- Fusion-only
    paa.project_id                              AS projectid,

    -- === Audit ===
    fu_cr.user_name                             AS createdby,
    paa.creation_date                           AS creationdate,
    fu_upd.user_name                            AS lastupdatedby,
    paa.last_update_date                        AS lastupdatedate

FROM
    per_absence_attendances         paa
    -- Person master
    JOIN per_all_people_f           papf
        ON papf.person_id = paa.person_id
        AND paa.date_start BETWEEN papf.effective_start_date
                                AND papf.effective_end_date
    -- Assignment (primary, active at absence date)
    LEFT JOIN per_all_assignments_f paaf
        ON paaf.person_id = paa.person_id
        AND paaf.primary_flag = 'Y'
        AND paa.date_start BETWEEN paaf.effective_start_date
                                AND paaf.effective_end_date
    -- Absence type
    LEFT JOIN per_absence_attendance_types paat
        ON paat.absence_attendance_type_id = paa.absence_attendance_type_id
    -- Absence reason
    LEFT JOIN per_abs_attendance_reasons par
        ON par.abs_attendance_reason_id = paa.abs_attendance_reason_id
    -- Business group (employer)
    LEFT JOIN hr_all_organization_units hou_bg
        ON hou_bg.organization_id = paa.business_group_id
    -- Audit: created by
    LEFT JOIN fnd_user              fu_cr
        ON fu_cr.user_id = paa.created_by
    -- Audit: last updated by
    LEFT JOIN fnd_user              fu_upd
        ON fu_upd.user_id = paa.last_updated_by

WHERE
    paa.business_group_id = :p_business_group_id
    AND paa.date_start BETWEEN :p_start_date AND :p_end_date

ORDER BY
    papf.employee_number,
    paa.date_start;
