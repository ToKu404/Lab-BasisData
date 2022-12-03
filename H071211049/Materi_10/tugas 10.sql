use classicmodels;

select customerName,
case 
	when creditLimit-sum(quantityOrdered*priceEach) > 0 then "you are safe"
    when creditLimit-sum(quantityOrdered*priceEach) < 0 then "you are in debt"
    else "you are running out of credits"
    end
    as "are you safe?",
creditLimit-sum(quantityOrdered*priceEach) as total
from customers
join orders using (customerNumber)
join orderdetails using (orderNumber)
group by customerNumber;