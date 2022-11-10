-- No 1

SELECT c.customerName, SUM(p.amount) AS 'Total Belanja', c.creditLimit AS 'Batas Kredit',
SUM(p.amount) - c.creditLimit AS 'Selisih'
FROM customers AS c
JOIN payments AS p
ON p.customerNumber = c.customerNumber
GROUP BY c.customerName
HAVING 'Total Belanja' > 'Batas Kredit'
ORDER BY Selisih DESC

-- No 2

SELECT CONCAT(c.customerName, " :", " ", c.contactFirstName, " ", c.contactLastName, " @", c.addressLine1) AS 'Pelanggan',
SUM(d.quantityOrdered) AS 'Jumlah Orderan'
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS d
ON o.orderNumber = d.orderNumber
GROUP BY c.customerName
ORDER BY 'Jumlah Orderan' DESC LIMIT 1

-- No 3

SELECT CONCAT(MONTHNAME(p.paymentDate), " ", YEAR(p.paymentDate)) AS 'Hari Pembayaran',
COUNT(DISTINCT c.customerNumber) AS 'Jumlah Pelanggan', GROUP_CONCAT(DISTINCT c.customerName ORDER BY c.customerName SEPARATOR " , ")
AS 'List pelanggan', SUM(p.amount) AS 'Jumlah Pembayaran'
FROM payments AS p
JOIN customers AS c
ON p.customerNumber = c.customerNumber
WHERE MONTH(paymentDate) = '02'
GROUP BY CONCAT(MONTHNAME(p.paymentDate), " ", YEAR(p.paymentDate))
ORDER BY SUM(p.amount) DESC

-- No 4

SELECT UPPER(p.productname) AS 'Nama Produk', COUNT(*) AS 'Jumlah Di Order',
GROUP_CONCAT(o.orderDate ORDER BY o.orderDate SEPARATOR " , ") AS 'Waktu Orderan',
p.buyPrice AS 'Harga Beli', od.priceEach AS 'Harga Jual', SUM(od.quantityOrdered) AS 'Total Jumlah Orderan',
CONCAT((od.priceEach*SUM(od.quantityOrdered)), " - ", (p.buyPrice*SUM(od.quantityOrdered)), " = ",
((SUM(od.priceEach*od.quantityOrdered))-(SUM(p.buyPrice*od.quantityOrdered)))) AS 'Pendapatan - Modal = Keuntungan'
FROM products AS p
JOIN orderdetails AS od
ON od.productCode = p.productCode
JOIN orders AS o
ON od.orderNumber = o.orderNumber
WHERE p.productName LIKE "%2001%"
GROUP BY od.priceEach
HAVING (SUM(od.priceEach*od.quantityOrdered))-(SUM(p.buyPrice*od.quantityOrdered)) > 5000
ORDER BY (SUM(od.priceEach*od.quantityOrdered))-(SUM(p.buyPrice*od.quantityOrdered)) DESC


-- No 5

SELECT o.addressLine1 AS 'Alamat', REPLACE(o.phone, RIGHT(o.phone, 6), '* **') AS 'Nomor Telepon', 
COUNT(DISTINCT e.employeeNumber) AS 'Jumlah Karyawan',
COUNT(DISTINCT c.customerName) AS 'Jumlah Pelanggan', ROUND(AVG(p.amount), 2) AS 'Rata-rata Penghasilan'
FROM customers AS c
JOIN employees AS e 
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices AS o
ON e.officeCode = o.officeCode
JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY alamat
ORDER BY o.phone ASC