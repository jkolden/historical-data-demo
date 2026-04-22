create or replace package assignment_pkg as

  g_total_rows number;

  procedure load_assignments(
    p_last_name  varchar2 default null,
    p_department varchar2 default null
  );

end assignment_pkg;
/
