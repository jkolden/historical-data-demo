--------------------------------------------------------
--  Mock legacy AP invoice LINE data
--  Ties back to demo_ap_invoices_hist via invoice_id
--------------------------------------------------------

truncate table demo_ap_invoice_line_hist;

------------------------------------------------------------------------
-- LEGACY (Infor) invoice lines
------------------------------------------------------------------------
-- INF-2015-0001  Classroom textbooks ($12,500)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500001, 5000011, 1, 'Math textbooks Grade 3-5', 'Item', 'Not Matched', 7500.00, 'Liquidated', date '2015-03-15', '101-610100-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500001, 5000012, 2, 'Science textbooks Grade 3-5', 'Item', 'Not Matched', 5000.00, 'Liquidated', date '2015-03-15', '101-610100-0000-000');

-- INF-2015-0002  IT equipment ($8,750)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500002, 5000021, 1, 'Desktop computers x10', 'Item', 'Not Matched', 6500.00, 'Liquidated', date '2015-07-01', '101-620200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500002, 5000022, 2, 'Monitors x10', 'Item', 'Not Matched', 2250.00, 'Liquidated', date '2015-07-01', '101-620200-0000-000');

-- INF-2016-0001  HVAC maintenance ($45,000)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500003, 5000031, 1, 'HVAC preventive maintenance - Q1', 'Item', 'Not Matched', 15000.00, 'Liquidated', date '2016-02-01', '101-630300-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500003, 5000032, 2, 'HVAC preventive maintenance - Q2', 'Item', 'Not Matched', 15000.00, 'Liquidated', date '2016-02-01', '101-630300-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500003, 5000033, 3, 'Replacement filters and parts', 'Item', 'Not Matched', 15000.00, 'Liquidated', date '2016-02-01', '101-630300-0000-000');

-- INF-2016-0002  Office supplies ($3,200)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500004, 5000041, 1, 'Copy paper and toner', 'Item', 'Not Matched', 1800.00, 'Liquidated', date '2016-04-15', '101-640100-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500004, 5000042, 2, 'Office furniture - chairs', 'Item', 'Not Matched', 1400.00, 'Liquidated', date '2016-04-15', '101-640100-0000-000');

-- INF-2017-0001  Student laptops Phase 1 ($67,500)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500005, 5000051, 1, 'Chromebooks x150', 'Item', 'Not Matched', 52500.00, 'Liquidated', date '2017-03-01', '101-620200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500005, 5000052, 2, 'Charging carts x10', 'Item', 'Not Matched', 10000.00, 'Liquidated', date '2017-03-01', '101-620200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500005, 5000053, 3, 'Protective cases x150', 'Item', 'Not Matched', 5000.00, 'Liquidated', date '2017-03-01', '101-620200-0000-000');

-- INF-2017-0002  Cafeteria equipment ($15,800)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500006, 5000061, 1, 'Commercial dishwasher', 'Item', 'Not Matched', 8500.00, 'Liquidated', date '2017-08-10', '101-650200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500006, 5000062, 2, 'Serving line warming trays', 'Item', 'Not Matched', 4300.00, 'Liquidated', date '2017-08-10', '101-650200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500006, 5000063, 3, 'Installation labor', 'Freight', 'Not Matched', 3000.00, 'Liquidated', date '2017-08-10', '101-650200-0000-000');

-- INF-2018-0001  Classroom furniture ($22,000)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500007, 5000071, 1, 'Student desks x60', 'Item', 'Not Matched', 12000.00, 'Liquidated', date '2018-01-20', '101-640200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500007, 5000072, 2, 'Student chairs x60', 'Item', 'Not Matched', 6000.00, 'Liquidated', date '2018-01-20', '101-640200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500007, 5000073, 3, 'Teacher desks x4', 'Item', 'Not Matched', 4000.00, 'Liquidated', date '2018-01-20', '101-640200-0000-000');

-- INF-2018-0002  Science lab supplies ($9,400)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500008, 5000081, 1, 'Lab equipment kits x20', 'Item', 'Not Matched', 6400.00, 'Liquidated', date '2018-06-01', '101-610200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500008, 5000082, 2, 'Safety goggles and gloves', 'Item', 'Not Matched', 3000.00, 'Liquidated', date '2018-06-01', '101-610200-0000-000');

