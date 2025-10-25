{{config(materialized='table')}}

SELECT  
    ORDERID,
    ORDERDATE,
    CUSTOMERID,
    EMPLOYEEID,
    STOREID,
    status as StatusCD,
    CASE 
        WHEN STATUS = '01' THEN 'In Progress'
        WHEN STATUS = '02' THEN 'Completed'
        WHEN STATUS ='03' THEN 'Cancelled'
        ELSE NULL
    END AS StatusDesc,
    CASE
        WHEN StoreID = 1000 THEN 'Online'
        ELSE 'In-Store'
    END as ORDER_CHANNEL,
    Updated_at,
    current_timestamp as dbt_updated_at
FROM 
    {{source('landing','orders')}}