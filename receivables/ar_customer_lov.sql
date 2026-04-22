------------------------------------------------------------------------
--  AR Customer popup LOV
--
--  Option A (below): Union distinct customers from local hist table
--           + Fusion collection. Works offline / always available.
--
--  Option B: Use an APEX REST Data Source pointing at the Fusion LOV:
--    /fscmRestApi/resources/11.13.18.05/receivablesInvoices/{id}/lov/billToCustomers?limit=1000
--    and bind it to a Popup LOV with display=BillToCustomerName,
--    return=BillToCustomerName.
------------------------------------------------------------------------

/* Distinct customer names from both sources */
select distinct customer_name as d, customer_name as r
from (
  /* From local history table */
  select billtocustomername as customer_name
  from demo_ar_invoices_hist
  where billtocustomername is not null

  union

  /* From Fusion collection (if loaded) */
  select json_value(c.clob001, '$.BillToCustomerName') as customer_name
  from apex_collections c
  where c.collection_name = 'FUSION_AR_ROWS'
    and json_value(c.clob001, '$.BillToCustomerName') is not null
)
order by 1
;
