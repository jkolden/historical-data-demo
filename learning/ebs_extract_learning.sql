/*===========================================================
  EBS R12 Extraction: Learning History
  Target table: DEMO_LEARNING_HIST

  Source: Oracle E-Business Suite R12 — Oracle Learning
         Management (OLM / iLearning)
  Tables: OTA_DELEGATE_BOOKINGS + OTA_EVENTS + OTA_ACTIVITY_VERSIONS

  Usage:
    Run against an EBS R12 database instance with Oracle
    Learning Management (OLM) installed.
    Output column aliases match DEMO_LEARNING_HIST exactly.
    The identity PK (id) is auto-generated on INSERT.

  Bind variables — adjust per customer:
    :p_business_group_id  - Business group to extract
    :p_start_date         - Booking creation date range start
    :p_end_date           - Booking creation date range end

  Notes:
    - EBS OLM model is very different from Fusion Learning:
      OTA_DELEGATE_BOOKINGS = enrollments/assignments
      OTA_EVENTS = scheduled offerings/classes
      OTA_ACTIVITY_VERSIONS = courses/learning items
    - Fusion Learning has ~137 columns; many are Fusion-only
      (waitlist, prerequisites, renewal, CPE, versioning, etc.)
    - This script maps what EBS OLM can provide; ~60% of columns
      will be NULL for Fusion-only concepts
===========================================================*/

