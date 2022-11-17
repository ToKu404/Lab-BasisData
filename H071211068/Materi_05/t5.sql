-- nomor 1
SELECT c.customerNumber, c.customerName, c.creditLimit, o.status, o.comments
FROM customers as c
INNER JOIN orders as o
ON  c.customerNumber = o.customerNumber
WHERE o.status = 'on hold' And o.comments LIKE '%credit limit exceeded%';

-- nomor 2
SELECT customers.customerName, orders.status, orders.comments FROM customers
INNER JOIN orders
ON  customers.customerNumber = orders.customerNumber
WHERE orders.comments LIKE '%DHL%';

-- nomor 3
SELECT customers.customerName, products.productName , orders.status, orders.orderDate, orders.shippedDate FROM customers
INNER JOIN orders
ON  customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode
WHERE  products.productName LIKE '%Ferrari%' AND orders.shippedDate is Not NULL ORDER BY orders.orderDate DESC;

-- nomor 4
-- memasukkan data baru pada kolom table orders
INSERT INTO orders(orderNumber,status,orderDate,requiredDate,customerNumber)
VALUES ('20000','In Process',current_date(),current_date() + INTERVAL 1 YEAR,'465');

SELECT * FROM customers where customerName like '%anton%' ;

-- memasukkan data baru pada table orderdetails

INSERT INTO orderdetails
VALUES ('20000','S18_2957','50','62.46','40');
describe orderdetails;
select * from products where productName like "%ford v8%";
SELECT * FROM orderdetails WHERE orderNumber like "20000" ;

-- Hasil
SELECT customers.customerNumber, customers.customerName, orders.status, orders.orderDate,orders.requiredDate,orderdetails.quantityOrdered,orderdetails.priceEach,products.MSRP,products.productName FROM customers
INNER JOIN orders
ON  customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode
WHERE  customers.customerNumber = '465';





