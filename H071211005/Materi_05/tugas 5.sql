#1. 
select c.customerName, o.comments, o.status
from customers as c
inner join orders as o
on c.customerNumber= o.customerNumber
where o.status= 'on hold' and o.comments like '%credit limit exceeded%';

#2. 
select c.customerName as 'nama pelanggan', o.status, o.comments
from customers as c
inner join orders as o 
on c.customerNumber = o.customerNumber
where comments like '%requested%DHL%';

#3. 
select c.customerName, p.productName, o.status, o.shippedDate
from customers as c
inner join orders as o
on c.customerNumber = o.customerNumber
inner join orderdetails as od
on o.orderNumber = od.orderNumber
inner join products as p
on od.productCode = p.productCode
where productName like '%ferrari%' order by shippedDate desc;

#4. 
insert into orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
select 11111, date(now()), date_add(date(now()), interval 1 year), date(now()), 
'In Process', 'hahaha', customers.customerNumber
from customers
where customerName like 'anton%';

insert into orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
select 11111, products.productCode, 50, products.MSRP, 1
from products
where products.productName = '1934 Ford V8 Coupe';
