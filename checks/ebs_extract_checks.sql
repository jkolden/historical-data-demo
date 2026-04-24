/*===========================================================
  EBS R12 Extraction: Checks (Payments)
  Target table: DEMO_CHECKS_HIST

  Source: Oracle E-Business Suite R12
  Tables: AP_CHECKS_ALL + IBY_PAYMENTS_ALL + lookups

  Usage:
    Run against an EBS R12 database instance.
    Output column aliases match DEMO_CHECKS_HIST exactly.
    The identity PK (id) is auto-generated on INSERT.

  Bind variables — adjust per customer:
    :p_org_id      - Operating unit (org_id) to extract
    :p_start_date  - Check/payment date range start
    :p_end_date    - Check/payment date range end

  Notes:
    - EBS R12 has dual payment tables: AP_CHECKS_ALL (legacy)
      and IBY_PAYMENTS_ALL (Payments hub). This query uses
      AP_CHECKS_ALL as the primary source.
    - Some IBY-specific fields are joined from IBY tables
    - Void/stop fields come directly from AP_CHECKS_ALL
    - Address fields come from supplier site or IBY
===========================================================*/

SELECT
    -- === Source tag ===
    'EBS'                                       AS sourcesystem,

    -- === Identifiers ===
    ac.check_id                                 AS checkid,
    ibypmt.payment_id                           AS paymentid,
    ibypmt.payment_reference_number             AS paymentreference,
    ac.check_number                             AS paperdocumentnumber,
    ac.check_number                             AS paymentnumber,
    ibypmt.paper_document_number                AS paymentfilereference,

    -- === Core payment info ===
    ibyreq.call_app_pay_service_req_code        AS paymentprocessrequest,
    ac.amount                                   AS paymentamount,
    ac.check_date                               AS paymentdate,
    ac.accounting_date                          AS accountingdate,
    ac.description                              AS paymentdescription,

    -- === Conversion ===
    ac.exchange_rate                             AS conversionrate,
    ac.exchange_date                             AS conversiondate,
    ac.exchange_rate_type                        AS conversionratetype,

    -- === Clearing ===
    ac.cleared_date                             AS clearingdate,
    ac.cleared_amount                           AS clearingamount,
    ac.cleared_base_amount                      AS clearingledgeramount,
    ac.cleared_exchange_rate                    AS clearingconversionrate,
    ac.cleared_exchange_date                    AS clearingconversiondate,
    ac.cleared_exchange_rate_type               AS clearingconversionratetype,

    -- === Maturity ===
    ac.future_pay_due_date                      AS maturitydate,
    NULL                                        AS maturityconversionratetype,  -- Fusion-only
    NULL                                        AS maturityconversiondate,      -- Fusion-only
    NULL                                        AS maturityconversionrate,      -- Fusion-only

    -- === Value dates ===
    NULL                                        AS anticipatedvaluedate, -- Fusion cash management
    NULL                                        AS clearingvaluedate,    -- Fusion cash management

    -- === Stop / Void ===
    ac.stopped_date                             AS stopdate,
    ac.stopped_reason                           AS stopreason,
    NULL                                        AS stopreference,        -- Fusion-only
    ac.void_date                                AS voiddate,
    CASE WHEN ac.void_date IS NOT NULL
         THEN ac.accounting_date
         ELSE NULL
    END                                         AS voidaccountingdate,

    -- === Statuses ===
    CASE ac.status_lookup_code
        WHEN 'NEGOTIABLE'       THEN 'Negotiable'
        WHEN 'VOIDED'           THEN 'Voided'
        WHEN 'CLEARED'          THEN 'Cleared'
        WHEN 'CLEARED BUT UNACCOUNTED' THEN 'Cleared'
        WHEN 'RECONCILED'       THEN 'Reconciled'
        WHEN 'RECONCILED UNACCOUNTED' THEN 'Reconciled'
        WHEN 'STOP INITIATED'   THEN 'Stop Initiated'
        WHEN 'OVERFLOW'         THEN 'Overflow'
        WHEN 'UNCONFIRMED'      THEN 'Unconfirmed'
        WHEN 'SET UP'           THEN 'Set Up'
        ELSE ac.status_lookup_code
    END                                         AS paymentstatus,
    CASE
        WHEN ac.acctd_amount IS NOT NULL THEN 'Accounted'
        ELSE 'Not Accounted'
    END                                         AS accountingstatus,
    ibypmt.payment_status                       AS ibypaymentstatus,
    CASE
        WHEN ac.status_lookup_code IN ('RECONCILED', 'RECONCILED UNACCOUNTED')
            THEN 'true'
        ELSE 'false'
    END                                         AS reconciledflag,

    -- === Payment classification ===
    ac.payment_type_flag                        AS paymenttype,
    ac.currency_code                            AS paymentcurrency,
    ac.base_amount                              AS paymentbaseamount,
    gsob.currency_code                          AS paymentbasecurrency,
    NULL                                        AS crosscurrencyratetype, -- Fusion-only

    -- === Amounts ===
    (SELECT NVL(SUM(aip.withholding_amount), 0)
       FROM ap_invoice_payments_all aip
      WHERE aip.check_id = ac.check_id)         AS withheldamount,
    NULL                                        AS bankchargeamount,     -- Fusion IBY

    -- === Org / Entity ===
    xle.name                                    AS legalentity,
    hou.name                                    AS businessunit,
    hou.name                                    AS procurementbu,        -- same OU in EBS
    'PAYABLES_DISB'                             AS paymentfunction,      -- standard for AP checks

    -- === Payee ===
    NVL(aps.vendor_name, ac.vendor_name)        AS payee,
    aps.party_id                                AS partyid,
    apss.vendor_site_code                       AS payeesite,
    NULL                                        AS employeeaddress,      -- for employee payments
    aps.segment1                                AS suppliernumber,
    NULL                                        AS thirdpartysupplier,   -- Fusion third-party payments
    NULL                                        AS thirdpartyaddressname,

    -- === Bank accounts ===
    ac.external_bank_account_id                 AS externalbankaccountid,
    ieba.bank_account_num                       AS remittoaccountnumber,
    cba.bank_account_num                        AS disbursementbankaccountnumber,
    cba.bank_account_name                       AS disbursementbankaccountname,

    -- === Payment method / Profile ===
    ac.payment_method_code                      AS paymentmethodcode,
    ipm.payment_method_name                     AS paymentmethod,
    ac.check_stock_id                           AS paymentdocument,      -- check stock reference
    ibypmt.payment_profile_id                   AS paymentprocessprofilecode,
    ibypp.system_profile_name                   AS paymentprocessprofile,

    -- === Document ===
    ac.doc_category_code                        AS documentcategory,
    ac.doc_sequence_id                          AS documentsequence,
    ac.voucher_num                              AS vouchernumber,
    NULL                                        AS separateremittanceadvice, -- Fusion-only

    -- === Address (supplier site address) ===
    apss.address_line1                          AS addressline1,
    apss.address_line2                          AS addressline2,
    apss.address_line3                          AS addressline3,
    NULL                                        AS addressline4,         -- EBS has 3 lines
    apss.city                                   AS city,
    apss.county                                 AS county,
    apss.province                               AS province,
    apss.state                                  AS state,
    apss.country                                AS country,
    apss.zip                                    AS zip,

    -- === Audit ===
    fu_cr.user_name                             AS createdby,
    ac.creation_date                            AS creationdate,
    fu_upd.user_name                            AS lastupdatedby,
    ac.last_update_date                         AS lastupdatedate,

    -- === Misc ===
    ac.payment_type_flag                        AS paymentmode,
    NULL                                        AS fundingcardaccount,   -- Fusion-only
    NULL                                        AS digitalpaymentaccount -- Fusion-only

