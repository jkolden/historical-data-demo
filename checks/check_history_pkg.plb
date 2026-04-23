create or replace package body check_history_pkg as

  procedure load_checks(
    p_start_date  date,
    p_end_date    date,
    p_payee       varchar2 default null,
    p_status      varchar2 default null
  )
  as
    l_response   clob;
    l_url        varchar2(4000);
    l_q          varchar2(2000);
    l_http_code  pls_integer;
    l_payee      varchar2(1000);
    l_status     varchar2(1000);
  begin
    if p_start_date is null or p_end_date is null then
      raise_application_error(-20001, 'Start date and end date are required.');
    end if;
    if p_start_date > p_end_date then
      raise_application_error(-20002, 'Start date cannot be after end date.');
    end if;

    l_payee  := case when p_payee  is not null then replace(p_payee,  '"', '\"') end;
    l_status := case when p_status is not null then replace(p_status, '"', '\"') end;

    -- PaymentDate IS queryable (date type, not datetime).
    l_q := 'PaymentDate>="' || to_char(p_start_date, 'YYYY-MM-DD') || '"'
        || ';PaymentDate<="' || to_char(p_end_date,   'YYYY-MM-DD') || '"';

    -- Payee IS queryable
    if l_payee is not null then
      l_q := l_q || ';Payee="' || l_payee || '"';
    end if;

    -- PaymentStatus IS queryable
    if l_status is not null then
      l_q := l_q || ';PaymentStatus="' || l_status || '"';
    end if;

    l_url := 'https://ecga-test.fa.us2.oraclecloud.com/fscmRestApi/resources/11.13.18.05/payablesPayments'
          || '?totalResults=true&limit=100'
          || '&q=' || apex_util.url_encode(l_q);

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
    apex_collection.create_or_truncate_collection('FUSION_CHECK_ROWS');

    for rec in (
      select jt.item_json
        from json_table(
               l_response, '$.items[*]'
               columns (item_json clob format json path '$')
             ) jt
    )
    loop
      apex_collection.add_member(
        p_collection_name => 'FUSION_CHECK_ROWS',
        p_clob001         => rec.item_json
      );
    end loop;

  end load_checks;

end check_history_pkg;
/
