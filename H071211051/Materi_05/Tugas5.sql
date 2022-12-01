-- no 1
SELECT c.customerName, c.creditLimit, o.status, p.amount, o.comments
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN payments AS p
ON o.customerNumber = p.customerNumber
WHERE o.status = 'On Hold' AND o.comments LIKE '%credit limit exceeded%';

-- no 2
SELECT c.customerName, o.status, o.comments
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber= o.customerNumber
WHERE o.comments LIKE '%DHL%';

-- no 3
SELECT c.customerName, od.productCode, p.productName, o.status, o.shippedDate
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products as p
ON od.productCode = p.productCode
WHERE p.productName LIKE '%Ferrari%' ORDER BY o.shippedDate DESC;

-- no 4 	
INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, STATUS, comments, customerNumber)
VALUES (10428, CURRENT_TIMESTAMP(), DATE_ADD(NOW(), INTERVAL 1 YEAR), NULL, 'In Process', NULL, 465);

INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
SELECT 10428, 'S18_2957', 50, p.MSRP, 1
FROM orderdetails
JOIN products AS p
ON orderdetails.productCode = p.productCode
WHERE p.productCode = 'S18_2957' LIMIT 1;


