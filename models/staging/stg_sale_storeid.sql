WITH stg_sale_storeid_source AS (
    SELECT *
    FROM `adventureworks2019.Sales.StoreID`
)

,stg_sale_storeid_cast_rename AS (
    SELECT
        CAST(StoreID as integer) AS store_key
        ,CAST(Name as string) AS store_name
    FROM stg_sale_storeid_source
)
,stg_sale_storeid_add_undefined_record AS (
    SELECT
        store_key
        ,store_name
    FROM stg_sale_storeid_cast_rename
    UNION ALL
    SELECT
        0 AS store_key
        ,'Undefined' AS store_name
)
SELECT *
FROM stg_sale_storeid_add_undefined_record