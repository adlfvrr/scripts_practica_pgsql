--Consignas
--De la tabla actor seleccionar Apellidos de actores únicos

SELECT DISTINCT last_name AS "Apellido"
FROM actor;

--Probamos hacer un insert repitiendo un apellido

INSERT INTO actor (first_name, last_name)
VALUES ('Matias', 'Pascal');

SELECT DISTINCT last_name AS "Apellido"
FROM actor;

SELECT * 
FROM actor;