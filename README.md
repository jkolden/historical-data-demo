# Historical Data Demo - Table Reference

Demo app (APEX App 121) showing how legacy data can be stored alongside Oracle Fusion Cloud data.
Each table holds **Legacy** and/or **EBS** historical records that are combined with live Fusion REST data via UNION ALL queries.

All tables mirror the **full field set** from their corresponding Fusion REST endpoints, so legacy data can be as rich as the live Fusion data.

---

## Tables at a Glance

| # | Table | Subject Area | Folder / DDL | Columns | REST Endpoint |
|---|-------|-------------|--------------|---------|---------------|
| 1 | `DEMO_AP_INVOICES_HIST` | AP Invoices | `ap-invoices/demo_ap_invoices_hist.sql` | 93 | `/fscmRestApi/.../invoices` |
| 2 | `DEMO_AP_INVOICE_LINE_HIST` | AP Invoice Lines | `ap-invoices/demo_ap_invoice_line_hist.sql` | 79 | `/fscmRestApi/.../invoices/{id}/child/invoiceLines` |
| 3 | `DEMO_PO_HIST` | Purchase Orders | `purchase-orders/demo_po_hist_ddl.sql` | 72 | `/fscmRestApi/.../purchaseOrders` |
| 4 | `DEMO_ASSIGNMENT_HIST` | HR Assignments | `assignments/demo_assignment_hist_ddl.sql` | 62 | `/hcmRestApi/.../publicWorkers` |
| 5 | `DEMO_ABSENCE_HIST` | Absences | `absences/demo_absence_hist_ddl.sql` | 56 | `/hcmRestApi/.../absences` |
| 6 | `DEMO_AR_INVOICES_HIST` | Receivables Invoices | `receivables/demo_ar_invoices_hist.sql` | 80 | `/fscmRestApi/.../receivablesInvoices` |

---

## 1. DEMO_AP_INVOICES_HIST

AP invoice headers from legacy/EBS systems. Mirrors `/fscmRestApi/resources/11.13.18.05/invoices`.

