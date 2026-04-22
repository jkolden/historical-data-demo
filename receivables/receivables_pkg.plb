create or replace package body receivables_pkg as


  procedure load_receivables_invoices(
    p_start_date  date,
    p_end_date    date,
    p_customer    varchar2 default null,
    p_status      varchar2 default null
  )
  as
    l_response   clob;
    l_url        varchar2(4000);
    l_q          varchar2(2000);
    l_http_code  pls_integer;
    l_customer   varchar2(1000);
    l_status     varchar2(1000);
  begin
    if p_start_date is null or p_end_date is null then
      raise_application_error(-20001, 'Start date and end date are required.');
    end if;
    if p_start_date > p_end_date then
      raise_application_error(-20002, 'Start date cannot be after end date.');
    end if;

    l_customer := case when p_customer is not null then replace(p_customer, '"', '\"') end;
    l_status   := case when p_status   is not null then replace(p_status,   '"', '\"') end;

    l_q := 'TransactionDate >= "' || to_char(p_start_date, 'YYYY-MM-DD') || '"'
        || ';TransactionDate <= "' || to_char(p_end_date,   'YYYY-MM-DD') || '"';
    if l_customer is not null then
      l_q := l_q || ';BillToCustomerName = "' || l_customer || '"';
    end if;
    if l_status is not null then
      l_q := l_q || ';InvoiceStatus = "' || l_status || '"';
    end if;

    l_url := 'https://<your-fusion-host>/fscmRestApi/resources/11.13.18.05/receivablesInvoices'
          || '?q=' || apex_util.url_encode(l_q)
          || '&totalResults=true&limit=100';

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
    apex_collection.create_or_truncate_collection('FUSION_AR_ROWS');

    for rec in (
      select jt.item_json
        from json_table(
               l_response, '$.items[*]'
               columns (item_json clob format json path '$')
             ) jt
    )
    loop
      apex_collection.add_member(
        p_collection_name => 'FUSION_AR_ROWS',
        p_clob001         => rec.item_json
      );
    end loop;

  end load_receivables_invoices;

end receivables_pkg;
/
