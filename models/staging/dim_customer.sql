WITH dim_customer AS (
SELECT
    stg_sales_customer.customer_key
    ,stg_dim_person.full_name AS customer_name
    ,stg_sales_customer.is_reseller
    ,stg_sales_customer.reseller_store_key
    ,stg_sale_storeid.store_name AS reseller_store_name
    ,stg_sales_customer.territory_key AS customer_territory_key
    ,stg_sale_territory.territory_name AS customer_territory_name
    ,stg_sale_territory.country_region_key AS customer_country_region_key
    ,stg_person_countryregion.country_region_name AS customer_country_region_name
    ,stg_dim_person.person_title AS customer_person_title
    ,stg_dim_person.first_name
    ,stg_dim_person.middle_name
    ,stg_dim_person.last_name
FROM `project-2-unigap.adventurework_dw.stg_sales_customer` as stg_sales_customer
LEFT JOIN `project-2-unigap.adventurework_dw.stg_dim_person` as stg_dim_person
ON stg_sales_customer.person_key = stg_dim_person.person_key
LEFT JOIN `project-2-unigap.adventurework_dw.stg_sale_storeid` as stg_sale_storeid
ON stg_sales_customer.reseller_store_key = stg_sale_storeid.store_key
LEFT JOIN `project-2-unigap.adventurework_dw.stg_sale_territory` as stg_sale_territory
ON stg_sales_customer.territory_key = stg_sale_territory.territory_key
LEFT JOIN `project-2-unigap.adventurework_dw.stg_person_countryregion` as stg_person_countryregion
ON stg_sale_territory.country_region_key = stg_person_countryregion.country_region_key
)