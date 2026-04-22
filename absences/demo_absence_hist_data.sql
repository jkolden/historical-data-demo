------------------------------------------------------------------------
--  demo_absence_hist  -  mock legacy / EBS absence data
--  Person numbers match Fusion so records mash up in the combined view
--  DisplayNames use "LastName, FirstName" format
------------------------------------------------------------------------

-- ===================== LEGACY rows (old HRIS, 2010-2019) =====================

-- Person 200214 (AR LE) – Fusion has Marriage Leave AR, Bereavement Leave AR, Annual Leave AR
insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70001, 100000065388289, '200214', 'Martinez, Lucas', 'Annual Leave', 'Vacation', date '2011-01-10', date '2011-01-14', 5, '5 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AR LE', 'AR', 'Summer vacation', '200214-1', 'Manual Entry', date '2010-12-20');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70002, 100000065388289, '200214', 'Martinez, Lucas', 'Sick Leave', 'Illness', date '2013-07-15', date '2013-07-16', 2, '2 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AR LE', 'AR', null, '200214-1', 'Manual Entry', date '2013-07-15');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70003, 100000065388289, '200214', 'Martinez, Lucas', 'Marriage Leave', 'Marriage', date '2015-11-02', date '2015-11-06', 5, '5 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AR LE', 'AR', 'Wedding leave', '200214-1', 'Manual Entry', date '2015-10-15');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70004, 100000065388289, '200214', 'Martinez, Lucas', 'Annual Leave', 'Vacation', date '2018-12-24', date '2018-12-31', 5, '5 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AR LE', 'AR', 'Holiday break', '200214-2', 'Manual Entry', date '2018-12-10');

-- Person 10093 (UK/GB LE) – Fusion has Sick Leave, Annual Leave
insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70005, 100000065398399, '10093', 'Chapin, Roy', 'Annual Leave', 'Vacation', date '2012-08-06', date '2012-08-17', 10, '10 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar UK LE', 'GB', 'Summer holiday', '10093-1', 'Manual Entry', date '2012-07-20');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70006, 100000065398399, '10093', 'Chapin, Roy', 'Sick Leave', 'Illness', date '2014-02-03', date '2014-02-04', 2, '2 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar UK LE', 'GB', 'Flu', '10093-1', 'Manual Entry', date '2014-02-03');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70007, 100000065398399, '10093', 'Chapin, Roy', 'Paternity Leave', 'Childbirth', date '2016-09-05', date '2016-09-16', 10, '10 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar UK LE', 'GB', 'Paternity leave', '10093-1', 'Manual Entry', date '2016-08-22');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70008, 100000065398399, '10093', 'Chapin, Roy', 'Annual Leave', 'Vacation', date '2018-12-21', date '2018-12-31', 7, '7 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar UK LE', 'GB', 'Christmas break', '10093-2', 'Manual Entry', date '2018-12-01');

-- Person 201054 (AU LE) – Fusion has Annual Leave AU
insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70009, 100000065398397, '201054', 'Clarke, Michael', 'Annual Leave', 'Vacation', date '2013-12-23', date '2013-12-31', 7, '7 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AU LE', 'AU', 'Christmas holiday', '201054-1', 'Manual Entry', date '2013-12-01');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70010, 100000065398397, '201054', 'Clarke, Michael', 'Sick Leave', 'Illness', date '2015-06-08', date '2015-06-10', 3, '3 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AU LE', 'AU', 'Flu', '201054-1', 'Manual Entry', date '2015-06-08');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70011, 100000065398397, '201054', 'Clarke, Michael', 'Annual Leave', 'Vacation', date '2017-01-02', date '2017-01-13', 10, '10 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AU LE', 'AU', 'Summer break', '201054-2', 'Manual Entry', date '2016-12-15');

-- Person 200700 (CA LE) – Fusion has Annual Leave CA
insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70012, 100000065398395, '200700', 'Allain, Serre', 'Annual Leave', 'Vacation', date '2014-08-11', date '2014-08-22', 10, '10 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar CA LE', 'CA', 'Family vacation', '200700-1', 'Manual Entry', date '2014-07-25');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70013, 100000065398395, '200700', 'Allain, Serre', 'Sick Leave', 'Medical Appointment', date '2016-11-07', date '2016-11-07', 1, '1 Day', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar CA LE', 'CA', null, '200700-2', 'Manual Entry', date '2016-11-07');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('Legacy', 70014, 100000065398395, '200700', 'Allain, Serre', 'Annual Leave', 'Vacation', date '2019-03-11', date '2019-03-15', 5, '5 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar CA LE', 'CA', 'March break', '200700-2', 'Manual Entry', date '2019-02-25');

