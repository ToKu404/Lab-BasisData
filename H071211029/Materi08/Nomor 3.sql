use classicmodels;

-- nomor 3
select city from (select employees.firstName as nama, city from employees
inner join offices on offices.officeCode = employees.officeCode where employees.firstName like 'l%'
union 
select customers.customerName as nama, city from customers where customers.customerName like 'l%') as a
group by city 
order by count(nama) desc
limit 1;