/*===========================================================
  EBS R12 Extraction: Receivables (AR) Invoices
  Target table: DEMO_AR_INVOICES_HIST

  Source: Oracle E-Business Suite R12
  Tables: RA_CUSTOMER_TRX_ALL + TCA/AR lookups

  Usage:
    Run against an EBS R12 database instance.
    Output column aliases match DEMO_AR_INVOICES_HIST exactly.

  Bind variables — adjust per customer:
    :p_org_id      - Operating unit (org_id) to extract
    :p_start_date  - Transaction date range start
    :p_end_date    - Transaction date range end

  Notes:
    - EBS AR uses TCA (Trading Community Architecture) for
      customer data: HZ_PARTIES → HZ_CUST_ACCOUNTS → HZ_CUST_SITE_USES
    - Credit card fields may not be populated in all implementations
    - Amount comes from RA_CUSTOMER_TRX_LINES_ALL aggregate
===========================================================*/

SELECT
    -- === Keys & Source ===
    'EBS'                                       AS sourcesystem,
    rct.customer_trx_id                         AS customertransactionid,

    -- === Core Transaction ===
    rct.trx_number                              AS transactionnumber,
    rct.trx_date                                AS transactiondate,
    rbs.name                                    AS transactionsource,
    rctt.name                                   AS transactiontype,
    hou.name                                    AS businessunit,
    CASE
        WHEN aps.amount_due_remaining = 0 THEN 'Closed'
        WHEN aps.status = 'OP'            THEN 'Open'
        WHEN aps.status = 'CL'            THEN 'Closed'
        ELSE NVL(aps.status, 'Open')
    END                                         AS invoicestatus,
    rct.invoice_currency_code                   AS invoicecurrencycode,
    (SELECT SUM(rctl.extended_amount)
       FROM ra_customer_trx_lines_all rctl
      WHERE rctl.customer_trx_id = rct.customer_trx_id
        AND rctl.line_type = 'LINE')            AS enteredamount,
    (SELECT SUM(rctl.extended_amount)
       FROM ra_customer_trx_lines_all rctl
      WHERE rctl.customer_trx_id = rct.customer_trx_id
        AND rctl.line_type = 'FREIGHT')         AS freightamount,
    aps.amount_due_remaining                    AS invoicebalanceamount,

    -- === Dates ===
    rctlgd.gl_date                              AS accountingdate,
    rct.billing_date                            AS billingdate,
    aps.due_date                                AS duedate,
    rct.ship_date_actual                        AS shipdate,
    rct.purchase_order_date                     AS purchaseorderdate,

    -- === Bill-To ===
    hp_bill.party_name                          AS billtocustomername,
    hca_bill.account_number                     AS billtocustomernumber,
    hp_bill.party_id                            AS billtopartyid,
    hcsua_bill.location                         AS billtosite,
    NULL                                        AS billtocontact,        -- join RA_CONTACTS if needed

    -- === Ship-To ===
    hp_ship.party_name                          AS shiptocustomername,
    hca_ship.account_number                     AS shiptocustomernumber,
    hcsua_ship.location                         AS shiptosite,
    NULL                                        AS shiptocontact,

    -- === Paying Customer ===
    hca_pay.account_number                      AS payingcustomeraccount,
    hp_pay.party_name                           AS payingcustomername,
    NULL                                        AS payingcustomersite,

    -- === Sold-To ===
    hca_bill.account_number                     AS soldtopartynumber,    -- bill-to = sold-to in most cases

    -- === Payment & Terms ===
    rat.name                                    AS paymentterms,
    arm.name                                    AS receiptmethod,
    CASE rct.invoicing_rule_id
        WHEN -2 THEN 'In Advance'
        WHEN -3 THEN 'In Arrears'
        ELSE NULL
    END                                         AS invoicingrule,
    NULL                                        AS bankaccountnumber,    -- on receipts, not transactions
    NULL                                        AS prepayment,
    NULL                                        AS structuredpaymentreference, -- Fusion-only

    -- === Credit Card ===
    NULL                                        AS cardholderfirstname,
    NULL                                        AS cardholderlastname,
    NULL                                        AS creditcardtokennumber,
    NULL                                        AS creditcardissuercode,
    NULL                                        AS creditcardexpirationdate,
    NULL                                        AS creditcardauthorizationrequestidentifier,
    NULL                                        AS creditcardvoiceauthorizationcode,
    NULL                                        AS creditcarderrorcode,
    NULL                                        AS creditcarderrortext,

    -- === Conversion / Currency ===
    rct.exchange_date                           AS conversiondate,
    rct.exchange_rate                           AS conversionrate,
    rct.exchange_rate_type                      AS conversionratetype,

    -- === Sales & Shipping ===
    rs.salesrep_number                          AS salespersonnumber,
    rct.ship_via                                AS carrier,
    rct.waybill_number                          AS shippingreference,

    -- === Purchase Order ===
    rct.purchase_order                          AS purchaseorder,
    rct.purchase_order_revision                 AS purchaseorderrevision,

    -- === References & Notes ===
    rct.ct_reference                            AS crossreference,
    rct.comments                                AS comments,
    rct.internal_notes                          AS internalnotes,
    rct.special_instructions                    AS specialinstructions,
    hp_bill.email_address                       AS email,

    -- === Print ===
    rct.printing_option                         AS invoiceprinted,
    rct.printing_option                         AS printoption,
    rct.printing_last_printed                   AS lastprintdate,
    rct.printing_original_date                  AS originalprintdate,

    -- === Legal & Tax ===
    TO_CHAR(rct.legal_entity_id)                AS legalentityidentifier,
    NULL                                        AS defaulttaxationcountry,       -- Fusion eBTax
    NULL                                        AS firstpartyregistrationnumber, -- Fusion eBTax
    NULL                                        AS thirdpartyregistrationnumber, -- Fusion eBTax
    NULL                                        AS documentfiscalclassification, -- Fusion eBTax

    -- === Miscellaneous ===
    rct.doc_sequence_value                      AS documentnumber,
    NULL                                        AS remittoaddress,       -- Fusion-only
    NULL                                        AS deliverymethod,       -- Fusion-only
    NULL                                        AS intercompany,         -- Fusion-only
    NULL                                        AS allowcompletion,      -- Fusion-only
    NULL                                        AS controlcompletionreason, -- Fusion-only

    -- === Audit ===
    fu_cr.user_name                             AS createdby,
    rct.creation_date                           AS creationdate,
    fu_upd.user_name                            AS lastupdatedby,
    rct.last_update_date                        AS lastupdatedate

