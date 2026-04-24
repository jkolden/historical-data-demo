------------------------------------------------------------------------
--  demo_learning_hist  --  local table for Legacy / EBS learning data
--
--  Columns mirror the Fusion learnerLearningRecords REST resource so
--  the IR UNION ALL query works seamlessly.
------------------------------------------------------------------------

create table demo_learning_hist (
  id                                    number generated always as identity primary key,
  sourcesystem                          varchar2(30)   not null,   -- 'Legacy' or 'EBS'
  -- identifiers
  assignmentrecordid                    number,
  assignmentrecordnumber                varchar2(30),
  -- assignment type / status
  assignmenttype                        varchar2(80),
  assignmenttypemeaning                 varchar2(240),
  assignmentjustification               varchar2(4000),
  assignmentduedate                     timestamp with time zone,
  assignmentstatus                      varchar2(80),
  assignmentstatusmeaning               varchar2(240),
  assignmentsubstatus                   varchar2(80),
  assignmentsubstatusmeaning            varchar2(240),
  assignmentattributionid               number,
  -- learner (assigned-to)
  assignedtoid                          number,
  assignedtonumber                      varchar2(30),
  assignedtotype                        varchar2(80),
  assignedtotypemeaning                 varchar2(240),
  assignedtopersonprimaryemailaddress   varchar2(240),
  assignedtopersonprimaryphonenumber    varchar2(80),
  assignedtodisplayname                 varchar2(240),
  -- assigner
  assignerid                            number,
  assignernumber                        varchar2(30),
  assignerattributiontype               varchar2(80),
  assignerattributiontypemeaning        varchar2(240),
  assignerdisplayname                   varchar2(240),
  assignerpersonprimaryemailaddress     varchar2(240),
  assignerpersonprimaryphonenumber      varchar2(80),
  assignercommentstolearner             varchar2(4000),
  -- learning item
  learningitemid                        number,
  learningitemnumber                    varchar2(30),
  learningitemtype                      varchar2(80),
  learningitemtypemeaning               varchar2(240),
  learningitemtitle                     varchar2(240),
  lishortdescription                    varchar2(4000),
  learningitemeffectiveasof             date,
  learningitempublisherdisplayname      varchar2(240),
  -- effort / pricing
  expectedeffortinhours                 varchar2(30),
  actualeffortinhours                   varchar2(30),
  litotalexpectedeffort                 varchar2(30),
  litotalexpectedeffortuom              varchar2(30),
  litotalexpectedeffortuommeaning       varchar2(240),
  learningitemmaximumprice              number,
  learningitemminimumprice              number,
  learningitempricecurrency             varchar2(15),
  -- request dates
  requesteddate                         timestamp with time zone,
  requestedstartdate                    timestamp with time zone,
  requestedcompletebydate               timestamp with time zone,
  requestapproveddate                   timestamp with time zone,
  requestrejecteddate                   timestamp with time zone,
  requestapprovedtimestamp              timestamp with time zone,
  requestrejectedtimestamp              timestamp with time zone,
  -- waitlist
  enteredwaitlistdate                   timestamp with time zone,
  enteredwaitlisttimestamp              timestamp with time zone,
  currentwaitlistposition               number,
  exitedwaitlistdate                    timestamp with time zone,
  exitedwaitlisttimestamp               timestamp with time zone,
  -- pending prerequisites
  deleteddate                           timestamp with time zone,
  enteredpendingprerequisitesdate       timestamp with time zone,
  exitedpendingprerequisitesdate        timestamp with time zone,
  enteredpendingprerequisitestimestamp  timestamp with time zone,
  exitedpendingprerequisitestimestamp   timestamp with time zone,
  enteredpendingpaymentdate             timestamp with time zone,
  -- purchase
  purchaseamount                        number,
  purchasecurrency                      varchar2(15),
  purchaseddate                         timestamp with time zone,
  purchasedtimestamp                    timestamp with time zone,
  -- core lifecycle dates
  assigneddate                          timestamp with time zone,
  starteddate                           timestamp with time zone,
  startedtimestamp                      timestamp with time zone,
  contentcompleteddate                  timestamp with time zone,
  contentcompletedtimestamp             timestamp with time zone,
  evaluationsubmitteddate               timestamp with time zone,
  evaluationsubmittedtimestamp          timestamp with time zone,
  withdrawndate                         timestamp with time zone,
  completeddate                         timestamp with time zone,
  activedate                            timestamp with time zone,
  -- expiration / renewal
  expirationdate                        timestamp with time zone,
  expirationtimestamp                   timestamp with time zone,
  expirationindayssystemdate            number,
  validityperiodrule                    varchar2(80),
  validityperiodrulemeaning             varchar2(240),
  renewalperiod                         varchar2(80),
  expirationrule                        varchar2(240),
  expirationrulecode                    varchar2(80),
  hasfuturerenewal                      varchar2(10),   -- 'true'/'false'
  nextrenewassignmentid                 number,
  nextrenewassignmentnumber             varchar2(30),
  haspasrenewal                         varchar2(5),    -- 'Y'/'N'
  -- withdrawal
  withdrawnrequesteddate                timestamp with time zone,
  statuschangecomment                   varchar2(4000),
  reasoncode                            varchar2(80),
  -- score / CPE
  actualscore                           number,
  learningitemcpetype                   varchar2(80),
  learningitemcpetypemeaning            varchar2(240),
  actualcpeunits                        number,
  -- learning item subtype
  learningitemsubtype                   varchar2(80),
  learningitemsubtypemeaning            varchar2(240),
  -- security / privilege
  datasecurityprivilege                 varchar2(80),
  datasecurityprivilegemeaning          varchar2(240),
  -- item versioning
  exempteddate                          timestamp with time zone,
  learningitemdefinitionuseddate        timestamp with time zone,
  learningitemeffectivedate             timestamp with time zone,
  learningitemlatestchangeeventdate     timestamp with time zone,
  islearneronlatestliversion            varchar2(5),    -- 'Y'/'N'
  enrollmentquestionnaireid             number,
  sourceid                              number,
  sourcetype                            varchar2(80),
  -- instructor / author / coordinator
  learningiteminstructortype            varchar2(80),
  learningiteminstructortypemeaning     varchar2(240),
  learningiteminstructordisplayname     varchar2(240),
  learningiteminstructorpersonnumber    varchar2(30),
  learningiteminstructoremailaddress    varchar2(240),
  learningiteminstructorprimaryphonenumber varchar2(80),
  learningiteminstructorpersonid        number,
  learningitemauthortype                varchar2(80),
  learningitemauthordisplayname         varchar2(240),
  learningitemauthoremailaddress        varchar2(240),
  learningitemauthorphonenumber         varchar2(80),
  learningitemauthorpersonid            number,
  learningitemcoorddisplayname          varchar2(240),
  learningitemcoordemailaddress         varchar2(240),
  learningitemcoordphonenumber          varchar2(80),
  learningitemcoordpersonid             number,
  -- pending seat acceptance
  enteredpendingseatacceptancedate      timestamp with time zone,
  exitedpendingseatacceptancedate       timestamp with time zone,
  -- item schedule
  learningitemstartdateutc              timestamp with time zone,
  learningitemenddateutc                timestamp with time zone,
  learningitemnotificationpattern       varchar2(80),
  -- misc
  assignmentdueinfromsystemdate         number,
  refundrule                            varchar2(240),
  caneditassignmenthint                 varchar2(80),
  caneditassignmenthintmeaning          varchar2(240),
  assignmentstateseverity               varchar2(80),
  assignmentstatemeaning                varchar2(240),
  viewmodeoverridelearningitemid        number,
  -- audit
  assignmentcreateddate                 timestamp with time zone,
  assignmentlastmodifieddate            timestamp with time zone
);

-- Sample data: see demo_learning_hist_data.sql (git-ignored)
