USE sakila;
#paket A no 11 #TKM0201
select concat(left(first_name,1), lower(substr(first_name,2)) ," ", left(last_name,1), lower(substr(last_name,2))) as `nama pelanggan`,
count(category.name) as `jumlah film`
from customer
join rental using (customer_id)
join inventory using (inventory_id)
join film using (film_id)
join film_category using (film_id)
join category using (category_id)
where name = "Horror" or name = "Comedy"
group by  `nama pelanggan`
order by `jumlah film` desc limit 3; 

#paket b no 4 
Tampilkan seluruh bahasa serta berapa banyak film yang menggunakan bahasa-bahasa 
tersebut!
select l.name, count(f.language_id)
from language as l
left join film as f
using (language_id)
group by l.name;


-- 
#paket c no 15 #TKV0101
select title, group_concat(concat(first_name, " ", last_name))
from category
join film_category using (category_id)
join film using(film_id)
join film_actor using (film_id)
join actor using (actor_id)
where name ='horror' and actor_id in
( select actor_id
from category
join film_category using (category_id)
join film using(film_id)
join film_actor using (film_id)
join actor using (actor_id)
where title = 'pulp beverly')
group by title limit 1; 

