--EJERCICIO DADO POR GEMINI AI
SELECT * FROM products;
SELECT * FROM sales;

--HACEMOS INSERT PARA DIFERENCIAR LA VENTA
INSERT INTO sales(product_id, quantity, sale_date) VALUES
(4, 2, now());

--AÑADIMOS UNA COLUMNA CON STOCK
ALTER TABLE products 
ADD COLUMN stock INTEGER DEFAULT 5;

--VAMOS A CREAR UN TRIGGER QUE CAMBIE AUTOMATICAMENTE EL STOCK LUEGO DE UNA VENTA

CREATE OR REPLACE FUNCTION fn_update_sales() 
RETURNS TRIGGER AS
$$
    DECLARE stock_product INTEGER;
    BEGIN
        SELECT stock INTO stock_product
        FROM products WHERE product_id = NEW.product_id;
        IF stock_product < NEW.quantity THEN 
        RAISE EXCEPTION 'No hay stock disponible para una venta de esa cantidad';
        ELSE
        UPDATE products
        SET stock = (stock_product - NEW.quantity) 
        WHERE product_id = NEW.product_id;
        END IF;
        RETURN NEW;
    END;
$$
LANGUAGE plpgsql

CREATE TRIGGER trigger_update_sales
BEFORE INSERT ON sales
FOR EACH ROW
EXECUTE FUNCTION fn_update_sales();

--PROBAMOS

SELECT * FROM sales;
SELECT * FROM products

INSERT INTO sales(product_id, quantity, sale_date) VALUES
(4, 2, now());

SELECT * FROM sales;
SELECT * FROM products

--EXCELENTE, TESTEAMOS EXCEPTION

INSERT INTO sales(product_id, quantity, sale_date) VALUES
(4, 6, now());

--PERFECTO