FROM
    ra_customer_trx_all             rct
    -- Operating unit
    JOIN hr_operating_units         hou
        ON hou.organization_id = rct.org_id
    -- Transaction type
    LEFT JOIN ra_cust_trx_types_all rctt
        ON rctt.cust_trx_type_id = rct.cust_trx_type_id
        AND rctt.org_id = rct.org_id
    -- Batch source
    LEFT JOIN ra_batch_sources_all  rbs
        ON rbs.batch_source_id = rct.batch_source_id
        AND rbs.org_id = rct.org_id
    -- Payment schedule (first open schedule for status/balance)
    LEFT JOIN ar_payment_schedules_all aps
        ON aps.customer_trx_id = rct.customer_trx_id
        AND aps.terms_sequence_number = 1
    -- GL date (from first distribution)
    LEFT JOIN ra_cust_trx_line_gl_dist_all rctlgd
        ON rctlgd.customer_trx_id = rct.customer_trx_id
        AND rctlgd.account_class = 'REC'
        AND rctlgd.latest_rec_flag = 'Y'
    -- Bill-to customer (TCA hierarchy)
    LEFT JOIN hz_cust_accounts      hca_bill
        ON hca_bill.cust_account_id = rct.bill_to_customer_id
    LEFT JOIN hz_parties            hp_bill
        ON hp_bill.party_id = hca_bill.party_id
    LEFT JOIN hz_cust_site_uses_all hcsua_bill
        ON hcsua_bill.site_use_id = rct.bill_to_site_use_id
    -- Ship-to customer
    LEFT JOIN hz_cust_accounts      hca_ship
        ON hca_ship.cust_account_id = rct.ship_to_customer_id
    LEFT JOIN hz_parties            hp_ship
        ON hp_ship.party_id = hca_ship.party_id
    LEFT JOIN hz_cust_site_uses_all hcsua_ship
        ON hcsua_ship.site_use_id = rct.ship_to_site_use_id
    -- Paying customer
    LEFT JOIN hz_cust_accounts      hca_pay
        ON hca_pay.cust_account_id = rct.paying_customer_id
    LEFT JOIN hz_parties            hp_pay
        ON hp_pay.party_id = hca_pay.party_id
    -- Payment terms
    LEFT JOIN ra_terms              rat
        ON rat.term_id = rct.term_id
    -- Receipt method
    LEFT JOIN ar_receipt_methods    arm
        ON arm.receipt_method_id = rct.receipt_method_id
    -- Salesperson
    LEFT JOIN ra_salesreps_all      rs
        ON rs.salesrep_id = rct.primary_salesrep_id
        AND rs.org_id = rct.org_id
    -- Audit: created by
    LEFT JOIN fnd_user              fu_cr
        ON fu_cr.user_id = rct.created_by
    -- Audit: last updated by
    LEFT JOIN fnd_user              fu_upd
        ON fu_upd.user_id = rct.last_updated_by

WHERE
    rct.org_id = :p_org_id
    AND rct.trx_date BETWEEN :p_start_date AND :p_end_date

ORDER BY
    rct.trx_date,
    rct.customer_trx_id;
