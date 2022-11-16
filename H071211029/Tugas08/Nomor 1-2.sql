use appseminar;

-- nomor 1
(select nama, (select nama from ss_prodi where id_prodi = 'H07') as prodi, nim from ss_mahasiswa
where id_prodi = 'H07')
union
(select nama, (select nama from ss_prodi where id_prodi = 'H07') as prodi, nip from ss_dosen
where id_prodi = 'H07');

-- nomor 2
select nama, prodi, nip, group_concat(riwayat) from 
(select distinct ss_dosen.nama, ss_prodi.nama as prodi, nip, 'pembimbing utama' as riwayat from ss_dosen
left join ss_prodi on ss_prodi.id_prodi = ss_dosen.id_prodi
left join ss_pembimbing on ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen
union
select distinct ss_dosen.nama, ss_prodi.nama as prodi, nip, 'pembimbing pertama' as riwayat from ss_dosen
left join ss_prodi on ss_prodi.id_prodi = ss_dosen.id_prodi
left join ss_pembimbing on ss_pembimbing.id_pembimbing_pertama = ss_dosen.id_dosen
union
select distinct ss_dosen.nama, ss_prodi.nama as prodi, nip, 'penguji 1' as riwayat from ss_dosen
left join ss_prodi on ss_prodi.id_prodi = ss_dosen.id_prodi
left join ss_penguji on ss_penguji.id_penguji_1 = ss_dosen.id_dosen
union 
select distinct ss_dosen.nama, ss_prodi.nama as prodi, nip, 'penguji 2' as riwayat from ss_dosen
left join ss_prodi on ss_prodi.id_prodi = ss_dosen.id_prodi
left join ss_penguji on ss_penguji.id_penguji_2 = ss_dosen.id_dosen) as a
group by nama, prodi, nip
order by nama desc;