create or replace package absence_pkg as

  g_total_rows number;

  procedure load_absences(
    p_person_number varchar2,
    p_from_date     date default null,
    p_to_date       date default null
  );

end absence_pkg;
/
