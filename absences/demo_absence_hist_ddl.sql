--------------------------------------------------------
--  demo_absence_hist  -  legacy absence history
--  Mirrors the full Fusion absences REST endpoint fields
--  plus SourceSystem to tag Legacy / EBS rows.
--
--  Expanded to match all meaningful fields returned by:
--  /hcmRestApi/resources/11.13.18.05/absences
--------------------------------------------------------

CREATE TABLE demo_absence_hist (
  absence_hist_id                   NUMBER          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  -- === Source tag ===
  sourcesystem                      VARCHAR2(30)    NOT NULL,   -- 'Legacy' or 'EBS'

  -- === Core identifiers ===
  personabsenceentryid              NUMBER,
  personid                          NUMBER,
  personnumber                      VARCHAR2(100),
  displayname                       VARCHAR2(400),

  -- === Absence type / reason ===
  absencetypeid                     NUMBER,
  absencetype                       VARCHAR2(400),
  absencetypereasonid               NUMBER,
  absencereason                     VARCHAR2(400),
  absencepatterncd                  VARCHAR2(100),             -- GENERIC, etc.

  -- === Dates ===
  startdate                         DATE,
  enddate                           DATE,
  starttime                         VARCHAR2(10),
  endtime                           VARCHAR2(10),
  startdateduration                 NUMBER,
  enddateduration                   NUMBER,
  conditionstartdate                DATE,
  confirmeddate                     DATE,
  notificationdate                  DATE,
  establishmentdate                 DATE,
  submitteddate                     DATE,
  plannedenddate                    DATE,

  -- === Duration ===
  duration                          NUMBER,
  formattedduration                 VARCHAR2(200),
  unitofmeasure                     VARCHAR2(30),              -- code: D, H, etc.
  unitofmeasuremeaning              VARCHAR2(200),             -- display: Days, Hours

  -- === Status ===
  absencestatuscd                   VARCHAR2(100),
  approvalstatuscd                  VARCHAR2(100),
  absencedispstatus                 VARCHAR2(100),             -- code: COMPLETED, etc.
  absencedispstatusmeaning          VARCHAR2(400),             -- display: Completed
  processingstatus                  VARCHAR2(30),

  -- === Approval ===
  approvaldatetime                  TIMESTAMP(6),
  authstatusupdatedate              DATE,

  -- === Employer / Legal ===
  employer                          VARCHAR2(400),
  legalentityid                     NUMBER,
  legislationcode                   VARCHAR2(30),
  legislativedatagroupid            NUMBER,

  -- === Assignment ===
  assignmentid                      NUMBER,
  assignmentnumber                  VARCHAR2(100),
  assignmentname                    VARCHAR2(200),

  -- === Agreement ===
  agreementid                       NUMBER,
  agreementname                     VARCHAR2(200),
  paymentdetail                     VARCHAR2(400),

  -- === Flags ===
  absenceentrybasicflag             VARCHAR2(5),
  openendedflag                     VARCHAR2(5),
  singledayflag                     VARCHAR2(5),
  overridden                        VARCHAR2(5),
  latenotifyflag                    VARCHAR2(5),
  absenceupdatableflag              VARCHAR2(5),

  -- === Misc ===
  comments                          VARCHAR2(4000),
  source                            VARCHAR2(200),
  frequency                         VARCHAR2(200),
  usermode                          VARCHAR2(30),
  projectid                         NUMBER,

  -- === Audit ===
  createdby                         VARCHAR2(255),
  creationdate                      TIMESTAMP(6),
  lastupdatedby                     VARCHAR2(255),
  lastupdatedate                    TIMESTAMP(6)
);

-- Indexes for common page filters
CREATE INDEX demo_abs_hist_person_ix ON demo_absence_hist (personnumber);
CREATE INDEX demo_abs_hist_type_ix   ON demo_absence_hist (absencetype);
CREATE INDEX demo_abs_hist_date_ix   ON demo_absence_hist (startdate);
CREATE INDEX demo_abs_hist_status_ix ON demo_absence_hist (absencedispstatus);
/