| Column | Type | Notes |
|--------|------|-------|
| **Source tag** | | |
| `SourceSystem` | VARCHAR2(30) | NOT NULL - 'Legacy' or 'EBS' |
| **Core identifiers** | | |
| `InvoiceId` | NUMBER | NOT NULL |
| `InvoiceNumber` | VARCHAR2(100) | NOT NULL |
| `InvoiceType` | VARCHAR2(50) | Standard, Credit Memo, etc. |
| `InvoiceSourceCode` | VARCHAR2(255) | Code value |
| `InvoiceSource` | VARCHAR2(255) | Display value |
| `InvoiceGroup` | VARCHAR2(255) | |
| `Description` | VARCHAR2(240) | |
| **Amounts / Currency** | | |
| `InvoiceAmount` | NUMBER(14,2) | |
| `AmountPaid` | NUMBER(14,2) | |
| `BaseAmount` | NUMBER(14,2) | |
| `ControlAmount` | NUMBER(14,2) | |
| `InvoiceCurrency` | VARCHAR2(15) | |
| `PaymentCurrency` | VARCHAR2(15) | |
| `ConversionRateType` | VARCHAR2(30) | |
| `ConversionDate` | DATE | |
| `ConversionRate` | NUMBER | |
| **Key dates** | | |
| `InvoiceDate` | DATE | |
| `AccountingDate` | DATE | |
| `TermsDate` | DATE | |
| `GoodsReceivedDate` | DATE | |
| `InvoiceReceivedDate` | DATE | |
| `ApplyAfterDate` | DATE | |
| `BudgetDate` | DATE | |
| `CanceledDate` | DATE | |
| **Business unit / Legal entity** | | |
| `BusinessUnit` | VARCHAR2(255) | |
| `ProcurementBU` | VARCHAR2(255) | |
| `LegalEntity` | VARCHAR2(255) | |
| `LegalEntityIdentifier` | VARCHAR2(100) | |
| `TaxationCountry` | VARCHAR2(255) | |
| **Supplier** | | |
| `Supplier` | VARCHAR2(255) | |
| `SupplierNumber` | VARCHAR2(30) | |
| `SupplierSite` | VARCHAR2(255) | |
| `Party` | VARCHAR2(255) | |
| `PartySite` | VARCHAR2(255) | |
| `SupplierTaxRegistrationNumber` | VARCHAR2(100) | |
| **Requester** | | |
| `RequesterId` | NUMBER | |
| `Requester` | VARCHAR2(255) | |
| **Statuses** | | |
| `ValidationStatus` | VARCHAR2(50) | |
| `ApprovalStatus` | VARCHAR2(50) | |
| `PaidStatus` | VARCHAR2(50) | |
| `AccountingStatus` | VARCHAR2(50) | |
| `FundsStatus` | VARCHAR2(100) | |
| `AccountCodingStatus` | VARCHAR2(100) | |
| `CanceledFlag` | VARCHAR2(5) | |
| `CanceledBy` | VARCHAR2(255) | |
| **Payment details** | | |
| `PaymentTerms` | VARCHAR2(100) | |
| `PaymentMethodCode` | VARCHAR2(30) | |
| `PaymentMethod` | VARCHAR2(100) | |
| `PayGroup` | VARCHAR2(255) | |
| `PayAloneFlag` | VARCHAR2(5) | |
| `BankAccount` | VARCHAR2(100) | |
| `SupplierIBAN` | VARCHAR2(100) | |
| `ExternalBankAccountId` | NUMBER | |
| `BankChargeBearer` | VARCHAR2(100) | |
| `SettlementPriority` | VARCHAR2(100) | |
| **Payment reason** | | |
| `PaymentReasonCode` | VARCHAR2(30) | |
| `PaymentReason` | VARCHAR2(255) | |
| `PaymentReasonComments` | VARCHAR2(4000) | |
| **Remittance** | | |
| `RemittanceMessageOne` | VARCHAR2(255) | |
| `RemittanceMessageTwo` | VARCHAR2(255) | |
| `RemittanceMessageThree` | VARCHAR2(255) | |
| `UniqueRemittanceIdentifier` | VARCHAR2(255) | |
| `UniqueRemittanceIdentifierChkDig` | VARCHAR2(10) | |
| **Delivery** | | |
| `DeliveryChannelCode` | VARCHAR2(30) | |
| `DeliveryChannel` | VARCHAR2(255) | |
| **Liability / Distribution** | | |
| `LiabilityDistribution` | VARCHAR2(255) | |
| **Document** | | |
| `DocumentCategory` | VARCHAR2(100) | |
| `DocumentSequence` | NUMBER | |
| `VoucherNumber` | NUMBER | |
| `DocumentFiscalClassCodePath` | VARCHAR2(4000) | |
| **PO link** | | |
| `PurchaseOrderNumber` | VARCHAR2(50) | |
| **First-party tax** | | |
| `FirstPartyTaxRegistrationId` | NUMBER | |
| `FirstPartyTaxRegistrationNumber` | VARCHAR2(100) | |
| **Routing attributes** | | |
| `RoutingAttribute1` - `RoutingAttribute5` | VARCHAR2(255) | 5 flex columns |
| **Reference keys** | | |
| `ReferenceKeyOne` - `ReferenceKeyFive` | VARCHAR2(255) | 5 flex columns |
| **Misc** | | |
| `ProductTable` | VARCHAR2(255) | |
| `ImageDocumentNumber` | VARCHAR2(255) | |
| `DigitalPaymentAccount` | VARCHAR2(255) | |
| **Audit** | | |
| `CreationDate` | TIMESTAMP(6) | |
| `CreatedBy` | VARCHAR2(255) | |
| `LastUpdateDate` | TIMESTAMP(6) | |
| `LastUpdatedBy` | VARCHAR2(255) | |

**PK:** `(SourceSystem, InvoiceId)`
**Indexes:** `InvoiceDate`, `SupplierNumber`, `BusinessUnit`, `PaidStatus`

---

## 2. DEMO_AP_INVOICE_LINE_HIST

AP invoice line details (child rows of invoices above). Mirrors `/fscmRestApi/.../invoices/{id}/child/invoiceLines`.

