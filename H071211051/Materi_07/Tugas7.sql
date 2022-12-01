#no1
SELECT Nomor, Nama, Jumlah_Terbesar, Jumlah_Terkecil
FROM (SELECT payments.customerNumber AS Nomor, customers.customerName AS Nama, MAX(amount) AS Jumlah_Terbesar, MIN(amount) AS Jumlah_Terkecil
		FROM payments
		JOIN customers
		ON payments.customerNumber = customers.customerNumber
		GROUP BY payments.customerNumber) AS jumlah

#no2
SELECT employeeNumber AS Nomor, CONCAT_WS(" ", firstName, lastName) AS Nama, officeCode
FROM employees
WHERE officeCode =
		((SELECT MAX(Office_Code) AS Kode_Kantor
		FROM
			(SELECT COUNT(officeCode) AS Office_Code
			FROM employees
			GROUP BY employeeNumber) AS count_office))
	
#no3
SELECT nama_Produk, product_Scale
FROM
	(SELECT productName AS nama_Produk, productScale AS product_Scale 
	FROM products 
	WHERE productName LIKE '%Ford%') AS ford_Product

#no4
SELECT c.customerNumber, c.customerName, CONCAT_WS(' ', e.firstName, e.lastName) AS 'Nama Karyawan', o.orderNumber, SUM(od.priceEach*od.quantityOrdered) AS 'Biaya Pesanan Termahal'
FROM employees AS e
JOIN customers AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
GROUP BY orderNumber
HAVING SUM(priceEach*quantityOrdered) =
	(SELECT MAX(Total.totalBiaya) 
	FROM 
	(SELECT SUM(priceEach*quantityOrdered) AS totalBiaya
	FROM orderDetails
	GROUP BY orderNumber) AS Total);
	
	
#no5
SELECT distinct country, LENGTH(country) AS `Panjang Karakter`
FROM customers
WHERE LENGTH(country) =
	(SELECT MAX(LENGTH(country)) AS `Terpanjang`
		FROM customers) 
OR LENGTH(country) =
	(SELECT MIN(LENGTH(country)) AS `Terpendek`
		FROM customers) 
ORDER BY `Panjang Karakter` desc;