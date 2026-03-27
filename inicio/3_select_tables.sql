--REALIZO 3 EJERCICIOS BASICOS DE SELECCIÓN DE DATOS, DADOS POR GEMINI AI
--1 SELECCIONAR TODOS LOS PRODUCTOS DE LA CATEGORÍA 'ELECTRÓNICA'
SELECT * FROM Products WHERE category = 'Electrónica';
--2 SE IMPLEMENTA JOIN, MOSTRAR NOMBRE DEL PRODUCTO Y LA FECHA DE TODAS LAS VENTAS REALIZADAS
SELECT p.product_name, s.sale_date
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id;
--3 CALCULAR DINERO TOTAL GANADO
SELECT p.product_name, p.price, s.quantity, SUM(s.quantity * p.price) AS total
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name, p.price, s.quantity;

--EJERCICIO PARA REFORZAR 
--CALCULAR PROMEDIO DE LO VENDIDO
SELECT p.product_name, AVG(s.quantity) AS prom_sell
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;