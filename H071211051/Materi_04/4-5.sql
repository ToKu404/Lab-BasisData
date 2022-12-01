-- no 4
-- poin pertama 
-- Buatlah kolom baru dengan nama status yang bertipe data varchar pada tabel customers
-- poin ketiga
-- sisanya isi dengan nilai 'Regular'
 ALTER TABLE customers
 ADD STATUS VARCHAR (10);
 ALTER TABLE customers
 DROP status

-- poin kedua
-- Kemuadian isi dengan nilai'VIP' untuk pelanggan yang jumlah pembayarannya pernah
-- diatas 100.000 atau pernah mengorder barang dengan kuantitas 50 ke atas

UPDATE customers
INNER JOIN payments 
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON orders.customerNumber = customers.customerNumber
INNER JOIN orderdetails
ON orderdetails.orderNumber = orders.orderNumber
SET customers.status = 'VIP'
WHERE payments.amount > 100000 OR orderdetails.quantityOrdered >= 50;

UPDATE customers
SET STATUS = 'Regular'
WHERE STATUS IS NULL;


-- NO 5
ALTER TABLE orders 
DROP CONSTRAINT orders_ibfk_1;
ALTER TABLE payments
DROP CONSTRAINT payments_ibfk_1;

DELETE customers FROM customers
INNER JOIN orders ON customers.customerNumber = orders.customerNumber
WHERE orders.status = 'Cancelled';
SELECT * FROM orders;







