USE classicmodels

SELECT * FROM orders

# nomor 1
SELECT od.orderNumber, od.productCode, p.productName, o.orderDate
FROM orderdetails AS od
LEFT JOIN orders AS o
ON od.orderNumber = o.orderNumber
LEFT JOIN products AS p
ON od.productCode = p.productCode
WHERE productName = '1940 Ford Pickup Truck' ORDER BY orderDate ASC

# nomor 2
SELECT DISTINCT p.productName
FROM orderdetails AS od
INNER JOIN products AS p
ON od.productCode = p.productCode
WHERE od.priceEach < (0.8*p.MSRP);

# nomor 4
SELECT status FROM customers;
SELECT * FROM orderdetail;
SELECT * FROM customers; 


ALTER TABLE customers
ADD `status` VARCHAR(100) DEFAULT "Regular";

UPDATE customers 
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON orders.customerNumber = customers.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
SET customers.status                                                                                                                                                                   = 'VIP'
WHERE payments.amount > 100000 OR orderdetails.quantityOrdered > 50;

SELECT c.customerName, c.customerNumber, c.`status`
FROM customers AS c
JOIN payments AS p
ON c.customerNumber = p.customerNumber
JOIN orders AS o
ON o.customerNumber = c.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber;

Update customers
SET customers.Status = 'Regular'
WHERE customers.Status is NULL

# nomor 5
SELECT COLUMN_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name 
FROM information_schema. key_column_usage
WHERE TABLE_NAME = 'orders';

SELECT COLUMN_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name 
FROM information_schema. key_column_usage
WHERE TABLE_NAME = 'orderdetails';

SELECT COLUMN_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name 
FROM information_schema. key_column_usage
WHERE TABLE_NAME = 'customers';

ALTER TABLE orders DROP CONSTRAINT orders_ibfk_1;
ALTER TABLE orderdetails DROP CONSTRAINT orderdetails_ibfk_1;
ALTER TABLE payments DROP CONSTRAINT payments_ibfk_1; 

DELETE customers FROM customers
INNER JOIN orders 
ON customers.customerNumber = orders.customerNumber
WHERE orders.status = "cancelled"
