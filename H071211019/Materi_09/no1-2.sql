-- 1
SET autocommit = 0;
START TRANSACTION;

INSERT INTO orders (orders.orderNumber, orders.customerNumber) 
	VALUES 	
		(66666, 121),
		(69420, 112),
 		(99999, 145);
		
INSERT INTO orderdetails (orderdetails.orderNumber, orderdetails.productCode) 
	VALUES 
		(66666, 'S10_1678'),
	 	(69420, 'S24_3949'),
	 	(99999, 'S700_2466');

COMMIT;

-- 2
SET autocommit = 0;
START TRANSACTION;
DELETE FROM orderdetails;

ROLLBACK;