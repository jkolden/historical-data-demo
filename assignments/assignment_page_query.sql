------------------------------------------------------------------------
--  HR Assignment History page - Interactive Report source
--  UNION ALL:  Fusion collection rows  +  local legacy table
--
--  Expects page items:
--    :P4001_LAST_NAME        (text)
--    :P4001_DEPARTMENT       (text / LOV - optional)
--    :P4001_TOTAL_ROWS       (hidden, set by process after pkg call)
--
--  Collection FUSION_ASSIGNMENT_ROWS is populated by
--  assignment_pkg.load_assignments via publicWorkers endpoint
------------------------------------------------------------------------

/* ======== Fusion (from shredded collection) ======== */
select
  c.seq_id             as id,
  'Fusion'             as SourceSystem,
  'Fusion'             as SourceSystem_search,

  c.n001               as PersonId,
  c.c001               as PersonNumber,
  c.c002               as DisplayName,
  c.n002               as AssignmentId,
  c.c003               as AssignmentNumber,
  c.c004               as AssignmentName,
  c.c005               as WorkerType,
  c.d001               as StartDate,
  c.c006               as DepartmentName,
  c.c007               as JobName,
  c.c008               as PositionName,
  c.c009               as GradeName,
  c.c010               as LocationName,
  c.c011               as BusinessUnit,
  c.c012               as LegalEmployer,
  c.c013               as ManagerName,
  c.c014               as FullPartTime,
  c.n003               as ServiceYears,
  -- legacy-only columns (null for Fusion)
  cast(null as varchar2(100)) as AssignmentStatus,
  cast(null as varchar2(100)) as ActionCode

from apex_collections c
where c.collection_name = 'FUSION_ASSIGNMENT_ROWS'

union all

/* ======== Legacy + EBS (from local table) ======== */
select
  null                 as id,
  d.sourcesystem       as SourceSystem,
  d.sourcesystem       as SourceSystem_search,

  d.personid           as PersonId,
  d.personnumber       as PersonNumber,
  d.displayname        as DisplayName,
  d.assignmentid       as AssignmentId,
  d.assignmentnumber   as AssignmentNumber,
  null                 as AssignmentName,
  d.workertype         as WorkerType,
  d.effectivestartdate as StartDate,
  d.departmentname     as DepartmentName,
  d.jobname            as JobName,
  d.positionname       as PositionName,
  d.gradename          as GradeName,
  d.locationname       as LocationName,
  d.businessunit       as BusinessUnit,
  null                 as LegalEmployer,
  null                 as ManagerName,
  d.assignmentcategory as FullPartTime,
  null                 as ServiceYears,
  d.assignmentstatus   as AssignmentStatus,
  d.actioncode         as ActionCode

from demo_assignment_hist d
where upper(d.displayname) like '%' || upper(:P4001_LAST_NAME) || '%'
  and ( nullif(:P4001_DEPARTMENT, '') is null
        or d.departmentname = :P4001_DEPARTMENT );
