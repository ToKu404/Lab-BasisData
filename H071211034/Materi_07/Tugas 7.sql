USE classicmodels;

#Nomor 1
SELECT c.customerName,
(SELECT MAX(p.amount) FROM payments AS p WHERE c.customerNumber = p.customerNumber) AS 'Amount Max',
(SELECT MIN(p.amount) FROM payments AS p WHERE c.customerNumber = p.customerNumber) AS 'Amount Min'
FROM customers AS c;

#nomor 2
SELECT CONCAT(firstName,' ', lastName) AS 'Nama Karyawan', employeeNumber AS 'Nomor karyawan' FROM employees
WHERE officecode = 
(SELECT officeCode FROM employees GROUP BY officecode ORDER BY COUNT(officecode) DESC LIMIT 1);

#nomor 3
SELECT productName, productScale FROM products
WHERE productName IN
(SELECT productName FROM products where productName LIKE '%ford%');

#nomor 4
SELECT customers.customerName AS 'Nama Pembeli', CONCAT(employees.firstName,' ', employees.lastName) AS 'Nama Karyawan',orders.orderNumber AS 'Nomor Pesanan', SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS 'Total Pembelian'
FROM customers 
INNER JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
INNER JOIN orders
ON orders.customerNumber = customers.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
GROUP BY orders.orderNumber
HAVING SUM(orderdetails.quantityOrdered * orderdetails.priceEach) =
(SELECT MAX(`Total Pembelian`) FROM (SELECT SUM(orderdetails.priceEach * orderdetails.quantityOrdered) AS 'Total Pembelian' from orderdetails GROUP BY orderNumber) as a);

-- nomor 5
SELECT DISTINCT Country,CHAR_LENGTH(Country) AS "Panjang Karakter"
FROM customers
GROUP BY country
HAVING CHAR_LENGTH(Country) =(SELECT MAX(CHAR_LENGTH(Country)) FROM customers) 
OR  CHAR_LENGTH(Country) =(SELECT MIN(CHAR_LENGTH(Country)) FROM customers) 
ORDER BY `Panjang karakter` DESC;	