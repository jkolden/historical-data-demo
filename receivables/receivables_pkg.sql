create or replace package receivables_pkg as

  g_total_rows number;

  procedure load_receivables_invoices(
    p_start_date  date,
    p_end_date    date,
    p_customer    varchar2 default null,
    p_status      varchar2 default null
  );

  /**
   * Loads Fusion billToCustomers LOV into collection FUSION_AR_CUSTOMERS.
   * Only fetches once per session (skips if collection already exists).
   * Call from the customer popup LOV "Before Header" or inline in LOV SQL.
   */
  procedure load_customer_lov;

end receivables_pkg;
/
