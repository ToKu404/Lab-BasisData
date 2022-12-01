USE classicmodels;

-- nomor 1
SELECT customers.customerName, orders.`status`, orders.comments FROM customers
RIGHT JOIN orders ON customers.customerNumber = orders.customerNumber
WHERE orders.`status` = 'on hold' AND orders.comments LIKE '%credit%';

-- nomor 2
SELECT customers.customerName, orders.`status`, orders.comments FROM customers
INNER JOIN orders ON customers.customerNumber = orders.customerNumber
WHERE orders.comments LIKE '%DHL%';

-- nomor 3
SELECT customers.customerName, products.productName, orders.`status`, orders.shippedDate FROM orders
INNER JOIN customers ON orders.customerNumber = customers.customerNumber
INNER JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber
INNER JOIN products ON products.productCode = orderdetails.productCode
WHERE products.productName LIKE '%Ferrari%' AND orders.shippedDate IS NOT NULL
ORDER BY orders.shippedDate DESC;

-- nomor 4
INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, `status`, customerNumber)
SELECT 10500, DATE(NOW()), DATE_ADD(DATE(NOW()), INTERVAL 1 YEAR), DATE_ADD(DATE(NOW()), INTERVAL 1 MONTH), 'In Process', customers.customerNumber
FROM customers 
WHERE customers.customerName LIKE '%anton%';

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach)
SELECT 10500, products.productCode, 50, products.MSRP FROM products
WHERE products.productName = '1934 Ford V8 Coupe';