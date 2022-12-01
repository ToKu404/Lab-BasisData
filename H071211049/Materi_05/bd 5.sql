use classicmodels;


-- nomor 1
select customers.customerName, status, comments from customers 
inner join orders on orders.customerNumber = customers.customerNumber
where status = "On Hold" and comments like "%credit%";


-- nomor 2
select customers.customerName, orders.status, orders.comments from customers 
inner join orders on orders.customerNumber = customers.customerNumber 
where comments like "%DHL%";


-- nomor 3
select customers.customerName, products.productName, orders.status, orders.shippedDate 
from customers
inner join orders on orders.customerNumber = customers.customerNumber 
inner join orderdetails on orderdetails.orderNumber = orders.orderNumber
inner join products on products.productCode = orderdetails.productCode
where productName like "%fer%"
order by shippedDate desc;


-- nomor 4
insert into orders 
select 11123, date(now()),  date_add(date(now()), interval 1 year), date_add(date(now()), interval 1 month), "In Process", null, customerNumber 
from customers where customerName = "Anton Designs, Ltd.";

insert into orderDetails
select 11123, productCode, 50, MSRP, 1 from products where productName = "1934 Ford V8 Coupe";

select * from orders natural join orderDetails where orders.orderNumber = orderDetails.orderNumber
and orders.orderNumber = 11123;
