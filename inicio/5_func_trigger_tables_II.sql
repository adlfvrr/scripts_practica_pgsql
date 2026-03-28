--EJEMPLO DADO DE GEMINI, TABLA DE AUDITORÍA
--OBJETIVO: NO COPIARLO TAL CUAL, IR VIENDO SOBRE LA MARCHA
CREATE TABLE historial_precios (
    id SERIAL PRIMARY KEY,
    product_id INTEGER,
    precio_viejo NUMERIC,
    precio_nuevo NUMERIC,
    fecha_cambio TIMESTAMP DEFAULT now()
); --ESTA SI LA COPIAMOS

SELECT * FROM historial_precios;

--CREAMOS FUNCIÓN

CREATE OR REPLACE FUNCTION fn_auditar_precio() 
RETURNS TRIGGER AS
$$
    BEGIN
        IF NEW.price <> OLD.price THEN
        INSERT INTO historial_precios(product_id, precio_viejo, precio_nuevo) VALUES
        (OLD.product_id, OLD.price, NEW.price);
        END IF;
    RETURN NEW;
    END;
$$
LANGUAGE plpgsql

CREATE TRIGGER trigger_cambio_precio
AFTER UPDATE ON products
FOR EACH ROW
EXECUTE FUNCTION fn_auditar_precio();
--
--TESTEAMOS
SELECT * FROM historial_precios;

--ACCIONAMOS EL UPDATE PARA QUE ACTÚE EL TRIGGER
UPDATE products SET price = 300.00 WHERE product_id = 1;

--CORROBORAMOS
SELECT * FROM historial_precios;

--PROBAMOS CREAR UNO NOSOTROS

CREATE TABLE productos_borrados(
    Id SERIAL,
    product_id INTEGER,
    product_name VARCHAR(50),
    product_price NUMERIC,
    delete_date DATE DEFAULT now(),
    PRIMARY KEY(Id)
);

--VEMOS LA TABLA VIEJA, TODO CREADO
SELECT * FROM productos_borrados;

CREATE OR REPLACE FUNCTION fn_auditar_delete_producto()
RETURNS TRIGGER AS
$$
    BEGIN
        INSERT INTO productos_borrados(product_id, product_name, product_price)
        VALUES(OLD.product_id, OLD.product_name, OLD.price);
    RETURN NEW;
    END;
$$
LANGUAGE plpgsql

CREATE TRIGGER trigger_delete_productos
AFTER DELETE ON products
FOR EACH ROW
EXECUTE FUNCTION fn_auditar_delete_producto();

--SELECCIONAMOS PRODUCT A BORRAR
SELECT * FROM products;

--BORRAMOS PRIMERO PARA EVITAR ERRORES POR LA FK
DELETE FROM sales
WHERE product_id = 2;

--BORRAMOS PRODUCT
DELETE FROM products
WHERE product_id = 2;

--EXITO, LOGRAMOS UNA FUNCTION JUNTO A UN TRIGGER SIN AYUDA ADICIONAL (SOLO EN ERROR POR FK)
SELECT * FROM productos_borrados;