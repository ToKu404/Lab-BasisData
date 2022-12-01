-- SELECT * FROM employees

#Nomor 1
#menambahkan 3 orang employee baru pada tabel employees
#salah satu nama employee merupakan nama anda
-- INSERT INTO employees (`employeeNumber`, `lastName`, `firstName`, `extension`, `email`, `officeCode`, `reportsTo`, `jobTitle`)
-- VALUES
-- (1403, 'Jihoon', 'Park', 'x1001', 'honny@classicmodelcars.com', '6', 1056, 'Sales Rep'),
-- (0909, 'Junkyu', 'Kim', 'x102', 'kimkyu@classicmodelcars.com', '7', 1102, 'Sales Rep'),
-- (1802, 'Junghwan', 'So', 'x207', 'kingcow@classicmodelcars.com', '4', 1621, 'Sales Rep');

#Nomor 2
#membuat query untuk memindahkan karyawan berjabatan Sales rep
#dari kantor 4, ke kantor yang baru
-- UPDATE employees
-- SET `officeCode`='new'
-- WHERE `officeCode`='4' AND `jobTitle`='Sales Rep';