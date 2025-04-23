SELECT 
    city,
    category_name,
    total_rental_hours
FROM (
    SELECT 
        ci.city,
        c.name AS category_name,
        SUM(f.rental_duration) AS total_rental_hours,
        RANK() OVER (PARTITION BY ci.city ORDER BY SUM(f.rental_duration) DESC) AS rank
    FROM 
        category c
        JOIN film_category fc ON c.category_id = fc.category_id
        JOIN film f ON fc.film_id = f.film_id
        JOIN inventory i ON f.film_id = i.film_id
        JOIN rental r ON i.inventory_id = r.inventory_id
        JOIN customer cu ON r.customer_id = cu.customer_id
        JOIN address a ON cu.address_id = a.address_id
        JOIN city ci ON a.city_id = ci.city_id
    WHERE 
        ci.city LIKE 'a%' OR ci.city LIKE '%-%'
    GROUP BY 
        ci.city, c.name
) ranked_data
WHERE 
    rank = 1
ORDER BY 
    city;