| Column | Type | Notes |
|--------|------|-------|
| **Parent key** | | |
| `Invoice_Id` | NUMBER | FK to invoices table |
| **Line identifiers** | | |
| `Line_Id` | NUMBER | |
| `Line_Number` | NUMBER | |
| `Line_Type` | VARCHAR2(30) | Item, Tax, Freight, etc. |
| `Line_Source` | VARCHAR2(255) | |
| `Description` | VARCHAR2(240) | |
| **Amounts** | | |
| `Line_Amount` | NUMBER | |
| `Base_Amount` | NUMBER | |
| `Unit_Price` | NUMBER | |
| `Quantity` | NUMBER | |
| `UOM` | VARCHAR2(30) | |
| `Assessable_Value` | NUMBER | |
| `Tax_Control_Amount` | NUMBER | |
| **Dates** | | |
| `Accounting_Date` | DATE | |
| `Budget_Date` | DATE | |
| `Multiperiod_Acctg_Start_Date` | DATE | |
| `Multiperiod_Acctg_End_Date` | DATE | |
| **Distribution** | | |
| `Distribution_Combination` | VARCHAR2(255) | Full account string |
| `Distribution_Set` | VARCHAR2(255) | |
| `Generate_Distributions` | VARCHAR2(5) | |
| `Multiperiod_Acctg_Accrual_Acct` | VARCHAR2(255) | |
| **Matching / PO** | | |
| `Match_Type` | VARCHAR2(30) | |
| `Match_Option` | VARCHAR2(30) | |
| `Match_Basis` | VARCHAR2(30) | |
| `Purchase_Order_Number` | VARCHAR2(50) | |
| `Purchase_Order_Line_Number` | NUMBER | |
| `Purchase_Order_Sched_Line_Number` | NUMBER | |
| `Receipt_Number` | VARCHAR2(50) | |
| `Receipt_Line_Number` | NUMBER | |
| `Consumption_Advice_Number` | VARCHAR2(50) | |
| `Consumption_Advice_Line_Number` | NUMBER | |
| `Final_Match_Flag` | VARCHAR2(5) | |
| **Item** | | |
| `Item` | VARCHAR2(255) | |
| `Item_Description` | VARCHAR2(255) | |
| **Tax** | | |
| `Tax_Rate_Name` | VARCHAR2(255) | |
| `Tax_Rate_Code` | VARCHAR2(100) | |
| `Tax_Rate` | NUMBER | |
| `Tax_Classification` | VARCHAR2(255) | |
| **Status / Flags** | | |
| `Approval_Status` | VARCHAR2(100) | |
| `Funds_Status` | VARCHAR2(30) | |
| `Discarded_Flag` | VARCHAR2(5) | |
| `Canceled_Flag` | VARCHAR2(5) | |
| `Prorate_Across_All_Items_Flag` | VARCHAR2(5) | |
| `Track_As_Asset_Flag` | VARCHAR2(5) | |
| `Landed_Cost_Enabled` | VARCHAR2(5) | |
| **Asset** | | |
| `Asset_Book` | VARCHAR2(255) | |
| `Asset_Category` | VARCHAR2(255) | |
| **Ship-to** | | |
| `Ship_To_Location_Code` | VARCHAR2(200) | |
| `Ship_To_Location` | VARCHAR2(255) | |
| `Ship_To_Customer_Location` | VARCHAR2(255) | |
| **Income tax** | | |
| `Income_Tax_Type` | VARCHAR2(100) | |
| `Income_Tax_Region` | VARCHAR2(255) | |
| **Product / Fiscal classification** | | |
| `Product_Type` | VARCHAR2(100) | |
| `Product_Category` | VARCHAR2(255) | |
| `Product_Fiscal_Classification` | VARCHAR2(255) | |
| `User_Defined_Fiscal_Class` | VARCHAR2(255) | |
| `Intended_Use` | VARCHAR2(255) | |
| `Transaction_Business_Category` | VARCHAR2(255) | |
| *(+ code variants for each)* | | |
| **Purchasing** | | |
| `Purchasing_Category` | VARCHAR2(255) | |
| **Requester** | | |
| `Requester_Id` | NUMBER | |
| `Requester` | VARCHAR2(255) | |
| **Withholding** | | |
| `Withholding` | VARCHAR2(255) | |
| **Prepayment** | | |
| `Prepayment_Number` | VARCHAR2(100) | |
| `Prepayment_Line_Number` | NUMBER | |
| `Prepayment_Included_On_Inv_Flag` | VARCHAR2(5) | |
| **References** | | |
| `Reference_Key_Two` | VARCHAR2(255) | |
| `Product_Table` | VARCHAR2(255) | |
| **Audit** | | |
| `Created_By` | VARCHAR2(255) | |
| `Creation_Date` | TIMESTAMP(6) | |
| `Last_Updated_By` | VARCHAR2(255) | |
| `Last_Update_Date` | TIMESTAMP(6) | |

**PK:** None defined
**Indexes:** `Invoice_Id`, `Purchase_Order_Number`

---

## 3. DEMO_PO_HIST

Purchase order history from legacy/EBS systems. Mirrors `/fscmRestApi/resources/11.13.18.05/purchaseOrders`.

