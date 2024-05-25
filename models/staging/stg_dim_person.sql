WITH stg_dim_person_source AS (
    SELECT *
    FROM `adventureworks2019.Person.Person`
)
, stg_dim_person_handler_null AS (
    SELECT
        BusinessEntityID
        ,NULLIF(Title,'NULL') as Title
        ,FirstName
        ,NULLIF(MiddleName,'NULL') as MiddleName
        ,LastName
      FROM stg_dim_person_source
)

,stg_dim_person_cast_rename AS (
    SELECT 
        CAST(BusinessEntityID AS integer) person_key
        ,CAST(Title AS string) AS person_title
        ,CAST(FirstName AS string) AS first_name
        ,CAST(MiddleName AS string) AS middle_name
        ,CAST(LastName AS string) AS last_name
    FROM stg_dim_person_handler_null
)
,stg_dim_person_add_undefine_record AS (
    SELECT
        person_key
        ,person_title
        ,first_name
        ,middle_name
        ,last_name
        ,CONCAT(first_name,middle_name,last_name) as full_name
    FROM stg_dim_person_cast_rename
    UNION ALL
    SELECT
        0 AS person_key
        ,'Undefined' AS person_title
        ,'Undefined' AS first_name
        ,'Undefined' AS middle_name
        ,'Undefined' AS last_name
        ,'Undefined' AS full_name
)
SELECT *
FROM stg_dim_person_add_undefine_record