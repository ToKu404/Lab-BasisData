#B #ALM0201 (Nomor 7)
select category.name `category name`,  (
	select count(film_category.film_id) 
	from film_category 
	where film_category.category_id = category.category_id) 
as `total movies` 
from category;

#D #TKH0201 (Nomor 1)
select count(*) 'jumlah pelanggan' from customer
join rental using (customer_id)
join inventory using (inventory_id)
join film using (film_id)
group by customer_id
having count(film_id) > (
    select avg(a) from (
        select count(film_id) as a from customer
        join rental using (customer_id)
        join inventory using (inventory_id)
        join film using (film_id)
        group by customer_id) as b)
order by count(*) desc limit 1;

#C #TKV0101 (Nomor 15)
select film.title from film 
join film_category on film.film_id = film_category.film_id 
join film_actor on film.film_id = film_actor.film_id 
where film_category.category_id like (
	select film_category.category_id from film 
    join film_category on film.film_id = film_category.film_id
	where film.title like 'PULP BEVERLY') 
and film_actor.actor_id like (
	select film_actor.actor_id from film 
	join film_actor on film_actor.film_id = film.film_id 
	where film.title like 'PULP BEVERLY' 
    limit 1)
order by film.title desc
limit 1;