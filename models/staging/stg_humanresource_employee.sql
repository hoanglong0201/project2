WITh stg_humanresource_employee_source AS (
    SELECT *
    FROM `adventureworks2019.HumanResources.Employee`
)

,stg_humanresource_employee_cast_rename AS (
    SELECT
        CAST(BusinessEntityID as integer) AS person_key
        ,CAST(JobTitle as string) AS job_title
        ,CAST(Gender as string) as gender
    FROM stg_humanresource_employee_source
)
,stg_humanresource_employee_add_undefined_record AS (
    SELECT
        person_key
        ,job_title
        ,gender
    FROM stg_humanresource_employee_cast_rename
    UNION ALL
    SELECT
        0 AS person_key
        ,'Undefined' AS job_title
        ,'Undefined' AS gender
)
SELECT *
FROM stg_humanresource_employee_add_undefined_record