--FAMILIZARIZANDO CON FUNCIONES Y TRIGGERS

CREATE OR REPLACE FUNCTION suma_numeros(
    primer_numero Integer, segundo_numero Integer
) RETURNS INTEGER AS
$$
BEGIN
RETURN primer_numero + segundo_numero;
END
$$
LANGUAGE plpgsql;

SELECT suma_numeros(5,2);

--FUNCION PENSADA POR MI, PRIMER Y ÚNICO ERROR: AMBIGUEDAD DE TABLA
--RESUELTO

CREATE OR REPLACE FUNCTION select_byID(p_id INTEGER) 
RETURNS TABLE(product_id INTEGER, product_name VARCHAR, price NUMERIC) AS
$$
    BEGIN
        RETURN QUERY
        SELECT p.product_id, p.product_name, p.price
        FROM products p
        WHERE p.product_id = p_id;
    END
$$
LANGUAGE plpgsql

DROP FUNCTION select_byID;

SELECT select_byID(4)
--

--ERRORES DE SINTAXIS
--RESUELTOS
--ERROR LÓGICO
--ERROR EN EL SELECT
--AGREGANDO CASTEOS (APRENDIENDOLOS)
--
CREATE OR REPLACE FUNCTION sale_byID(id INTEGER)
RETURNS TABLE(product_id INTEGER, quantity INTEGER, sale NUMERIC) AS
$$
    BEGIN   
        RETURN QUERY
        SELECT s.product_id, SUM(s.quantity)::INTEGER, SUM(p.price * s.quantity)::NUMERIC AS total
        FROM sales s
        INNER JOIN products p ON s.product_id = p.product_id
        WHERE s.product_id = id
        GROUP BY s.product_id;
    END
$$
LANGUAGE plpgsql

SELECT * FROM sale_byID(2)
--