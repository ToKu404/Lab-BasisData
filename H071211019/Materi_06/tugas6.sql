USE classicmodels;

# No. 1
SELECT c.customerName AS 'Nama Pelanggan',
SUM(p.amount) AS 'Total Belanja',
c.creditLimit AS 'Batas Kredit',
(SUM(p.amount) - c.creditLimit) AS 'Selisih' 
FROM customers AS c 
INNER JOIN payments AS p
USING(customernumber)
GROUP BY c.customerNumber
HAVING Selisih > 0
ORDER BY Selisih DESC;

# No. 2
SELECT CONCAT(c.customerName, ' : ' , c.contactFirstName, c.contactLastName, '@', c.addressLine1) AS Pelanggan,
SUM(od.quantityOrdered) AS 'Jumlah Orderan' 
FROM customers AS c 
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber
ORDER BY SUM(od.quantityOrdered) DESC
LIMIT 1;

# No. 3
SELECT CONCAT(MONTHNAME(p.paymentDate), ' ', YEAR(p.paymentDate)) AS 'Hari Pembayaran',
COUNT(c.customerName) AS 'Jumlah Pelanggan',
GROUP_CONCAT(c.customerName ORDER BY c.customerName ASC SEPARATOR ',') AS 'List Pelanggan',
SUM(p.amount) AS 'Jumlah Pembayaran' 
FROM payments AS p
INNER JOIN customers AS c
ON p.customerNumber = c.customerNumber
WHERE MONTH(p.paymentDate) = 2
GROUP BY `Hari Pembayaran`
ORDER BY SUM(p.amount) DESC;

# No. 4
SELECT UPPER(pr.productName) AS 'Nama Produk',
COUNT(od.priceEach) AS 'Jumlah di Order',
GROUP_CONCAT(o.orderDate SEPARATOR ',') AS 'Waktu Orderan', 
od.priceEach AS 'Harga Jual', 
pr.buyPrice AS 'Harga Beli', 
SUM(od.quantityOrdered) AS 'Total Jumlah Orderan',
CONCAT((od.priceEach * SUM(od.quantityOrdered)), ' - ' ,(pr.buyPrice * SUM(od.quantityOrdered))  , ' = ', ((od.priceEach * SUM(od.quantityOrdered))-(pr.buyPrice * SUM(od.quantityOrdered)))) AS 'Pendapatan - Modal = Keuntungan'
FROM orders AS o
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products AS pr
ON pr.productCode = od.productCode
WHERE pr.productName LIKE '%Ferrari Enzo%' 
GROUP BY od.priceEach
HAVING ((od.priceEach * SUM(od.quantityOrdered)) - (pr.buyPrice * SUM(od.quantityOrdered))) > 5000 
ORDER BY ((od.priceEach * SUM(od.quantityOrdered)) - (pr.buyPrice * SUM(od.quantityOrdered))) DESC;

# No. 5
SELECT of.addressLine1 AS 'Alamat', 
CONCAT(substring(of.phone, 1, LENGTH(of.phone)-6), '* ****') AS 'Nomor Telp', 
COUNT(DISTINCT e.employeeNumber) AS 'Jumlah Karyawan', 
COUNT(DISTINCT c.customerName) AS 'Jumlah Pelanggan', 
FORMAT(AVG(p.amount), 2) AS 'Rata-rata Penghasilan'
FROM employees AS e
LEFT JOIN customers AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments AS p
ON c.customerNumber = p.customerNumber
INNER  JOIN offices AS of
USING(officecode)
GROUP BY e.officeCode
ORDER BY of.phone;