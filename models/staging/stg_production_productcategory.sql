WITH stg_production_pc_source AS (
    SELECT *
    FROM `adventureworks2019.Production.ProductCategory`
)

,stg_production_pc_cast_rename AS (
    SELECT
        CAST(ProductCategoryID AS integer) AS product_category_key
        ,CAST(Name as string) AS product_category_name
    FROM stg_production_pc_source
)

,stg_product_pc__add_undefined_record AS(
    SELECT
        product_category_key
        ,product_category_name
    FROM stg_production_pc_cast_rename
    UNION ALL
    SELECT
        0 AS product_category_key
        ,'Undefined' as product_category_name
)

SELECT
    product_category_key
    ,product_category_name
FROM stg_product_pc__add_undefined_record