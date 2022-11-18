
#no.1 
select ss_mahasiswa.nama as Nama, ss_mahasiswa.nim as 'Nim/Nip', ss_prodi.nama as Prodi, "Mahasiswa" as Type
from ss_mahasiswa
inner join ss_prodi
on ss_mahasiswa.id_prodi = ss_prodi.id_prodi
where ss_prodi.nama like "%komputer"
union
select ss_dosen.nama, ss_dosen.nip, ss_prodi.nama, "Dosen"
from ss_dosen
inner join ss_prodi
on ss_dosen.id_prodi = ss_prodi.id_prodi
where ss_prodi.nama like "%komputer";

#no.2
select linenama.nama as 'Nama', ss_prodi.nama as 'Prodi', group_concat(status) as "Riwayat Status"
from 
(select ss_dosen.nama as nama, 'Pembimbing Utama' as 'status'
from ss_dosen
inner join ss_pembimbing
on ss_dosen.id_dosen = ss_pembimbing.id_pembimbing_utama
union
select ss_dosen.nama as nama, 'Pembimbing Pertama' as 'status'
from ss_dosen
inner join ss_pembimbing
on ss_dosen.id_dosen = ss_pembimbing.id_pembimbing_pertama
union
select ss_dosen.nama as nama, 'Penguji 1' as 'status'
from ss_dosen
inner join ss_penguji
on ss_dosen.id_dosen = ss_penguji.id_penguji_1
union
select ss_dosen.nama as nama, 'Penguji 2' as 'status'
from ss_dosen
inner join ss_penguji
on ss_dosen.id_dosen = ss_penguji.id_penguji_2) as linenama
inner join ss_dosen
on ss_dosen.nama = linenama.nama
left join ss_prodi
on ss_dosen.id_prodi = ss_prodi.id_prodi
group by linenama.nama
order by linenama.nama desc;

#no.3
select  city as Kota
from (
select count(e.firstName) as 'nama', ofc.city
from employees as e
natural join offices as ofc
where e.firstName like "L%"
group by ofc.city
union 
select count(customers.customerName), city
from customers
where customerName like "L%"
group by city) as linenama
group by city
order by sum(nama) desc limit 1;








