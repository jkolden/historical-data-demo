------------------------------------------------------------------------
--  AR Customer popup LOV
--
--  Uses the FUSION_AR_CUSTOMERS collection (loaded once per session
--  by receivables_pkg.load_customer_lov via REST data source
--  "receivables_customer_lov") UNION with local history table.
--
--  Call receivables_pkg.load_customer_lov in a Before Header process
--  (or in the LOV's "function returning SQL" wrapper) so the
--  collection is populated before the LOV fires.
------------------------------------------------------------------------

/* Distinct customer names from both Fusion LOV + local history */
select distinct customer_name as d, customer_name as r
from (
  /* From local history table */
  select billtocustomername as customer_name
  from demo_ar_invoices_hist
  where billtocustomername is not null

  union

  /* From Fusion customer LOV collection */
  select c.c001 as customer_name
  from apex_collections c
  where c.collection_name = 'FUSION_AR_CUSTOMERS'
    and c.c001 is not null
)
order by 1
;
