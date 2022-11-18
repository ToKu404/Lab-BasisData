-- no 1

use appseminar;

select * from 
(select m.nama, m.nim as "nim/nip", p.nama as "nama program studi" 
from ss_mahasiswa m
join ss_prodi p
on m.id_prodi = p.id_prodi
where p.nama = 'Ilmu Komputer'
union
select d.nama, d.nip, p.nama 
from ss_dosen d
join ss_prodi p
on d.id_prodi = p.id_prodi
where p.nama = 'Ilmu Komputer') as a
order by a.nama;

-- no 2

use appseminar;

select distinct d.nama, p.nama as prodi, "pembimbing utama" as riwayat from ss_dosen d
join ss_prodi p
using (id_prodi)
join ss_pembimbing g
on g.id_pembimbing_utama = d.id_dosen;

select nama, prodi, group_concat(riwayat) as riwayat from (
select distinct d.nama, p.nama as prodi, "pembimbing utama" as riwayat from ss_dosen d
join ss_prodi p
using (id_prodi)
join ss_pembimbing g
on g.id_pembimbing_utama = d.id_dosen
union
select distinct d.nama, p.nama as prodi, "pembimbing pertama" as riwayat from ss_dosen d
join ss_prodi p
using (id_prodi)
join ss_pembimbing g
on g.id_pembimbing_pertama = d.id_dosen
union
select distinct d.nama, p.nama as prodi, "penguji 1" as riwayat from ss_dosen d
join ss_prodi p
using (id_prodi)
join ss_penguji g
on g.id_penguji_1 = d.id_dosen
union
select distinct d.nama, p.nama as prodi, "penguji 2" as riwayat from ss_dosen d
join ss_prodi p
using (id_prodi)
join ss_penguji g
on g.id_penguji_2 = d.id_dosen) as z
group by nama, prodi
having prodi = 'Ilmu Komputer';


-- no 3
use classicmodels;

select count(customerName), city from (
select customerName, city from customers 
where customerName like "L%"
union
select e.firstName, o.city 
from employees e
join offices o
on e.officeCode = o.officeCode
where e.firstName like "L%") as a
group by city
order by count(customerName) desc
limit 1;
