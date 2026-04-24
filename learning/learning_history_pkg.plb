create or replace package body learning_history_pkg as

  procedure load_learning(
    p_learner     varchar2 default null,
    p_status      varchar2 default null,
    p_type        varchar2 default null,
    p_start_date  date     default null,
    p_end_date    date     default null
  )
  as
    l_response   clob;
    l_url        varchar2(4000);
    l_q          varchar2(2000);
    l_http_code  pls_integer;
    l_sep        varchar2(1) := null;   -- first predicate has no leading ';'
  begin
    -- Build optional q= filter string
    -- assignedToNumber IS queryable (person number, e.g. '90004')
    if p_learner is not null then
      l_q  := 'assignedToNumber=' || p_learner;
      l_sep := ';';
    end if;

    -- assignmentStatus IS queryable (code, e.g. ORA_ASSN_REC_ACTIVE)
    if p_status is not null then
      l_q  := l_q || l_sep || 'assignmentStatus="' || replace(p_status, '"', '\"') || '"';
      l_sep := ';';
    end if;

    -- learningItemType IS queryable (code, e.g. ORA_COURSE)
    if p_type is not null then
      l_q  := l_q || l_sep || 'learningItemType="' || replace(p_type, '"', '\"') || '"';
      l_sep := ';';
    end if;

    -- assignedDate range (optional)
    if p_start_date is not null then
      l_q  := l_q || l_sep || 'assignedDate>="' || to_char(p_start_date, 'YYYY-MM-DD') || '"';
      l_sep := ';';
    end if;
    if p_end_date is not null then
      l_q  := l_q || l_sep || 'assignedDate<="' || to_char(p_end_date, 'YYYY-MM-DD') || '"';
      l_sep := ';';
    end if;

    l_url := 'https://ecga-test.fa.us2.oraclecloud.com/hcmRestApi/resources/11.13.18.05/learnerLearningRecords'
          || '?totalResults=true&limit=100';

    if l_q is not null then
      l_url := l_url || '&q=' || apex_util.url_encode(l_q);
    end if;

    apex_web_service.g_request_headers.delete;
    apex_web_service.g_request_headers(1).name  := 'Accept';
    apex_web_service.g_request_headers(1).value := 'application/json';

    l_response := apex_web_service.make_rest_request(
      p_url                  => l_url,
      p_http_method          => 'GET',
      p_credential_static_id => '<your-credential-static-id>'
    );

    l_http_code := apex_web_service.g_status_code;

    if l_http_code not between 200 and 299 then
      raise_application_error(-20003,
        'Fusion REST call failed (HTTP ' || l_http_code || ').');
    end if;

    g_total_rows := json_value(l_response, '$.totalResults' returning number null on error);

    -- one row per JSON object, raw JSON in clob001
    apex_collection.create_or_truncate_collection('FUSION_LEARNING_ROWS');

    for rec in (
      select jt.item_json
        from json_table(
               l_response, '$.items[*]'
               columns (item_json clob format json path '$')
             ) jt
    )
    loop
      apex_collection.add_member(
        p_collection_name => 'FUSION_LEARNING_ROWS',
        p_clob001         => rec.item_json
      );
    end loop;

  end load_learning;

end learning_history_pkg;
/