-- ===================== EBS rows (EBS HRMS, 2020-2023) =====================

-- Person 200214 (AR LE)
insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70015, 100000065388289, '200214', 'Martinez, Lucas', 'Annual Leave', 'Vacation', date '2020-01-20', date '2020-01-24', 5, '5 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AR LE', 'AR', 'Summer vacation', '200214-2', 'Self-Service', date '2020-01-06');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70016, 100000065388289, '200214', 'Martinez, Lucas', 'Sick Leave', 'Illness', date '2021-05-10', date '2021-05-11', 2, '2 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AR LE', 'AR', null, '200214-2', 'Self-Service', date '2021-05-10');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70017, 100000065388289, '200214', 'Martinez, Lucas', 'Bereavement Leave', 'Family Bereavement', date '2022-09-12', date '2022-09-14', 3, '3 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AR LE', 'AR', null, '200214-3', 'Self-Service', date '2022-09-12');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70018, 100000065388289, '200214', 'Martinez, Lucas', 'Annual Leave', 'Vacation', date '2023-12-22', date '2023-12-29', 5, '5 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AR LE', 'AR', 'Holiday break', '200214-3', 'Self-Service', date '2023-12-08');

-- Person 10093 (UK/GB LE)
insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70019, 100000065398399, '10093', 'Chapin, Roy', 'Annual Leave', 'Vacation', date '2020-08-03', date '2020-08-14', 10, '10 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar UK LE', 'GB', 'Summer holiday', '10093-2', 'Self-Service', date '2020-07-20');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70020, 100000065398399, '10093', 'Chapin, Roy', 'Sick Leave', 'Illness', date '2021-11-08', date '2021-11-10', 3, '3 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar UK LE', 'GB', 'Cold/flu', '10093-2', 'Self-Service', date '2021-11-08');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70021, 100000065398399, '10093', 'Chapin, Roy', 'Bereavement Leave', 'Family Bereavement', date '2023-05-15', date '2023-05-19', 5, '5 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar UK LE', 'GB', null, '10093-3', 'Self-Service', date '2023-05-15');

-- Person 201054 (AU LE)
insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70022, 100000065398397, '201054', 'Clarke, Michael', 'Annual Leave', 'Vacation', date '2020-12-21', date '2020-12-31', 8, '8 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AU LE', 'AU', 'Christmas break', '201054-2', 'Self-Service', date '2020-12-01');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70023, 100000065398397, '201054', 'Clarke, Michael', 'Marriage Leave', 'Marriage', date '2022-04-11', date '2022-04-15', 5, '5 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AU LE', 'AU', 'Wedding leave', '201054-3', 'Self-Service', date '2022-03-25');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70024, 100000065398397, '201054', 'Clarke, Michael', 'Sick Leave', 'Medical Appointment', date '2023-03-06', date '2023-03-07', 2, '2 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar AU LE', 'AU', null, '201054-3', 'Self-Service', date '2023-03-06');

-- Person 200700 (CA LE)
insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70025, 100000065398395, '200700', 'Allain, Serre', 'Annual Leave', 'Vacation', date '2020-07-06', date '2020-07-10', 5, '5 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar CA LE', 'CA', 'Canada Day week', '200700-2', 'Self-Service', date '2020-06-22');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70026, 100000065398395, '200700', 'Allain, Serre', 'Sick Leave', 'Illness', date '2021-11-22', date '2021-11-24', 3, '3 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar CA LE', 'CA', 'Cold/flu', '200700-3', 'Self-Service', date '2021-11-22');

insert into demo_absence_hist (sourcesystem, personabsenceentryid, personid, personnumber, displayname, absencetype, absencereason, startdate, enddate, duration, formattedduration, unitofmeasuremeaning, absencestatuscd, approvalstatuscd, absencedispstatusmeaning, employer, legislationcode, comments, assignmentnumber, source, submitteddate)
values ('EBS', 70027, 100000065398395, '200700', 'Allain, Serre', 'Annual Leave', 'Vacation', date '2023-08-07', date '2023-08-18', 10, '10 Days', 'Days', 'SUBMITTED', 'APPROVED', 'Approved', 'Sierra-Cedar CA LE', 'CA', 'Summer vacation', '200700-3', 'Self-Service', date '2023-07-24');

commit;
