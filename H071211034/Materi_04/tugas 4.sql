-- USE classicmodels;
-- SELECT * FROM orders;
-- SELECT * FROM products;
-- SELECT * FROM orderdetails;
-- SELECT * FROM payments;

-- nomor 1
-- SELECT O.orderDate 
-- FROM products AS P 
-- INNER JOIN orderdetails AS OD
-- ON P.productCode = OD.productCode 
-- INNER JOIN orders AS O 
-- ON O.orderNumber = OD.orderNumber
-- WHERE P.productName = '1940 Ford Pickup Truck'
-- ORDER BY orderDate DESC;

-- nomor 2
-- SELECT P.productName, P.MSRP*0.8 AS '80% MSRP', OD.priceEach
-- FROM products AS P
-- INNER JOIN orderdetails AS OD
-- ON p.productCode = OD.productCode
-- WHERE OD.priceEach < (0.8*P.MSRP);
-- 
-- nomor 3
-- USE appseminar;
-- SELECT * FROM ss_mahasiswa WHERE nama= 'Sulaeman';
-- SELECT * FROM ss_pembimbing;
-- SELECT * FROM ss_dosen;

-- SELECT P.nama
-- FROM ss_dosen AS P
-- INNER JOIN ss_pembimbing AS O
-- ON P.id_dosen = O.id_pembimbing_utama
-- INNER JOIN ss_mahasiswa AS OD
-- ON O.id_mahasiswa = OD.id_mahasiswa
-- WHERE OD.nama = 'Sulaeman';classicmodels

-- nomor 4
-- USE classicmodels;
-- ALTER TABLE customers
-- ADD status VARCHAR(10);

-- UPDATE customers AS C
-- INNER JOIN payments AS PA
-- ON C.customerNumber = PA.customerNumber
-- INNER JOIN orders AS O
-- ON C.customerNumber = O.customerNumber
-- INNER JOIN orderdetails AS OD
-- ON O.orderNumber = OD.orderNumber
-- SET C.status ='VIP'
-- WHERE PA.amount > 100000 OR OD.quantityOrdered >=50;

-- SELECT * FROM customers

-- UPDATE customers AS C
-- SET C.status='regular' WHERE status IS NULL;
-- SELECT * FROM customers;

-- nomor 5 
-- SELECT * FROM orderdetails;
-- SELECT * FROM orders WHERE `status` = 'Cancelled';
-- SELECT * FROM orderdetails;
-- SELECT * FROM customers;
-- SELECT * FROM payments;

-- SHOW CREATE TABLE orderdetails;
-- SHOW CREATE TABLE orders;
-- SHOW CREATE TABLE payments;

-- ALTER TABLE orderdetails
-- DROP CONSTRAINT orderdetails_ibfk_1;

-- ALTER TABLE orderdetails
-- DROP CONSTRAINT orderdetails_ibfk_2;

-- ALTER TABLE orders
-- DROP CONSTRAINT orders_ibfk_1;

-- ALTER TABLE payments
-- DROP CONSTRAINT payments_ibfk_1;

-- DELETE C, O, OD, PA
-- FROM customers AS C
-- INNER JOIN orders AS O
-- ON C.customerNumber = O.customerNumber
-- INNER JOIN orderdetails AS OD
-- ON O.orderNumber = OD.orderNumber
-- INNER JOIN payments AS PA
-- ON C.customerNumber = PA.customerNumber
-- WHERE O.status = 'Cancelled';