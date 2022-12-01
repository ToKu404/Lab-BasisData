USE classicmodels;

# No. 1
SELECT O.orderDate
FROM products AS P
INNER JOIN orderdetails AS OD
ON P.productCode = OD.productCode
INNER JOIN orders AS O
ON OD.orderNumber = O.orderNumber
WHERE P.productName = '1940 Ford Pickup Truck'
ORDER BY orderDate DESC;

# No. 2
SELECT P.productName, P.MSRP * 0.8 AS `80% dari MSRP`, OD.priceEach
FROM products AS P
INNER JOIN orderdetails AS OD
ON P.productCode = OD.productCode
WHERE OD.priceEach < (0.8 * P.MSRP);


# No. 3 
USE appseminar;

SELECT M.nama, M.nim, P.id_pembimbing_utama, D.nip, D.nama
FROM ss_dosen AS D
INNER JOIN ss_pembimbing AS P
ON D.id_dosen = P.id_pembimbing_utama
INNER JOIN ss_mahasiswa AS M
ON M.id_mahasiswa = P.id_mahasiswa
WHERE M.nama = 'Sulaeman';

# No. 4
USE classicmodels;
ALTER TABLE customers
DROP COLUMN STATUS;
ALTER TABLE customers
ADD COLUMN `status` VARCHAR(10);


UPDATE customers AS C
INNER JOIN payments AS Py
ON C.customerNumber = Py.customerNumber
INNER JOIN orders AS O
ON C.customerNumber = O.customerNumber
INNER JOIN orderdetails AS OD
ON O.orderNumber = OD.orderNumber
SET C.`status` = 'VIP' 
WHERE Py.amount > 100000 OR OD.quantityordered >= 50;

SELECT c.customerName, c.status, py.amount, OD.quantityOrdered FROM customers AS C
INNER JOIN payments AS Py
ON C.customerNumber = Py.customerNumber
INNER JOIN orders AS O
ON C.customerNumber = O.customerNumber
INNER JOIN orderdetails AS OD
ON O.orderNumber = OD.orderNumber;

UPDATE customers AS C
SET C.`status` = 'Regular' 
WHERE `status` IS NULL;


# No. 5
SHOW CREATE TABLE orderdetails;
SHOW CREATE TABLE orders;
SHOW CREATE TABLE payments;

ALTER TABLE orderdetails
DROP CONSTRAINT orderdetails_ibfk_2;

ALTER TABLE orderdetails
ADD CONSTRAINT orderdetails_ibfk_2 FOREIGN KEY(orderNumber) REFERENCES orders(orderNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE orders
DROP CONSTRAINT orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE payments
DROP CONSTRAINT payments_ibfk_1;

ALTER TABLE payments
ADD CONSTRAINT payments_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

DELETE C, O, OD, P
FROM customers AS C
INNER JOIN orders AS O
ON C.customerNumber = O.customerNumber
INNER JOIN orderdetails AS OD
ON O.orderNumber = OD.orderNumber
INNER JOIN payments AS P
ON C.customerNumber = P.customerNumber
WHERE O.`status` = 'Cancelled';

SELECT * FROM orderdetails;