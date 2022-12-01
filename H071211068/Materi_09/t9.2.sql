-- no 1
set autocommit = off;
begin;
insert into orders
values("10426,"2005-05-28","2005-07-07",NULL,"In Process",NULL,"155"),
		("10427","2006-12-25","2007-12-16","2007-01-12","Shipped",NULL,"166"),
		-- ("10428","2007-05-05","2007-06-06",NULL,"In Process",NULL,"169");

insert into orderdetails
values("10101,"S18_4409","50","133.33","6"),
		-- ("10102","S17_412","22","123.46","7"),
		("10103","S16_543","33","14.55","8");



-- no 2
begin;
delete from orders;
select count(*) from orders;
rollback;
select count(*) from orders;

