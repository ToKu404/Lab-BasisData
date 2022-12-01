use classicmodels;

-- no-1
select customerName as 'Pengguna', max(p.amount) as 'Pembayaran Terbesar', min(p.amount) as 'Pembayaran Terkecil'
from payments p
inner join customers c on c.customerNumber = p.customerNumber
where c.customerName in (
	select customerName from customers)
	group by customerName;

-- no 2
select officeCode, employeeNumber, concat(firstName, ' ', lastName) as 'Employee'  from employees
where officeCode = (
	select officeCode from (
		select officeCode, count(officeCode) as 'Employee' from employees
		group by officeCode
		order by 'Employee'
		limit 1) as O);

-- no 3
select productName, productScale 
from products
where productName in (
	select productName from products where productName like "%Ford%");
    
-- no 4

-- select customerName, concat(e.firstName, ' ', e.lastName) as 'employeeName', o.orderNumber, sum(o1.priceEach*o1.quantityOrdered) as 'Biaya Pesanan' from customers c
-- inner join employees e on c.salesRepEmployeeNumber = e.employeeNumber
-- natural join orders o
-- natural join orderdetails o1
-- group by o.orderNumber, customerName, employeeName
-- order by `Biaya Pesanan` desc
-- limit 1;

select customerName, concat(e.firstName, ' ', e.lastName) as 'employeeName', o.orderNumber, sum(o1.priceEach*o1.quantityOrdered) as 'Biaya Pesanan' from customers c
inner join employees e on c.salesRepEmployeeNumber = e.employeeNumber
natural join orders o
natural join orderdetails o1
group by o.orderNumber, customerName, employeeName
having sum(o1.priceEach*o1.quantityOrdered) = (select max(a) from (select sum(o1.priceEach*o1.quantityOrdered) as a from orderdetails o1
group by orderNumber) as b);

    
-- no 5
select distinct country, length(country) as 'lengthName' 
from customers
where length(country) = (
	select max(length(country)) as 'Terpanjang' from customers)
    or length(country) = (select min(length(country)) as 'Terpendek' from customers);

