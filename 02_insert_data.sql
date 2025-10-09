INSERT INTO customers (name, email, city, signup_date) VALUES
('Alice Gómez', 'alice@example.com', 'Monterrey', '2025-09-10'),
('Bob Rivera', 'bob@example.com', 'Guadalajara', '2025-09-15'),
('Carla Díaz', 'carla@example.com', 'CDMX', '2025-09-20'),
('Diego Luna', 'diego@example.com', 'Monterrey', '2025-09-25');

INSERT INTO products (name, price) VALUES
('Teclado Mecánico', 1299.90),
('Mouse Inalámbrico', 549.00),
('Monitor 24"', 3299.00),
('Base Laptop', 799.50);

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-10-01'),
(1, '2025-10-05'),
(2, '2025-10-03'),
(3, '2025-10-04');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 2, 1),
(3, 4, 1),
(4, 1, 1);

