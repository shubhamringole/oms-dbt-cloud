{{config(materialized='table')}}
SELECT 
    OS.CustomerID,
    c.CustomerName,
    sum(OS.orderCount) as OrderCount,
    sum(OS.Revenue) as Revenue
FROM
    {{ref('orders_fact')}} as OS 
JOIN 
    {{ref("customers_stg")}} as C on os.CustomerID = C.CustomerID
GROUP BY
    OS.CustomerID,
    c.CustomerName