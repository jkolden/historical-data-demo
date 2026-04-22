-- ============================================================
-- Table: DEMO_AR_INVOICES_HIST
-- Subject Area: Receivables Invoices (AR)
-- Source REST endpoint:
--   /fscmRestApi/resources/11.13.18.05/receivablesInvoices
--
-- Stores Legacy / EBS historical receivables invoices.
-- Column names mirror the Fusion REST attribute names
-- (lower-cased, underscored).
-- ============================================================

create table demo_ar_invoices_hist (
  -- ---- Keys & Source ----
  sourcesystem                          varchar2(30)    not null,
  customertransactionid                 number          not null,

  -- ---- Core Transaction ----
  transactionnumber                     varchar2(200),
  transactiondate                       date,
  transactionsource                     varchar2(200),
  transactiontype                       varchar2(200),
  businessunit                          varchar2(200),
  invoicestatus                         varchar2(100),
  invoicecurrencycode                   varchar2(30),
  enteredamount                         number,
  freightamount                         number,
  invoicebalanceamount                  number,

  -- ---- Dates ----
  accountingdate                        date,
  billingdate                           date,
  duedate                               date,
  shipdate                              date,
  purchaseorderdate                     date,

  -- ---- Bill-To ----
  billtocustomername                    varchar2(400),
  billtocustomernumber                  varchar2(100),
  billtopartyid                         number,
  billtosite                            varchar2(200),
  billtocontact                         varchar2(400),

  -- ---- Ship-To ----
  shiptocustomername                    varchar2(400),
  shiptocustomernumber                  varchar2(100),
  shiptosite                            varchar2(200),
  shiptocontact                         varchar2(400),

  -- ---- Paying Customer ----
  payingcustomeraccount                 varchar2(200),
  payingcustomername                    varchar2(400),
  payingcustomersite                    varchar2(200),

  -- ---- Sold-To ----
  soldtopartynumber                     varchar2(100),

  -- ---- Payment & Terms ----
  paymentterms                          varchar2(200),
  receiptmethod                         varchar2(200),
  invoicingrule                         varchar2(200),
  bankaccountnumber                     varchar2(200),
  prepayment                            varchar2(100),
  structuredpaymentreference            varchar2(200),

  -- ---- Credit Card ----
  cardholderfirstname                   varchar2(200),
  cardholderlastname                    varchar2(200),
  creditcardtokennumber                 varchar2(200),
  creditcardissuercode                  varchar2(100),
  creditcardexpirationdate              varchar2(100),
  creditcardauthorizationrequestidentifier varchar2(200),
  creditcardvoiceauthorizationcode      varchar2(200),
  creditcarderrorcode                   varchar2(100),
  creditcarderrortext                   varchar2(2000),

  -- ---- Conversion / Currency ----
  conversiondate                        date,
  conversionrate                        number,
  conversionratetype                    varchar2(100),

  -- ---- Sales & Shipping ----
  salespersonnumber                     varchar2(100),
  carrier                               varchar2(200),
  shippingreference                     varchar2(200),

  -- ---- Purchase Order ----
  purchaseorder                         varchar2(200),
  purchaseorderrevision                 varchar2(100),

  -- ---- References & Notes ----
  crossreference                        varchar2(200),
  comments                              varchar2(4000),
  internalnotes                         varchar2(4000),
  specialinstructions                   varchar2(4000),
  email                                 varchar2(400),

  -- ---- Print ----
  invoiceprinted                        varchar2(30),
  printoption                           varchar2(100),
  lastprintdate                         date,
  originalprintdate                     date,

  -- ---- Legal & Tax ----
  legalentityidentifier                 varchar2(200),
  defaulttaxationcountry                varchar2(100),
  firstpartyregistrationnumber          varchar2(200),
  thirdpartyregistrationnumber          varchar2(200),
  documentfiscalclassification          varchar2(200),

  -- ---- Miscellaneous ----
  documentnumber                        number,
  remittoaddress                        varchar2(2000),
  deliverymethod                        varchar2(100),
  intercompany                          varchar2(100),
  allowcompletion                       varchar2(10),
  controlcompletionreason               varchar2(2000),

  -- ---- Audit ----
  createdby                             varchar2(200),
  creationdate                          timestamp,
  lastupdatedby                         varchar2(200),
  lastupdatedate                        timestamp,

  -- ---- PK ----
  constraint demo_ar_invoices_hist_pk
    primary key (sourcesystem, customertransactionid)
);

-- Indexes for common queries
create index demo_ar_inv_hist_txndate_ix
  on demo_ar_invoices_hist (transactiondate);

create index demo_ar_inv_hist_billcust_ix
  on demo_ar_invoices_hist (billtocustomernumber);

create index demo_ar_inv_hist_bu_ix
  on demo_ar_invoices_hist (businessunit);

create index demo_ar_inv_hist_status_ix
  on demo_ar_invoices_hist (invoicestatus);