| Column | Type | Notes |
|--------|------|-------|
| **Identity** | | |
| `Po_Hist_Id` | NUMBER | Identity PK (auto-generated) |
| **Source tag** | | |
| `SourceSystem` | VARCHAR2(30) | NOT NULL - 'Legacy' or 'EBS' |
| **Core identifiers** | | |
| `POHeaderId` | NUMBER | |
| `OrderNumber` | VARCHAR2(200) | |
| `StatusCode` | VARCHAR2(200) | Code value |
| `Status` | VARCHAR2(200) | Display value |
| `Revision` | NUMBER | |
| `DocumentStyle` | VARCHAR2(200) | Purchase Order, Blanket, etc. |
| `PurchaseBasis` | VARCHAR2(200) | GOODS_AND_SERVICES, etc. |
| `Description` | VARCHAR2(4000) | |
| **Amounts / Currency** | | |
| `Ordered` | NUMBER | Line-level ordered amount |
| `OrderedAmountBeforeAdjustments` | NUMBER | |
| `CreditAmount` | NUMBER | |
| `DiscountAmount` | NUMBER | |
| `TotalTax` | NUMBER | |
| `Total` | NUMBER | Total incl tax |
| `RecoverableTax` | NUMBER | |
| `NonRecoverableTax` | NUMBER | |
| `RecoverableInclusiveTax` | NUMBER | |
| `NonRecoverableInclusiveTax` | NUMBER | |
| `CurrencyCode` | VARCHAR2(30) | |
| `Currency` | VARCHAR2(100) | Display name |
| `ConversionRateType` | VARCHAR2(30) | |
| `ConversionRate` | NUMBER | |
| `ConversionRateDate` | DATE | |
| **Dates** | | |
| `OrderDate` | DATE | |
| `CreationDate` | DATE | |
| `LastUpdateDate` | DATE | |
| `AcknowledgmentDueDate` | DATE | |
| **Business units / Legal entity** | | |
| `ProcurementBU` | VARCHAR2(200) | |
| `RequisitioningBU` | VARCHAR2(200) | |
| `BillToBU` | VARCHAR2(200) | |
| `SoldToLegalEntity` | VARCHAR2(200) | |
| **Supplier** | | |
| `Supplier` | VARCHAR2(400) | |
| `SupplierSite` | VARCHAR2(200) | |
| `SupplierContact` | VARCHAR2(200) | |
| `SupplierOrder` | VARCHAR2(200) | |
| `SupplierCommunicationMethod` | VARCHAR2(200) | |
| **Buyer / Requester** | | |
| `Buyer` | VARCHAR2(200) | |
| `BuyerDisplayName` | VARCHAR2(200) | |
| `RequesterId` | NUMBER | |
| `RequesterDisplayName` | VARCHAR2(200) | |
| **Locations** | | |
| `ShipToLocationCode` | VARCHAR2(200) | |
| `ShipToLocationAddress` | VARCHAR2(400) | |
| `BillToLocation` | VARCHAR2(200) | |
| `BillToLocationAddress` | VARCHAR2(400) | |
| **Payment / Terms** | | |
| `PaymentTerms` | VARCHAR2(200) | |
| **Shipping / Freight** | | |
| `Carrier` | VARCHAR2(200) | |
| `ModeOfTransport` | VARCHAR2(200) | |
| `ServiceLevel` | VARCHAR2(200) | |
| `ShippingMethod` | VARCHAR2(200) | |
| `FreightTerms` | VARCHAR2(200) | |
| `FOB` | VARCHAR2(200) | |
| **Contract / Source** | | |
| `MasterContractNumber` | VARCHAR2(200) | |
| `MasterContractType` | VARCHAR2(200) | |
| `SourceAgreement` | VARCHAR2(200) | |
| `SalesOrder` | VARCHAR2(200) | |
| `Negotiation` | VARCHAR2(200) | |
| `Requisition` | VARCHAR2(200) | |
| **Notes** | | |
| `NoteToSupplier` | VARCHAR2(4000) | |
| `NoteToReceiver` | VARCHAR2(4000) | |
| **References** | | |
| `ReferenceNumber` | VARCHAR2(200) | |
| `ImportSourceCode` | VARCHAR2(30) | |
| **Budget / Funds** | | |
| `FundsStatusCode` | VARCHAR2(200) | |
| `FundsStatus` | VARCHAR2(200) | |
| `BudgetControlEnabledFlag` | VARCHAR2(5) | |
| **Flags** | | |
| `RequiresSignatureFlag` | VARCHAR2(5) | |
| `PayOnReceiptFlag` | VARCHAR2(5) | |
| `ConfirmingOrderFlag` | VARCHAR2(5) | |
| `BuyerManagedTransportFlag` | VARCHAR2(5) | |
| `RetainageFlag` | VARCHAR2(5) | |
| `ProgressPaymentFlag` | VARCHAR2(5) | |
| `ConsignmentTermsFlag` | VARCHAR2(5) | |
| **Acknowledgment** | | |
| `RequiredAcknowledgment` | VARCHAR2(200) | |
| `AcknowledgeWithinDays` | NUMBER | |
| **Approver override** | | |
| `OverridingApprover` | VARCHAR2(200) | |
| **Tax / Fiscal** | | |
| `DefaultTaxationCountry` | VARCHAR2(200) | |
| `DocumentFiscalClassification` | VARCHAR2(200) | |
| `FirstPartyRegistrationNumber` | VARCHAR2(200) | |
| `ThirdPartyRegistrationNumber` | VARCHAR2(200) | |
| **Audit** | | |
| `CreatedBy` | VARCHAR2(255) | |
| `LastUpdatedBy` | VARCHAR2(255) | |

