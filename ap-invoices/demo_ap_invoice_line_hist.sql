--------------------------------------------------------
--  demo_ap_invoice_line_hist  -  legacy AP invoice lines
--  Mirrors the full Fusion invoices/invoiceLines REST
--  child endpoint fields.
--
--  Expanded to match all meaningful fields returned by:
--  /fscmRestApi/resources/11.13.18.05/invoices/{id}/child/invoiceLines
--------------------------------------------------------

CREATE TABLE demo_ap_invoice_line_hist (
  -- === Parent key ===
  invoice_id                        NUMBER,

  -- === Line identifiers ===
  line_id                           NUMBER,
  line_number                       NUMBER,
  line_type                         VARCHAR2(30),              -- Item, Tax, Freight, etc.
  line_source                       VARCHAR2(255),
  description                       VARCHAR2(240),

  -- === Amounts ===
  line_amount                       NUMBER,
  base_amount                       NUMBER,
  unit_price                        NUMBER,
  quantity                          NUMBER,
  uom                               VARCHAR2(30),
  assessable_value                  NUMBER,
  tax_control_amount                NUMBER,

  -- === Dates ===
  accounting_date                   DATE,
  budget_date                       DATE,
  multiperiod_acctg_start_date      DATE,
  multiperiod_acctg_end_date        DATE,

  -- === Distribution ===
  distribution_combination          VARCHAR2(255),
  distribution_set                  VARCHAR2(255),
  generate_distributions            VARCHAR2(5),
  multiperiod_acctg_accrual_acct    VARCHAR2(255),

  -- === Matching / PO ===
  match_type                        VARCHAR2(30),
  match_option                      VARCHAR2(30),
  match_basis                       VARCHAR2(30),
  purchase_order_number             VARCHAR2(50),
  purchase_order_line_number        NUMBER,
  purchase_order_sched_line_number  NUMBER,
  receipt_number                    VARCHAR2(50),
  receipt_line_number               NUMBER,
  consumption_advice_number         VARCHAR2(50),
  consumption_advice_line_number    NUMBER,
  final_match_flag                  VARCHAR2(5),

  -- === Item ===
  item                              VARCHAR2(255),
  item_description                  VARCHAR2(255),

  -- === Tax ===
  tax_rate_name                     VARCHAR2(255),
  tax_rate_code                     VARCHAR2(100),
  tax_rate                          NUMBER,
  tax_classification                VARCHAR2(255),

  -- === Status / Flags ===
  approval_status                   VARCHAR2(100),
  funds_status                      VARCHAR2(30),
  discarded_flag                    VARCHAR2(5),
  canceled_flag                     VARCHAR2(5),
  prorate_across_all_items_flag     VARCHAR2(5),
  track_as_asset_flag               VARCHAR2(5),
  landed_cost_enabled               VARCHAR2(5),

  -- === Asset ===
  asset_book                        VARCHAR2(255),
  asset_category                    VARCHAR2(255),

  -- === Ship-to ===
  ship_to_location_code             VARCHAR2(200),
  ship_to_location                  VARCHAR2(255),
  ship_to_customer_location         VARCHAR2(255),

  -- === Income tax ===
  income_tax_type                   VARCHAR2(100),
  income_tax_region                 VARCHAR2(255),

  -- === Product / Fiscal classification ===
  product_type                      VARCHAR2(100),
  product_category                  VARCHAR2(255),
  product_category_code_path        VARCHAR2(4000),
  product_fiscal_classification      VARCHAR2(255),
  product_fiscal_classification_code VARCHAR2(255),
  product_fiscal_classification_type VARCHAR2(255),
  user_defined_fiscal_class         VARCHAR2(255),
  user_defined_fiscal_class_code    VARCHAR2(255),
  intended_use                      VARCHAR2(255),
  intended_use_code                 VARCHAR2(255),
  transaction_business_category     VARCHAR2(255),
  transaction_bus_category_code_path VARCHAR2(255),

  -- === Purchasing ===
  purchasing_category               VARCHAR2(255),

  -- === Requester ===
  requester_id                      NUMBER,
  requester                         VARCHAR2(255),

  -- === Withholding ===
  withholding                       VARCHAR2(255),

  -- === Prepayment ===
  prepayment_number                 VARCHAR2(100),
  prepayment_line_number            NUMBER,
  prepayment_included_on_inv_flag   VARCHAR2(5),

  -- === References ===
  reference_key_two                 VARCHAR2(255),
  product_table                     VARCHAR2(255),

  -- === Audit ===
  created_by                        VARCHAR2(255),
  creation_date                     TIMESTAMP(6),
  last_updated_by                   VARCHAR2(255),
  last_update_date                  TIMESTAMP(6)
);

-- Indexes for common lookups
CREATE INDEX demo_ap_inv_line_hist_inv_ix ON demo_ap_invoice_line_hist (invoice_id);
CREATE INDEX demo_ap_inv_line_hist_po_ix  ON demo_ap_invoice_line_hist (purchase_order_number);
/
