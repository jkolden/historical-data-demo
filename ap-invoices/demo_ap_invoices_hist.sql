--------------------------------------------------------
--  demo_ap_invoices_hist  -  legacy AP invoice headers
--  Mirrors the full Fusion invoices REST endpoint fields
--  plus SourceSystem to tag Legacy / EBS rows.
--
--  Expanded to match all meaningful fields returned by:
--  /fscmRestApi/resources/11.13.18.05/invoices
--------------------------------------------------------

CREATE TABLE demo_ap_invoices_hist (
  -- === Source tag ===
  sourcesystem                      VARCHAR2(30)    NOT NULL,   -- 'Legacy' or 'EBS'

  -- === Core identifiers ===
  invoiceid                         NUMBER          NOT NULL,
  invoicenumber                     VARCHAR2(100)   NOT NULL,
  invoicetype                       VARCHAR2(50),
  invoicesourcecode                  VARCHAR2(255),
  invoicesource                     VARCHAR2(255),
  invoicegroup                      VARCHAR2(255),
  description                       VARCHAR2(240),

  -- === Amounts / Currency ===
  invoiceamount                     NUMBER(14,2),
  amountpaid                        NUMBER(14,2),
  baseamount                        NUMBER(14,2),
  controlamount                     NUMBER(14,2),
  invoicecurrency                   VARCHAR2(15),
  paymentcurrency                   VARCHAR2(15),
  conversionratetype                VARCHAR2(30),
  conversiondate                    DATE,
  conversionrate                    NUMBER,

  -- === Key dates ===
  invoicedate                       DATE,
  accountingdate                    DATE,
  termsdate                         DATE,
  goodsreceiveddate                 DATE,
  invoicereceiveddate               DATE,
  applyafterdate                    DATE,
  budgetdate                        DATE,
  canceleddate                      DATE,

  -- === Business unit / Legal entity ===
  businessunit                      VARCHAR2(255),
  procurementbu                     VARCHAR2(255),
  legalentity                       VARCHAR2(255),
  legalentityidentifier             VARCHAR2(100),
  taxationcountry                   VARCHAR2(255),

  -- === Supplier ===
  supplier                          VARCHAR2(255),
  suppliernumber                    VARCHAR2(30),
  suppliersite                      VARCHAR2(255),
  party                             VARCHAR2(255),
  partysite                         VARCHAR2(255),
  suppliertaxregistrationnumber     VARCHAR2(100),

  -- === Requester ===
  requesterid                       NUMBER,
  requester                         VARCHAR2(255),

  -- === Statuses ===
  validationstatus                  VARCHAR2(50),
  approvalstatus                    VARCHAR2(50),
  paidstatus                        VARCHAR2(50),
  accountingstatus                  VARCHAR2(50),
  fundsstatus                       VARCHAR2(100),
  accountcodingstatus               VARCHAR2(100),
  canceledflag                      VARCHAR2(5),
  canceledby                        VARCHAR2(255),

  -- === Payment details ===
  paymentterms                      VARCHAR2(100),
  paymentmethodcode                 VARCHAR2(30),
  paymentmethod                     VARCHAR2(100),
  paygroup                          VARCHAR2(255),
  payaloneflag                      VARCHAR2(5),
  bankaccount                       VARCHAR2(100),
  supplieriban                      VARCHAR2(100),
  externalbankaccountid             NUMBER,
  bankchargebearer                  VARCHAR2(100),
  settlementpriority                VARCHAR2(100),

  -- === Payment reason ===
  paymentreasoncode                 VARCHAR2(30),
  paymentreason                     VARCHAR2(255),
  paymentreasoncomments             VARCHAR2(4000),

  -- === Remittance ===
  remittancemessageone              VARCHAR2(255),
  remittancemessagetwo              VARCHAR2(255),
  remittancemessagethree            VARCHAR2(255),
  uniqueremittanceidentifier        VARCHAR2(255),
  uniqueremittanceidentifierchkdig  VARCHAR2(10),

  -- === Delivery ===
  deliverychannelcode               VARCHAR2(30),
  deliverychannel                   VARCHAR2(255),

  -- === Liability / Distribution ===
  liabilitydistribution             VARCHAR2(255),

  -- === Document ===
  documentcategory                  VARCHAR2(100),
  documentsequence                  NUMBER,
  vouchernumber                     NUMBER,
  documentfiscalclasscodepath       VARCHAR2(4000),

  -- === PO link ===
  purchaseordernumber               VARCHAR2(50),

  -- === First-party tax ===
  firstpartytaxregistrationid       NUMBER,
  firstpartytaxregistrationnumber   VARCHAR2(100),

  -- === Routing attributes ===
  routingattribute1                 VARCHAR2(255),
  routingattribute2                 VARCHAR2(255),
  routingattribute3                 VARCHAR2(255),
  routingattribute4                 VARCHAR2(255),
  routingattribute5                 VARCHAR2(255),

  -- === Reference keys ===
  referencekeyone                   VARCHAR2(255),
  referencekeytwo                   VARCHAR2(255),
  referencekeythree                 VARCHAR2(255),
  referencekeyfour                  VARCHAR2(255),
  referencekeyfive                  VARCHAR2(255),

  -- === Misc ===
  producttable                      VARCHAR2(255),
  imagedocumentnumber               VARCHAR2(255),
  digitalpaymentaccount             VARCHAR2(255),

  -- === Audit ===
  creationdate                      TIMESTAMP(6),
  createdby                         VARCHAR2(255),
  lastupdatedate                    TIMESTAMP(6),
  lastupdatedby                     VARCHAR2(255),

  CONSTRAINT demo_ap_invoices_hist_pk PRIMARY KEY (sourcesystem, invoiceid)
);

-- Indexes for common page filters
CREATE INDEX demo_ap_inv_hist_date_ix     ON demo_ap_invoices_hist (invoicedate);
CREATE INDEX demo_ap_inv_hist_supplier_ix ON demo_ap_invoices_hist (suppliernumber);
CREATE INDEX demo_ap_inv_hist_bu_ix       ON demo_ap_invoices_hist (businessunit);
CREATE INDEX demo_ap_inv_hist_status_ix   ON demo_ap_invoices_hist (paidstatus);
/
