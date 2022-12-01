-- nomor 3
USE appseminar;

SELECT ss_dosen.nama, ss_mahasiswa.nama FROM ss_pembimbing
INNER JOIN ss_dosen ON ss_dosen.id_dosen = ss_pembimbing.id_pembimbing_utama
INNER JOIN ss_mahasiswa ON ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
WHERE ss_mahasiswa.nama = 'Sulaeman';