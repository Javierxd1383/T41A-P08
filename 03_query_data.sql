SELECT c.id, c.name, o.id AS order_id, o.order_date
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
ORDER BY c.id, o.order_date;

SELECT o.id AS order_id, o.order_date, c.name AS customer_name,
       p.name AS product_name, oi.quantity, p.price,
       (oi.quantity * p.price) AS line_total
FROM orders o
JOIN customers c ON c.id = o.customer_id
JOIN order_items oi ON oi.order_id = o.id
JOIN products p ON p.id = oi.product_id
ORDER BY o.id, p.name;

SELECT c.id, c.name,
       COALESCE(SUM(oi.quantity * p.price), 0)::NUMERIC(12,2) AS total_spent
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
LEFT JOIN order_items oi ON oi.order_id = o.id
LEFT JOIN products p ON p.id = oi.product_id
GROUP BY c.id, c.name
ORDER BY total_spent DESC, c.id;

