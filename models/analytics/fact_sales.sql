WITH fact_sales AS (
SELECT
    sales_detail.sales_order_line_key
    ,sales_detail.sales_order_key
    ,sales_detail.product_key
    ,sales_header.customer_key
    ,sales_header.territory_key as sales_territory_key
    ,sales_header.person_key as sales_person_key
    ,sales_header.order_date_key
    ,sales_header.sale_order_status
    ,sales_header.bill_to_address_key
    ,sales_header.ship_to_address_key
    ,sales_header.ship_method_key
    ,sales_detail.order_quantity
    ,sales_detail.unit_price
    ,sales_detail.unit_price_discount
    ,sales_header.tax_amount
    ,sales_detail.gross_amount
    ,sales_header.sub_total
    ,sales_header.total_due
FROM `project-2-unigap.adventurework_dw.stg_sales_order_detail` AS sales_detail
LEFT JOIN `project-2-unigap.adventurework_dw.stg_sales_order_header` AS sales_header
ON sales_detail.sales_order_key = sales_header.sales_order_key
)
SELECT *
FROM fact_sales