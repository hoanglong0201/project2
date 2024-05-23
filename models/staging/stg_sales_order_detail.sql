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

SELECT *
FROM stg_sales_order_detail_cast_rename