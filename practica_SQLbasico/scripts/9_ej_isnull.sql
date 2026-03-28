--Consignas
--De la tabla rental encontrar alquileres sin devolución
--De la tabla address encontrar códigos postales vacíos
--De la tabla staff encontrar a qué empleado le falta la imagen

--Hacemos insert para poder hacer el ejercicio

--Tabla rental

INSERT INTO rental (rental_date, return_date, customer_id, inventory_id)
VALUES ('2005-05-24 22:53:30', '2005-05-26 22:04:30', 1, 1);

INSERT INTO rental (rental_date, return_date, customer_id, inventory_id)
VALUES ('2005-05-25 10:00:00', NULL, 2, 2);

INSERT INTO rental (rental_date, return_date, customer_id, inventory_id)
VALUES ('2005-05-28 14:30:00', '2005-05-30 15:00:00', 3, 3);

--Tabla _address

INSERT INTO _address (address, postal_code)
VALUES ('Calle Falsa 123', '3100');

INSERT INTO _address (address, postal_code)
VALUES ('Avenida Siempre Viva 742', NULL);

INSERT INTO _address (address, postal_code)
VALUES ('Ruta 12 Km 400', '3114');

--Tabla staff

INSERT INTO staff (first_name, last_name, picture)
VALUES ('Mike', 'Hillyer', E'\\x010203');

INSERT INTO staff (first_name, last_name, picture)
VALUES ('Jon', 'Stephens', NULL);

--De la tabla rental encontrar alquileres sin devolución

SELECT *
FROM rental
WHERE return_date IS NULL;

--De la tabla address encontrar códigos postales vacíos

SELECT *
FROM _address
WHERE postal_code IS NULL;

--De la tabla staff encontrar a qué empleado le falta la imagen

SELECT *
FROM staff
WHERE picture IS NULL;