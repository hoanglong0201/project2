WITH dim_sales_territory AS (
    SELECT 
        sales_territory.territory_key
        ,sales_territory.territory_name
        ,sales_territory.country_region_key
        ,country_region.country_region_name
        ,sales_territory.group_name
    FROM `project-2-unigap.adventurework_dw.stg_sale_territory` AS sales_territory
    LEFT JOIN `project-2-unigap.adventurework_dw.stg_person_countryregion` AS country_region
    ON sales_territory.country_region_key = country_region.country_region_key
)

SELECT *
FROM dim_sales_territory