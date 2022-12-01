USE classicmodels;

-- nomor 1
SELECT products.productName, products.productcode, orders.orderDate From products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode 
INNER JOIN orders
on  orderdetails.orderNumber = orders.orderNumber
WHERE products.productCode = "S18_1097" order by orders.orderDate desc;

-- nomor 2
SELECT products.productName, products.productcode, orderdetails.priceEach, products.MSRP From products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode 
WHERE orderdetails.priceEach < 80/100*(Products.MSRP);



USE appseminar;
-- nomor 3
SELECT ss_mahasiswa.Nama, ss_mahasiswa.id_mahasiswa , ss_pembimbing.id_pembimbing_utama, ss_dosen.nama From ss_mahasiswa
INNER JOIN ss_pembimbing
ON ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
INNER JOIN ss_dosen
ON ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen
WHERE ss_mahasiswa.id_mahasiswa = '288';
-- 



USE classicmodels;
-- nomor 4
ALTER TABLE customers
ADD COLUMN `Status` varchar(10);

update customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
Set customers.Status = 'VIP'
WHERE payments.amount >= 100000 or orderdetails.quantityOrdered >= 50;

-- 
-- -- melihat daftar customer VIP
SELECT customers.customerName, payments.amount, orderdetails.quantityOrdered, customers.status FROM customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
WHERE payments.amount >= 100000 or orderdetails.quantityOrdered >= 50;
-- 
-- -- Mengubah yang selain VIP menjadi Regular
Update customers
SET customers.Status = 'Regular'
WHERE customers.Status is NULL;

-- melihat  constraint
SHOW CREATE TABLE customers;




-- nomor 5
-- menghapus constraint

ALTER  TABLE payments
DROP CONSTRAINT  `payments_ibfk_1`;

ALTER  TABLE orders
DROP CONSTRAINT  `orders_ibfk_1`;

DELETE  customers
JOIN orders 
ON customers.customerNumber = orders.customerNumber
WHERE orders.`status` = "Cancelled";

