WITH stg_product_model_source AS (
    SELECT * 
    FROM `adventureworks2019.Production.ProductModel`
)


,stg_product_model_cast_rename AS (
    SELECT
        CAST(ProductModelID AS integer) AS product_model_key
        ,CAST(Name AS string) AS product_model_name
    FROM stg_product_model_source
)
,stg_product_model__add_undefined_record AS (
    SELECT
        product_model_key
        ,product_model_name
    FROM stg_product_model_cast_rename
    UNION ALL
    SELECT
        0 AS product_model_key
        ,'Undefined' AS product_model_name
)
SELECT
    product_model_key
    ,product_model_name
FROM stg_product_model__add_undefined_record