FROM
    ap_checks_all                   ac
    -- Operating unit
    JOIN hr_operating_units         hou
        ON hou.organization_id = ac.org_id
    -- Set of books (for base currency)
    LEFT JOIN gl_sets_of_books      gsob
        ON gsob.set_of_books_id = ac.set_of_books_id
    -- Supplier
    LEFT JOIN ap_suppliers          aps
        ON aps.vendor_id = ac.vendor_id
    -- Supplier site
    LEFT JOIN ap_supplier_sites_all apss
        ON apss.vendor_site_id = ac.vendor_site_id
    -- Legal entity
    LEFT JOIN xle_entity_profiles   xle
        ON xle.legal_entity_id = ac.legal_entity_id
    -- IBY payment (R12 payments hub)
    LEFT JOIN iby_payments_all      ibypmt
        ON ibypmt.payment_id = ac.payment_id
    -- IBY payment service request
    LEFT JOIN iby_pay_service_requests ibyreq
        ON ibyreq.pay_service_request_id = ibypmt.payment_service_request_id
    -- IBY payment process profile
    LEFT JOIN iby_payment_profiles  ibypp
        ON ibypp.payment_profile_id = ibypmt.payment_profile_id
    -- Payment method
    LEFT JOIN iby_payment_methods_tl ipm
        ON ipm.payment_method_code = ac.payment_method_code
        AND ipm.language = USERENV('LANG')
    -- External bank account (supplier)
    LEFT JOIN iby_ext_bank_accounts ieba
        ON ieba.ext_bank_account_id = ac.external_bank_account_id
    -- Internal (disbursement) bank account
    LEFT JOIN ce_bank_accounts      cba
        ON cba.bank_account_id = ac.ce_bank_acct_use_id
    -- Audit: created by
    LEFT JOIN fnd_user              fu_cr
        ON fu_cr.user_id = ac.created_by
    -- Audit: last updated by
    LEFT JOIN fnd_user              fu_upd
        ON fu_upd.user_id = ac.last_updated_by

WHERE
    ac.org_id = :p_org_id
    AND ac.check_date BETWEEN :p_start_date AND :p_end_date

ORDER BY
    ac.check_date,
    ac.check_id;
