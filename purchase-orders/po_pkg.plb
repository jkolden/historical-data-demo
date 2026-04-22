create or replace package body po_pkg as


  procedure load_purchase_orders(
    p_start_date date,
    p_end_date   date,
    p_supplier   varchar2 default null,
    p_status     varchar2 default null,
    p_buyer      varchar2 default null
  )
  as
    l_response   clob;
    l_url        varchar2(4000);
    l_q          varchar2(2000);
    l_http_code  pls_integer;
    l_supplier   varchar2(1000);
    l_status     varchar2(1000);
    l_buyer      varchar2(1000);

    function clip(p in clob, p_max in pls_integer := 1000) return varchar2 is
    begin
      if p is null then
        return null;
      end if;
      return dbms_lob.substr(p, p_max, 1);
    end;
  begin
    -- basic validation
    if p_start_date is null or p_end_date is null then
      raise_application_error(-20001, 'Start date and end date are required.');
    end if;

    if p_start_date > p_end_date then
      raise_application_error(-20002, 'Start date cannot be after end date.');
    end if;

    -- escape single quotes inside values (double them)
    l_supplier := case when p_supplier is not null then replace(p_supplier, '''', '''''') end;
    l_status   := case when p_status   is not null then replace(p_status,   '''', '''''') end;
    l_buyer    := case when p_buyer    is not null then replace(p_buyer,    '''', '''''') end;

    -- Fusion ADF-style filter string  (OrderDate is not queryable; use CreationDate)
    -- Uses single-quote syntax per Postman-verified format: Supplier='value'
    l_q :=
         'CreationDate >= ''' || to_char(p_start_date, 'YYYY-MM-DD') || ''''
      || ';CreationDate <= ''' || to_char(p_end_date,   'YYYY-MM-DD') || '''';

    if l_supplier is not null then
      l_q := l_q || ';Supplier=''' || l_supplier || '''';
    end if;

    if l_status is not null then
      l_q := l_q || ';Status=''' || l_status || '''';
    end if;

    if l_buyer is not null then
      l_q := l_q || ';Buyer=''' || l_buyer || '''';
    end if;

    -- utl_url.escape only encodes illegal URL chars (spaces etc.)
    -- unlike apex_util.url_encode which over-encodes quotes/parens
    l_url :=
         'https://<your-fusion-host>/fscmRestApi/resources/11.13.18.05/purchaseOrders'
      || '?q=' || utl_url.escape(l_q, false, 'AL32UTF8')
      || '&totalResults=true'
      || '&limit=100';

    -- collections: raw + shredded rows
    apex_collection.create_or_truncate_collection('PO_RAW');

    begin
      apex_collection.delete_collection('FUSION_PO_ROWS');
    exception
      when others then null;   -- collection did not exist yet
    end;

    -- optional header
    apex_web_service.g_request_headers.delete;
    apex_web_service.g_request_headers(1).name  := 'Accept';
    apex_web_service.g_request_headers(1).value := 'application/json';

    -- call API
    l_response := apex_web_service.make_rest_request(
      p_url                  => l_url,
      p_http_method          => 'GET',
      p_credential_static_id => '<your-credential-static-id>'
    );

    l_http_code := apex_web_service.g_status_code;

    -- store raw payload (single row)
    apex_collection.add_member(
      p_collection_name => 'PO_RAW',
      p_c001            => case when l_http_code between 200 and 299 then 'OK' else 'ERROR' end,
      p_n001            => l_http_code,
      p_c002            => case when l_http_code between 200 and 299 then null else clip(l_response, 1000) end,
      p_clob001         => l_response
    );

    if l_http_code not between 200 and 299 then
      g_total_rows := null;
      raise_application_error(
        -20003,
        'Fusion REST call failed (HTTP '||l_http_code||'). '||nvl(clip(l_response, 500), '(no response body)')
      );
    end if;

    -- totalResults (safe)
    g_total_rows := json_value(l_response, '$.totalResults' returning number null on error null on empty);

    -- shred $.items[*] -> row collection (set-based)
    apex_collection.create_collection_from_query2(
      p_collection_name => 'FUSION_PO_ROWS',
      p_query => q'~
        select
           /* ---- N001..N005 ---- */
      jt.poheaderid       as n001,
      jt.ordered          as n002,
      jt.total            as n003,
      jt.revision         as n004,
      cast(null as number) as n005,

      /* ---- D001..D005 ---- */
      jt.orderdate        as d001,
      jt.creationdate     as d002,
      cast(null as date)  as d003,
      cast(null as date)  as d004,
      cast(null as date)  as d005,

      /* ---- C001.. ---- */
      jt.ordernumber          as c001,
      jt.procurementbu        as c002,
      jt.supplier             as c003,
      jt.suppliersite         as c004,
      jt.status               as c005,
      jt.buyer                as c006,
      jt.currencycode         as c007,
      jt.paymentterms         as c008,
      jt.description          as c009,
      jt.shiptolocationcode   as c010,
      jt.billtolocation       as c011,
      jt.fundsstatus          as c012,
      jt.requisition          as c013,
          c.c001                  as c014,  -- raw status 'OK'
          to_char(c.n001)         as c015   -- raw http code
        from apex_collections c
        cross join json_table(
          nvl(c.clob001, to_clob('{}')),
          '$.items[*]'
          columns (
            poheaderid           number        path '$.POHeaderId'            null on error,
            ordernumber          varchar2(200) path '$.OrderNumber'           null on error,
            ordered              number        path '$.Ordered'              null on error,
            total                number        path '$.Total'               null on error,
            revision             number        path '$.Revision'            null on error,
            orderdate            date          path '$.OrderDate'           null on error,
            creationdate         date          path '$.CreationDate'        null on error,
            procurementbu        varchar2(200) path '$.ProcurementBU'       null on error,
            supplier             varchar2(400) path '$.Supplier'            null on error,
            suppliersite         varchar2(200) path '$.SupplierSite'        null on error,
            status               varchar2(200) path '$.Status'              null on error,
            buyer                varchar2(200) path '$.Buyer'               null on error,
            currencycode         varchar2(30)  path '$.CurrencyCode'        null on error,
            paymentterms         varchar2(200) path '$.PaymentTerms'        null on error,
            description          varchar2(4000) path '$.Description'        null on error,
            shiptolocationcode   varchar2(200) path '$.ShipToLocationCode'  null on error,
            billtolocation       varchar2(200) path '$.BillToLocation'      null on error,
            fundsstatus          varchar2(200) path '$.FundsStatus'         null on error,
            requisition          varchar2(200) path '$.Requisition'         null on error
          )
        ) jt
        where c.collection_name = 'PO_RAW'
          and c.seq_id = 1
          and c.c001 = 'OK'
      ~'
    );

  exception
    when others then
      raise;
  end load_purchase_orders;

end po_pkg;
/