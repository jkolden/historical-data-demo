------------------------------------------------------------------------
--  demo_assignment_hist  -  mock legacy / EBS HR assignment data
--  Sierra-Cedar employees showing career progression into Fusion
--  DisplayNames use "LastName, FirstName" so LIKE search matches
------------------------------------------------------------------------

-- ===================== LEGACY rows (old HRIS, 2001-2019) =====================

-- Mary Wyle (10070) – Fusion: Recruiter, HR, Redwood City (started 2001)
insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('Legacy', 80001, 'L-10070', 'Wyle, Mary', 90001, 'L-10070-1', 'INACTIVE', 'HIRE', date '2001-06-15', date '2006-12-31', 'Human Resources', 'HR Assistant', 'HR Assistant - Recruiting', 'G1', 'Redwood City', 'Sierra-Cedar US BU', 'FR', 'E');

insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('Legacy', 80001, 'L-10070', 'Wyle, Mary', 90002, 'L-10070-2', 'INACTIVE', 'PROMOTION', date '2007-01-01', date '2013-06-30', 'Human Resources', 'HR Coordinator', 'HR Coordinator - Talent Acquisition', 'G2', 'Redwood City', 'Sierra-Cedar US BU', 'FR', 'E');

insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('Legacy', 80001, 'L-10070', 'Wyle, Mary', 90003, 'L-10070-3', 'INACTIVE', 'PROMOTION', date '2013-07-01', date '2019-12-31', 'Human Resources', 'Recruiter', 'Recruiter - Campus & Early Career', 'G2', 'Redwood City', 'Sierra-Cedar US BU', 'FR', 'E');

-- Serre Allain (200700) – Fusion: Shipping Agent, Warehouse, Toronto (started 2019)
insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('Legacy', 80002, 'L-200700', 'Allain, Serre', 90004, 'L-200700-1', 'INACTIVE', 'HIRE', date '2013-03-15', date '2016-02-29', 'Warehouse', 'Warehouse Associate', 'Warehouse Associate - Receiving', 'G1', 'Toronto', 'Sierra-Cedar CA BU', 'FR', 'E');

insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('Legacy', 80002, 'L-200700', 'Allain, Serre', 90005, 'L-200700-2', 'INACTIVE', 'PROMOTION', date '2016-03-01', date '2018-12-31', 'Warehouse', 'Inventory Clerk', 'Inventory Clerk - Toronto', 'G2', 'Toronto', 'Sierra-Cedar CA BU', 'FR', 'E');

-- Michael Clarke (201054) – Fusion: Representative, Sales, AU (started 2024)
insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('Legacy', 80003, 'L-201054', 'Clarke, Michael', 90006, 'L-201054-1', 'INACTIVE', 'HIRE', date '2015-09-01', date '2019-12-31', 'Sales', 'Sales Trainee', 'Sales Trainee - APAC', 'G1', 'Sydney', 'Sierra-Cedar AU BU', 'FR', 'E');

-- Ajit Padmanabhan (201043) – Fusion: Administrator, Sales, IN (started 2024)
insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('Legacy', 80004, 'L-201043', 'Padmanabhan, Ajit', 90007, 'L-201043-1', 'INACTIVE', 'HIRE', date '2016-04-15', date '2019-12-31', 'Administration', 'Office Assistant', 'Office Assistant - Bangalore', 'G1', 'Bangalore', 'Sierra-Cedar IN BU', 'FR', 'E');

-- Roy Chapin (201025) – Fusion: UK BU (started 2024)
insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('Legacy', 80005, 'L-201025', 'Chapin, Roy', 90008, 'L-201025-1', 'INACTIVE', 'HIRE', date '2014-06-01', date '2019-12-31', 'Finance', 'Analyst', 'Financial Analyst - UK', 'G2', 'London', 'Sierra-Cedar UK BU', 'FR', 'E');

-- ===================== EBS rows (EBS HRMS, 2020-2023) =====================

