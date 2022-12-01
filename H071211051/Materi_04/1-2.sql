-- 1. Tampilkan kolom tanggal pemesanan product dalam urutan menurun untuk pesanan Ford Pickup Truck 1940
-- DATABASE classicmodels
SELECT o.orderDate AS 'tanggal pemesanan', p.productName AS 'produk'
FROM orders AS o
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p
ON od.productCode = p.productCode
WHERE od.productCode = 'S18_1097' ORDER BY 'tanggal pemesanan' DESC;

-- 2.tampilkan daftar nama produk yang dijual dengan harga kurang dari 80% dari MSRP (harga eceran yang disarankan)
SELECT p.productName AS 'Nama Produk', od.priceEach AS 'Harga', p.MSRP*0.8 AS '80% MSRP'
FROM products AS p
JOIN orderdetails AS od
WHERE od.priceEach < p.MSRP*0.8;

-- 3. Tampilkan pembimbing utama dari mahasiswa bernama sulaeman! (DATABASE appseminar)
SELECT m.nama AS 'Nama Mahasiswa', p.id_pembimbing_utama, d.nama AS 'Nama Dosen'
FROM ss_mahasiswa AS m
JOIN ss_pembimbing AS p
ON m.id_mahasiswa = p.id_mahasiswa
INNER JOIN ss_dosen AS d
ON p.id_pembimbing_utama = d.id_dosen
WHERE p.id_mahasiswa = 288;


