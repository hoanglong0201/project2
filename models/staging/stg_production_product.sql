WITH stg_production_product_source AS (
    SELECT *
    FROM `adventureworks2019.Production.Product`
)
,stg_product_handler_null AS (
    SELECT 
        ProductID
        ,NULLIF(Name,'NULL') AS Name
        ,NULLIF(ProductNumber,'NULL') AS ProductNumber
        ,NULLIF(Color,'NULL') AS Color
        ,MakeFlag
        ,FinishedGoodsFlag
        ,SafetyStockLevel
        ,StandardCost
        ,ListPrice
        ,NULLIF(Size,'NULL') AS Size
        ,NULLIF(SizeUnitMeasureCode,'NULL') AS SizeUnitMeasureCode
        ,NULLIF(WeightUnitMeasureCode,'NULL') AS WeightUnitMeasureCode
        ,NULLIF(Weight,'NULL') AS Weight
        ,NULLIF(ProductSubcategoryID,'NULL') AS ProductSubcategoryID
        ,NULLIF(ProductModelID,'NULL') AS ProductModelID
    FROM stg_production_product_source
)
,stg_production_product_cast_rename AS (
    SELECT 
        CAST(ProductID as integer) AS product_key
        ,CAST(Name as string) AS product_name
        ,CAST(ProductNumber as string) AS product_number
        ,CAST(MakeFlag as tinyint) AS make_flag
        ,CAST(FinishedGoodsFlag as tinyint) AS finished_goods_flag
        ,CAST(Color as string) AS color
        ,CAST(SafetyStockLevel AS bigint) AS safety_stock_level
        ,CAST(StandardCost as decimal) AS standard_cost
        ,CAST(ListPrice as decimal) AS list_price
        ,CAST(Size as string) AS size
        ,CAST(SizeUnitMeasureCode as string) AS size_unit_measure_key
        ,CAST(WeightUnitMeasureCode as string) AS weight_unit_measure_key
        ,CAST(Weight as decimal) as weight
        ,CAST(ProductSubcategoryID as integer) AS product_subcategory_key
        ,CAST(ProductModelID as integer) as product_model_key
    FROM stg_product_handler_null
)

,stg_product__add_undefined_record AS (
    SELECT
        product_key
        ,product_name
        ,product_number
        ,make_flag
        ,finished_goods_flag
        ,color
        ,safety_stock_level
        ,standard_cost
        ,list_price
        ,size
        ,size_unit_measure_key
        ,weight_unit_measure_key
        ,weight
        ,product_subcategory_key
        ,product_model_key
    FROM stg_production_product_cast_rename

    UNION ALL
    SELECT
        0 AS product_key
        ,'Undefined' AS product_name
        ,'Undefined' AS product_number
        ,0 AS make_flag
        ,1 AS finished_goods_flag
        ,'Undefined' as color
        ,0 as safety_stock_level
        ,0 as standard_cost
        ,0 as list_price
        ,'Undefined' as size
        ,'Undefined' as size_unit_measure_key
        ,'Undefined' as weight_unit_measure_key
        ,0 as weight
        ,0 as product_subcategory_key
        ,0 as product_model_key
)

SELECT *
FROM stg_product__add_undefined_record