select cu.customerid,
	   cu.firstname,
	   cu.lastname,
	   cu.Email,
	   cu.phonenumber,
	   g.genderid,
	   g.gendername
from customer cu
left join gender g
on cu.genderid =g.genderid