-- INF-2019-0001  Bus fleet parts ($38,000)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500009, 5000091, 1, 'Brake assemblies x24', 'Item', 'Not Matched', 18000.00, 'Liquidated', date '2019-03-10', '101-660100-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500009, 5000092, 2, 'Tires x48', 'Item', 'Not Matched', 14400.00, 'Liquidated', date '2019-03-10', '101-660100-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500009, 5000093, 3, 'Oil and filters', 'Item', 'Not Matched', 5600.00, 'Liquidated', date '2019-03-10', '101-660100-0000-000');

-- INF-2019-0002  Athletic equipment ($5,600)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500010, 5000101, 1, 'Football equipment', 'Item', 'Not Matched', 3200.00, 'Liquidated', date '2019-09-15', '101-670100-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500010, 5000102, 2, 'Soccer goals and nets', 'Item', 'Not Matched', 2400.00, 'Liquidated', date '2019-09-15', '101-670100-0000-000');

-- INF-2020-0001  Student laptops Phase 2 ($82,000)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500011, 5000111, 1, 'Chromebooks x200', 'Item', 'Not Matched', 70000.00, 'Liquidated', date '2020-02-01', '101-620200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500011, 5000112, 2, 'Charging carts x12', 'Item', 'Not Matched', 12000.00, 'Liquidated', date '2020-02-01', '101-620200-0000-000');

-- INF-2020-0002  PPE supplies ($14,200)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500012, 5000121, 1, 'N95 masks - bulk', 'Item', 'Not Matched', 5200.00, 'Liquidated', date '2020-06-15', '101-680100-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500012, 5000122, 2, 'Hand sanitizer dispensers x50', 'Item', 'Not Matched', 4500.00, 'Liquidated', date '2020-06-15', '101-680100-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (500012, 5000123, 3, 'Plexiglass dividers x100', 'Item', 'Not Matched', 4500.00, 'Liquidated', date '2020-06-15', '101-680100-0000-000');

------------------------------------------------------------------------
-- EBS (Lawson) invoice lines
------------------------------------------------------------------------
-- LAW-40001  Network switches ($18,500)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600001, 6000011, 1, 'Cisco 48-port switches x10', 'Item', 'Not Matched', 15000.00, 'Liquidated', date '2018-02-20', '201-620300-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600001, 6000012, 2, 'Patch cables and accessories', 'Item', 'Not Matched', 2000.00, 'Liquidated', date '2018-02-20', '201-620300-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600001, 6000013, 3, 'Installation services', 'Freight', 'Not Matched', 1500.00, 'Liquidated', date '2018-02-20', '201-620300-0000-000');

-- LAW-40002  Janitorial supplies ($6,300)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600002, 6000021, 1, 'Cleaning chemicals - bulk', 'Item', 'Not Matched', 3500.00, 'Liquidated', date '2018-07-25', '201-640300-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600002, 6000022, 2, 'Mops, brooms, trash bags', 'Item', 'Not Matched', 2800.00, 'Liquidated', date '2018-07-25', '201-640300-0000-000');

-- LAW-40003  Modular classroom ($52,000)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600003, 6000031, 1, 'Modular building unit', 'Item', 'Not Matched', 42000.00, 'Liquidated', date '2019-01-15', '201-650300-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600003, 6000032, 2, 'Site prep and foundation', 'Item', 'Not Matched', 6500.00, 'Liquidated', date '2019-01-15', '201-650300-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600003, 6000033, 3, 'Electrical and HVAC hookup', 'Freight', 'Not Matched', 3500.00, 'Liquidated', date '2019-01-15', '201-650300-0000-000');

-- LAW-40004  Printer toner ($4,100)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600004, 6000041, 1, 'HP toner cartridges x50', 'Item', 'Not Matched', 2600.00, 'Liquidated', date '2019-06-01', '201-640100-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600004, 6000042, 2, 'Copy paper - 50 cases', 'Item', 'Not Matched', 1500.00, 'Liquidated', date '2019-06-01', '201-640100-0000-000');

