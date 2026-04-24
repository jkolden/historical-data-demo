/*===========================================================
  EBS R12 Extraction: Purchase Orders
  Target table: DEMO_PO_HIST

  Source: Oracle E-Business Suite R12
  Tables: PO_HEADERS_ALL + lookups

  Usage:
    Run against an EBS R12 database instance.
    Output column aliases match DEMO_PO_HIST exactly.
    The identity PK (po_hist_id) is auto-generated on INSERT.

  Bind variables — adjust per customer:
    :p_org_id      - Operating unit (org_id) to extract
    :p_start_date  - PO creation date range start
    :p_end_date    - PO creation date range end

  Notes:
    - EBS PO amounts live on lines/distributions; header-level
      totals are calculated via subqueries
    - Some Fusion-only fields (e.g., buyer managed transport)
      may not have direct EBS equivalents
===========================================================*/

SELECT
    -- === Source tag ===
    'EBS'                                       AS sourcesystem,

    -- === Core identifiers ===
    ph.po_header_id                             AS poheaderid,
    ph.segment1                                 AS ordernumber,
    ph.authorization_status                     AS statuscode,
    CASE ph.authorization_status
        WHEN 'APPROVED'            THEN 'Open'
        WHEN 'REQUIRES REAPPROVAL' THEN 'Requires Reapproval'
        WHEN 'INCOMPLETE'          THEN 'Incomplete'
        WHEN 'IN PROCESS'          THEN 'Pending Approval'
        WHEN 'PRE-APPROVED'        THEN 'Pre-Approved'
        WHEN 'REJECTED'            THEN 'Rejected'
        ELSE ph.authorization_status
    END                                         AS status,
    ph.revision_num                             AS revision,
    ph.type_lookup_code                         AS documentstyle,        -- STANDARD, BLANKET, CONTRACT, PLANNED
    CASE ph.type_lookup_code
        WHEN 'STANDARD' THEN 'GOODS_AND_SERVICES'
        WHEN 'BLANKET'  THEN 'GOODS_AND_SERVICES'
        WHEN 'CONTRACT' THEN 'SERVICES'
        ELSE 'GOODS_AND_SERVICES'
    END                                         AS purchasebasis,
    ph.comments                                 AS description,

    -- === Amounts / Currency (calculated from lines) ===
    (SELECT SUM(pl.quantity * pl.unit_price)
       FROM po_lines_all pl
      WHERE pl.po_header_id = ph.po_header_id)  AS ordered,
    (SELECT SUM(pl.quantity * pl.unit_price)
       FROM po_lines_all pl
      WHERE pl.po_header_id = ph.po_header_id)  AS orderedamountbeforeadjustments,
    NULL                                        AS creditamount,         -- Fusion-only
    NULL                                        AS discountamount,       -- Fusion-only
    (SELECT NVL(SUM(pd.nonrecoverable_tax), 0)
       FROM po_distributions_all pd
      WHERE pd.po_header_id = ph.po_header_id)  AS totaltax,
    (SELECT SUM(pl.quantity * pl.unit_price)
       FROM po_lines_all pl
      WHERE pl.po_header_id = ph.po_header_id)
    + (SELECT NVL(SUM(pd.nonrecoverable_tax), 0)
         FROM po_distributions_all pd
        WHERE pd.po_header_id = ph.po_header_id) AS total,
    (SELECT NVL(SUM(pd.recoverable_tax), 0)
       FROM po_distributions_all pd
      WHERE pd.po_header_id = ph.po_header_id)  AS recoverabletax,
    (SELECT NVL(SUM(pd.nonrecoverable_tax), 0)
       FROM po_distributions_all pd
      WHERE pd.po_header_id = ph.po_header_id)  AS nonrecoverabletax,
    NULL                                        AS recoverableinclusivetax,    -- Fusion eBTax
    NULL                                        AS nonrecoverableinclusivetax, -- Fusion eBTax
    ph.currency_code                            AS currencycode,
    ph.currency_code                            AS currency,             -- EBS: code = display
    ph.rate_type                                AS conversionratetype,
    ph.rate                                     AS conversionrate,
    ph.rate_date                                AS conversionratedate,

    -- === Dates ===
    NVL(ph.approved_date, ph.creation_date)     AS orderdate,
    ph.creation_date                            AS creationdate,
    ph.last_update_date                         AS lastupdatedate,
    NULL                                        AS acknowledgmentduedate, -- Fusion iSupplier

    -- === Business units / Legal entity ===
    hou.name                                    AS procurementbu,
    hou.name                                    AS requisitioningbu,     -- same OU in EBS
    hou.name                                    AS billtobu,             -- same OU in EBS
    xle.name                                    AS soldtolegalentity,

    -- === Supplier ===
    aps.vendor_name                             AS supplier,
    apss.vendor_site_code                       AS suppliersite,
    pvc.last_name || ', ' || pvc.first_name     AS suppliercontact,
    ph.vendor_order_num                         AS supplierorder,
    ph.supplier_notif_method                    AS suppliercommunicationmethod,

    -- === Buyer / Requester ===
    buyer.full_name                             AS buyer,
    buyer.full_name                             AS buyerdisplayname,
    NULL                                        AS requesterid,          -- lives on requisition in EBS
    NULL                                        AS requesterdisplayname, -- lives on requisition in EBS

    -- === Locations ===
    hla_ship.location_code                      AS shiptolocationcode,
    hla_ship.address_line_1
        || CASE WHEN hla_ship.town_or_city IS NOT NULL
                THEN ', ' || hla_ship.town_or_city END
        || CASE WHEN hla_ship.region_1 IS NOT NULL
                THEN ', ' || hla_ship.region_1 END
                                                AS shiptolocationaddress,
    hla_bill.location_code                      AS billtolocation,
    hla_bill.address_line_1
        || CASE WHEN hla_bill.town_or_city IS NOT NULL
                THEN ', ' || hla_bill.town_or_city END
        || CASE WHEN hla_bill.region_1 IS NOT NULL
                THEN ', ' || hla_bill.region_1 END
                                                AS billtolocationaddress,

    -- === Payment / Terms ===
    apt.name                                    AS paymentterms,

    -- === Shipping / Freight ===
    NULL                                        AS carrier,              -- lives on PO lines in EBS
    NULL                                        AS modeoftransport,      -- Fusion-only
    NULL                                        AS servicelevel,         -- Fusion-only
    ph.ship_via_lookup_code                     AS shippingmethod,
    ph.freight_terms_lookup_code                AS freightterms,
    ph.fob_lookup_code                          AS fob,

    -- === Contract / Source ===
    NULL                                        AS mastercontractnumber, -- Fusion contracts
    NULL                                        AS mastercontracttype,   -- Fusion contracts
    bpa.segment1                                AS sourceagreement,      -- blanket reference
    NULL                                        AS salesorder,           -- Fusion back-to-back
    NULL                                        AS negotiation,          -- Fusion sourcing
    NULL                                        AS requisition,          -- header-level; on lines in EBS

    -- === Notes ===
    ph.note_to_vendor                           AS notetosupplier,
    ph.note_to_receiver                         AS notetoreceiver,

    -- === References ===
    ph.vendor_order_num                         AS referencenumber,
    ph.interface_source_code                    AS importsourcecode,

    -- === Budget / Funds ===
    NULL                                        AS fundsstatuscode,      -- on distributions in EBS
    NULL                                        AS fundsstatus,
    CASE WHEN ph.encumbrance_required_flag = 'Y'
         THEN 'Y' ELSE 'N'
    END                                         AS budgetcontrolenabledflag,

    -- === Flags ===
    ph.acceptance_required_flag                 AS requiressignatureflag,
    CASE WHEN ph.pay_on_code = 'RECEIPT'
         THEN 'Y' ELSE 'N'
    END                                         AS payonreceiptflag,
    ph.confirming_order_flag                    AS confirmingorderflag,
    NULL                                        AS buyermanagedtransportflag, -- Fusion-only
    NULL                                        AS retainageflag,        -- Fusion-only
    NULL                                        AS progresspaymentflag,  -- Fusion-only
    ph.consigned_consumption_flag               AS consignmenttermsflag,

    -- === Acknowledgment ===
    ph.acceptance_required_flag                 AS requiredacknowledgment,
    ph.acceptance_due_date - ph.creation_date   AS acknowledgewithindays,

    -- === Approver override ===
    NULL                                        AS overridingapprover,   -- Fusion AMX

    -- === Tax / Fiscal ===
    NULL                                        AS defaulttaxationcountry,        -- Fusion eBTax
    NULL                                        AS documentfiscalclassification,  -- Fusion eBTax
    NULL                                        AS firstpartyregistrationnumber,  -- Fusion eBTax
    aps.vat_registration_num                    AS thirdpartyregistrationnumber,

    -- === Audit ===
    fu_cr.user_name                             AS createdby,
    fu_upd.user_name                            AS lastupdatedby

