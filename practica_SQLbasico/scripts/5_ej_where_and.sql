--Consignas
-- 1_De la tabla film seleccionar title y release_year siempre que rating 
--   sea ‘PG’ y rental_duration sea mayor a 5
-- 2_De la tabla film seleccionar film_id, title y rental_rate siempre 
--   que rental_rate sea mayor a 3 o rating sea ‘R’

-- 1_
SELECT title, release_year
FROM film
WHERE rating = 'PG' AND rental_duration > 5;

-- 2_
SELECT film_id, title, rental_rate
FROM film
WHERE rental_rate > 3 OR rating = 'R'
