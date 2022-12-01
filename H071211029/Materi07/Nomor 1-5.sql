use classicmodels;

-- nomor 1
-- select customers.customerName, max(amo) as `Pembayaran Terbesar`, min(amo) as `Pembayaran Terkecil` 
-- from (select customerNumber, amount as amo from payments) as lineamo 
-- join customers using(customerNumber)
-- group by customerNumber;

-- nomor 2
-- select officeCode, concat(firstName, ' ', lastName) as employee
-- from employees
-- where officeCode = (select officeCode from (select officeCode, count(employeeNumber) from offices natural join employees
-- group by officeCode order by count(employeeNumber) desc limit 1) as sub);

-- nomor 3
-- select productName, productScale
-- from products
-- where productName in (select productName from products where productName like '%ford%');
 
--  nomor 4
-- select c.customerName `Nama Pelanggan`, concat(e.firstName, ' ', e.lastName) as 'Nama Karyawan' , orderNumber, 
-- sum(quantityOrdered * priceEach) as `total pembelian`
-- from customers as c
-- inner join employees as e on c.salesRepEmployeeNumber = e.employeeNumber
-- natural join orders as o
-- natural join orderdetails
-- group by orderNumber, customerName, `nama karyawan`, orderNumber
-- having sum(quantityOrdered * priceEach) =
-- (select sum(quantityOrdered * priceEach) as `total pembelian` from orderdetails group by orderNumber
-- order by `total pembelian` desc limit 1);
 
--  nomor 5
-- select distinct country, length(country) as `panjang karakter` from customers
-- where length(country) =(select max(length(country)) from customers ) or length(country) =
-- (select min(length(country)) from customers);