**PK:** `Po_Hist_Id` (identity)
**Indexes:** `Supplier`, `Status`, `OrderDate`, `ProcurementBU`

---

## 4. DEMO_ASSIGNMENT_HIST

HR assignment history from legacy/EBS systems. Flattened from `/hcmRestApi/resources/11.13.18.05/publicWorkers` + `child/assignments`.

| Column | Type | Notes |
|--------|------|-------|
| **Identity** | | |
| `Assignment_Hist_Id` | NUMBER | Identity PK (auto-generated) |
| **Source tag** | | |
| `SourceSystem` | VARCHAR2(30) | NOT NULL - 'Legacy' or 'EBS' |
| **Person-level (from publicWorkers)** | | |
| `PersonId` | NUMBER | |
| `PersonNumber` | VARCHAR2(100) | |
| `DisplayName` | VARCHAR2(400) | |
| `ListName` | VARCHAR2(400) | "Last, First" |
| `OrderName` | VARCHAR2(400) | "Last First" |
| `LastName` | VARCHAR2(200) | |
| `FirstName` | VARCHAR2(200) | |
| `MiddleNames` | VARCHAR2(200) | |
| `Title` | VARCHAR2(100) | |
| `Suffix` | VARCHAR2(100) | |
| `Honors` | VARCHAR2(200) | |
| `KnownAs` | VARCHAR2(200) | |
| `WorkEmail` | VARCHAR2(400) | |
| `Username` | VARCHAR2(400) | |
| **Assignment identifiers** | | |
| `AssignmentId` | NUMBER | |
| `AssignmentNumber` | VARCHAR2(100) | |
| `AssignmentName` | VARCHAR2(200) | |
| **Assignment status / action** | | |
| `AssignmentStatus` | VARCHAR2(100) | ACTIVE / INACTIVE |
| `ActionCode` | VARCHAR2(100) | HIRE / PROMOTION / TRANSFER / TERMINATION |
| **Dates** | | |
| `EffectiveStartDate` | DATE | |
| `EffectiveEndDate` | DATE | |
| `StartDate` | DATE | Assignment start date |
| **Organization** | | |
| `LegalEmployerName` | VARCHAR2(200) | |
| `BusinessUnit` | VARCHAR2(200) | |
| `DepartmentName` | VARCHAR2(200) | |
| `JobCode` | VARCHAR2(100) | |
| `JobName` | VARCHAR2(200) | |
| `PositionCode` | VARCHAR2(100) | |
| `PositionName` | VARCHAR2(200) | |
| `GradeCode` | VARCHAR2(100) | |
| `GradeName` | VARCHAR2(200) | |
| `ManagerName` | VARCHAR2(400) | |
| **Location** | | |
| `LocationCode` | VARCHAR2(200) | |
| `LocationName` | VARCHAR2(200) | |
| `LocationAddressLine1` - `Line4` | VARCHAR2(400) | 4 address lines |
| `LocationRegion1` - `Region3` | VARCHAR2(200) | 3 region fields |
| `LocationTownOrCity` | VARCHAR2(200) | |
| `LocationPostalCode` | VARCHAR2(100) | |
| `LocationCountry` | VARCHAR2(100) | |
| `LocationTimezoneCode` | VARCHAR2(100) | |
| `LocationSingleLineAddress` | VARCHAR2(4000) | |
| **Internal workspace** | | |
| `InternalBuilding` | VARCHAR2(200) | |
| `InternalFloor` | VARCHAR2(200) | |
| `InternalOfficeNumber` | VARCHAR2(200) | |
| `InternalMailstop` | VARCHAR2(200) | |
| **Worker classification** | | |
| `AssignmentCategory` | VARCHAR2(100) | FR=Full-time Regular, PT=Part-time |
| `WorkerType` | VARCHAR2(30) | E=Employee, C=Contingent Worker |
| `FullPartTime` | VARCHAR2(30) | |
| `WorkAtHomeFlag` | VARCHAR2(5) | |
| `PrimaryFlag` | VARCHAR2(5) | |
| `PrimaryAssignmentFlag` | VARCHAR2(5) | |
| **Length of service** | | |
| `LengthOfServiceYears` | NUMBER | |
| `LengthOfServiceMonths` | NUMBER | |
| `LengthOfServiceDays` | NUMBER | |

