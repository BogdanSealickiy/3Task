SELECT * 
FROM
(SELECT a.first_name, a.last_name, COUNT(*) AS films_count, RANK() OVER (ORDER BY COUNT(*) DESC) AS film_rank
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film_category fc ON fa.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Children'
GROUP BY a.actor_id) f
WHERE film_rank <=3
