------------------------------------------------------------------------
--  Absence History page - Interactive Report source
--  UNION ALL:  Fusion collection rows  +  local legacy table
--
--  Expects page items:
--    :P5001_PERSON_NUMBER    (text - required)
--    :P5001_FROM_DATE        (date - optional)
--    :P5001_TO_DATE          (date - optional)
--    :P5001_TOTAL_ROWS       (hidden, set by process after pkg call)
--
--  Collection FUSION_ABSENCE_ROWS is populated by
--  absence_pkg.load_absences via absences endpoint
------------------------------------------------------------------------

/* ======== Fusion (from shredded collection) ======== */
select
  c.seq_id                 as id,
  'Fusion'                 as SourceSystem,
  'Fusion'                 as SourceSystem_search,

  c.n001                   as PersonAbsenceEntryId,
  c.n002                   as PersonId,
  c.c001                   as PersonNumber,
  c.c002                   as AbsenceType,
  c.c003                   as AbsenceReason,
  c.d001                   as StartDate,
  c.d002                   as EndDate,
  c.n003                   as Duration,
  c.c009                   as FormattedDuration,
  c.c010                   as UnitOfMeasure,
  c.c004                   as AbsenceStatus,
  c.c005                   as ApprovalStatus,
  c.c006                   as StatusMeaning,
  c.c007                   as Employer,
  c.c008                   as LegislationCode,
  c.c011                   as Comments,
  c.c012                   as AssignmentNumber,
  c.c013                   as Source,
  c.d003                   as SubmittedDate

from apex_collections c
where c.collection_name = 'FUSION_ABSENCE_ROWS'

union all

/* ======== Legacy + EBS (from local table) ======== */
select
  null                          as id,
  d.sourcesystem                as SourceSystem,
  d.sourcesystem                as SourceSystem_search,

  d.personabsenceentryid        as PersonAbsenceEntryId,
  d.personid                    as PersonId,
  d.personnumber                as PersonNumber,
  d.absencetype                 as AbsenceType,
  d.absencereason               as AbsenceReason,
  d.startdate                   as StartDate,
  d.enddate                     as EndDate,
  d.duration                    as Duration,
  d.formattedduration           as FormattedDuration,
  d.unitofmeasuremeaning        as UnitOfMeasure,
  d.absencestatuscd             as AbsenceStatus,
  d.approvalstatuscd            as ApprovalStatus,
  d.absencedispstatusmeaning    as StatusMeaning,
  d.employer                    as Employer,
  d.legislationcode             as LegislationCode,
  d.comments                    as Comments,
  d.assignmentnumber            as AssignmentNumber,
  d.source                      as Source,
  d.submitteddate               as SubmittedDate

from demo_absence_hist d
where d.personnumber like '%' || :P5001_PERSON_NUMBER || '%'
  and ( nullif(:P5001_FROM_DATE, '') is null
        or d.startdate >= to_date(:P5001_FROM_DATE, 'YYYY-MM-DD') )
  and ( nullif(:P5001_TO_DATE, '') is null
        or d.startdate <= to_date(:P5001_TO_DATE, 'YYYY-MM-DD') );
