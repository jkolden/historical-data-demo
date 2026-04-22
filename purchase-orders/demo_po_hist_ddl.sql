--------------------------------------------------------
--  demo_po_hist  -  legacy purchase-order history
--  Mirrors the full Fusion purchaseOrders REST endpoint
--  plus SourceSystem to tag Legacy / EBS rows.
--
--  Expanded to match all meaningful fields returned by:
--  /fscmRestApi/resources/11.13.18.05/purchaseOrders
--------------------------------------------------------

CREATE TABLE demo_po_hist (
  po_hist_id                        NUMBER          GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  -- === Source tag ===
  sourcesystem                      VARCHAR2(30)    NOT NULL,   -- 'Legacy' or 'EBS'

  -- === Core identifiers ===
  poheaderid                        NUMBER,
  ordernumber                       VARCHAR2(200),
  statuscode                        VARCHAR2(200),
  status                            VARCHAR2(200),
  revision                          NUMBER,
  documentstyle                     VARCHAR2(200),
  purchasebasis                     VARCHAR2(200),             -- GOODS_AND_SERVICES, etc.
  description                       VARCHAR2(4000),

  -- === Amounts / Currency ===
  ordered                           NUMBER,                    -- line-level ordered amount
  orderedamountbeforeadjustments    NUMBER,
  creditamount                      NUMBER,
  discountamount                    NUMBER,
  totaltax                          NUMBER,
  total                             NUMBER,                    -- total incl tax
  recoverabletax                    NUMBER,
  nonrecoverabletax                 NUMBER,
  recoverableinclusivetax           NUMBER,
  nonrecoverableinclusivetax        NUMBER,
  currencycode                      VARCHAR2(30),
  currency                          VARCHAR2(100),             -- display name
  conversionratetype                VARCHAR2(30),
  conversionrate                    NUMBER,
  conversionratedate                DATE,

  -- === Dates ===
  orderdate                         DATE,
  creationdate                      DATE,
  lastupdatedate                    DATE,
  acknowledgmentduedate             DATE,

  -- === Business units / Legal entity ===
  procurementbu                     VARCHAR2(200),
  requisitioningbu                  VARCHAR2(200),
  billtobu                          VARCHAR2(200),
  soldtolegalentity                 VARCHAR2(200),

  -- === Supplier ===
  supplier                          VARCHAR2(400),
  suppliersite                      VARCHAR2(200),
  suppliercontact                   VARCHAR2(200),
  supplierorder                     VARCHAR2(200),
  suppliercommunicationmethod       VARCHAR2(200),

  -- === Buyer / Requester ===
  buyer                             VARCHAR2(200),
  buyerdisplayname                  VARCHAR2(200),
  requesterid                       NUMBER,
  requesterdisplayname              VARCHAR2(200),

  -- === Locations ===
  shiptolocationcode                VARCHAR2(200),
  shiptolocationaddress             VARCHAR2(400),
  billtolocation                    VARCHAR2(200),
  billtolocationaddress             VARCHAR2(400),

  -- === Payment / Terms ===
  paymentterms                      VARCHAR2(200),

  -- === Shipping / Freight ===
  carrier                           VARCHAR2(200),
  modeoftransport                   VARCHAR2(200),
  servicelevel                      VARCHAR2(200),
  shippingmethod                    VARCHAR2(200),
  freightterms                      VARCHAR2(200),
  fob                               VARCHAR2(200),

  -- === Contract / Source ===
  mastercontractnumber              VARCHAR2(200),
  mastercontracttype                VARCHAR2(200),
  sourceagreement                   VARCHAR2(200),
  salesorder                        VARCHAR2(200),
  negotiation                       VARCHAR2(200),
  requisition                       VARCHAR2(200),

  -- === Notes ===
  notetosupplier                    VARCHAR2(4000),
  notetoreceiver                    VARCHAR2(4000),

  -- === References ===
  referencenumber                   VARCHAR2(200),
  importsourcecode                  VARCHAR2(30),

  -- === Budget / Funds ===
  fundsstatuscode                   VARCHAR2(200),
  fundsstatus                       VARCHAR2(200),
  budgetcontrolenabledflag          VARCHAR2(5),

  -- === Flags ===
  requiressignatureflag             VARCHAR2(5),
  payonreceiptflag                  VARCHAR2(5),
  confirmingorderflag               VARCHAR2(5),
  buyermanagedtransportflag         VARCHAR2(5),
  retainageflag                     VARCHAR2(5),
  progresspaymentflag               VARCHAR2(5),
  consignmenttermsflag              VARCHAR2(5),

  -- === Acknowledgment ===
  requiredacknowledgment            VARCHAR2(200),
  acknowledgewithindays             NUMBER,

  -- === Approver override ===
  overridingapprover                VARCHAR2(200),

  -- === Tax / Fiscal ===
  defaulttaxationcountry            VARCHAR2(200),
  documentfiscalclassification      VARCHAR2(200),
  firstpartyregistrationnumber      VARCHAR2(200),
  thirdpartyregistrationnumber      VARCHAR2(200),

  -- === Audit ===
  createdby                         VARCHAR2(255),
  lastupdatedby                     VARCHAR2(255)
);

-- Indexes for common page filters
CREATE INDEX demo_po_hist_supplier_ix ON demo_po_hist (supplier);
CREATE INDEX demo_po_hist_status_ix   ON demo_po_hist (status);
CREATE INDEX demo_po_hist_date_ix     ON demo_po_hist (orderdate);
CREATE INDEX demo_po_hist_bu_ix       ON demo_po_hist (procurementbu);
/
