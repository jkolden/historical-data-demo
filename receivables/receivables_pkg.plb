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
    l_customer := case when p_customer is not null then replace(p_customer, '''', '''''') end;
    l_status   := case when p_status   is not null then replace(p_status,   '''', '''''') end;

    -- Fusion ADF-style filter string
    l_q :=
         'TransactionDate >= ''' || to_char(p_start_date, 'YYYY-MM-DD') || ''''
      || ';TransactionDate <= ''' || to_char(p_end_date,   'YYYY-MM-DD') || '''';

    if l_customer is not null then
      l_q := l_q || ';BillToCustomerName=''' || l_customer || '''';
    end if;

    if l_status is not null then
      l_q := l_q || ';InvoiceStatus=''' || l_status || '''';
    end if;

    l_url :=
         'https://<your-fusion-host>/fscmRestApi/resources/11.13.18.05/receivablesInvoices'
      || '?q=' || utl_url.escape(l_q, false, 'AL32UTF8')
      || '&totalResults=true'
      || '&limit=100';

    -- collections: raw + shredded rows
    apex_collection.create_or_truncate_collection('AR_RAW');

    begin
      apex_collection.delete_collection('FUSION_AR_ROWS');
    exception
      when others then null;   -- collection did not exist yet
    end;

    -- request header
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
      p_collection_name => 'AR_RAW',
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
    -- Collection column mapping:
    --   n001=CustomerTransactionId  n002=EnteredAmount  n003=InvoiceBalanceAmount
    --   n004=FreightAmount  n005=DocumentNumber
    --   d001=TransactionDate  d002=AccountingDate  d003=DueDate  d004=ShipDate  d005=BillingDate
    --   c001=TransactionNumber  c002=BusinessUnit  c003=BillToCustomerName
    --   c004=BillToCustomerNumber  c005=InvoiceStatus  c006=TransactionType
    --   c007=TransactionSource  c008=InvoiceCurrencyCode  c009=PaymentTerms
    --   c010=PurchaseOrder  c011=SalesPersonNumber  c012=BillToSite
    --   c013=ShipToCustomerName  c014=ReceiptMethod  c015=Comments
    apex_collection.create_collection_from_query2(
      p_collection_name => 'FUSION_AR_ROWS',
      p_query => q'~
        select
           /* ---- N001..N005 ---- */
      jt.customertransactionid  as n001,
      jt.enteredamount          as n002,
      jt.invoicebalanceamount   as n003,
      jt.freightamount          as n004,
      jt.documentnumber         as n005,

      /* ---- D001..D005 ---- */
      jt.transactiondate        as d001,
      jt.accountingdate         as d002,
      jt.duedate                as d003,
      jt.shipdate               as d004,
      jt.billingdate            as d005,

      /* ---- C001.. ---- */
      jt.transactionnumber          as c001,
      jt.businessunit               as c002,
      jt.billtocustomername         as c003,
      jt.billtocustomernumber       as c004,
      jt.invoicestatus              as c005,
      jt.transactiontype            as c006,
      jt.transactionsource          as c007,
      jt.invoicecurrencycode        as c008,
      jt.paymentterms               as c009,
      jt.purchaseorder              as c010,
      jt.salespersonnumber          as c011,
      jt.billtosite                 as c012,
      jt.shiptocustomername         as c013,
      jt.receiptmethod              as c014,
      jt.comments                   as c015
        from apex_collections c
        cross join json_table(
          nvl(c.clob001, to_clob('{}')),
          '$.items[*]'
          columns (
            customertransactionid  number        path '$.CustomerTransactionId'   null on error,
            transactionnumber      varchar2(200) path '$.TransactionNumber'       null on error,
            transactiondate        date          path '$.TransactionDate'         null on error,
            accountingdate         date          path '$.AccountingDate'          null on error,
            duedate                date          path '$.DueDate'                null on error,
            shipdate               date          path '$.ShipDate'               null on error,
            billingdate            date          path '$.BillingDate'            null on error,
            businessunit           varchar2(200) path '$.BusinessUnit'           null on error,
            billtocustomername     varchar2(400) path '$.BillToCustomerName'     null on error,
            billtocustomernumber   varchar2(100) path '$.BillToCustomerNumber'   null on error,
            billtosite             varchar2(200) path '$.BillToSite'             null on error,
            shiptocustomername     varchar2(400) path '$.ShipToCustomerName'     null on error,
            invoicestatus          varchar2(100) path '$.InvoiceStatus'          null on error,
            transactiontype        varchar2(200) path '$.TransactionType'        null on error,
            transactionsource      varchar2(200) path '$.TransactionSource'      null on error,
            invoicecurrencycode    varchar2(30)  path '$.InvoiceCurrencyCode'    null on error,
            enteredamount          number        path '$.EnteredAmount'          null on error,
            invoicebalanceamount   number        path '$.InvoiceBalanceAmount'   null on error,
            freightamount          number        path '$.FreightAmount'          null on error,
            documentnumber         number        path '$.DocumentNumber'         null on error,
            paymentterms           varchar2(200) path '$.PaymentTerms'           null on error,
            purchaseorder          varchar2(200) path '$.PurchaseOrder'          null on error,
            salespersonnumber      varchar2(100) path '$.SalesPersonNumber'      null on error,
            receiptmethod          varchar2(200) path '$.ReceiptMethod'          null on error,
            comments               varchar2(4000) path '$.Comments'             null on error
          )
        ) jt
        where c.collection_name = 'AR_RAW'
          and c.seq_id = 1
          and c.c001 = 'OK'
      ~'
    );

  exception
    when others then
      raise;
  end load_receivables_invoices;

end receivables_pkg;
/