**PK:** `Assignment_Hist_Id` (identity)
**Indexes:** `UPPER(DisplayName)`, `DepartmentName`, `AssignmentStatus`, `EffectiveStartDate`, `PersonNumber`

---

## 5. DEMO_ABSENCE_HIST

Absence/leave history from legacy/EBS systems. Mirrors `/hcmRestApi/resources/11.13.18.05/absences`.

| Column | Type | Notes |
|--------|------|-------|
| **Identity** | | |
| `Absence_Hist_Id` | NUMBER | Identity PK (auto-generated) |
| **Source tag** | | |
| `SourceSystem` | VARCHAR2(30) | NOT NULL - 'Legacy' or 'EBS' |
| **Core identifiers** | | |
| `PersonAbsenceEntryId` | NUMBER | |
| `PersonId` | NUMBER | |
| `PersonNumber` | VARCHAR2(100) | |
| `DisplayName` | VARCHAR2(400) | |
| **Absence type / reason** | | |
| `AbsenceTypeId` | NUMBER | |
| `AbsenceType` | VARCHAR2(400) | |
| `AbsenceTypeReasonId` | NUMBER | |
| `AbsenceReason` | VARCHAR2(400) | |
| `AbsencePatternCd` | VARCHAR2(100) | GENERIC, etc. |
| **Dates** | | |
| `StartDate` | DATE | |
| `EndDate` | DATE | |
| `StartTime` | VARCHAR2(10) | |
| `EndTime` | VARCHAR2(10) | |
| `StartDateDuration` | NUMBER | |
| `EndDateDuration` | NUMBER | |
| `ConditionStartDate` | DATE | |
| `ConfirmedDate` | DATE | |
| `NotificationDate` | DATE | |
| `EstablishmentDate` | DATE | |
| `SubmittedDate` | DATE | |
| `PlannedEndDate` | DATE | |
| **Duration** | | |
| `Duration` | NUMBER | |
| `FormattedDuration` | VARCHAR2(200) | "2 Days" |
| `UnitOfMeasure` | VARCHAR2(30) | Code: D, H |
| `UnitOfMeasureMeaning` | VARCHAR2(200) | Display: Days, Hours |
| **Status** | | |
| `AbsenceStatusCd` | VARCHAR2(100) | |
| `ApprovalStatusCd` | VARCHAR2(100) | |
| `AbsenceDispStatus` | VARCHAR2(100) | Code: COMPLETED |
| `AbsenceDispStatusMeaning` | VARCHAR2(400) | Display: Completed |
| `ProcessingStatus` | VARCHAR2(30) | |
| **Approval** | | |
| `ApprovalDatetime` | TIMESTAMP(6) | |
| `AuthStatusUpdateDate` | DATE | |
| **Employer / Legal** | | |
| `Employer` | VARCHAR2(400) | |
| `LegalEntityId` | NUMBER | |
| `LegislationCode` | VARCHAR2(30) | |
| `LegislativeDataGroupId` | NUMBER | |
| **Assignment** | | |
| `AssignmentId` | NUMBER | |
| `AssignmentNumber` | VARCHAR2(100) | |
| `AssignmentName` | VARCHAR2(200) | |
| **Agreement** | | |
| `AgreementId` | NUMBER | |
| `AgreementName` | VARCHAR2(200) | |
| `PaymentDetail` | VARCHAR2(400) | |
| **Flags** | | |
| `AbsenceEntryBasicFlag` | VARCHAR2(5) | |
| `OpenEndedFlag` | VARCHAR2(5) | |
| `SingleDayFlag` | VARCHAR2(5) | |
| `Overridden` | VARCHAR2(5) | |
| `LateNotifyFlag` | VARCHAR2(5) | |
| `AbsenceUpdatableFlag` | VARCHAR2(5) | |
| **Misc** | | |
| `Comments` | VARCHAR2(4000) | |
| `Source` | VARCHAR2(200) | |
| `Frequency` | VARCHAR2(200) | |
| `UserMode` | VARCHAR2(30) | |
| `ProjectId` | NUMBER | |
| **Audit** | | |
| `CreatedBy` | VARCHAR2(255) | |
| `CreationDate` | TIMESTAMP(6) | |
| `LastUpdatedBy` | VARCHAR2(255) | |
| `LastUpdateDate` | TIMESTAMP(6) | |

