select o.customerid,
       o.orderid,
	   o.salesmanid,
       o.OrderDate,
	   od.OrderDetailsID,
	   od.productid,
	   od.Quantity,
	   od.TotalPrice,
	   od.LastModifiedDate

from Orderdetails as od
inner join [order] as o
on o.orderid =od.orderid
where o.LastModifiedDate >= ?