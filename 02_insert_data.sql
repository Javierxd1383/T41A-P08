INSERT INTO customers (name, email, city, signup_date) VALUES
('Alice', 'alice@example.com', 'New York', '2023-01-01'),
('Bob', 'bob@example.com', 'Los Angeles', '2023-02-15');
 
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2023-03-01'),
(2, '2023-03-05');
 
INSERT INTO products (name, price) VALUES
('Product A', 10.00),
('Product B', 20.00);
 
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),  -- Alice bought 2 of Product A
(1, 2, 1),  -- Alice bought 1 of Product B
(2, 2, 3);  -- Bob bought 3 of Product B
