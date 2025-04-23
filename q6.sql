SELECT 
    c.city, 
    COUNT(CASE WHEN cu.active = 1 THEN 1 END) AS active, 
    COUNT(CASE WHEN cu.active = 0 THEN 1 END) AS inactive
FROM 
    city c
JOIN 
    address a ON c.city_id = a.city_id
JOIN 
    customer cu ON a.address_id = cu.address_id
GROUP BY 
    c.city
ORDER BY 
    inactive DESC;
