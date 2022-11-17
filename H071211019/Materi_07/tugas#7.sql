USE classicmodels;

# No. 1
SELECT customers.customerNumber, customers.customerName, MAX(amount) `Pembayaran Tertinggi`, MIN(amount) `Pembayaran Terendah`
FROM 
	(SELECT customernumber, amount FROM payments) AS lineamount
LEFT JOIN customers
USING(customernumber)
GROUP BY customernumber;

# No. 2
SELECT officecode, CONCAT(firstname, ' ', lastname) `Employee's Name`
FROM employees
WHERE officecode = 
	(SELECT officecode 
	FROM
		(SELECT officecode, COUNT(employeenumber) FROM offices
		NATURAL JOIN employees
		GROUP BY officecode
		ORDER BY COUNT(employeenumber) DESC LIMIT 1) AS X);

# No. 3
SELECT productname, productscale
FROM products
WHERE productname IN 
	(SELECT productname FROM products
	WHERE productname LIKE '%ford%');
	
# No. 4
SELECT c.customerNumber, c.customerName, CONCAT(e.firstName, ' ', e.lastName) `Nama Karyawan`, o.ordernumber, SUM(od.quantityordered * od.priceeach) `biaya termahal`
FROM employees e
JOIN customers c 
ON e.employeeNumber = c.salesrepemployeenumber 
JOIN orders o
USING(customernumber)
JOIN orderdetails od
USING(ordernumber)
GROUP BY ordernumber
HAVING `biaya termahal` = 
	(SELECT MAX(total.totalbeli) FROM 
		(SELECT SUM(quantityordered * priceeach) totalbeli
		FROM orderdetails
		GROUP BY ordernumber) total);


# No. 5
SELECT DISTINCT country, LENGTH(country) `panjang karakter`
FROM customers
WHERE LENGTH(country) IN
	((SELECT MAX(LENGTH(country)) `karakter terpanjang`
	FROM customers),
	(SELECT min(LENGTH(country)) `karakter terpanjang`
	FROM customers))
GROUP BY `panjang karakter`;