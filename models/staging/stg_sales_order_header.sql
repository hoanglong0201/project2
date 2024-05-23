WITH stg_sales_order_header_source AS (
    SELECT *
    FROM `adventureworks2019.Sales.SalesOrderHeader`
)
,stg_sales_order_header_handler_null AS (
    SELECT
        SalesOrderID
        ,OrderDate
        ,CustomerID
        ,TerritoryID
        ,NULLIF(SalesPersonID,'NULL') AS SalesPersonID
        ,Status
        ,BillToAddressID
        ,ShipToAddressID
        ,ShipMethodID
        ,SubTotal
        ,TaxAmt
        ,TotalDue
    FROM stg_sales_order_header_source
)
,stg_sales_order_header_cast_rename AS (
    SELECT
        CAST(SalesOrderID as integer) AS sales_order_key
        ,CAST(OrderDate as datetime) AS order_date_key
        ,CAST(CustomerID as integer) AS customer_key
        ,CAST(TerritoryID as integer) AS territory_key
        ,CAST(SalesPersonID as integer) AS person_key
        ,CAST(Status as tinyint) AS sale_order_status
        ,CAST(BillToAddressID as integer) AS bill_to_address_key
        ,CAST(ShipToAddressID as integer) AS ship_to_address_key
        ,CAST(ShipMethodID as integer) AS ship_method_key
        ,CAST(SubTotal as decimal) AS sub_total
        ,CAST(TaxAmt as decimal) AS tax_amount
        ,CAST(TotalDue as decimal) AS total_due
    FROM stg_sales_order_header_handler_null
)
SELECT *
FROM stg_sales_order_header_cast_rename 