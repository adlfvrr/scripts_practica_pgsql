--Consignas
--De la tabla film seleccionar title y release_year siempre que el rating sea ‘PG-13’
--De la tabla actor seleccionar first_name y last_name siempre que last_name sea Johansson

--De la tabla film seleccionar title y release_year siempre que el rating sea ‘PG-13’
SELECT title, release_year
FROM film
WHERE rating = 'PG-13';

--De la tabla actor seleccionar first_name y last_name siempre que last_name sea Johansson
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Johansson'

--No hubo insert con Johansson