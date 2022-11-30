select c.customerName, (c.creditLimit - sum(od.quantityOrdered * od.priceEach)) AS 'total',
case 
when  (c.creditLimit - sum(od.quantityOrdered * od.priceEach)) > 0 then "you are safe"
when (c.creditLimit - sum(od.quantityOrdered * od.priceEach)) < 0 then "you are in debt"
else  "you are running out of credits "
end as `Are you safe?`
from customers c 
inner join orders o on o.customerNumber = c.customerNumber
join orderdetails od on od.orderNumber = o.orderNumber group by c.customerName;