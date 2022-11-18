USE classicmodels;

#Nomor 1
-- SELECT c.customerName, o.status, o.comments
-- FROM customers AS c
-- INNER JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- WHERE o.comments LIKE '%exceed%' AND o.status = 'on hold';
 
#nomor 2
-- SELECT c.customerName, o.status, o.comments
-- FROM customers AS c
-- INNER JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- WHERE o.comments LIKE '%DHL%';

#nomor 3
-- SELECT c.customerName, p.productName, o.status, o.shippedDate
-- FROM customers AS c
-- INNER JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- INNER JOIN orderdetails AS od
-- ON o.orderNumber = od.orderNumber
-- INNER JOIN products AS p
-- ON p.productCode = od.productCode
-- WHERE p.productName LIKE '%Ferrari%'
-- ORDER BY o.shippedDate DESC;

#nomor 4
-- INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, STATUS, customerNumber)
-- VALUES (2022, CURRENT_DATE(), CURRENT_DATE(), CURRENT_DATE() + INTERVAL 1 YEAR, 'In Process', '', 465);

-- INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
-- VALUES (2022, 'S18_2957', 50 , '62.46', 20);

-- SELECT c.customerNumber, c.customerName, o.status, o.orderDate, o.shippedDate, od.quantityOrdered, p.productName
-- FROM customers AS c
-- INNER JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- JOIN orderdetails AS od
-- ON o.orderNumber = od.orderNumber
-- JOIN products AS p
-- ON p.productCode = od.productCode
-- WHERE c.customerNumber = 465;
