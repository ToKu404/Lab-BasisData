#no 1
SELECT ss_mahasiswa.nim, ss_mahasiswa.nama, ss_prodi.nama
FROM ss_mahasiswa
JOIN ss_prodi
ON ss_mahasiswa.id_prodi = ss_prodi.id_prodi
WHERE ss_prodi.nama = "Ilmu Komputer"
UNION
SELECT ss_dosen.nip, ss_dosen.nama, ss_prodi.nama
FROM ss_dosen
JOIN ss_prodi
ON ss_dosen.id_prodi = ss_prodi.id_prodi 
WHERE ss_prodi.nama = "Ilmu Komputer";

#no2
SELECT `Nama Dosen`, `Nama Prodi`, GROUP_CONCAT(stat) AS `Riwayat Status`
FROM (
		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
			SELECT 'Penguji 1' WHERE ss_penguji.id_penguji_1 = ss_dosen.id_dosen) AS stat
		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji 
		UNION 
		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
			SELECT 'Penguji 2' WHERE ss_penguji.id_penguji_2 = ss_dosen.id_dosen) AS stat
		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji
		UNION 
		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
			SELECT 'Penguji 3' WHERE ss_penguji.id_penguji_3 = ss_dosen.id_dosen) AS stat
		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji
		UNION 
		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
			SELECT 'Pembimbing Utama' WHERE ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen) AS stat
		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_pembimbing
		UNION 
		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
			SELECT 'Pembimbing Pertama' WHERE ss_pembimbing.id_pembimbing_pertama = ss_dosen.id_dosen) AS stat
		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_pembimbing
		UNION 
		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
			SELECT 'Pembimbing Kedua' WHERE ss_pembimbing.id_pembimbing_kedua = ss_dosen.id_dosen) AS stat
		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_pembimbing
	) AS riwayat
GROUP BY `Nama Dosen`
HAVING `Riwayat Status` IS NOT NULL 
ORDER BY `Nama Dosen` DESC;
	
#no3
SELECT city
FROM (
		SELECT employees.firstName, offices.city
			FROM employees
			JOIN offices
			ON employees.officeCode = offices.officeCode
			WHERE employees.firstName LIKE 'L%'
		UNION 
		SELECT customerName, city
			FROM customers
			WHERE customerName LIKE 'L%' 
			
			) AS A		
	GROUP BY city 
	ORDER BY COUNT(city) DESC
	LIMIT 1;



 
	