-- LAW-40005  Security cameras Phase 1 ($27,500)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600005, 6000051, 1, 'IP cameras x30', 'Item', 'Not Matched', 18000.00, 'Liquidated', date '2019-11-20', '201-620400-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600005, 6000052, 2, 'NVR recording system', 'Item', 'Not Matched', 5500.00, 'Liquidated', date '2019-11-20', '201-620400-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600005, 6000053, 3, 'Cabling and installation', 'Freight', 'Not Matched', 4000.00, 'Liquidated', date '2019-11-20', '201-620400-0000-000');

-- LAW-40006  Remote learning hotspots ($11,200)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600006, 6000061, 1, 'Mobile hotspot devices x100', 'Item', 'Not Matched', 8000.00, 'Liquidated', date '2020-03-25', '201-620200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600006, 6000062, 2, '12-month data plans x100', 'Item', 'Not Matched', 3200.00, 'Liquidated', date '2020-03-25', '201-620200-0000-000');

-- LAW-40007  HVAC filtration ($33,000)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600007, 6000071, 1, 'MERV-13 filter units x20', 'Item', 'Not Matched', 16000.00, 'Liquidated', date '2020-08-15', '201-630300-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600007, 6000072, 2, 'UV-C air purifiers x15', 'Item', 'Not Matched', 12000.00, 'Liquidated', date '2020-08-15', '201-630300-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600007, 6000073, 3, 'Installation labor', 'Freight', 'Not Matched', 5000.00, 'Liquidated', date '2020-08-15', '201-630300-0000-000');

-- LAW-40008  Cafeteria disposables ($7,800)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600008, 6000081, 1, 'Disposable trays and utensils', 'Item', 'Not Matched', 4800.00, 'Liquidated', date '2021-02-10', '201-650200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600008, 6000082, 2, 'Individual milk cartons - bulk', 'Item', 'Not Matched', 3000.00, 'Liquidated', date '2021-02-10', '201-650200-0000-000');

-- LAW-40009  Chromebook fleet ($41,000)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600009, 6000091, 1, 'Chromebooks x100', 'Item', 'Not Matched', 35000.00, 'Liquidated', date '2021-07-20', '201-620200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600009, 6000092, 2, 'Enrollment and MDM setup', 'Item', 'Not Matched', 6000.00, 'Liquidated', date '2021-07-20', '201-620200-0000-000');

-- LAW-40010  Playground equipment ($16,500)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600010, 6000101, 1, 'ADA-compliant play structure', 'Item', 'Not Matched', 11000.00, 'Liquidated', date '2022-01-25', '201-670200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600010, 6000102, 2, 'Rubber surfacing material', 'Item', 'Not Matched', 3500.00, 'Liquidated', date '2022-01-25', '201-670200-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600010, 6000103, 3, 'Installation', 'Freight', 'Not Matched', 2000.00, 'Liquidated', date '2022-01-25', '201-670200-0000-000');

-- LAW-40011  Library books ($9,200)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600011, 6000111, 1, 'Fiction collection - 200 titles', 'Item', 'Not Matched', 5200.00, 'Liquidated', date '2022-07-05', '201-610100-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600011, 6000112, 2, 'Reference and non-fiction', 'Item', 'Not Matched', 4000.00, 'Liquidated', date '2022-07-05', '201-610100-0000-000');

-- LAW-40012  Security cameras Phase 2 ($24,000)
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600012, 6000121, 1, 'IP cameras x20', 'Item', 'Not Matched', 12000.00, 'Liquidated', date '2022-10-10', '201-620400-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600012, 6000122, 2, 'Access control readers x8', 'Item', 'Not Matched', 8000.00, 'Liquidated', date '2022-10-10', '201-620400-0000-000');
insert into demo_ap_invoice_line_hist (invoice_id, line_id, line_number, description, line_type, match_type, line_amount, funds_status, accounting_date, distribution_combination) values (600012, 6000123, 3, 'Cabling and installation', 'Freight', 'Not Matched', 4000.00, 'Liquidated', date '2022-10-10', '201-620400-0000-000');

commit;

-- verify
select h.invoicenumber, count(l.line_id) as line_count, to_char(sum(l.line_amount), 'FM$999,999,990.00') as line_total
from demo_ap_invoices_hist h
join demo_ap_invoice_line_hist l on l.invoice_id = h.invoiceid
group by h.invoicenumber
order by h.invoicenumber;
/
