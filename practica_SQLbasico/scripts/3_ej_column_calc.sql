--Consignas
-- 1_ Seleccionar film_id, title, rental_duration, 
--creando una columna calculada que toma el contenido de 
--rental_duration y le concatena la cadena ‘ días’ y renombrando como duracion_alquiler de film

-- 2_ Seleccionar de la tabla fim film_id, title, rental_rate, creando la columna calculada a partir de
--rental_rate que le suma el 21% de IVA llamándola tarifa_con_iva. 
--(Se sugiere calcular el iva sumándo al valor de la columna realizando la multiplicación por 1.21)

-- 3_ Seleccionar de la tabla payment payment_id, customer_id, amount, y 
--crear una columna calculada que suma el 10% de propina a amount, llamándola total_mas_propina

-- 1_

--Insert a payment
INSERT INTO payment (customer_id, amount, payment_date)
VALUES (1, 15.50, '2026-03-25');

INSERT INTO payment (customer_id, amount, payment_date)
VALUES (2, 20.00, '2026-03-26');

INSERT INTO payment (customer_id, amount, payment_date)
VALUES (3, 45.75, '2026-03-27');

--

SELECT film_id, title, rental_duration || ' dias' AS "duracion_alquiler" 
FROM film

--2_
SELECT film_id, title, rental_rate, TRUNC(rental_rate * 1.21, 2) AS "tarifa_con_iva"
FROM film;

--3_
SELECT payment_id, customer_id, amount AS "total", TRUNC(amount * 1.1, 2) AS "total_mas_propina"
FROM payment;