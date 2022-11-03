-- NO1
SELECT c.customerName, SUM(p.amount) AS 'Total_Belanja', c.creditLimit AS 'Batas_Kredit', 
SUM(p.amount)-c.creditLimit AS 'Selisih'
FROM customers AS c
JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY c.customerName
HAVING Total_Belanja > Batas_Kredit
ORDER BY Selisih DESC



-- NO2
SELECT CONCAT (CONCAT_WS (' : ', c.customerName, c.contactFirstName), CONCAT_WS('@', c.contactLastName, c.addressLine1)) AS 'Pelanggan',
SUM(od.quantityOrdered) AS 'Jumlah_Orderan'
FROM customers c
JOIN orders
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
GROUP BY c.customerName
ORDER BY Jumlah_Orderan DESC
LIMIT 1;


-- NO3
SELECT CONCAT_WS(' ', MONTHNAME(p.paymentDate), YEAR(p.paymentDate)) AS 'Hari_Pembayaran', COUNT(c.customerName) AS 'Jumlah_Pelanggan', 
GROUP_CONCAT(c.customerName ORDER BY c.customerName ASC) AS 'List_Pelanggan', SUM(p.amount) AS 'Amount'
FROM customers AS c
JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY Hari_Pembayaran
HAVING Hari_Pembayaran LIKE 'Feb%'
ORDER BY Amount DESC



-- NO4
SELECT UPPER(productName) 'Nama Produk', COUNT(DISTINCT orderDate) AS 'Jumlah di Order', GROUP_CONCAT(orderDate) AS 'Waktu Orderan', 
buyPrice 'Harga Beli', priceEach 'Harga Jual', SUM(quantityOrdered) 'Total Jumlah Orderan', 
CONCAT(o.priceEach*SUM(quantityOrdered), ' - ', buyPrice*SUM(quantityOrdered), ' = ', o.priceEach*SUM(quantityOrdered)-buyPrice*SUM(quantityOrdered)) 
AS 'Pendapatan - Modal = Keuntungan'
FROM products
JOIN orderdetails o ON products.productCode = o.productCode
JOIN  orders o2 ON o.orderNumber = o2.orderNumber
JOIN customers c ON o2.customerNumber = c.customerNumber
WHERE productName LIKE '%ferrari enz%'
GROUP BY productName, priceEach, buyPrice
HAVING SUM(o.priceEach*quantityOrdered)-SUM(buyPrice*quantityOrdered) > 5000
ORDER BY SUM(o.priceEach*quantityOrdered)-SUM(buyPrice*quantityOrdered) DESC;



-- NO5
SELECT o.addressLine1, CONCAT(LEFT(o.phone, 9), '* ****') AS 'phone', COUNT(distinct e.employeeNumber) AS 'Jumlah_Karyawan', 
COUNT(distinct c.customerNumber) AS 'Jumlah_Pelanggan', ROUND(AVG(p.amount), 2) AS 'Rata_rata_Penghasilan'
FROM offices AS o
right JOIN employees AS e
ON o.officeCode = e.officeCode
JOIN customers AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY e.officeCode
ORDER BY Rata_rata_Penghasilan ASC 











