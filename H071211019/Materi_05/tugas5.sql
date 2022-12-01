USE classicmodels;

# No. 1
SELECT c.customername, c.creditlimit, o.status, o.comments
FROM customers c
INNER JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE o.status = 'On Hold' AND o.comments LIKE '%credit limit exceeded%';

# No. 2
SELECT c.customername, o.status, o.comments
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.comments LIKE '%DHL%';
-- 
# No. 3
SELECT c.customername, p.productname, o.status, o.orderdate
FROM customers AS c
INNER JOIN orders AS o
ON c.customernumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products AS p
ON p.productCode = od.productCode
WHERE p.productname LIKE '%Ferrari%'
ORDER BY o.shippeddate DESC;


# No. 4
SELECT * FROM customers WHERE customername LIKE '%anton%'; 
-- customernumber = 465

INSERT  INTO orders(orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
VALUES ('2022', CURRENT_DATE(), CURRENT_DATE() + INTERVAL 1 YEAR, CURRENT_DATE() + INTERVAL 1 MONTH, 'In Process', NULL, '465');
SELECT * FROM orders
WHERE customerNumber = '465';

INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES ('2022', 'S18_2957', '50', '62.46', '20');
SELECT * FROM orderdetails
WHERE orderNumber = '2022';

SELECT * FROM customers;
SELECT * FROM products WHERE productname = '1934 Ford V8 Coupe';
SELECT * FROM orders;
SELECT * FROM orderdetails;

SELECT c.customerNumber, c.customerName, o.status, o.orderDate, o.shippedDate, od.quantityOrdered, p.productName
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE c.customerName LIKE '%anton%';