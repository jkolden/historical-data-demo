create or replace package po_pkg as

  g_total_rows number;

  procedure load_purchase_orders(
    p_start_date date,
    p_end_date   date,
    p_supplier   varchar2 default null,
    p_status     varchar2 default null,
    p_buyer      varchar2 default null
  );

end po_pkg;
/