SELECT
    -- === Source tag ===
    'EBS'                                       AS sourcesystem,

    -- === Identifiers ===
    odb.booking_id                              AS assignmentrecordid,
    TO_CHAR(odb.booking_id)                     AS assignmentrecordnumber,

    -- === Assignment type / Status ===
    CASE odb.booking_status_type_id
        WHEN (SELECT bst.booking_status_type_id FROM ota_booking_status_types bst
              WHERE bst.type = 'P' AND ROWNUM = 1)
            THEN 'ORA_PUSH_ASSIGNMENT'
        ELSE 'ORA_JOIN_ASSIGNMENT'
    END                                         AS assignmenttype,
    CASE odb.booking_status_type_id
        WHEN (SELECT bst.booking_status_type_id FROM ota_booking_status_types bst
              WHERE bst.type = 'P' AND ROWNUM = 1)
            THEN 'Required Assignment'
        ELSE 'Voluntary Assignment'
    END                                         AS assignmenttypemeaning,
    odb.booking_justification_code              AS assignmentjustification,
    NULL                                        AS assignmentduedate,    -- Fusion-only
    CASE obst.type
        WHEN 'A' THEN 'ORA_ASSN_REC_ACTIVE'
        WHEN 'E' THEN 'ORA_ASSN_REC_COMPLETED'
        WHEN 'C' THEN 'ORA_ASSN_REC_WITHDRAWN'
        WHEN 'W' THEN 'ORA_ASSN_REC_WAITLISTED'
        WHEN 'R' THEN 'ORA_ASSN_REC_REQUESTED'
        ELSE 'ORA_ASSN_REC_ACTIVE'
    END                                         AS assignmentstatus,
    CASE obst.type
        WHEN 'A' THEN 'Active'
        WHEN 'E' THEN 'Completed'
        WHEN 'C' THEN 'Withdrawn'
        WHEN 'W' THEN 'Waitlisted'
        WHEN 'R' THEN 'Requested'
        ELSE obst.name
    END                                         AS assignmentstatusmeaning,
    NULL                                        AS assignmentsubstatus,
    NULL                                        AS assignmentsubstatusmeaning,
    NULL                                        AS assignmentattributionid,

    -- === Learner (assigned-to) ===
    papf.person_id                              AS assignedtoid,
    papf.employee_number                        AS assignedtonumber,
    'ORA_PERSON'                                AS assignedtotype,
    'Person'                                    AS assignedtotypemeaning,
    papf.email_address                          AS assignedtopersonprimaryemailaddress,
    NULL                                        AS assignedtopersonprimaryphonenumber,
    TRIM(papf.first_name || ' ' || papf.last_name)
                                                AS assignedtodisplayname,

    -- === Assigner ===
    NULL                                        AS assignerid,           -- EBS: created_by is closest
    NULL                                        AS assignernumber,
    NULL                                        AS assignerattributiontype,
    NULL                                        AS assignerattributiontypemeaning,
    NULL                                        AS assignerdisplayname,
    NULL                                        AS assignerpersonprimaryemailaddress,
    NULL                                        AS assignerpersonprimaryphonenumber,
    NULL                                        AS assignercommentstolearner,

    -- === Learning item ===
    oav.activity_version_id                     AS learningitemid,
    TO_CHAR(oav.activity_version_id)            AS learningitemnumber,
    'ORA_COURSE'                                AS learningitemtype,     -- OLM = courses primarily
    'Course'                                    AS learningitemtypemeaning,
    oav.version_name                            AS learningitemtitle,
    oav.description                             AS lishortdescription,
    oav.start_date                              AS learningitemeffectiveasof,
    NULL                                        AS learningitempublisherdisplayname,

    -- === Effort / Pricing ===
    TO_CHAR(oav.duration)                       AS expectedeffortinhours,
    TO_CHAR(odb.successful_attendance_flag)      AS actualeffortinhours,  -- placeholder
    TO_CHAR(oav.duration)                       AS litotalexpectedeffort,
    oav.duration_units                          AS litotalexpectedeffortuom,
    CASE oav.duration_units
        WHEN 'H' THEN 'Hours'
        WHEN 'D' THEN 'Days'
        WHEN 'W' THEN 'Weeks'
        ELSE oav.duration_units
    END                                         AS litotalexpectedeffortuommeaning,
    oev.price_basis                             AS learningitemmaximumprice,
    oev.price_basis                             AS learningitemminimumprice,
    oev.currency_code                           AS learningitempricecurrency,

    -- === Request dates (mostly Fusion-only) ===
    NULL                                        AS requesteddate,
    NULL                                        AS requestedstartdate,
    NULL                                        AS requestedcompletebydate,
    NULL                                        AS requestapproveddate,
    NULL                                        AS requestrejecteddate,
    NULL                                        AS requestapprovedtimestamp,
    NULL                                        AS requestrejectedtimestamp,

    -- === Waitlist ===
    NULL                                        AS enteredwaitlistdate,
    NULL                                        AS enteredwaitlisttimestamp,
    NULL                                        AS currentwaitlistposition,
    NULL                                        AS exitedwaitlistdate,
    NULL                                        AS exitedwaitlisttimestamp,

    -- === Pending prerequisites (Fusion-only) ===
    NULL                                        AS deleteddate,
    NULL                                        AS enteredpendingprerequisitesdate,
    NULL                                        AS exitedpendingprerequisitesdate,
    NULL                                        AS enteredpendingprerequisitestimestamp,
    NULL                                        AS exitedpendingprerequisitestimestamp,
    NULL                                        AS enteredpendingpaymentdate,

    -- === Purchase ===
    odb.money_amount                            AS purchaseamount,
    oev.currency_code                           AS purchasecurrency,
    NULL                                        AS purchaseddate,
    NULL                                        AS purchasedtimestamp,

    -- === Core lifecycle dates ===
    odb.date_booking_placed                     AS assigneddate,
    oev.course_start_date                       AS starteddate,
    oev.course_start_date                       AS startedtimestamp,
    CASE WHEN obst.type = 'E'
         THEN NVL(oev.course_end_date, odb.date_status_changed)
         ELSE NULL
    END                                         AS contentcompleteddate,
    CASE WHEN obst.type = 'E'
         THEN NVL(oev.course_end_date, odb.date_status_changed)
         ELSE NULL
    END                                         AS contentcompletedtimestamp,
    NULL                                        AS evaluationsubmitteddate,
    NULL                                        AS evaluationsubmittedtimestamp,
    CASE WHEN obst.type = 'C'
         THEN odb.date_status_changed
         ELSE NULL
    END                                         AS withdrawndate,
    CASE WHEN obst.type = 'E'
         THEN NVL(oev.course_end_date, odb.date_status_changed)
         ELSE NULL
    END                                         AS completeddate,
    CASE WHEN obst.type = 'A'
         THEN odb.date_status_changed
         ELSE NULL
    END                                         AS activedate,

    -- === Expiration / Renewal (Fusion-only) ===
    NULL                                        AS expirationdate,
    NULL                                        AS expirationtimestamp,
    NULL                                        AS expirationindayssystemdate,
    NULL                                        AS validityperiodrule,
    NULL                                        AS validityperiodrulemeaning,
    NULL                                        AS renewalperiod,
    NULL                                        AS expirationrule,
    NULL                                        AS expirationrulecode,
    NULL                                        AS hasfuturerenewal,
    NULL                                        AS nextrenewassignmentid,
    NULL                                        AS nextrenewassignmentnumber,
    NULL                                        AS haspasrenewal,

    -- === Withdrawal ===
    CASE WHEN obst.type = 'C'
         THEN odb.date_status_changed
         ELSE NULL
    END                                         AS withdrawnrequesteddate,
    odb.cancellation_reason                     AS statuschangecomment,
    NULL                                        AS reasoncode,

    -- === Score / CPE ===
    NULL                                        AS actualscore,          -- OLM: in OTA_PERFORMANCES
    NULL                                        AS learningitemcpetype,
    NULL                                        AS learningitemcpetypemeaning,
    NULL                                        AS actualcpeunits,

    -- === Learning item subtype (Fusion-only) ===
    NULL                                        AS learningitemsubtype,
    NULL                                        AS learningitemsubtypemeaning,

    -- === Security / Privilege (Fusion-only) ===
    NULL                                        AS datasecurityprivilege,
    NULL                                        AS datasecurityprivilegemeaning,

    -- === Item versioning (Fusion-only) ===
    NULL                                        AS exempteddate,
    NULL                                        AS learningitemdefinitionuseddate,
    NULL                                        AS learningitemeffectivedate,
    NULL                                        AS learningitemlatestchangeeventdate,
    NULL                                        AS islearneronlatestliversion,
    NULL                                        AS enrollmentquestionnaireid,
    NULL                                        AS sourceid,
    NULL                                        AS sourcetype,

    -- === Instructor / Author / Coordinator ===
    NULL                                        AS learningiteminstructortype,
    NULL                                        AS learningiteminstructortypemeaning,
    instr.full_name                             AS learningiteminstructordisplayname,
    instr.employee_number                       AS learningiteminstructorpersonnumber,
    instr.email_address                         AS learningiteminstructoremailaddress,
    NULL                                        AS learningiteminstructorprimaryphonenumber,
    oer.resource_id                             AS learningiteminstructorpersonid,
    NULL                                        AS learningitemauthortype,
    NULL                                        AS learningitemauthordisplayname,
    NULL                                        AS learningitemauthoremailaddress,
    NULL                                        AS learningitemauthorphonenumber,
    NULL                                        AS learningitemauthorpersonid,
    NULL                                        AS learningitemcoorddisplayname,
    NULL                                        AS learningitemcoordemailaddress,
    NULL                                        AS learningitemcoordphonenumber,
    NULL                                        AS learningitemcoordpersonid,

    -- === Pending seat acceptance (Fusion-only) ===
    NULL                                        AS enteredpendingseatacceptancedate,
    NULL                                        AS exitedpendingseatacceptancedate,

    -- === Item schedule ===
    oev.course_start_date                       AS learningitemstartdateutc,
    oev.course_end_date                         AS learningitemenddateutc,
    NULL                                        AS learningitemnotificationpattern,

    -- === Misc ===
    NULL                                        AS assignmentdueinfromsystemdate,
    NULL                                        AS refundrule,
    NULL                                        AS caneditassignmenthint,
    NULL                                        AS caneditassignmenthintmeaning,
    NULL                                        AS assignmentstateseverity,
    NULL                                        AS assignmentstatemeaning,
    NULL                                        AS viewmodeoverridelearningitemid,

    -- === Audit ===
    odb.creation_date                           AS assignmentcreateddate,
    odb.last_update_date                        AS assignmentlastmodifieddate

