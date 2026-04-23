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
    l_status     varchar2(1000);
    l_party_id   number;
  begin
    if p_start_date is null or p_end_date is null then
      raise_application_error(-20001, 'Start date and end date are required.');
    end if;
    if p_start_date > p_end_date then
      raise_application_error(-20002, 'Start date cannot be after end date.');
    end if;

    l_status := case when p_status is not null then replace(p_status, '"', '\"') end;

    -- Build q filter from queryable attributes only.
    -- CreationDate IS queryable (datetime format with T separator).
    -- TransactionDate, AccountingDate, BillingDate are NOT queryable.
    -- BillToCustomerName is NOT queryable; use BillToPartyId instead.
    l_q := 'CreationDate>="' || to_char(p_start_date, 'YYYY-MM-DD') || 'T00:00:00"'
        || ';CreationDate<="' || to_char(p_end_date,   'YYYY-MM-DD') || 'T23:59:59"';

    -- BillToPartyId IS queryable; look up from customer LOV collection.
    if p_customer is not null then
      begin
        select c.n001
          into l_party_id
          from apex_collections c
         where c.collection_name = 'FUSION_AR_CUSTOMERS'
           and c.c001 = p_customer
           and rownum = 1;
        l_q := l_q || ';BillToPartyId=' || l_party_id;
      exception
        when no_data_found then null;
      end;
    end if;

    -- InvoiceStatus IS queryable
    if l_status is not null then
      l_q := l_q || ';InvoiceStatus="' || l_status || '"';
    end if;

    l_url := 'https://ecga-test.fa.us2.oraclecloud.com/fscmRestApi/resources/11.13.18.05/receivablesInvoices'
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

  procedure load_customer_lov
  as
    l_context  apex_exec.t_context;
    l_columns  apex_exec.t_columns;
  begin
    -- only fetch once per session
    if apex_collection.collection_exists('FUSION_AR_CUSTOMERS') then
      return;
    end if;

    apex_collection.create_collection('FUSION_AR_CUSTOMERS');

    -- request the columns we need (c001=name, c002=number, n001=PartyId)
    apex_exec.add_column(l_columns, 'BILLTOCUSTOMERNAME');
    apex_exec.add_column(l_columns, 'BILLTOCUSTOMERNUMBER');
    apex_exec.add_column(l_columns, 'PARTYID');

    l_context := apex_exec.open_rest_source_query(
      p_static_id    => 'receivables_customer_lov',
      p_max_rows     => 1000,
      p_columns      => l_columns
    );

    while apex_exec.next_row(l_context) loop
      apex_collection.add_member(
        p_collection_name => 'FUSION_AR_CUSTOMERS',
        p_c001            => apex_exec.get_varchar2(l_context, 1),
        p_c002            => apex_exec.get_varchar2(l_context, 2),
        p_n001            => apex_exec.get_number(l_context, 3)
      );
    end loop;

    apex_exec.close(l_context);
  exception
    when others then
      apex_exec.close(l_context);
      raise;
  end load_customer_lov;

end receivables_pkg;
/
