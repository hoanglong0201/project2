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

SELECT *
FROM stg_dim_customer_cast_rename
