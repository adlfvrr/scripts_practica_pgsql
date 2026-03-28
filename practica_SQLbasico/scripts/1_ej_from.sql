--Consignas
--Seleccionar todos los datos de la tabla actor
--Seleccionar solamente el primer nombre de la tabla actor
--Seleccionar el id de actor, nombre y apellido de actor

--Creamos la tabla
DROP TABLE IF EXISTS actor;

--Insert
INSERT INTO actor (first_name, last_name)
VALUES ('Ricardo', 'Darín');

INSERT INTO actor (first_name, last_name)
VALUES ('Meryl', 'Streep');

INSERT INTO actor (first_name, last_name)
VALUES ('Pedro', 'Pascal');

--Primera consigna
--Seleccionar todos los datos de la tabla actor
SELECT *
FROM actor;

--Seleccionar solamente el primer nombre de la tabla actor
SELECT first_name
FROM actor
LIMIT 1;

----Seleccionar el id de actor, nombre y apellido de actor
SELECT actor_id AS "Numero de serie", first_name AS "Nombre", last_name AS "Apellido"
FROM actor