**PK:** `Absence_Hist_Id` (identity)
**Indexes:** `PersonNumber`, `AbsenceType`, `StartDate`, `AbsenceDispStatus`

---

## 6. DEMO_AR_INVOICES_HIST

Receivables (AR) invoice history from legacy/EBS systems. Mirrors `/fscmRestApi/resources/11.13.18.05/receivablesInvoices`.

| Column | Type | Notes |
|--------|------|-------|
| **Source tag** | | |
| `SourceSystem` | VARCHAR2(30) | NOT NULL - 'Legacy' or 'EBS' |
| **Core identifiers** | | |
| `CustomerTransactionId` | NUMBER | NOT NULL |
| `TransactionNumber` | VARCHAR2(200) | |
| `TransactionDate` | DATE | |
| `TransactionSource` | VARCHAR2(200) | |
| `TransactionType` | VARCHAR2(200) | |
| `BusinessUnit` | VARCHAR2(200) | |
| `InvoiceStatus` | VARCHAR2(100) | |
| `InvoiceCurrencyCode` | VARCHAR2(30) | |
| **Amounts** | | |
| `EnteredAmount` | NUMBER | |
| `FreightAmount` | NUMBER | |
| `InvoiceBalanceAmount` | NUMBER | |
| **Dates** | | |
| `AccountingDate` | DATE | |
| `BillingDate` | DATE | |
| `DueDate` | DATE | |
| `ShipDate` | DATE | |
| `PurchaseOrderDate` | DATE | |
| **Bill-To** | | |
| `BillToCustomerName` | VARCHAR2(400) | |
| `BillToCustomerNumber` | VARCHAR2(100) | |
| `BillToPartyId` | NUMBER | |
| `BillToSite` | VARCHAR2(200) | |
| `BillToContact` | VARCHAR2(400) | |
| **Ship-To** | | |
| `ShipToCustomerName` | VARCHAR2(400) | |
| `ShipToCustomerNumber` | VARCHAR2(100) | |
| `ShipToSite` | VARCHAR2(200) | |
| `ShipToContact` | VARCHAR2(400) | |
| **Paying Customer** | | |
| `PayingCustomerAccount` | VARCHAR2(200) | |
| `PayingCustomerName` | VARCHAR2(400) | |
| `PayingCustomerSite` | VARCHAR2(200) | |
| **Sold-To** | | |
| `SoldToPartyNumber` | VARCHAR2(100) | |
| **Payment & Terms** | | |
| `PaymentTerms` | VARCHAR2(200) | |
| `ReceiptMethod` | VARCHAR2(200) | |
| `InvoicingRule` | VARCHAR2(200) | |
| `BankAccountNumber` | VARCHAR2(200) | |
| `Prepayment` | VARCHAR2(100) | |
| `StructuredPaymentReference` | VARCHAR2(200) | |
| **Credit Card** | | |
| `CardHolderFirstName` | VARCHAR2(200) | |
| `CardHolderLastName` | VARCHAR2(200) | |
| `CreditCardTokenNumber` | VARCHAR2(200) | |
| `CreditCardIssuerCode` | VARCHAR2(100) | |
| `CreditCardExpirationDate` | VARCHAR2(100) | |
| `CreditCardAuthorizationRequestIdentifier` | VARCHAR2(200) | |
| `CreditCardVoiceAuthorizationCode` | VARCHAR2(200) | |
| `CreditCardErrorCode` | VARCHAR2(100) | |
| `CreditCardErrorText` | VARCHAR2(2000) | |
| **Conversion / Currency** | | |
| `ConversionDate` | DATE | |
| `ConversionRate` | NUMBER | |
| `ConversionRateType` | VARCHAR2(100) | |
| **Sales & Shipping** | | |
| `SalesPersonNumber` | VARCHAR2(100) | |
| `Carrier` | VARCHAR2(200) | |
| `ShippingReference` | VARCHAR2(200) | |
| **Purchase Order** | | |
| `PurchaseOrder` | VARCHAR2(200) | |
| `PurchaseOrderRevision` | VARCHAR2(100) | |
| **References & Notes** | | |
| `CrossReference` | VARCHAR2(200) | |
| `Comments` | VARCHAR2(4000) | |
| `InternalNotes` | VARCHAR2(4000) | |
| `SpecialInstructions` | VARCHAR2(4000) | |
| `Email` | VARCHAR2(400) | |
| **Print** | | |
| `InvoicePrinted` | VARCHAR2(30) | |
| `PrintOption` | VARCHAR2(100) | |
| `LastPrintDate` | DATE | |
| `OriginalPrintDate` | DATE | |
| **Legal & Tax** | | |
| `LegalEntityIdentifier` | VARCHAR2(200) | |
| `DefaultTaxationCountry` | VARCHAR2(100) | |
| `FirstPartyRegistrationNumber` | VARCHAR2(200) | |
| `ThirdPartyRegistrationNumber` | VARCHAR2(200) | |
| `DocumentFiscalClassification` | VARCHAR2(200) | |
| **Miscellaneous** | | |
| `DocumentNumber` | NUMBER | |
| `RemitToAddress` | VARCHAR2(2000) | |
| `DeliveryMethod` | VARCHAR2(100) | |
| `Intercompany` | VARCHAR2(100) | |
| `AllowCompletion` | VARCHAR2(10) | |
| `ControlCompletionReason` | VARCHAR2(2000) | |
| **Audit** | | |
| `CreatedBy` | VARCHAR2(200) | |
| `CreationDate` | TIMESTAMP | |
| `LastUpdatedBy` | VARCHAR2(200) | |
| `LastUpdateDate` | TIMESTAMP | |

