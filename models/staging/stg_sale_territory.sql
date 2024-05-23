WITH stg_sale_territory_source AS (
    SELECT *
    FROM `adventureworks2019.Sales.SalesTerritory`
)

, stg_sale_territory_cast_rename AS (
    SELECT 
        CAST(TerritoryID AS integer) AS territory_key
        ,CAST(Name AS string) AS territory_name
        ,CAST(CountryRegionCode AS string) AS country_region_key
        ,CAST(stg_sale_territory_source.Group AS string) AS group_name
    FROM stg_sale_territory_source
)

SELECT *
FROM stg_sale_territory_cast_rename