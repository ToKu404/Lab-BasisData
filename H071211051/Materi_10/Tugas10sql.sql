SELECT c.customerName,
case 
	when
	(c.creditLimit-SUM(od.quantityOrdered*od.priceEach)) > 0 then 'you are safe'
	when
	(c.creditLimit-SUM(od.quantityOrdered*od.priceEach)) < 0 then 'you are in debt'
	ELSE 'you are running out of credits'
END AS 'are you safe?',  (c.creditLimit-SUM(od.quantityOrdered*od.priceEach)) AS 'Total'
FROM customers AS c
INNER JOIN orders o
ON  c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
GROUP BY c.customerName
ORDER BY 'are you safe?' DESC 