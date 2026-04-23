------------------------------------------------------------------------
--  demo_checks_hist  –  local table for Legacy / EBS check data
--
--  Columns mirror the Fusion payablesPayments REST resource so the
--  IR UNION ALL query works seamlessly.
------------------------------------------------------------------------

create table demo_checks_hist (
  id                            number generated always as identity primary key,
  sourcesystem                  varchar2(30)   not null,   -- 'Legacy' or 'EBS'
  -- identifiers
  checkid                       number,
  paymentid                     number,
  paymentreference              number,
  paperdocumentnumber           number,                    -- "check number"
  paymentnumber                 number,
  paymentfilereference          number,
  -- core payment info
  paymentprocessrequest         varchar2(255),
  paymentamount                 number,
  paymentdate                   date,
  accountingdate                date,
  paymentdescription            varchar2(240),
  -- conversion
  conversionrate                number,
  conversiondate                date,
  conversionratetype            varchar2(30),
  -- clearing
  clearingdate                  date,
  clearingamount                number,
  clearingledgeramount          number,
  clearingconversionrate        number,
  clearingconversiondate        date,
  clearingconversionratetype    varchar2(30),
  -- maturity
  maturitydate                  date,
  maturityconversionratetype    varchar2(30),
  maturityconversiondate        date,
  maturityconversionrate        number,
  -- value dates
  anticipatedvaluedate          date,
  clearingvaluedate             date,
  -- stop / void
  stopdate                      date,
  stopreason                    varchar2(240),
  stopreference                 varchar2(240),
  voiddate                      date,
  voidaccountingdate            date,
  -- statuses
  paymentstatus                 varchar2(80),
  accountingstatus              varchar2(80),
  ibypaymentstatus              varchar2(80),
  reconciledflag                varchar2(5),   -- 'true'/'false'
  -- payment classification
  paymenttype                   varchar2(80),
  paymentcurrency               varchar2(15),
  paymentbaseamount             number,
  paymentbasecurrency           varchar2(15),
  crosscurrencyratetype         varchar2(30),
  -- amounts
  withheldamount                number,
  bankchargeamount              number,
  -- org / entity
  legalentity                   varchar2(240),
  businessunit                  varchar2(240),
  procurementbu                 varchar2(240),
  paymentfunction               varchar2(80),
  -- payee
  payee                         varchar2(240),
  partyid                       number,
  payeesite                     varchar2(240),
  employeeaddress               varchar2(240),
  suppliernumber                varchar2(30),
  thirdpartysupplier            varchar2(240),
  thirdpartyaddressname         varchar2(240),
  -- bank accounts
  externalbankaccountid         number,
  remittoaccountnumber          varchar2(100),
  disbursementbankaccountnumber varchar2(100),
  disbursementbankaccountname   varchar2(150),
  -- payment method / profile
  paymentmethodcode             varchar2(30),
  paymentmethod                 varchar2(100),
  paymentdocument               varchar2(80),
  paymentprocessprofilecode     varchar2(80),
  paymentprocessprofile         varchar2(240),
  -- document
  documentcategory              varchar2(80),
  documentsequence              number,
  vouchernumber                 number,
  separateremittanceadvice      varchar2(10),
  -- address
  addressline1                  varchar2(240),
  addressline2                  varchar2(240),
  addressline3                  varchar2(240),
  addressline4                  varchar2(240),
  city                          varchar2(150),
  county                        varchar2(150),
  province                      varchar2(150),
  state                         varchar2(150),
  country                       varchar2(10),
  zip                           varchar2(60),
  -- audit
  createdby                     varchar2(100),
  creationdate                  timestamp with time zone,
  lastupdatedby                 varchar2(100),
  lastupdatedate                timestamp with time zone,
  -- misc
  paymentmode                   varchar2(80),
  fundingcardaccount            varchar2(240),
  digitalpaymentaccount         varchar2(240)
);

-- Sample data: see demo_checks_hist_data.sql (git-ignored)
