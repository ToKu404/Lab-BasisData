
USE classicmodels;

-- nomor1
SELECT * FROM offices where city="San Francisco";
SELECT * FROM offices where city IN  ( "San Francisco");

-- nomor2
SELECT * FROM  orderdetails WHERE quantityOrdered > 70 ORDER BY  orderLineNumber ASC ;

-- nomor3
SELECT   DISTINCT productLine  FROM products 

-- nomor4
SELECT customerNumber nomorPelanggan,customerName namaPelanggan FROM customers WHERE customerNumber >100 AND customerNumber < 150;
  SELECT customerNumber nomorPelanggan,customerName namaPelanggan FROM customers WHERE customerNumber BETWEEN  100 AND  150 ;
  
-- nomor5
  SELECT * FROM customers WHERE country != 'USA'   AND creditLimit= 0 ORDER BY customerName LIMIT 9,10 ;
  
-- latihan
  SELECT * FROM  orderdetails WHERE quantityOrdered = 50 OR  priceEach >100  ORDER BY  priceEach DESC  LIMIT 7;

  