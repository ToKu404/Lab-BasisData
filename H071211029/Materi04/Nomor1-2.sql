USE classicmodels;

-- nomor 1
SELECT orders.orderDate, products.productName FROM orderdetails
INNER JOIN orders ON orderdetails.orderNumber = orders.orderNumber
INNER JOIN products ON orderdetails.productCode = products.productCode
WHERE productName  = '1940 Ford Pickup Truck';

-- nomor 2
SELECT products.productCode, products.productName, products.MSRP * 0.8 AS '80% MSRP' , orderdetails.priceEach FROM products
INNER JOIN orderdetails ON products.productCode = orderdetails.productCode
WHERE orderdetails.priceEach < (0.8*products.MSRP);