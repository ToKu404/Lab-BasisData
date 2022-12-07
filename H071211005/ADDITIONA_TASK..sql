-- (MEDIUM) #TKM0201

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

select distinct 
case 
when timestampdiff(second, last_update, '2006-02-23 05:00:00') < 60  then concat("terakhir di update ", timestampdiff(second, last_update, '2006-02-23 05:00:00'), " detik yang lalu")
when timestampdiff(minute, last_update, '2006-02-23 05:00:00') < 60  then concat("terakhir di update ", timestampdiff(minute, last_update, '2006-02-23 05:00:00'), " menit yang lalu")
when timestampdiff(day, last_update, '2006-02-23 05:00:00') > 7  then concat("terakhir di update ", timestampdiff(day, last_update, '2006-02-23 05:00:00'), " jam yang lalu")
else concat(dayname(last_update) ," ", day(last_update), " , ", monthname(last_update), " ", year(last_update))
end as `terakhir update` , action from  (select last_update , concat('perubahan pada data', " ", "payment") as action
from payment
union
select last_update, concat('perubahan pada data', " ", "rental") as action
from rental 
union
select last_update,concat('perubahan pada data', " ", "inventory") as action
from inventory
union 
select last_update,concat('perubahan pada data', " ", "film") as action
from film 
union 
select last_update, concat('perubahan pada data', " ", "actor") as action
from actor ) as a
order by a.last_update desc;


-- (VERY HARD) #TKV0101
-- Toku merupakan salah satu pelanggan yang ingin merental film, namun karena terlalu 
-- banyak pilihan, Toku meminta rekomendasi film yang mungkin dia sukai. Sebelumnya toku 
-- memberitahukan bahwa dia suka menonton film PULP BEVERLY. Kamu diminta untuk 
-- menampilkan 1 rekomendasi film untuk toku berdasarkan kesamaan Genre dan Artis dari
-- film yang dia sukai

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






