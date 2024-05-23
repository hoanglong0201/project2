WITH stg_production_subpc_source AS (
    SELECT *
    FROM `adventureworks2019.Production.ProductSubcategory`
)

,stg_production_subpc_cast_rename AS (
    SELECT
        CAST(ProductSubcategoryID AS integer) AS product_subcategory_key
        ,CAST(ProductCategoryID AS integer) AS product_category_key
        ,CAST(Name as string) AS product_subcategory_name
    FROM stg_production_subpc_source
)

,stg_product_subpc__add_undefined_record AS (
    SELECT
        product_subcategory_key
        ,product_category_key
        ,product_subcategory_name
    FROM stg_production_subpc_cast_rename
    UNION ALL
    SELECT
        0 AS product_subcategory_key
        ,0 AS product_category_key
        ,'Undefined' AS product_subcategory_name
)
SELECT 
    product_subcategory_key
    ,product_category_key
    ,product_subcategory_name
FROM stg_product_subpc__add_undefined_record