/*===========================================================
  EBS R12 Extraction: AP Invoice Headers
  Target table: DEMO_AP_INVOICES_HIST

  Source: Oracle E-Business Suite R12
  Tables: AP_INVOICES_ALL + lookups

  Usage:
    Run against an EBS R12 database instance.
    Output column aliases match DEMO_AP_INVOICES_HIST exactly.
    Results can be:
      - Spooled to CSV (SET COLSEP, SPOOL)
      - Inserted via DB link into the target ADB table
      - Used with SQL*Loader or external tables

  Bind variables — adjust per customer:
    :p_org_id      - Operating unit (org_id) to extract
    :p_start_date  - Invoice date range start
    :p_end_date    - Invoice date range end

  Notes:
    - Columns marked NULL are Fusion-only with no EBS equivalent
    - R12 uses AP_SUPPLIERS; 11i uses PO_VENDORS (same structure)
    - payment_status_flag: Y=Paid, N=Unpaid, P=Partially Paid
===========================================================*/

SELECT
    -- === Source tag ===
    'EBS'                                       AS sourcesystem,

    -- === Core identifiers ===
    ai.invoice_id                               AS invoiceid,
    ai.invoice_num                              AS invoicenumber,
    ai.invoice_type_lookup_code                 AS invoicetype,
    ai.source                                   AS invoicesourcecode,
    ai.source                                   AS invoicesource,
    ai.invoice_group                            AS invoicegroup,
    ai.description                              AS description,

    -- === Amounts / Currency ===
    ai.invoice_amount                           AS invoiceamount,
    ai.amount_paid                              AS amountpaid,
    ai.base_amount                              AS baseamount,
    ai.control_amount                           AS controlamount,
    ai.invoice_currency_code                    AS invoicecurrency,
    ai.payment_currency_code                    AS paymentcurrency,
    ai.exchange_rate_type                       AS conversionratetype,
    ai.exchange_date                            AS conversiondate,
    ai.exchange_rate                            AS conversionrate,

    -- === Key dates ===
    ai.invoice_date                             AS invoicedate,
    ai.gl_date                                  AS accountingdate,
    ai.terms_date                               AS termsdate,
    ai.goods_received_date                      AS goodsreceiveddate,
    ai.invoice_received_date                    AS invoicereceiveddate,
    ai.apply_advances_default                   AS applyafterdate,       -- closest EBS equivalent
    ai.gl_date                                  AS budgetdate,           -- EBS uses GL date as budget date
    ai.cancelled_date                           AS canceleddate,

    -- === Business unit / Legal entity ===
    hou.name                                    AS businessunit,
    hou.name                                    AS procurementbu,        -- same OU in EBS (no separate procurement BU)
    xle.name                                    AS legalentity,
    TO_CHAR(xle.legal_entity_id)                AS legalentityidentifier,
    ai.taxation_country                         AS taxationcountry,

    -- === Supplier ===
    aps.vendor_name                             AS supplier,
    aps.segment1                                AS suppliernumber,
    apss.vendor_site_code                       AS suppliersite,
    aps.vendor_name                             AS party,               -- EBS: party = supplier name
    apss.vendor_site_code                       AS partysite,           -- EBS: party site = supplier site
    aps.vat_registration_num                    AS suppliertaxregistrationnumber,

    -- === Requester ===
    ai.requester_id                             AS requesterid,
    fu_req.user_name                            AS requester,

    -- === Statuses ===
    CASE ai.approval_status
        WHEN 'APPROVED'          THEN 'Validated'
        WHEN 'NEEDS REAPPROVAL'  THEN 'Needs Revalidation'
        WHEN 'NEVER APPROVED'    THEN 'Never Validated'
        ELSE ai.approval_status
    END                                         AS validationstatus,
    CASE ai.wfapproval_status
        WHEN 'WFAPPROVED'        THEN 'Workflow Approved'
        WHEN 'REJECTED'          THEN 'Rejected'
        WHEN 'REQUIRED'          THEN 'Required'
        WHEN 'NOT REQUIRED'      THEN 'Not Required'
        WHEN 'MANUALLY APPROVED' THEN 'Manually Approved'
        ELSE ai.wfapproval_status
    END                                         AS approvalstatus,
    CASE ai.payment_status_flag
        WHEN 'Y' THEN 'Fully Paid'
        WHEN 'P' THEN 'Partially Paid'
        WHEN 'N' THEN 'Unpaid'
        ELSE ai.payment_status_flag
    END                                         AS paidstatus,
    CASE
        WHEN ai.accts_pay_code_combination_id IS NOT NULL
            THEN 'Accounted'
        ELSE 'Not Accounted'
    END                                         AS accountingstatus,
    NULL                                        AS fundsstatus,          -- Fusion-only (funds checking)
    NULL                                        AS accountcodingstatus,  -- Fusion-only
    NVL(ai.cancelled_flag, 'N')                 AS canceledflag,
    fu_cancel.user_name                         AS canceledby,

    -- === Payment details ===
    apt.name                                    AS paymentterms,
    ai.payment_method_code                      AS paymentmethodcode,
    ipm.payment_method_name                     AS paymentmethod,
    ai.pay_group_lookup_code                    AS paygroup,
    ai.exclusive_payment_flag                   AS payaloneflag,
    NULL                                        AS bankaccount,          -- Fusion-only display field
    ieba.iban_number                            AS supplieriban,
    ai.external_bank_account_id                 AS externalbankaccountid,
    NULL                                        AS bankchargebearer,     -- Fusion-only (ISO 20022)
    NULL                                        AS settlementpriority,   -- Fusion-only (ISO 20022)

    -- === Payment reason ===
    ai.payment_reason_code                      AS paymentreasoncode,
    ai.payment_reason_comments                  AS paymentreason,        -- EBS stores reason in comments
    ai.payment_reason_comments                  AS paymentreasoncomments,

    -- === Remittance ===
    ai.remittance_message1                      AS remittancemessageone,
    ai.remittance_message2                      AS remittancemessagetwo,
    ai.remittance_message3                      AS remittancemessagethree,
    ai.unique_remittance_identifier             AS uniqueremittanceidentifier,
    ai.uri_check_digit                          AS uniqueremittanceidentifierchkdig,

    -- === Delivery ===
    ai.delivery_channel_code                    AS deliverychannelcode,
    NULL                                        AS deliverychannel,      -- Fusion-only display value

    -- === Liability / Distribution ===
    NULL                                        AS liabilitydistribution, -- Fusion derives from dist combo

    -- === Document ===
    ai.doc_category_code                        AS documentcategory,
    ai.doc_sequence_id                          AS documentsequence,
    ai.voucher_num                              AS vouchernumber,
    NULL                                        AS documentfiscalclasscodepath, -- Fusion-only

    -- === PO link ===
    ph.segment1                                 AS purchaseordernumber,

    -- === First-party tax ===
    NULL                                        AS firstpartytaxregistrationid,      -- Fusion eBTax
    NULL                                        AS firstpartytaxregistrationnumber,   -- Fusion eBTax

    -- === Routing attributes (Fusion-only) ===
    NULL                                        AS routingattribute1,
    NULL                                        AS routingattribute2,
    NULL                                        AS routingattribute3,
    NULL                                        AS routingattribute4,
    NULL                                        AS routingattribute5,

    -- === Reference keys ===
    ai.reference_1                              AS referencekeyone,
    ai.reference_2                              AS referencekeytwo,
    NULL                                        AS referencekeythree,    -- Fusion-only
    NULL                                        AS referencekeyfour,     -- Fusion-only
    NULL                                        AS referencekeyfive,     -- Fusion-only

    -- === Misc ===
    ai.product_table                            AS producttable,
    NULL                                        AS imagedocumentnumber,  -- Fusion imaging integration
    NULL                                        AS digitalpaymentaccount, -- Fusion-only

    -- === Audit ===
    ai.creation_date                            AS creationdate,
    fu_cr.user_name                             AS createdby,
    ai.last_update_date                         AS lastupdatedate,
    fu_upd.user_name                            AS lastupdatedby

