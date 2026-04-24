/*===========================================================
  EBS R12 Extraction: AP Invoice Lines
  Target table: DEMO_AP_INVOICE_LINE_HIST

  Source: Oracle E-Business Suite R12
  Tables: AP_INVOICE_LINES_ALL + lookups

  Usage:
    Run against an EBS R12 database instance.
    Output column aliases match DEMO_AP_INVOICE_LINE_HIST exactly.

  Bind variables — adjust per customer:
    :p_org_id      - Operating unit (org_id) to extract
    :p_start_date  - Parent invoice date range start
    :p_end_date    - Parent invoice date range end

  Notes:
    - AP_INVOICE_LINES_ALL is R12-specific (11i uses distributions)
    - Join to parent AP_INVOICES_ALL for date/org filtering
    - Fiscal classification columns are Fusion-only (eBTax)
===========================================================*/

SELECT
    -- === Parent key ===
    ail.invoice_id                              AS invoice_id,

    -- === Line identifiers ===
    ail.line_number                             AS line_id,              -- R12 line_number as line identifier
    ail.line_number                             AS line_number,
    ail.line_type_lookup_code                   AS line_type,            -- ITEM, TAX, FREIGHT, MISCELLANEOUS
    ail.line_source                             AS line_source,
    ail.description                             AS description,

    -- === Amounts ===
    ail.amount                                  AS line_amount,
    ail.base_amount                             AS base_amount,
    ail.unit_price                              AS unit_price,
    ail.quantity_invoiced                        AS quantity,
    ail.unit_meas_lookup_code                   AS uom,
    ail.assessable_value                        AS assessable_value,
    ail.control_amount                          AS tax_control_amount,

    -- === Dates ===
    ail.accounting_date                         AS accounting_date,
    NULL                                        AS budget_date,          -- Fusion-only
    ail.start_expense_date                      AS multiperiod_acctg_start_date,
    ail.end_expense_date                        AS multiperiod_acctg_end_date,

    -- === Distribution ===
    gcc.concatenated_segments                   AS distribution_combination,
    ads.distribution_set_name                   AS distribution_set,
    ail.generate_dists                          AS generate_distributions,
    gcc_acc.concatenated_segments               AS multiperiod_acctg_accrual_acct,

    -- === Matching / PO ===
    ail.match_type                              AS match_type,
    CASE ail.match_type
        WHEN 'PRICE_CORRECTION'  THEN 'Price'
        WHEN 'QTY_CORRECTION'    THEN 'Quantity'
        WHEN 'ITEM_TO_PO'        THEN 'Purchase Order'
        WHEN 'ITEM_TO_RECEIPT'   THEN 'Receipt'
        ELSE NULL
    END                                         AS match_option,
    NULL                                        AS match_basis,          -- Fusion-only
    ph.segment1                                 AS purchase_order_number,
    ail.po_line_number                          AS purchase_order_line_number,
    ail.po_line_location_id                     AS purchase_order_sched_line_number,
    ail.receipt_number                          AS receipt_number,
    ail.receipt_line_number                     AS receipt_line_number,
    NULL                                        AS consumption_advice_number,      -- Fusion-only
    NULL                                        AS consumption_advice_line_number,  -- Fusion-only
    ail.final_match_flag                        AS final_match_flag,

    -- === Item ===
    msi.segment1                                AS item,
    msi.description                             AS item_description,

    -- === Tax ===
    ail.tax_rate_name                           AS tax_rate_name,
    ail.tax_rate_code                           AS tax_rate_code,
    ail.tax_rate                                AS tax_rate,
    ail.tax_classification_code                 AS tax_classification,

    -- === Status / Flags ===
    CASE ail.approval_status
        WHEN 'APPROVED'          THEN 'Approved'
        WHEN 'NEEDS REAPPROVAL'  THEN 'Needs Reapproval'
        WHEN 'NEVER APPROVED'    THEN 'Never Approved'
        WHEN 'REJECTED'          THEN 'Rejected'
        ELSE ail.approval_status
    END                                         AS approval_status,
    ail.fund_status                             AS funds_status,
    ail.discarded_flag                          AS discarded_flag,
    ail.cancelled_flag                          AS canceled_flag,
    ail.prorate_across_all_items                AS prorate_across_all_items_flag,
    ail.assets_tracking_flag                    AS track_as_asset_flag,
    NULL                                        AS landed_cost_enabled,  -- Fusion-only

    -- === Asset ===
    ail.asset_book_type_code                    AS asset_book,
    ail.asset_category_id                       AS asset_category,       -- ID; join FA_CATEGORIES for name

    -- === Ship-to ===
    hla.location_code                           AS ship_to_location_code,
    hla.description                             AS ship_to_location,
    NULL                                        AS ship_to_customer_location, -- Fusion-only (AR ship-to)

    -- === Income tax ===
    ail.income_tax_type                         AS income_tax_type,
    ail.income_tax_region                       AS income_tax_region,

    -- === Product / Fiscal classification (mostly Fusion eBTax) ===
    ail.product_type                            AS product_type,
    NULL                                        AS product_category,
    NULL                                        AS product_category_code_path,
    NULL                                        AS product_fiscal_classification,
    NULL                                        AS product_fiscal_classification_code,
    NULL                                        AS product_fiscal_classification_type,
    NULL                                        AS user_defined_fiscal_class,
    NULL                                        AS user_defined_fiscal_class_code,
    NULL                                        AS intended_use,
    NULL                                        AS intended_use_code,
    NULL                                        AS transaction_business_category,
    NULL                                        AS transaction_bus_category_code_path,

    -- === Purchasing ===
    NULL                                        AS purchasing_category,   -- join MTL_CATEGORIES if needed

    -- === Requester ===
    ail.requester_id                            AS requester_id,
    fu_req.user_name                            AS requester,

    -- === Withholding ===
    awg.name                                    AS withholding,

    -- === Prepayment ===
    ail.prepay_invoice_id                       AS prepayment_number,    -- would need join for invoice_num
    ail.prepay_line_number                      AS prepayment_line_number,
    CASE WHEN ail.prepay_invoice_id IS NOT NULL
         THEN 'Y' ELSE 'N'
    END                                         AS prepayment_included_on_inv_flag,

    -- === References ===
    ail.reference_2                             AS reference_key_two,
    ail.product_table                           AS product_table,

    -- === Audit ===
    fu_cr.user_name                             AS created_by,
    ail.creation_date                           AS creation_date,
    fu_upd.user_name                            AS last_updated_by,
    ail.last_update_date                        AS last_update_date

