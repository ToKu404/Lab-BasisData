USE classicmodels;

SELECT customers.customerName,
       (customers.creditLimit - SUM(orderdetails.quantityOrdered * orderdetails.priceEach)) AS 'total',
CASE 
WHEN (customers.creditLimit - SUM(orderdetails.quantityOrdered * orderdetails.priceEach)) > 0 THEN "you are safe"
WHEN (customers.creditLimit - SUM(orderdetails.quantityOrdered * orderdetails.priceEach)) < 0 THEN "you are in debt"
ELSE 'you are running out of credits'
END 

AS "are you safe?"
FROM customers
JOIN orders USING (customerNumber)
JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber
GROUP BY customers.customerNumber;