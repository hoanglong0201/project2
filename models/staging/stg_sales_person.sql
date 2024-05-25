WITH stg_sales_person_source AS (
    SELECT *
    FROM `adventureworks2019.Sales.SalesPerson`
)

,stg_sales_person_handler_null AS (
    SELECT
        BusinessEntityID
        ,NULLIF(TerritoryID,'NULL') AS TerritoryID
        ,Bonus
        ,CommissionPct
    FROM stg_sales_person_source
)

,stg_sales_person_cast_rename AS (
    SELECT
        CAST(BusinessEntityID as integer) AS person_key
        ,CAST(TerritoryID as integer) AS territory_key
        ,CAST(Bonus as decimal) AS bonus
        ,CAST(CommissionPct as decimal) AS commission
    FROM stg_sales_person_handler_null
)
,stg_sales_person_add_undefined_record AS (
    SELECT
        person_key
        ,territory_key
        ,bonus
        ,commission
    FROM stg_sales_person_cast_rename
    UNION ALL
    SELECT
        0 AS person_key
        ,0 AS territory_key
        ,0.00 AS bonus
        ,0.00 AS commission

)
SELECT *
FROM stg_sales_person_add_undefined_record