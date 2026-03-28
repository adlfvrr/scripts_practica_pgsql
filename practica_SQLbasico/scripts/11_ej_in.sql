--Consignas
--Buscar peliculas que se encuentren en G, PG, PG-13.
--¿Cómo puede hacer la misma consulta sin emplear IN?

--Buscar actores con apellido Johansson, Berry y Cage


--Buscar peliculas que se encuentren en G, PG, PG-13 (CON IN).


SELECT *
FROM film
WHERE rating IN ('G', 'PG', 'PG-13');

-- SIN IN

SELECT *
FROM film
WHERE rating = 'G' OR rating = 'PG' OR rating = 'PG-13';

--Buscar actores con apellido Johansson, Berry y Cage

SELECT *
FROM actor
WHERE last_name IN ('Johansson', 'Berry', 'Cage');