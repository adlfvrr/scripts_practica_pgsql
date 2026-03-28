--Consignas
--De la tabla film buscar películas que empiezan con “A”
--De la tabla actor buscar apellidos de actores que terminan con “son”
--Ejercicio opcional
--Lo mismo que el anterior pero con ‘%SON’. ¿Funciona o nos falta algo?

--De la tabla film buscar películas que empiezan con “A”

SELECT *
FROM film
WHERE title LIKE 'A%';

--De la tabla actor buscar apellidos de actores que terminan con “son”

SELECT actor_id, last_name AS "Apellido"
FROM actor
WHERE last_name LIKE '%son';

--Hacemos insert para probar mejor el query

INSERT INTO actor (first_name, last_name)
VALUES ('Scarlett', 'Johansson');

INSERT INTO actor (first_name, last_name)
VALUES ('Johanna', 'Johansson');

--Para el ultimo ejercicio, funciona pero antes hay que castear el apellido a uppercase
SELECT *
FROM film
WHERE UPPER(title) LIKE '%SON'; 

--Hacemos insert para probar mejor el query
INSERT INTO film (title, release_year, rental_duration, rental_rate, rating)
VALUES ('Friday the 13th: Jason', 1980, 3, 2.50, 'R');