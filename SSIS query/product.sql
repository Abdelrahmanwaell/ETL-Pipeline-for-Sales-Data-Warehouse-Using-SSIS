select p.productid,
	   p.productname,
	   p.price,
	   sub.subcategoryid,
	   sub.subcategoryname,
	   cat.categoryid,
	   cat.categoryname
from Product p
left join SubCategory sub
on p.SubCategoryID =sub.SubCategoryID
left join Category cat 
on cat.CategoryID =sub.CategoryID