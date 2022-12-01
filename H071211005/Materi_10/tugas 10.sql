#no.1
select customers.customerName,
case 
when customers.creditLimit - (sum(orderdetails.quantityOrdered * orderdetails.priceEach)) > 0 then 'you are safe'
when customers.creditLimit - (sum(orderdetails.quantityOrdered * orderdetails.priceEach)) < 0 then 'you are in debt'
else  'you are running out of credits'
end 
as 'are you safe?',
(customers.creditLimit - (sum(orderdetails.quantityOrdered * orderdetails.priceEach))) as total
from customers
natural join orders
natural join orderdetails
group by customerNumber