FROM
    ap_invoices_all             ai
    -- Operating unit → business unit name
    JOIN hr_operating_units     hou
        ON hou.organization_id = ai.org_id
    -- Supplier header
    LEFT JOIN ap_suppliers      aps
        ON aps.vendor_id = ai.vendor_id
    -- Supplier site
    LEFT JOIN ap_supplier_sites_all apss
        ON apss.vendor_site_id = ai.vendor_site_id
    -- Legal entity
    LEFT JOIN xle_entity_profiles xle
        ON xle.legal_entity_id = ai.legal_entity_id
    -- Payment terms
    LEFT JOIN ap_terms          apt
        ON apt.term_id = ai.terms_id
    -- Payment method (IBY in R12)
    LEFT JOIN iby_payment_methods_tl ipm
        ON ipm.payment_method_code = ai.payment_method_code
        AND ipm.language = USERENV('LANG')
    -- PO header (for quick PO link)
    LEFT JOIN po_headers_all    ph
        ON ph.po_header_id = ai.quick_po_header_id
    -- Supplier IBAN (external bank account)
    LEFT JOIN iby_ext_bank_accounts ieba
        ON ieba.ext_bank_account_id = ai.external_bank_account_id
    -- Audit: created by
    LEFT JOIN fnd_user          fu_cr
        ON fu_cr.user_id = ai.created_by
    -- Audit: last updated by
    LEFT JOIN fnd_user          fu_upd
        ON fu_upd.user_id = ai.last_updated_by
    -- Requester
    LEFT JOIN fnd_user          fu_req
        ON fu_req.employee_id = ai.requester_id
    -- Canceled by
    LEFT JOIN fnd_user          fu_cancel
        ON fu_cancel.user_id = ai.cancelled_by

WHERE
    ai.org_id = :p_org_id
    AND ai.invoice_date BETWEEN :p_start_date AND :p_end_date

ORDER BY
    ai.invoice_date,
    ai.invoice_id;