**PK:** `(SourceSystem, CustomerTransactionId)`
**Indexes:** `TransactionDate`, `BillToCustomerNumber`, `BusinessUnit`, `InvoiceStatus`

---

## Folder Structure

```
Historical Data Demo/
├── README.md
├── ap-invoices/           ── AP Invoices (headers + lines)
│   ├── demo_ap_invoices_hist.sql          DDL - invoice headers
│   ├── demo_ap_invoice_line_hist.sql      DDL - invoice lines
│   ├── demo_ap_invoices_hist_data.sql     Sample data - headers
│   ├── demo_ap_invoice_line_hist_data.sql Sample data - lines
│   ├── invoice_pkg.sql / .plb             PL/SQL REST package
│   ├── invoices.json / invoicelines.json  REST endpoint reference
│   └── f121_page_3.sql / f121_page_3001.sql  APEX pages
├── purchase-orders/       ── Purchase Orders
│   ├── demo_po_hist_ddl.sql               DDL
│   ├── demo_po_hist_data.sql              Sample data
│   ├── po_pkg.sql / .plb                  PL/SQL REST package
│   ├── po_page_query.sql / po_kpi_query.sql  Queries
│   ├── purchaseorders.json                REST endpoint reference
│   └── f121_page_4001.sql                 APEX page
├── assignments/           ── HR Assignments
│   ├── demo_assignment_hist_ddl.sql       DDL
│   ├── demo_assignment_hist_data.sql      Sample data
│   ├── assignment_pkg.sql / .plb          PL/SQL REST package
│   ├── assignment_page_query.sql / assignment_kpi_query.sql
│   ├── assignments.json                   REST endpoint reference
│   └── f121_page_5001.sql                 APEX page
├── absences/              ── Absences
│   ├── demo_absence_hist_ddl.sql          DDL
│   ├── demo_absence_hist_data.sql         Sample data
│   ├── absence_pkg.sql / .plb             PL/SQL REST package
│   ├── absence_page_query.sql / absence_kpi_query.sql
│   └── absences.json                      REST endpoint reference
└── receivables/           ── Receivables Invoices (AR)
    ├── demo_ar_invoices_hist.sql          DDL
    ├── receivables_pkg.sql / .plb         PL/SQL REST package
```

## Per-Folder Artifacts

| File Pattern | Purpose |
|------|---------|
| `demo_*_ddl.sql` / `demo_*_hist.sql` | Table DDL - mirrors full Fusion REST endpoint |
| `demo_*_data.sql` | INSERT scripts with sample legacy/EBS data |
| `*_pkg.sql` / `*_pkg.plb` | PL/SQL package spec/body - fetches Fusion data via REST |
| `*_page_query.sql` | UNION ALL queries combining Fusion + legacy data |
| `*_kpi_query.sql` | KPI card aggregation queries (Fusion / Legacy / EBS / Total) |
| `f121_page_*.sql` | APEX page exports |
| `*.json` | Raw REST endpoint output used as column reference |

---

## Remaining Subject Areas (from SOW)

Not yet built:
- Check history
- Prior year(s) Benefit enrollments
- Time history
- Payroll and W2 history
- Performance review history
- Learning history
