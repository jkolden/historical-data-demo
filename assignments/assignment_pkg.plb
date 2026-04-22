create or replace package body assignment_pkg as


  procedure load_assignments(
    p_last_name  varchar2 default null,
    p_department varchar2 default null
  )
  as
    l_response   clob;
    l_url        varchar2(4000);
    l_q          varchar2(2000);
    l_http_code  pls_integer;
    l_last_name  varchar2(1000);

    function clip(p in clob, p_max in pls_integer := 1000) return varchar2 is
    begin
      if p is null then
        return null;
      end if;
      return dbms_lob.substr(p, p_max, 1);
    end;
  begin
    -- basic validation
    if p_last_name is null then
      raise_application_error(-20001, 'Last name is required.');
    end if;

    -- escape single quotes inside values (double them)
    l_last_name := replace(p_last_name, '''', '''''');

    -- Fusion ADF-style filter string
    l_q := 'LastName=''' || l_last_name || '''';

    -- utl_url.escape preserves single quotes and parens (matching Postman)
    l_url :=
         'https://<your-fusion-host>/hcmRestApi/resources/11.13.18.05/publicWorkers'
      || '?q=' || utl_url.escape(l_q, false, 'AL32UTF8')
      || '&expand=assignments'
      || '&onlyData=true'
      || '&totalResults=true'
      || '&limit=100';

    -- collections: raw + shredded rows
    apex_collection.create_or_truncate_collection('ASSIGNMENT_RAW');

    begin
      apex_collection.delete_collection('FUSION_ASSIGNMENT_ROWS');
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
      p_collection_name => 'ASSIGNMENT_RAW',
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

    -- shred $.items[*] with nested $.assignments[*]
    -- publicWorkers returns assignments as a direct array (not paged child)
    -- Collection column mapping:
    --   n001=PersonId  n002=AssignmentId  n003=LengthOfServiceYears
    --   d001=StartDate
    --   c001=PersonNumber  c002=DisplayName  c003=AssignmentNumber
    --   c004=AssignmentName  c005=WorkerType  c006=DepartmentName
    --   c007=JobName  c008=PositionName  c009=GradeName  c010=LocationName
    --   c011=BusinessUnitName  c012=LegalEmployerName  c013=ManagerName
    --   c014=FullPartTime  c015=WorkEmail
    apex_collection.create_collection_from_query2(
      p_collection_name => 'FUSION_ASSIGNMENT_ROWS',
      p_query => q'~
        select
           /* ---- N001..N005 ---- */
      jt.personid              as n001,
      jt.assignmentid          as n002,
      jt.lengthofserviceyears  as n003,
      cast(null as number)     as n004,
      cast(null as number)     as n005,

      /* ---- D001..D005 ---- */
      jt.startdate             as d001,
      cast(null as date)       as d002,
      cast(null as date)       as d003,
      cast(null as date)       as d004,
      cast(null as date)       as d005,

      /* ---- C001.. ---- */
      jt.personnumber          as c001,
      jt.displayname           as c002,
      jt.assignmentnumber      as c003,
      jt.assignmentname        as c004,
      jt.workertype            as c005,
      jt.departmentname        as c006,
      jt.jobname               as c007,
      jt.positionname          as c008,
      jt.gradename             as c009,
      jt.locationname          as c010,
      jt.businessunitname      as c011,
      jt.legalemployername     as c012,
      jt.managername           as c013,
      jt.fullparttime          as c014,
      jt.workemail             as c015
        from apex_collections c
        cross join json_table(
          nvl(c.clob001, to_clob('{}')),
          '$.items[*]'
          columns (
            personid             number        path '$.PersonId'              null on error,
            personnumber         varchar2(100) path '$.PersonNumber'          null on error,
            displayname          varchar2(400) path '$.DisplayName'           null on error,
            workemail            varchar2(400) path '$.WorkEmail'             null on error,
            nested path '$.assignments[*]'
            columns (
              assignmentid           number        path '$.AssignmentId'           null on error,
              assignmentnumber       varchar2(100) path '$.AssignmentNumber'       null on error,
              assignmentname         varchar2(200) path '$.AssignmentName'         null on error,
              workertype             varchar2(30)  path '$.WorkerType'             null on error,
              startdate              date          path '$.StartDate'              null on error,
              fullparttime           varchar2(100) path '$.FullPartTime'           null on error,
              managername            varchar2(400) path '$.ManagerName'            null on error,
              businessunitname       varchar2(200) path '$.BusinessUnitName'       null on error,
              legalemployername      varchar2(400) path '$.LegalEmployerName'      null on error,
              departmentname         varchar2(200) path '$.DepartmentName'         null on error,
              jobname                varchar2(200) path '$.JobName'                null on error,
              positionname           varchar2(200) path '$.PositionName'           null on error,
              locationname           varchar2(200) path '$.LocationName'           null on error,
              gradename              varchar2(200) path '$.GradeName'              null on error,
              lengthofserviceyears   number        path '$.LengthOfServiceYears'   null on error
            )
          )
        ) jt
        where c.collection_name = 'ASSIGNMENT_RAW'
          and c.seq_id = 1
          and c.c001 = 'OK'
      ~'
    );

  exception
    when others then
      raise;
  end load_assignments;

end assignment_pkg;
/
