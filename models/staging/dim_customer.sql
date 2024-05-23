SELECT
    stg_sales_customer.customer_key
    ,full_name AS customer_name
    ,is_reseller
    ,reseller_store_key
    ,store_name AS reseller_store_name
    ,stg_sales_customer.territory_key AS customer_territory_key
    ,territory_name AS customer_territory_name
    ,stg_sale_territory.country_region_key AS customer_country_region_key
    ,country_region_name AS customer_country_region_name
    ,person_title AS customer_person_title
    ,first_name
    ,middle_name
    ,last_name
FROM `project-2-unigap.adventurework_dw.stg_sales_customer` as stg_sales_customer
JOIN `project-2-unigap.adventurework_dw.stg_dim_person` as stg_dim_person
ON stg_sales_customer.person_key = stg_dim_person.person_key
JOIN `project-2-unigap.adventurework_dw.stg_sale_storeid` as stg_sale_storeid
ON stg_sales_customer.reseller_store_key = stg_sale_storeid.store_key
JOIN `project-2-unigap.adventurework_dw.stg_sale_territory` as stg_sale_territory
ON stg_sales_customer.territory_key = stg_sale_territory.territory_key
JOIN `project-2-unigap.adventurework_dw.stg_person_countryregion` as stg_person_countryregion
ON stg_sale_territory.country_region_key = stg_person_countryregion.country_region_key