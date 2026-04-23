create or replace package check_history_pkg as

  g_total_rows number;

  procedure load_checks(
    p_start_date  date,
    p_end_date    date,
    p_payee       varchar2 default null,
    p_status      varchar2 default null
  );

end check_history_pkg;
/
