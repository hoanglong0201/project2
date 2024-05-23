SELECT
    sales_order_line_key
    ,sales_detail.sales_order_key
    ,product_key
    ,customer_key
    ,territory_key as sales_territory_key
    ,person_key as sales_person_key
    ,order_date_key
    ,sale_order_status
    ,bill_to_address_key
    ,ship_to_address_key
    ,ship_method_key
    ,order_quantity
    ,unit_price
    ,unit_price_discount
    ,tax_amount
    ,gross_amount
    ,sub_total
    ,total_due
FROM `project-2-unigap.adventurework_dw.stg_sales_order_detail` AS sales_detail
LEFT JOIN `project-2-unigap.adventurework_dw.stg_sales_order_header` AS sales_header
ON sales_detail.sales_order_key = sales_header.sales_order_key