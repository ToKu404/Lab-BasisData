USE appseminar

# nomor 3
SELECT d.nama, m.nama
FROM ss_mahasiswa AS m
JOIN ss_pembimbing AS p
USING (id_mahasiswa)
JOIN ss_dosen AS d
ON p.id_pembimbing_utama = d.id_dosen
WHERE m.nama = 'sulaeman';