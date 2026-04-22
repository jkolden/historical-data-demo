------------------------------------------------------------------------
--  AR Receivables History page – Interactive Report source
--  UNION ALL:  Fusion collection rows  +  local legacy table
--
--  Expects page items:
--    :P<n>_CUSTOMER        (popup LOV – BillToCustomerName)
--    :P<n>_STATUS          (select list – InvoiceStatus)
--    :P<n>_FROM_DATE       (date picker)
--    :P<n>_TO_DATE         (date picker)
--
--  Collection FUSION_AR_ROWS is populated by
--    receivables_pkg.load_receivables_invoices
--  Each row has raw JSON in clob001 – parsed here with json_value().
------------------------------------------------------------------------

/* ======== Fusion (from collection, raw JSON in clob001) ======== */
select
  c.seq_id                                                          as id,
  'Fusion'                                                          as SourceSystem,
  json_value(c.clob001, '$.CustomerTransactionId' returning number) as CustomerTransactionId,
  json_value(c.clob001, '$.TransactionNumber')                      as TransactionNumber,
  to_date(json_value(c.clob001, '$.TransactionDate'), 'YYYY-MM-DD') as TransactionDate,
  json_value(c.clob001, '$.TransactionType')                        as TransactionType,
  json_value(c.clob001, '$.TransactionSource')                      as TransactionSource,
  json_value(c.clob001, '$.BusinessUnit')                           as BusinessUnit,
  json_value(c.clob001, '$.InvoiceStatus')                          as InvoiceStatus,
  json_value(c.clob001, '$.InvoiceCurrencyCode')                    as InvoiceCurrencyCode,
  json_value(c.clob001, '$.EnteredAmount' returning number)         as EnteredAmount,
  json_value(c.clob001, '$.InvoiceBalanceAmount' returning number)  as InvoiceBalanceAmount,
  to_date(json_value(c.clob001, '$.AccountingDate'), 'YYYY-MM-DD') as AccountingDate,
  to_date(json_value(c.clob001, '$.DueDate'), 'YYYY-MM-DD')        as DueDate,
  json_value(c.clob001, '$.BillToCustomerName')                     as BillToCustomerName,
  json_value(c.clob001, '$.BillToCustomerNumber')                   as BillToCustomerNumber,
  json_value(c.clob001, '$.BillToSite')                             as BillToSite,
  json_value(c.clob001, '$.PaymentTerms')                           as PaymentTerms,
  json_value(c.clob001, '$.PurchaseOrder')                          as PurchaseOrder,
  json_value(c.clob001, '$.RemitToAddress')                         as RemitToAddress,
  json_value(c.clob001, '$.DefaultTaxationCountry')                 as DefaultTaxationCountry,
  json_value(c.clob001, '$.Prepayment')                             as Prepayment,
  json_value(c.clob001, '$.Comments')                               as Comments

from apex_collections c
where c.collection_name = 'FUSION_AR_ROWS'

union all

/* ======== Legacy + EBS (from local table) ======== */
select
  null                    as id,
  d.sourcesystem          as SourceSystem,
  d.customertransactionid as CustomerTransactionId,
  d.transactionnumber     as TransactionNumber,
  d.transactiondate       as TransactionDate,
  d.transactiontype       as TransactionType,
  d.transactionsource     as TransactionSource,
  d.businessunit          as BusinessUnit,
  d.invoicestatus         as InvoiceStatus,
  d.invoicecurrencycode   as InvoiceCurrencyCode,
  d.enteredamount         as EnteredAmount,
  d.invoicebalanceamount  as InvoiceBalanceAmount,
  d.accountingdate        as AccountingDate,
  d.duedate               as DueDate,
  d.billtocustomername    as BillToCustomerName,
  d.billtocustomernumber  as BillToCustomerNumber,
  d.billtosite            as BillToSite,
  d.paymentterms          as PaymentTerms,
  d.purchaseorder         as PurchaseOrder,
  d.remittoaddress        as RemitToAddress,
  d.defaulttaxationcountry as DefaultTaxationCountry,
  d.prepayment            as Prepayment,
  d.comments              as Comments

from demo_ar_invoices_hist d
where ( nullif(:P_CUSTOMER, '') is null
        or d.billtocustomername = :P_CUSTOMER )
  and ( nullif(:P_STATUS, '') is null
        or d.invoicestatus = :P_STATUS )
;
