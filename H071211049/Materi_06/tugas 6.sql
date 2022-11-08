use classicmodels;

-- no 1
select customerName as `Nama Pelanggan`, sum(amount) as `Total Belanja`, 
creditLimit as `Batas Kredit`, sum(amount)-creditLimit as `Selisih` from customers 
join payments on payments.customerNumber = customers.customerNumber
group by customerName 
having sum(amount) > creditLimit
order by sum(amount)-creditLimit desc;

-- no 2
select concat(customerName, ' : ', contactFirstName, contactLastName, '@', addressLine1) as `Pelanggan`, 
sum(quantityOrdered) as `Jumlah Orderan` from customers
join orders on orders.customerNumber = customers.customerNumber
join orderdetails on orderdetails.orderNumber = orders.orderNumber
group by customerName
order by sum(quantityOrdered) desc
limit 1;

-- no 3
select date_format(paymentDate,'%M %Y') as `Hari Pembayaran`,
count(customers.customerName) as `Jumlah Pelanggan`,
group_concat(distinct customers.customerName) as `List Pelanggan`,
sum(payments.amount) as `Jumlah Pembayaran` from payments
inner join customers on payments.customerNumber = customers.customerNumber
where month(paymentDate) = 02
group by `Hari Pembayaran`
order by `Jumlah Pembayaran` desc;

-- no 4
select upper(productName) as `Nama Produk`,
count(distinct orderDate) as `Jumlah di Order`, 
group_concat(orderDate) as `Waktu Orderan`,
buyPrice as `Harga Beli`,
priceEach as `Harga Jual`,
sum(quantityOrdered) as `Total Jumlah Orderan`,
concat(orderdetails.priceEach*sum(quantityOrdered), ' - ', buyPrice*sum(quantityOrdered), ' = ', 
orderdetails.priceEach*sum(quantityOrdered)-buyPrice*sum(quantityOrdered)) as `Pendapatan - Modal = Keuntungan` from products
join orderdetails on products.productCode = orderdetails.productCode
join orders on orderdetails.orderNumber = orders.orderNumber
join customers on orders.customerNumber = customers.customerNumber
where productName like '%enzo%'
group by productName, priceEach, buyPrice
having sum(orderdetails.priceEach*quantityOrdered)-sum(buyPrice*quantityOrdered) > 5000
order by sum(orderdetails.priceEach*quantityOrdered)-sum(buyPrice*quantityOrdered) desc;

-- no 5
select offices.addressLine1 as `Alamat`,
concat(left(offices.phone,char_length(offices.phone)-6),'* ****') as `Nomor Telp`,
count(distinct employees.firstName) as `Jumlah Karyawan`,
count(distinct customers.customerName) as `Jumlah Pelanggan`,
round(avg(amount),2) as `Rata-rata Penghasilan` from offices
inner join employees on offices.officeCode = employees.officeCode
left join customers on employees.employeeNumber = customers.salesRepEmployeeNumber
left join payments on customers.customerNumber = payments.customerNumber
group by offices.phone, offices.addressLine1;
