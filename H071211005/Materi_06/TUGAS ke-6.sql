#no.1
SELECT customers.customerName as 'nama pelanggan', 
SUM(amount) as 'total belanja', customers.creditLimit as 'batas kredit', (SUM(amount)-creditLimit) as 'selisih'
FROM customers
inner join payments
on customers.customerNumber = payments.customerNumber
group by customerName
having sum(amount) > customers.creditLimit order by selisih  desc limit 5;

#no.2
select concat(c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName, '@', c.addressLine1) as pelanggan, 
sum(od.quantityOrdered) as 'jumlah orderan'
from customers as c
inner join orders as o
on c.customerNumber = o.customerNumber
inner join orderdetails as od
on o.orderNumber = od.orderNumber
group by c.customerName order by sum(quantityOrdered) desc limit 1;

#no.3
select date_format(paymentDate,  "%M %Y ") as 'hari pembayaran', count(c.customerName) as 'jumlah pelanggan', group_concat(customerName) as 'list pelanggan', sum(p.amount) as 'jumlah pembayaran'
from customers as c
inner join payments as p
on c.customerNumber = p.customerNumber
where month(paymentdate) = 2
group by `hari pembayaran` order by sum(p.amount) desc;


select upper(p.productName) as 'nama produk' , count(o.customerNumber) as 'jumlah diorder', 
group_concat(orderDate) as 'waktu orderan', p.buyPrice as 'harga beli', od.priceEach as 'harga jual', 
concat((sum(od.quantityOrdered *od.priceEach)),'-', sum(od.quantityOrdered * p.buyprice) , '=',(sum(od.quantityOrdered * od.priceEach)) - sum(od.quantityOrdered * p.buyprice))
as "pendapatan - modal = keuntungan"
from products as p
inner join orderdetails as od
on p.productCode = od.productCode
inner join orders as o
on od.orderNumber = o.orderNumber
where p.productCode = 'S12_1108'
group by priceEach
having `pendapatan - modal = keuntungan` > 5000 order by (sum(od.quantityOrdered * od.priceEach)) - sum(od.quantityOrdered * p.buyprice) desc;

select ofc.addressLine1 as 'alamat', concat(left(ofc.phone,char_length(ofc.phone)-6), "* ****") as 'no.telp', count(distinct e.employeeNumber) as 'Jumlah Karyawan', count(distinct c.customerNumber) as 'Jumlah Pelanggan', round(avg(p.amount),2) as 'rata-rata penghasilan'
from offices as ofc
left join employees as e
on e.officeCode = ofc.officeCode
left join customers as c
on c.salesRepEmployeeNumber = e.employeeNumber
left join payments as p 
on c.customerNumber = p.customerNumber
group by ofc.addressLine1 order by `rata-rata penghasilan` asc;

