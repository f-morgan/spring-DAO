SELECT product_name FROM orders o
JOIN customers c on c.id = o.customer_id
WHERE lower(name) = lower(:name)
ORDER BY o.date DESC
LIMIT 1
