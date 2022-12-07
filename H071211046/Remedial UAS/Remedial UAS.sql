#8 #AWM0101

SELECT c.name AS Category, f.title as Title
FROM category AS c
JOIN film_category AS fc
USING(category_id)
JOIN film AS f
USING(film_id)
WHERE LEFT(f.title, 1) IN ('A', 'I', 'U', 'E', 'O')
ORDER BY RIGHT(f.title, 2) ASC;

#13 #AZV0101

SELECT f.title, c.name AS genre
FROM category AS c
JOIN film_category AS fc
USING(category_id)
JOIN film AS f
USING(film_id)
JOIN inventory AS i
USING(film_id)
JOIN rental AS r
USING(inventory_id)
JOIN customer AS ct
USING(customer_id)
WHERE f.title NOT IN 
(
SELECT f.title
FROM category AS c
JOIN film_category AS fc
USING(category_id)
JOIN film AS f
USING(film_id)
JOIN inventory AS i
USING(film_id)
JOIN rental AS r
USING(inventory_id)
JOIN customer AS ct
USING(customer_id)
WHERE ct.customer_id = 375
GROUP BY f.title
)
GROUP BY f.title;

#15 #TKV0101

SELECT f.title AS `Movies similiar to Pulp Beverly`
FROM category AS c
JOIN film_category AS fc
USING(category_id)
JOIN film AS f
USING(film_id)
JOIN film_actor AS fa
USING(film_id)
JOIN actor AS a
USING(actor_id)
WHERE c.name = 'Horror' AND
concat(a.first_name, ' ', a.last_name) = 'KIRSTEN PALTROW' | 'DUSTIN TAUTOU' | 'SUSAN DAVIS' | 'WARREN NOLTE' | 'GRETA KEITEL' | 'WHOOPI HURT' | 'ANGELA WITHERSPOON'
GROUP BY f.title;
