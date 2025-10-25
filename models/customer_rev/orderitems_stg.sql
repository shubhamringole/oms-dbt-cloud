{{config(materialized='table')}}

SELECT 
    ORDERID,
    ORDERITEMID,
    PRODUCTID,
    QUANTITY,
    UNITPRICE,
    quantity * unitprice as TotalPrice,
    Updated_at
FROM
     {{source('landing','ORDERITEMS')}}