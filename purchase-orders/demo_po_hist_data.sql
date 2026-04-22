--------------------------------------------------------
--  Mock legacy purchase-order data for the PO History
--  demo page.  Two source systems:
--    Legacy  – older ERP (pre-2020 data)
--    EBS     – Oracle E-Business Suite (2018-2022)
--
--  Supplier names overlap with what exists in the
--  Fusion test instance so the filter / mashup is visible.
--  Uses real Fusion location names where possible.
--------------------------------------------------------

-- wipe previous demo rows
truncate table demo_po_hist;

------------------------------------------------------------------------
-- LEGACY source  (older ERP, 2015-2020)
------------------------------------------------------------------------
insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('Legacy', 900001, 'LPO-2015-0001', 12500.00, 13125.00, 0, date '2015-03-12', date '2015-03-10', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Jane Smith', 'USD', 'Net 30', 'Classroom textbooks - Spring 2015', 'Alexander Elementary School', 'Central Office', 'Liquidated', null);

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('Legacy', 900002, 'LPO-2015-0002', 8750.00, 9187.50, 0, date '2015-06-20', date '2015-06-18', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Jane Smith', 'USD', 'Net 30', 'IT equipment - Summer refresh', 'Alexander Elementary School', 'Central Office', 'Liquidated', null);

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('Legacy', 900003, 'LPO-2016-0001', 45000.00, 47250.00, 1, date '2016-01-15', date '2016-01-12', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Bob Johnson', 'USD', 'Net 45', 'HVAC maintenance contract FY16', 'Central Office', 'Central Office', 'Liquidated', 'LREQ-1001');

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('Legacy', 900004, 'LPO-2016-0002', 3200.00, 3360.00, 0, date '2016-04-08', date '2016-04-05', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Jane Smith', 'USD', 'Net 30', 'Office supplies Q2 2016', 'Central Office', 'Central Office', 'Liquidated', null);

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('Legacy', 900005, 'LPO-2017-0001', 67500.00, 70875.00, 2, date '2017-02-20', date '2017-02-15', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Bob Johnson', 'USD', 'Net 60', 'Student laptops - 1:1 initiative Phase 1', 'Alexander Elementary School', 'Central Office', 'Liquidated', 'LREQ-1045');

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('Legacy', 900006, 'LPO-2017-0002', 15800.00, 16590.00, 0, date '2017-08-01', date '2017-07-28', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Jane Smith', 'USD', 'Net 30', 'Cafeteria equipment replacement', 'Central Office', 'Central Office', 'Liquidated', null);

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('Legacy', 900007, 'LPO-2018-0001', 22000.00, 23100.00, 0, date '2018-01-10', date '2018-01-08', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Bob Johnson', 'USD', 'Net 30', 'Classroom furniture - new wing', 'Alexander Elementary School', 'Central Office', 'Liquidated', 'LREQ-1102');

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('Legacy', 900008, 'LPO-2018-0002', 9400.00, 9870.00, 1, date '2018-05-15', date '2018-05-12', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Jane Smith', 'USD', 'Net 30', 'Science lab supplies FY18', 'Central Office', 'Central Office', 'Liquidated', null);

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('Legacy', 900009, 'LPO-2019-0001', 38000.00, 39900.00, 0, date '2019-03-01', date '2019-02-25', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Bob Johnson', 'USD', 'Net 45', 'Bus fleet maintenance parts', 'Central Office', 'Central Office', 'Liquidated', 'LREQ-1200');

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('Legacy', 900010, 'LPO-2019-0002', 5600.00, 5880.00, 0, date '2019-09-10', date '2019-09-08', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Jane Smith', 'USD', 'Net 30', 'Athletic equipment - Fall sports', 'Alexander Elementary School', 'Central Office', 'Liquidated', null);

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('Legacy', 900011, 'LPO-2020-0001', 82000.00, 86100.00, 3, date '2020-01-20', date '2020-01-15', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Bob Johnson', 'USD', 'Net 60', 'Student laptops - 1:1 initiative Phase 2', 'Alexander Elementary School', 'Central Office', 'Liquidated', 'LREQ-1310');

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('Legacy', 900012, 'LPO-2020-0002', 14200.00, 14910.00, 0, date '2020-06-05', date '2020-06-01', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Jane Smith', 'USD', 'Net 30', 'PPE and sanitization supplies - COVID', 'Central Office', 'Central Office', 'Liquidated', null);

------------------------------------------------------------------------
-- EBS source  (Oracle E-Business Suite, 2018-2022)
------------------------------------------------------------------------
insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('EBS', 800001, 'EBS-40001', 18500.00, 19425.00, 0, date '2018-02-14', date '2018-02-12', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Mary Williams', 'USD', 'Net 30', 'Network switches - district-wide upgrade', 'Alexander Elementary School', 'Central Office', 'Liquidated', 'EREQ-5001');

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('EBS', 800002, 'EBS-40002', 6300.00, 6615.00, 0, date '2018-07-20', date '2018-07-18', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Mary Williams', 'USD', 'Net 30', 'Janitorial supplies Q3 2018', 'Central Office', 'Central Office', 'Liquidated', null);

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('EBS', 800003, 'EBS-40003', 52000.00, 54600.00, 1, date '2019-01-08', date '2019-01-05', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Tom Davis', 'USD', 'Net 45', 'Modular classroom building', 'Central Office', 'Central Office', 'Liquidated', 'EREQ-5020');

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('EBS', 800004, 'EBS-40004', 4100.00, 4305.00, 0, date '2019-05-22', date '2019-05-20', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Mary Williams', 'USD', 'Net 30', 'Printer toner and paper - bulk', 'Central Office', 'Central Office', 'Liquidated', null);

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('EBS', 800005, 'EBS-40005', 27500.00, 28875.00, 0, date '2019-11-15', date '2019-11-12', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Tom Davis', 'USD', 'Net 30', 'Security camera system - Phase 1', 'Alexander Elementary School', 'Central Office', 'Liquidated', 'EREQ-5055');

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('EBS', 800006, 'EBS-40006', 11200.00, 11760.00, 0, date '2020-03-18', date '2020-03-15', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Mary Williams', 'USD', 'Net 30', 'Remote learning hotspots - COVID response', 'Alexander Elementary School', 'Central Office', 'Liquidated', null);

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('EBS', 800007, 'EBS-40007', 33000.00, 34650.00, 2, date '2020-08-10', date '2020-08-05', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Tom Davis', 'USD', 'Net 45', 'HVAC air filtration upgrades', 'Central Office', 'Central Office', 'Liquidated', 'EREQ-5100');

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('EBS', 800008, 'EBS-40008', 7800.00, 8190.00, 0, date '2021-02-01', date '2021-01-28', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Mary Williams', 'USD', 'Net 30', 'Cafeteria disposables - COVID protocols', 'Central Office', 'Central Office', 'Liquidated', null);

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('EBS', 800009, 'EBS-40009', 41000.00, 43050.00, 1, date '2021-07-15', date '2021-07-12', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Tom Davis', 'USD', 'Net 60', 'Chromebook fleet replacement', 'Alexander Elementary School', 'Central Office', 'Liquidated', 'EREQ-5150');

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('EBS', 800010, 'EBS-40010', 16500.00, 17325.00, 0, date '2022-01-20', date '2022-01-18', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Mary Williams', 'USD', 'Net 30', 'Playground equipment - ADA compliance', 'Central Office', 'Central Office', 'Liquidated', null);

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('EBS', 800011, 'EBS-40011', 9200.00, 9660.00, 0, date '2022-06-30', date '2022-06-28', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Tom Davis', 'USD', 'Net 30', 'Library books and media - FY22', 'Central Office', 'Central Office', 'Liquidated', null);

insert into demo_po_hist (sourcesystem, poheaderid, ordernumber, ordered, total, revision, orderdate, creationdate, procurementbu, supplier, suppliersite, status, buyer, currencycode, paymentterms, description, shiptolocationcode, billtolocation, fundsstatus, requisition)
values ('EBS', 800012, 'EBS-40012', 24000.00, 25200.00, 1, date '2022-10-05', date '2022-10-01', 'Greenville County Schools', 'Lee Supplies', 'ALL', 'Closed', 'Mary Williams', 'USD', 'Net 45', 'Security camera system - Phase 2', 'Alexander Elementary School', 'Central Office', 'Liquidated', 'EREQ-5200');

commit;

-- verify
select sourcesystem, count(*) as po_count, to_char(sum(total), 'FM$999,999,990.00') as total_value
from demo_po_hist
group by sourcesystem
order by sourcesystem;
/