FROM
    ap_invoice_lines_all            ail
    -- Parent invoice (for date/org filtering)
    JOIN ap_invoices_all            ai
        ON ai.invoice_id = ail.invoice_id
    -- Account code combination (distribution account)
    LEFT JOIN gl_code_combinations_kfv gcc
        ON gcc.code_combination_id = ail.default_dist_ccid
    -- Multi-period accrual account
    LEFT JOIN gl_code_combinations_kfv gcc_acc
        ON gcc_acc.code_combination_id = ail.deferred_acctg_flag  -- placeholder; actual column varies
    -- Distribution set
    LEFT JOIN ap_distribution_sets_all ads
        ON ads.distribution_set_id = ail.distribution_set_id
    -- PO header
    LEFT JOIN po_headers_all        ph
        ON ph.po_header_id = ail.po_header_id
    -- Item master
    LEFT JOIN mtl_system_items_b    msi
        ON msi.inventory_item_id = ail.inventory_item_id
        AND msi.organization_id = ail.org_id
    -- Ship-to location
    LEFT JOIN hr_locations_all      hla
        ON hla.location_id = ail.ship_to_location_id
    -- Withholding tax group
    LEFT JOIN ap_awt_groups         awg
        ON awg.group_id = ail.awt_group_id
    -- Requester
    LEFT JOIN fnd_user              fu_req
        ON fu_req.employee_id = ail.requester_id
    -- Audit: created by
    LEFT JOIN fnd_user              fu_cr
        ON fu_cr.user_id = ail.created_by
    -- Audit: last updated by
    LEFT JOIN fnd_user              fu_upd
        ON fu_upd.user_id = ail.last_updated_by

WHERE
    ai.org_id = :p_org_id
    AND ai.invoice_date BETWEEN :p_start_date AND :p_end_date

ORDER BY
    ail.invoice_id,
    ail.line_number;
