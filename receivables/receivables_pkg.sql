create or replace package receivables_pkg as

  g_total_rows number;

  procedure load_receivables_invoices(
    p_start_date  date,
    p_end_date    date,
    p_customer    varchar2 default null,
    p_status      varchar2 default null
  );

end receivables_pkg;
/
