SELECT * FROM orders;

-- nomor 1
SELECT c.customerName, o.status, o.comments
FROM `orders` AS o
LEFT JOIN customers AS c
USING(customerNumber)
WHERE o.`comments` LIKE 'Customer credit limit exceeded%';

-- nomor 2
SELECT c.customerName, o.status, o.comments
FROM `orders` AS o
LEFT JOIN customers AS c
USING(customerNumber)
WHERE o.`comments` LIKE '%DHL%';

-- nomor 3
SELECT p.productName, c.customerName, o.status, o.shippedDate
FROM `products` AS P
JOIN orderdetails AS od
USING(productCode)
JOIN orders AS o
USING(orderNumber)
JOIN customers AS c
USING(customerNumber)
WHERE p.productName LIKE '%Ferrari%' ORDER BY shippedDate DESC;

-- nomor 4
INSERT INTO `products`

SELECT c.customerName, od.quantityOrdered, p.productName, o.status, o.orderDate, o.requiredDate, o.comments
FROM `products` AS P
JOIN orderdetails AS od
USING(productCode)
JOIN orders AS o
USING(orderNumber)
JOIN customers AS c
USING(customerNumber);

SELECT * FROM orders;

SELECT FROM customers
WHERE customerName LIKE 'Anton%'

-- memasukkan data baru pada kolom table orders
INSERT INTO orders (orderNumber,status,orderDate,requiredDate,customerNumber)
VALUES ('20000','In Process',current_date(),current_date() + INTERVAL 1 YEAR,'465');
SELECT * FROM orders WHERE customerNumber = '465';

-- memasukkan data baru pada table orderdetails
SELECT * FROM products WHERE productName LIKE "%v8 coupe%";

INSERT INTO orderdetails
VALUES ('20000','S18_2957','50','62.46','40');

SELECT * FROM orderdetails WHERE orderNumber = "20000";

-- HASILNYA
SELECT customers.customerNumber, customers.customerName, orders.status,
orders.orderDate,orders.requiredDate,orderdetails.quantityOrdered, products.productName 
FROM customers
INNER JOIN orders
ON  customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode
WHERE  customers.customerNumber = '465';