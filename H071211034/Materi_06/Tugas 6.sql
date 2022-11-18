USE classicmodels;

#Nomor 1
-- SELECT c.customerName AS 'Nama Pelanggan', SUM(p.amount) AS 'Total Belanja', c.creditLimit AS 'Batas Kredit', 
-- SUM(p.amount)-(c.creditLimit) AS Selisih 
-- FROM customers AS c
-- INNER JOIN payments AS p
-- ON c.customerNumber = p.customerNumber
-- GROUP BY c.customerName, c.creditLimit
-- HAVING SUM(p.amount) > c.creditLimit
-- ORDER BY Selisih DESC;

#Nomor 2
-- SELECT CONCAT(c.customerName,' : ', c.contactFirstName,' ', c.contactLastName,'@',c.addressline1) AS Pelanggan,
-- SUM(od.quantityOrdered) AS 'Jumlah Orderan'
-- FROM customers AS c
-- INNER JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- INNER JOIN orderdetails AS od
-- ON o.orderNumber = od.orderNumber
-- GROUP BY c.customerName
-- ORDER BY `Jumlah Orderan` DESC LIMIT 1;

#Nomor 3
-- SELECT CONCAT(MONTHNAME(p.paymentDate),' ',YEAR(p.paymentDate)) AS 'Hari Pembayaran',
-- COUNT(c.customerName) AS 'Jumlah Pelanggan',
-- GROUP_CONCAT(c.customerName ORDER BY customerName SEPARATOR ", ") AS 'List Pelanggan',
-- SUM(p.amount) AS 'Jumlah Pembayaran'
-- FROM payments AS p
-- INNER JOIN customers AS c
-- ON c.customerNumber = p.customerNumber
-- WHERE MONTH(p.paymentDate) = 2
-- GROUP BY `Hari Pembayaran`
-- ORDER BY `Hari Pembayaran` DESC;

#Nomor 4
-- SELECT UPPER(pr.productName) AS 'Nama Produk',
-- COUNT(DISTINCT o.orderDate) AS 'Jumlah di Order',
-- GROUP_CONCAT(o.orderDate) AS 'Waktu Orderan',
-- pr.buyPrice AS 'Harga Beli',
-- od.priceEach AS 'Harga Jual',
-- SUM(od.quantityOrdered) AS 'Total Jumlah Orderan',
-- CONCAT(od.priceEach * SUM(od.quantityOrdered), ' - ', pr.buyPrice * SUM(od.quantityOrdered), ' = ', 
-- od.priceEach * SUM(od.quantityOrdered) - pr.buyPrice * SUM(od.quantityOrdered)) AS 'Pendapatan - Modal = Keuntungan'
-- FROM products AS pr
-- INNER JOIN orderdetails AS od
-- ON pr.productCode = od.productCode
-- INNER JOIN orders AS o
-- ON od.orderNumber = o.orderNumber
-- WHERE pr.productName LIKE '%Ferrari enzo%'
-- GROUP BY pr.productName, od.priceEach, pr.buyPrice	
-- HAVING SUM(od.priceEach*od.quantityOrdered) - SUM(pr.buyPrice*od.quantityOrdered) > 5000
-- ORDER BY SUM(od.priceEach*od.quantityOrdered) - SUM(pr.productCode*od.quantityOrdered) DESC;	

#Nomor 5
SELECT of.addressLine1 AS 'Alamat', 
CONCAT(LEFT(of.phone, 6), '* **') AS 'Nomor Telp', 
COUNT(DISTINCT e.employeeNumber) AS 'Jumlah Karyawan', 
COUNT(DISTINCT c.customerName) AS 'Jumlah Pelanggan', 
FORMAT(AVG(p.amount),2) AS 'Rata-rata Penghasilan'
FROM employees AS e
LEFT JOIN customers AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments AS p
ON c.customerNumber = p.customerNumber
INNER  JOIN offices AS of
USING(officecode)
GROUP BY e.officeCode
ORDER BY of.phone;