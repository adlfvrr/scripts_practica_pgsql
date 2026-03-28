--Creo todas las tablas a partir de las consignas (Utilizo Gemini AI)
--Casi TODOS los INSERT fueron generados con AI, con el fín de ahorrar tiempo
--Comentarios dentro de las tablas creados por la AI

DROP TABLE IF EXISTS actor;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS film;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS rental;
DROP TABLE IF EXISTS _address;
DROP TABLE IF EXISTS staff;

CREATE TABLE actor (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) DEFAULT 'Sin ingresar'
);

CREATE TABLE film (
    film_id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    release_year INTEGER,
    rental_duration INTEGER, -- En días
    rental_rate NUMERIC(4,2), -- Precio de alquiler
    rating VARCHAR(10)        -- G, PG, PG-13, R, etc.
);

CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    amount NUMERIC(10,2),
    payment_date DATE
);

CREATE TABLE rental (
    rental_id SERIAL PRIMARY KEY,
    rental_date TIMESTAMP,
    return_date TIMESTAMP, -- Puede ser NULL para "sin devolución"
    customer_id INTEGER,
    inventory_id INTEGER
);

CREATE TABLE _address (
    address_id SERIAL PRIMARY KEY,
    address VARCHAR(255),
    postal_code VARCHAR(20) -- Puede estar vacío para el ejercicio de IS NULL
);

CREATE TABLE staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    picture BYTEA -- Columna de imagen (BLOB) para el ejercicio de IS NULL
);