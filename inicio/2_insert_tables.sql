INSERT INTO products (product_name, category, price) VALUES
('Laptop Pro', 'Electrónica', 1200.50),
('Mouse Ergonómico', 'Accesorios', 25.00),
('Monitor 4K', 'Electrónica', 350.00),
('Teclado Mecánico', 'Accesorios', 80.00);

INSERT INTO sales (product_id, quantity, sale_date) VALUES
(1, 1, '2026-03-20'),
(2, 2, '2026-03-21'),
(3, 1, '2026-03-22'),
(2, 3, CURRENT_DATE),
(1, 1, CURRENT_DATE);

SELECT * FROM products;
SELECT * FROM sales;