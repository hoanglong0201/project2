WITH stg_sales_order_detail_source AS (
    SELECT *
    FROM `adventureworks2019.Sales.SalesOrderDetail`
)

,stg_sales_order_detail_cast_rename AS(
    SELECT
        CAST(SalesOrderID as integer) AS sales_order_key
        ,CAST(SalesOrderDetailID as integer) AS sales_order_line_key
        ,CAST(OrderQty as integer) AS order_quantity
        ,CAST(ProductID as integer) AS product_key
        ,CAST(UnitPrice as decimal) AS unit_price
        ,CAST(UnitPriceDiscount as decimal) AS unit_price_discount
        ,CAST(LineTotal as decimal) AS gross_amount
    FROM stg_sales_order_detail_source
)
,stg_sales_order_detail_add_undefined_record AS (
    SELECT
        sales_order_key
        ,sales_order_line_key
        ,order_quantity
        ,product_key
        ,unit_price
        ,unit_price_discount
        ,gross_amount
    FROM stg_sales_order_detail_cast_rename
    UNION ALL
    SELECT
        0 AS sales_order_key
        ,0 AS sales_order_line_key
        ,0 AS order_quantity
        ,0 AS product_key
        ,0.00 AS unit_price
        ,0.00 AS unit_price_discount
        ,0.00 AS gross_amount
)
SELECT *
FROM stg_sales_order_detail_add_undefined_record