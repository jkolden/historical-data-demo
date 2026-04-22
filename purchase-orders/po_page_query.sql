------------------------------------------------------------------------
--  PO History page – Interactive Report source
--  UNION ALL:  Fusion collection rows  +  local legacy table
--
--  Expects page items:
--    :P<n>_SUPPLIER_NAME   (text / LOV)
--    :P<n>_STATUS           (text / LOV)
--    :P<n>_BUYER            (text / LOV – optional)
--    :P<n>_FROM_DATE        (date picker)
--    :P<n>_TO_DATE          (date picker)
--
--  Collection FUSION_PO_ROWS is populated by po_pkg.load_purchase_orders
------------------------------------------------------------------------

/* ======== Fusion (from shredded collection) ======== */
select
  c.seq_id           as id,
  'Fusion'           as SourceSystem,
  'Fusion'           as SourceSystem_search,

  c.n001             as POHeaderId,
  c.c001             as OrderNumber,
  c.n002             as Ordered,
  c.n003             as Total,
  c.n004             as Revision,
  c.d001             as OrderDate,
  c.d002             as CreationDate,
  case when c.c002 = 'Greenville County Schools' then 'Main BU' end as ProcurementBU,
  c.c003             as Supplier,
  c.c004             as SupplierSite,
  c.c005             as Status,
  c.c006             as Buyer,
  c.c007             as CurrencyCode,
  c.c008             as PaymentTerms,
  c.c009             as Description,
  c.c010             as ShipToLocationCode,
  c.c011             as BillToLocation,
  c.c012             as FundsStatus,
  c.c013             as Requisition

from apex_collections c
where c.collection_name = 'FUSION_PO_ROWS'

union all

/* ======== Legacy + EBS (from local table) ======== */
select
  null               as id,
  d.sourcesystem     as SourceSystem,
  d.sourcesystem     as SourceSystem_search,

  d.poheaderid       as POHeaderId,
  d.ordernumber      as OrderNumber,
  d.ordered          as Ordered,
  d.total            as Total,
  d.revision         as Revision,
  d.orderdate        as OrderDate,
  d.creationdate     as CreationDate,
  case when d.procurementbu = 'Greenville County Schools' then 'Main BU' end as ProcurementBU,
  d.supplier         as Supplier,
  d.suppliersite     as SupplierSite,
  d.status           as Status,
  d.buyer            as Buyer,
  d.currencycode     as CurrencyCode,
  d.paymentterms     as PaymentTerms,
  d.description      as Description,
  d.shiptolocationcode as ShipToLocationCode,
  d.billtolocation   as BillToLocation,
  d.fundsstatus      as FundsStatus,
  d.requisition      as Requisition

from demo_po_hist d
where d.supplier = :P_SUPPLIER_NAME
  and ( nullif(:P_STATUS, '') is null
        or d.status = :P_STATUS )
;