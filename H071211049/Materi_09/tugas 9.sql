use classicmodels;
show variables like '%autocommit%';
set autocommit = 0;

-- no1
begin;
insert into orders 
values 	(10426, "2005-06-01", "2005-06-10", "2005-06-05", "shipped", null, 357),
		(10427, "2005-06-03", "2005-06-08", "2005-06-07", "shipped", null, 189),
		(10428, "2005-06-11", "2005-06-21", "2005-06-18", "shipped", null, 276);
        
insert into orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
values	(10426, "S12_3891", 14, 152.26, 4),
		(10427, "S10_4757", 17, 118.32 , 5),
		(10428, "S24_1937", 20, 27.88, 2);
        
commit;
-- select * from orderdetails;    
-- select * from orders;    

-- no2
begin;
delete from orderdetails;
rollback;