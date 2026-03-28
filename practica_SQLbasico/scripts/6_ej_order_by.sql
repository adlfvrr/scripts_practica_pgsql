--Consignas
--De la tabla film ordenar title y release_year por title
--De la tabla customer ordenar first_name y last_name (descendente)

--De la tabla film ordenar title y release_year por title
SELECT title, release_year
FROM film
ORDER BY title;

--De la tabla customer ordenar first_na	me y last_name (descendente)
SELECT *
FROM customer
ORDER BY first_name DESC, last_name DESC;