--Consignas
--Empleando alias, seleccionar first_name renombrándolo como nombre y last_name como apellido de la tabla customer
--Seleccionar title como título, rental_rate como tarifa de film

--Creamos tabla
DROP TABLE IF EXISTS customer;


--Insert
INSERT INTO customer (first_name, last_name, email)
VALUES ('Marcos', 'García', 'marcos.garcia@email.com');

INSERT INTO customer (first_name, last_name)
VALUES ('Lucía', 'Fernández');

INSERT INTO customer (first_name, last_name, email)
VALUES ('Julián', 'Sánchez', 'julian.s@email.com');

--Primera consigna
--Empleando alias, seleccionar first_name renombrándolo como nombre y last_name como apellido de la tabla customer
SELECT first_name AS "Nombre", last_name AS "Apellido" 
FROM customer;

--Segunda consigna
--Insert
INSERT INTO film (title, release_year, rental_duration, rental_rate, rating)
VALUES ('Inception', 2010, 3, 2.99, 'PG-13');

INSERT INTO film (title, release_year, rental_duration, rental_rate, rating)
VALUES ('Toy Story', 1995, 6, 4.99, 'PG');

INSERT INTO film (title, release_year, rental_duration, rental_rate, rating)
VALUES ('The Matrix', 1999, 5, 3.50, 'R');

INSERT INTO film (title, release_year, rental_duration, rental_rate, rating)
VALUES ('Avatar', 2009, 4, 4.99, 'G');

INSERT INTO film (title, release_year, rental_duration, rental_rate, rating)
VALUES ('Finding Nemo', 2003, 7, 1.99, 'G');

SELECT title AS "Título", rental_rate AS "Tarifa de film"
FROM film;