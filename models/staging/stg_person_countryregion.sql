WITH stg_person_countryregion_source AS (
    SELECT *
    FROM `adventureworks2019.Person.CountryRegion`
)

,stg_person_countryregion_cast_rename AS (
    SELECT
        CAST(CountryRegionCode as string) AS country_region_key
        ,CAST(Name as string) AS country_region_name
    FROM stg_person_countryregion_source
)

,stg_person_countryregion_add_undefied_record AS (
    SELECT
        country_region_key
        ,country_region_name
    FROM stg_person_countryregion_cast_rename
    UNION ALL
    SELECT
        'Undefined' AS country_region_key
        ,'Undefined' AS country_region_name
)
SELECT *
FROM stg_person_countryregion_add_undefied_record