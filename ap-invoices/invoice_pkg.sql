create or replace package invoice_pkg as
  
  g_total_rows number;
  
  procedure load_invoices(
    p_start_date date,
    p_end_date   date,
    p_supplier   varchar2 default null,
    p_status     varchar2 default null
  );
  
end invoice_pkg;
/