FROM
    po_headers_all              ph
    -- Operating unit → business unit name
    JOIN hr_operating_units     hou
        ON hou.organization_id = ph.org_id
    -- Supplier
    LEFT JOIN ap_suppliers      aps
        ON aps.vendor_id = ph.vendor_id
    -- Supplier site
    LEFT JOIN ap_supplier_sites_all apss
        ON apss.vendor_site_id = ph.vendor_site_id
    -- Supplier contact
    LEFT JOIN po_vendor_contacts pvc
        ON pvc.vendor_contact_id = ph.vendor_contact_id
    -- Legal entity
    LEFT JOIN xle_entity_profiles xle
        ON xle.legal_entity_id = hou.default_legal_context_id
    -- Buyer
    LEFT JOIN per_all_people_f  buyer
        ON buyer.person_id = ph.agent_id
        AND SYSDATE BETWEEN buyer.effective_start_date AND buyer.effective_end_date
    -- Ship-to location
    LEFT JOIN hr_locations_all  hla_ship
        ON hla_ship.location_id = ph.ship_to_location_id
    -- Bill-to location
    LEFT JOIN hr_locations_all  hla_bill
        ON hla_bill.location_id = ph.bill_to_location_id
    -- Payment terms
    LEFT JOIN ap_terms          apt
        ON apt.term_id = ph.terms_id
    -- Blanket/source agreement reference
    LEFT JOIN po_headers_all    bpa
        ON bpa.po_header_id = ph.blanket_total_amount  -- placeholder; actual FK varies
    -- Audit: created by
    LEFT JOIN fnd_user          fu_cr
        ON fu_cr.user_id = ph.created_by
    -- Audit: last updated by
    LEFT JOIN fnd_user          fu_upd
        ON fu_upd.user_id = ph.last_updated_by

WHERE
    ph.org_id = :p_org_id
    AND ph.creation_date BETWEEN :p_start_date AND :p_end_date
    AND ph.type_lookup_code IN ('STANDARD', 'BLANKET', 'CONTRACT', 'PLANNED')

ORDER BY
    ph.creation_date,
    ph.po_header_id;
