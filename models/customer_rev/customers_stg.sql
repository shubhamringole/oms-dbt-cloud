{{config(materialized='table')}}


SELECT 
    CUSTOMERID,
    FIRSTNAME,
    LASTNAME,
    EMAIL,
    PHONE,
    ADDRESS,
    CITY,
    STATE,
    ZIPCODE,
    concat(FIRSTNAME,' ',LASTNAME) as CustomerName
    
FROM 
    {{source('landing','CUSTOMERS')}}
