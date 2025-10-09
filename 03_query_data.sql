SET enable_hashjoin = OFF;
SET enable_mergejoin = OFF;
 
EXPLAIN ANALYZE
SELECT c.name, o.order_date, p.name AS product_name, oi.quantity
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;
