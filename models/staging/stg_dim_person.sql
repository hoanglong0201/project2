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
        ,CONCAT(FirstName,' ', MiddleName,' ',LastName) as full_name
    FROM stg_dim_person_handler_null
)

SELECT *
FROM stg_dim_person_cast_rename