-- Mary Wyle – continued from Legacy
insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('EBS', 80001, 'E-10070', 'Wyle, Mary', 90010, 'E-10070-1', 'INACTIVE', 'TRANSFER', date '2020-01-01', date '2023-06-30', 'Human Resources', 'Senior Recruiter', 'Senior Recruiter - Technical', 'G2', 'Redwood City', 'Sierra-Cedar US BU', 'FR', 'E');

-- Serre Allain – continued from Legacy
insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('EBS', 80002, 'E-200700', 'Allain, Serre', 90011, 'E-200700-1', 'INACTIVE', 'PROMOTION', date '2019-01-01', date '2022-12-31', 'Warehouse', 'Shipping Coordinator', 'Shipping Coordinator - Toronto', 'G2', 'Toronto', 'Sierra-Cedar CA BU', 'FR', 'E');

-- Michael Clarke – continued from Legacy
insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('EBS', 80003, 'E-201054', 'Clarke, Michael', 90012, 'E-201054-1', 'INACTIVE', 'PROMOTION', date '2020-01-01', date '2021-12-31', 'Sales', 'Junior Representative', 'Junior Rep - APAC', 'G1', 'Sydney', 'Sierra-Cedar AU BU', 'FR', 'E');

insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('EBS', 80003, 'E-201054', 'Clarke, Michael', 90013, 'E-201054-2', 'INACTIVE', 'PROMOTION', date '2022-01-01', date '2023-12-31', 'Sales', 'Sales Associate', 'Sales Associate - APAC', 'G2', 'Sydney', 'Sierra-Cedar AU BU', 'FR', 'E');

-- Ajit Padmanabhan – continued from Legacy
insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('EBS', 80004, 'E-201043', 'Padmanabhan, Ajit', 90014, 'E-201043-1', 'INACTIVE', 'PROMOTION', date '2020-01-01', date '2021-06-30', 'Sales', 'Admin Coordinator', 'Admin Coordinator - Sales India', 'G1', 'Bangalore', 'Sierra-Cedar IN BU', 'FR', 'E');

insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('EBS', 80004, 'E-201043', 'Padmanabhan, Ajit', 90015, 'E-201043-2', 'INACTIVE', 'PROMOTION', date '2021-07-01', date '2023-12-31', 'Sales', 'Administrator', 'Administrator - Sales India', 'G2', 'Bangalore', 'Sierra-Cedar IN BU', 'FR', 'E');

-- Michael Blackmore (90005) – Fusion: US BU (started 2024), only EBS history
insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('EBS', 80006, 'E-90005', 'Blackmore, Michael', 90016, 'E-90005-1', 'INACTIVE', 'HIRE', date '2020-08-01', date '2022-07-31', 'Operations', 'Junior Analyst', 'Junior Analyst - Operations', 'G1', 'Redwood City', 'Sierra-Cedar US BU', 'FR', 'E');

insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('EBS', 80006, 'E-90005', 'Blackmore, Michael', 90017, 'E-90005-2', 'INACTIVE', 'PROMOTION', date '2022-08-01', date '2024-09-25', 'Operations', 'Analyst', 'Analyst - Operations', 'G2', 'Redwood City', 'Sierra-Cedar US BU', 'FR', 'E');

-- Roy Chapin – continued from Legacy
insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('EBS', 80005, 'E-201025', 'Chapin, Roy', 90018, 'E-201025-1', 'INACTIVE', 'PROMOTION', date '2020-01-01', date '2022-02-28', 'Finance', 'Senior Analyst', 'Senior Financial Analyst - UK', 'G2', 'London', 'Sierra-Cedar UK BU', 'FR', 'E');

insert into demo_assignment_hist (sourcesystem, personid, personnumber, displayname, assignmentid, assignmentnumber, assignmentstatus, actioncode, effectivestartdate, effectiveenddate, departmentname, jobname, positionname, gradename, locationname, businessunit, assignmentcategory, workertype)
values ('EBS', 80005, 'E-201025', 'Chapin, Roy', 90019, 'E-201025-2', 'INACTIVE', 'PROMOTION', date '2022-03-01', date '2024-06-02', 'Finance', 'Finance Manager', 'Finance Manager - UK', 'G3', 'London', 'Sierra-Cedar UK BU', 'FR', 'E');

commit;
