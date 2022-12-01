USE classicmodels;

-- nomor 1
SELECT customers.customerName AS 'Nama Pelanggan', SUM(amount) AS 'Total Belanja', customers.creditLimit AS 'Batas Kredit', 
SUM(amount)-(customers.creditLimit) AS 'Selisih' FROM customers 
INNER JOIN payments ON customers.customerNumber = payments.customerNumber
GROUP BY customers.customerName, customers.creditLimit
HAVING `Total Belanja` > customers.creditLimit
ORDER BY `Selisih` DESC;

-- nomor 2
SELECT CONCAT(customers.customerName, ' : ', customers.contactFirstName, ' ', customers.contactLastName, 
'@', customers.addressLine1) AS 'Pelanggan',
SUM(orderdetails.quantityOrdered) AS 'Jumlah Orderan' FROM orders
INNER JOIN customers ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber
GROUP BY customers.customerName 
ORDER BY `Jumlah Orderan` DESC LIMIT 1;

-- nomor 3
SELECT CONCAT('February ', YEAR(payments.paymentDate)) AS 'Hari Pembayaran', COUNT(payments.customerNumber) AS 'Jumlah Pelanggan', 
GROUP_CONCAT(DISTINCT customers.customerName ORDER BY customers.customerName) AS 'List Pelanggan', 
SUM(payments.amount) AS 'Jumlah Pembayaran'
FROM payments 
INNER JOIN customers ON customers.customerNumber = payments.customerNumber
WHERE MONTH(payments.paymentDate) = 02
GROUP BY `Hari Pembayaran`
ORDER BY `Jumlah Pembayaran` DESC;

-- nomor 4
SELECT UPPER(productName) AS 'Nama Produk', COUNT(DISTINCT orderDate) AS 'Jumlah di Order', 
GROUP_CONCAT(orderDate) AS 'Waktu Orderan', buyPrice AS 'Harga Beli', priceEach AS 'Harga Jual',
SUM(quantityOrdered) AS 'Total Jumlah Orderan', CONCAT(o.priceEach * SUM(quantityOrdered), ' - ', buyPrice * SUM(quantityOrdered), 
' = ', o.priceEach * SUM(quantityOrdered) - buyPrice * SUM(quantityOrdered)) AS 'Pendapatan - Modal = Keuntungan'
FROM products
INNER JOIN orderdetails o ON products.productCode = o.productCode
INNER JOIN orders o2 ON o.orderNumber = o2.orderNumber
INNER JOIN customers c ON o2.customerNumber = c.customerNumber
WHERE productName LIKE '%ferrari enz%'
GROUP BY productName, priceEach, buyPrice
HAVING SUM(o.priceEach*quantityOrdered) - SUM(buyPrice*quantityOrdered) > 5000
ORDER BY SUM(o.priceEach*quantityOrdered) - SUM(buyPrice*quantityOrdered) DESC;

-- nomor 5
SELECT offices.addressLine1 AS 'Alamat', CONCAT(LEFT(offices.phone, CHAR_LENGTH(offices.phone) - 6), '* ****') AS 'Nomor Telp',
COUNT(DISTINCT e.firstName) AS 'Jumlah Karyawan', COUNT(DISTINCT c.customerName) AS 'Jumlah Pelanggan',
ROUND(AVG(amount),2) AS 'Rata-rata Penghasilan'
FROM offices
INNER JOIN employees e ON offices.officeCode = e.officeCode
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY offices.phone, offices.addressLine1;