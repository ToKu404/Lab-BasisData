USE classicmodels;

-- nomor 4
ALTER TABLE customers
ADD status VARCHAR (255);

UPDATE orderdetails 
JOIN orders ON orderdetails.orderNumber = orders.orderNumber
JOIN payments ON orders.customerNumber = payments.customerNumber
JOIN customers ON payments.customerNumber = customers.customerNumber
SET customers.`status` = 'VIP'
WHERE (orderdetails.quantityOrdered >= 50) OR (payments.amount > 100000);

UPDATE customers
SET STATUS = 'Regular'
WHERE STATUS != 'VIP' OR STATUS IS NULL;

-- nomor 5
SHOW CREATE TABLE payments;
ALTER TABLE payments
DROP CONSTRAINT payments_ibfk_1;

SHOW CREATE TABLE orders;
ALTER TABLE orders
DROP CONSTRAINT orders_ibfk_1;

DELETE customers FROM customers
INNER JOIN orders ON orders.customerNumber = customers.customerNumber
WHERE orders.status = 'Cancelled';