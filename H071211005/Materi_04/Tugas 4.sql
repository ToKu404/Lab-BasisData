#no.1
select O.orderDate
from products as p
inner join orderdetails as od 
on p.productCode = od.productCode
inner join orders as o
on od.orderNumber = o.orderNumber
where productName="1940 Ford pickup truck" order by orderDate desc;

#no.2
select p.productName, P.MSRP  * 0.8 as '80% dari MRSP', od.priceEach
from products as p
inner join orderdetails as od
on p.productCode = od.productCode
where priceEach < 0.8 * MSRP;

#no.3
select ss_mahasiswa.nama, ss_dosen.nama
from ss_mahasiswa
inner join ss_pembimbing
on ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
inner join ss_dosen
on ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen
where ss_mahasiswa.nama= "sulaeman";

#no.4 
# - Membuat kolom baru dengan nama status yang bertipe data varchar pada tabel customers
-- alter table customers
-- add status varchar(200);
update customers
inner join  payments
on customers.customerNumber = payments.customerNumber
inner join orders
on payments.customerNumber = orders.customerNumber
inner join orderdetails
on orders.orderNumber = orderdetails.orderNumber
set customers.status = 'VIP'
where payments.amount > 100000 or orderdetails.quantityOrdered > 50;
# nilai null pada status diupdate ulang menjadi regular 
update customers
set status = 'Reguler'
where status is null;

#melihat 3 kolom yg berhubungan 
-- select payments.amount, orderdetails.quantityOrdered, customers.status
-- from customers
-- inner join  payments
-- on customers.customerNumber = payments.customerNumber
-- inner join orders
-- on payments.customerNumber = orders.customerNumber
-- inner join orderdetails on orders.orderNumber = orderdetails.orderNumber

#no.5
-- show create table payments
-- alter table orders drop constraint orders_ibfk_1;
-- alter table payments drop constraint payments_ibfk_1;

delete customers from customers
join orders 
on customers.customerNumber = orders.customerNumber
where orders.status ="Cancelled";

select orders.status, customers.customerName from customers
left join orders
on customers.customerNumber = orders.customerNumber
where orders.status ="Cancelled";

ALTER TABLE orders ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY(customerNumber)REFERENCES orderscustomers(customerNumber);
select orders.customerNumber, customers.customerNumber from orders
left join customers 
on customers.customerNumber = orders.customerNumber
where customers.customerNumber is null







