SELECT a.first_name, a.last_name, COUNT(*)
FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id
JOIN inventory i
ON fa.film_id = i.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY COUNT(*) DESC
LIMIT 10