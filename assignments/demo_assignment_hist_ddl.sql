--------------------------------------------------------
--  demo_assignment_hist  -  legacy HR assignment history
--  Mirrors the full Fusion publicWorkers + assignments
--  REST endpoint, flattened into a single table.
--  SourceSystem tags Legacy / EBS rows.
--
--  Expanded to match all meaningful fields returned by:
--  /hcmRestApi/resources/11.13.18.05/publicWorkers
--    -> child/assignments
--------------------------------------------------------

CREATE TABLE demo_assignment_hist (
  assignment_hist_id                NUMBER          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  -- === Source tag ===
  sourcesystem                      VARCHAR2(30)    NOT NULL,   -- 'Legacy' or 'EBS'

  -- === Person-level fields (from publicWorkers) ===
  personid                          NUMBER,
  personnumber                      VARCHAR2(100),
  displayname                       VARCHAR2(400),
  listname                          VARCHAR2(400),             -- "Last, First"
  ordername                         VARCHAR2(400),             -- "Last First"
  lastname                          VARCHAR2(200),
  firstname                         VARCHAR2(200),
  middlenames                       VARCHAR2(200),
  title                             VARCHAR2(100),
  suffix                            VARCHAR2(100),
  honors                            VARCHAR2(200),
  knownas                           VARCHAR2(200),
  workemail                         VARCHAR2(400),
  username                          VARCHAR2(400),

  -- === Assignment identifiers ===
  assignmentid                      NUMBER,
  assignmentnumber                  VARCHAR2(100),
  assignmentname                    VARCHAR2(200),

  -- === Assignment status / action ===
  assignmentstatus                  VARCHAR2(100),              -- ACTIVE / INACTIVE
  actioncode                        VARCHAR2(100),              -- HIRE / PROMOTION / TRANSFER / TERMINATION

  -- === Dates ===
  effectivestartdate                DATE,
  effectiveenddate                  DATE,
  startdate                         DATE,                      -- assignment start date

  -- === Organization ===
  legalemployername                 VARCHAR2(200),
  businessunit                      VARCHAR2(200),
  departmentname                    VARCHAR2(200),
  jobcode                           VARCHAR2(100),
  jobname                           VARCHAR2(200),
  positioncode                      VARCHAR2(100),
  positionname                      VARCHAR2(200),
  gradecode                         VARCHAR2(100),
  gradename                         VARCHAR2(200),
  managername                       VARCHAR2(400),

  -- === Location ===
  locationcode                      VARCHAR2(200),
  locationname                      VARCHAR2(200),
  locationaddressline1              VARCHAR2(400),
  locationaddressline2              VARCHAR2(400),
  locationaddressline3              VARCHAR2(400),
  locationaddressline4              VARCHAR2(400),
  locationregion1                   VARCHAR2(200),
  locationregion2                   VARCHAR2(200),
  locationregion3                   VARCHAR2(200),
  locationtownorcity                VARCHAR2(200),
  locationpostalcode                VARCHAR2(100),
  locationcountry                   VARCHAR2(100),
  locationtimezonecode              VARCHAR2(100),
  locationsinglelineaddress         VARCHAR2(4000),

  -- === Internal workspace ===
  internalbuilding                  VARCHAR2(200),
  internalfloor                     VARCHAR2(200),
  internalofficenumber              VARCHAR2(200),
  internalmailstop                  VARCHAR2(200),

  -- === Worker classification ===
  assignmentcategory                VARCHAR2(100),              -- FR=Full-time Regular, PT=Part-time
  workertype                        VARCHAR2(30),               -- E=Employee, C=Contingent Worker
  fullparttime                      VARCHAR2(30),
  workathomeflag                    VARCHAR2(5),
  primaryflag                       VARCHAR2(5),
  primaryassignmentflag             VARCHAR2(5),

  -- === Length of service ===
  lengthofserviceyears              NUMBER,
  lengthofservicemonths             NUMBER,
  lengthofservicedays               NUMBER
);

-- Indexes for common page filters
CREATE INDEX demo_asgn_hist_name_ix   ON demo_assignment_hist (UPPER(displayname));
CREATE INDEX demo_asgn_hist_dept_ix   ON demo_assignment_hist (departmentname);
CREATE INDEX demo_asgn_hist_status_ix ON demo_assignment_hist (assignmentstatus);
CREATE INDEX demo_asgn_hist_date_ix   ON demo_assignment_hist (effectivestartdate);
CREATE INDEX demo_asgn_hist_person_ix ON demo_assignment_hist (personnumber);
/
