

SELECT 
    o.orderid,
    o.orderdate,
    o.customerid,
    o.EMPLOYEEID,
    o.STOREID,
    o.StatusCD,
    o.StatusDesc,
    count(DISTINCT o.orderid) as orderCount,
    SUM(OI.TotalPrice) as Revenue
 FROM
{{ref('orders_stg')}} as o
JOIN
{{ref('orderitems_stg')}} as oi
ON o.orderid=oi.orderid
GROUP BY 1,2,3,4,5,6,7
