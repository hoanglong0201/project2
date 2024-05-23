WITH dim_store__source AS (
    SELECT *
    FROM `adventureworks2019.Sales.Store`
)

,dim_store_cast_rename AS (
    SELECT 
        cast(BusinessEntityID AS integer) AS store_key
        ,cast(Name AS string) AS store_name
        ,cast(SalesPersonID AS integer) AS store_person_key
    FROM dim_store__source
)
,dim_store__add_undefined_record AS (
    SELECT
        store_key
        ,store_name
        ,store_person_key
    FROM dim_store_cast_rename
    
    UNION ALL
    SELECT
        0 AS store_key
        ,'Undefined' AS store_name
        ,0 AS store_person_key
)
SELECT
    store_key
    ,store_name
    ,store_person_key
FROM dim_store__add_undefined_record
