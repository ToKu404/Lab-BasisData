use classicmodels;

-- nomor 1
select orders.orderDate from orders inner join orderdetails
on orderdetails.orderNumber = orders.orderNumber inner join products
on products.productCode = orderdetails.productCode
where products.productName like "1940 Ford Pickup Truck"
order by orders.orderDate desc;

-- nomor 2
select products.productName, orderdetails.priceEach, products.MSRP * 0.8 as "80% MSRP" from products
inner join orderdetails on products.productCode = orderdetails.productCode
where (products.MSRP * 0.8) > orderdetails.priceEach;


-- nomor 3
use appseminar;

select ss_dosen.nama from ss_mahasiswa
inner join ss_pembimbing on ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
inner join ss_dosen on id_dosen = ss_pembimbing.id_pembimbing_utama
where ss_mahasiswa.nama = ("Suleman");

-- nomor 4
use classicmodels;
alter table customers 
drop status;

select status from customers;

alter table customers
add status varchar(50);

update customers 
inner join payments 
on payments.customerNumber = customers.customerNumber
inner join orders
on customer.customerNumber = orders.customerNumber
inner join orderdetails 
on orders.orderNumber = orderdetails.orderNumber
set customers.status = 'VIP'
where payments.amount > 100.0000 or orderdetails.quantityOrdered > 49;
update customers
set customers.status = 'Reguler'
where customers.status is null;

-- nomor 5
use classicmodels;

show create table orders;
show create table payments;

alter table orders drop constraint orders_ibfk_1;
alter table payments drop constraint payments_ibfk_1;

select distinct status from orders;

delete customers from customers 
inner join orders on orders.customerNumber = customers.customerNumber
where status in ("Cancelled");