FROM
    ota_delegate_bookings           odb
    -- Booking status type
    JOIN ota_booking_status_types   obst
        ON obst.booking_status_type_id = odb.booking_status_type_id
    -- Event (scheduled class/offering)
    JOIN ota_events                 oev
        ON oev.event_id = odb.event_id
    -- Activity version (course/learning item)
    LEFT JOIN ota_activity_versions oav
        ON oav.activity_version_id = oev.activity_version_id
    -- Learner (person)
    LEFT JOIN per_all_people_f      papf
        ON papf.person_id = odb.delegate_person_id
        AND NVL(odb.date_booking_placed, odb.creation_date)
            BETWEEN papf.effective_start_date AND papf.effective_end_date
    -- Instructor (first resource on the event)
    LEFT JOIN ota_event_resources   oer
        ON oer.event_id = oev.event_id
        AND oer.resource_type = 'T'            -- T = Trainer/Instructor
        AND ROWNUM = 1
    LEFT JOIN per_all_people_f      instr
        ON instr.person_id = oer.resource_id
        AND NVL(oev.course_start_date, SYSDATE)
            BETWEEN instr.effective_start_date AND instr.effective_end_date

WHERE
    odb.business_group_id = :p_business_group_id
    AND odb.creation_date BETWEEN :p_start_date AND :p_end_date

ORDER BY
    papf.employee_number,
    odb.date_booking_placed;
