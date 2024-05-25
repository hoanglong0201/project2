With stg_dim_customer_source AS (
    SELECT *
    FROM `adventureworks2019.Sales.Customer`
)

,stg_dim_customer_handler_null AS (
    SELECT
        CustomerID
        ,NULLIF(PersonID,'NULL') AS PersonID
        ,NULLIF(StoreID,'NULL') AS StoreID
        ,TerritoryID
    FROM stg_dim_customer_source
)
,stg_dim_customer_handler_reseller AS (
    SELECT
        CustomerID
        ,PersonID
        ,StoreID
        ,TerritoryID
        ,CASE
            WHEN StoreID IS NOT NULL THEN True
            ELSE False
            END AS is_reseller
        ,CASE
            WHEN StoreID IS NOT NULL THEN
            StoreID
            ELSE null
            END AS reseller_store_key
    FROM stg_dim_customer_handler_null
)
,stg_dim_customer_cast_rename AS (
    SELECT
        CAST(CustomerID as integer) AS customer_key
        ,CAST(PersonID as integer) AS person_key
        ,CAST(StoreID as integer) AS store_key
        ,CAST(TerritoryID as integer) AS territory_key
        ,is_reseller
        ,CAST(reseller_store_key as integer) AS reseller_store_key
        
    FROM stg_dim_customer_handler_reseller
)
,stg_dim_customer_add_undefined_record AS (
    SELECT
        customer_key
        ,person_key
        ,store_key
        ,territory_key
        ,is_reseller
        ,reseller_store_key
    FROM stg_dim_customer_cast_rename
    UNION ALL
    SELECT
        0 AS customer_key
        ,0 AS person_key
        ,0 AS store_key
        ,0 AS territory_key
        ,False AS is_reseller
        ,0 AS reseller_store_key
)
SELECT *
FROM stg_dim_customer_add_undefined_record
