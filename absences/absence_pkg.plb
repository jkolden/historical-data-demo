create or replace package body absence_pkg as


  procedure load_absences(
    p_person_number varchar2,
    p_from_date     date default null,
    p_to_date       date default null
  )
  as
    l_response   clob;
    l_url        varchar2(4000);
    l_q          varchar2(2000);
    l_http_code  pls_integer;
    l_pn         varchar2(1000);

    function clip(p in clob, p_max in pls_integer := 1000) return varchar2 is
    begin
      if p is null then
        return null;
      end if;
      return dbms_lob.substr(p, p_max, 1);
    end;
  begin
    -- basic validation
    if p_person_number is null then
      raise_application_error(-20001, 'Person number is required.');
    end if;

    -- escape single quotes inside values (double them)
    l_pn := replace(p_person_number, '''', '''''');

    -- Fusion ADF-style filter string
    l_q := 'personNumber=''' || l_pn || '''';

    if p_from_date is not null then
      l_q := l_q || ';startDate >= ''' || to_char(p_from_date, 'YYYY-MM-DD') || '''';
    end if;

    if p_to_date is not null then
      l_q := l_q || ';startDate <= ''' || to_char(p_to_date, 'YYYY-MM-DD') || '''';
    end if;

    -- utl_url.escape preserves single quotes and parens (matching Postman)
    l_url :=
         'https://<your-fusion-host>/hcmRestApi/resources/11.13.18.05/absences'
      || '?q=' || utl_url.escape(l_q, false, 'AL32UTF8')
      || '&onlyData=true'
      || '&totalResults=true'
      || '&limit=100';

    -- collections: raw + shredded rows
    apex_collection.create_or_truncate_collection('ABSENCE_RAW');

    begin
      apex_collection.delete_collection('FUSION_ABSENCE_ROWS');
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
      p_collection_name => 'ABSENCE_RAW',
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
    -- Absences endpoint returns FLAT items (not nested like publicWorkers)
    -- Collection column mapping:
    --   n001=personAbsenceEntryId  n002=personId  n003=duration  n004=absenceTypeId
    --   d001=startDate  d002=endDate  d003=submittedDate
    --   c001=personNumber  c002=absenceType  c003=absenceReason
    --   c004=absenceStatusCd  c005=approvalStatusCd  c006=absenceDispStatusMeaning
    --   c007=employer  c008=legislationCode  c009=formattedDuration
    --   c010=unitOfMeasureMeaning  c011=comments  c012=assignmentNumber  c013=source
    apex_collection.create_collection_from_query2(
      p_collection_name => 'FUSION_ABSENCE_ROWS',
      p_query => q'~
        select
           /* ---- N001..N005 ---- */
      jt.personabsenceentryid  as n001,
      jt.personid              as n002,
      jt.duration              as n003,
      jt.absencetypeid         as n004,
      cast(null as number)     as n005,

      /* ---- D001..D005 ---- */
      jt.startdate             as d001,
      jt.enddate               as d002,
      jt.submitteddate         as d003,
      cast(null as date)       as d004,
      cast(null as date)       as d005,

      /* ---- C001.. ---- */
      jt.personnumber          as c001,
      jt.absencetype           as c002,
      jt.absencereason         as c003,
      jt.absencestatuscd       as c004,
      jt.approvalstatuscd      as c005,
      jt.absencedispstatusmeaning as c006,
      jt.employer              as c007,
      jt.legislationcode       as c008,
      jt.formattedduration     as c009,
      jt.unitofmeasuremeaning  as c010,
      jt.comments              as c011,
      jt.assignmentnumber      as c012,
      jt.source                as c013
        from apex_collections c
        cross join json_table(
          nvl(c.clob001, to_clob('{}')),
          '$.items[*]'
          columns (
            personabsenceentryid   number        path '$.personAbsenceEntryId'    null on error,
            personid               number        path '$.personId'               null on error,
            personnumber           varchar2(100) path '$.personNumber'           null on error,
            absencetype            varchar2(400) path '$.absenceType'            null on error,
            absencereason          varchar2(400) path '$.absenceReason'          null on error,
            absencetypeid          number        path '$.absenceTypeId'          null on error,
            startdate              date          path '$.startDate'              null on error,
            enddate                date          path '$.endDate'               null on error,
            duration               number        path '$.duration'              null on error,
            formattedduration      varchar2(200) path '$.formattedDuration'      null on error,
            unitofmeasuremeaning   varchar2(200) path '$.unitOfMeasureMeaning'   null on error,
            absencestatuscd        varchar2(100) path '$.absenceStatusCd'        null on error,
            approvalstatuscd       varchar2(100) path '$.approvalStatusCd'       null on error,
            absencedispstatusmeaning varchar2(400) path '$.absenceDispStatusMeaning' null on error,
            employer               varchar2(400) path '$.employer'               null on error,
            legislationcode        varchar2(30)  path '$.legislationCode'        null on error,
            comments               varchar2(4000) path '$.comments'             null on error,
            assignmentnumber       varchar2(100) path '$.assignmentNumber'       null on error,
            source                 varchar2(200) path '$.source'                 null on error,
            submitteddate          date          path '$.submittedDate'          null on error
          )
        ) jt
        where c.collection_name = 'ABSENCE_RAW'
          and c.seq_id = 1
          and c.c001 = 'OK'
      ~'
    );

  exception
    when others then
      raise;
  end load_absences;

end absence_pkg;
/
