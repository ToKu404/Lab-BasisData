-- nomor 1
begin;

insert into orders values (10426, '2002-11-23', '2002-11-23', '2002-11-23', 'Shipped', null, 145),
(10427, '2002-11-23', '2002-11-23', '2002-11-23', 'Shipped', null, 363),
(10428, '2002-11-23', '2002-11-23', '2002-11-23', 'Shipped', null, 131);

insert into orderdetails values (10200, 'S24_3969', 21, 61, 4),
(10101, 'S18_2248', 30, 15, 1),
(10102, 'S10_4962', 50, 108, 8);

commit;

-- nomor 2
begin;

delete from orderdetails;

rollback;