SELECT
    sales_person.person_key AS sales_person_key
    ,person.person_title AS sales_person_title
    ,person.first_name
    ,person.middle_name
    ,person.last_name
    ,employee.job_title
    ,employee.gender
    ,sales_person.bonus
    ,sales_person.commission
FROM `project-2-unigap.adventurework_dw.stg_sales_person` AS sales_person
JOIN `project-2-unigap.adventurework_dw.stg_dim_person` AS person
ON sales_person.person_key = person.person_key
JOIN `project-2-unigap.adventurework_dw.stg_humanresource_employee` AS employee
ON sales_person.person_key = employee.person_key 