create or replace package learning_history_pkg as

  g_total_rows number;

  procedure load_learning(
    p_learner     varchar2 default null,
    p_status      varchar2 default null,
    p_type        varchar2 default null,
    p_start_date  date     default null,
    p_end_date    date     default null
  );

end learning_history_pkg;
/
