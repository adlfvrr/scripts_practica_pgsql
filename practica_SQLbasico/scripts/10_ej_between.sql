--Consignas
--De la tabla film buscar el rental_rate entre 2.00 y 4.00
--De la tabla film buscar los alquileres entre 3 y 5 días

--Ejercicio opcional
--De la tabla rental obtener rental_id y rental_date Entre 25/5/2005 y 30/5/2005

--De la tabla film buscar el rental_rate entre 2.00 y 4.00

SELECT *
FROM film
WHERE rental_rate BETWEEN 2 AND 4;

--De la tabla film buscar los alquileres entre 3 y 5 días

SELECT *
FROM film
WHERE rental_duration BETWEEN 3 AND 5;

--De la tabla rental obtener rental_id y rental_date Entre 25/5/2005 y 30/5/2005

SELECT rental_id, rental_date
FROM rental
WHERE rental_date BETWEEN '25-05-2005' AND '30-05-2005';