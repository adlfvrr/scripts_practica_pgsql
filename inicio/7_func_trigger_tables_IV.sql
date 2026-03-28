--EJERCICIO GUIA5.1 DE PROG.APLICADA 2025.
--EJ2 TABLA POR TIPO
DROP TABLE IF EXISTS Figuras;
DROP TABLE IF EXISTS Rectangulos;
DROP TABLE IF EXISTS Circulos;

CREATE TABLE Figuras(
	Id SERIAL,	
	Area DECIMAL(18, 2) DEFAULT 0,
	CONSTRAINT PK_Figuras PRIMARY KEY (Id)
);

CREATE TABLE Rectangulos(
	Id INT,
	Ancho DECIMAL(18,2) NOT NULL, 
	Largo DECIMAL(18,2) NOT NULL,
	CONSTRAINT PK_Rectangulos PRIMARY KEY (Id),
	CONSTRAINT FK_Rectangulos_Figuras FOREIGN KEY (Id) REFERENCES Figuras(Id)
);

CREATE TABLE Circulos(
	Id INT,
	Radio DECIMAL(18,2) NOT NULL,
	CONSTRAINT PK_Circulos PRIMARY KEY (Id),
	CONSTRAINT FK_Circulos_Figuras FOREIGN KEY (Id) REFERENCES Figuras(Id)
);

SELECT * FROM Figuras;
SELECT * FROM Rectangulos;
SELECT * FROM Circulos;
--CREAMOS LAS FUNC
CREATE OR REPLACE FUNCTION fn_insert_rectangulo(r_ancho DECIMAL, r_largo DECIMAL)
RETURNS INTEGER AS
$$
    DECLARE nuevo_id INTEGER;
    BEGIN
        IF r_ancho IS NULL OR r_largo IS NULL THEN
		RAISE EXCEPTION 'Insertar valores válidos.'; 
        END IF;

        INSERT INTO Figuras DEFAULT VALUES
		RETURNING Id INTO nuevo_id;

		INSERT INTO Rectangulos(Id, Ancho, Largo) VALUES
		(nuevo_id, r_ancho, r_largo);
		RETURN nuevo_id;
    END;
$$
LANGUAGE plpgsql

SELECT fn_insert_rectangulo(5,1)

CREATE OR REPLACE FUNCTION fn_insert_circulo(c_radio DECIMAL)
RETURNS INTEGER AS
$$
    DECLARE nuevo_id INTEGER;
    BEGIN
        IF c_radio IS NULL THEN
		RAISE EXCEPTION 'Insertar valores válidos.'; 
        END IF;

        INSERT INTO Figuras DEFAULT VALUES
		RETURNING Id INTO nuevo_id;

		INSERT INTO Circulos(Id, Radio) VALUES
		(nuevo_id, c_radio);
		RETURN nuevo_id;
    END;
$$
LANGUAGE plpgsql

SELECT fn_insert_circulo(2);

CREATE OR REPLACE FUNCTION fn_calcular_area(fig_id INTEGER)
RETURNS DECIMAL AS
$$
DECLARE 
fig_area DECIMAL;
fig_ancho DECIMAL;
fig_largo DECIMAL;
fig_radio DECIMAL;
BEGIN
	IF EXISTS (SELECT 1 FROM Rectangulos WHERE Id = fig_id) THEN
	SELECT Ancho, Largo INTO fig_ancho, fig_largo
	 FROM Rectangulos
	 WHERE Id = fig_id;


	 fig_area:= fig_largo * fig_ancho;

	 ELSEIF EXISTS (SELECT 1 FROM Circulos WHERE Id = fig_id) THEN
	 SELECT Radio INTO fig_radio 
	 FROM CIRCULOS
	 WHERE Id = fig_id;

	 fig_area:= (fig_radio * fig_radio) * 3.14;


	 ELSE RAISE EXCEPTION 'La figura con dicho Id no existe o no tiene un tipo definido';
	 END IF;

	 UPDATE Figuras 
	 SET Area = fig_area 
	 WHERE Id = fig_id;

	 RETURN fig_area;	
END;
$$
LANGUAGE plpgsql

SELECT fn_calcular_area(1);
SELECT fn_calcular_area(3);

SELECT * FROM Figuras;
SELECT * FROM Rectangulos;
SELECT * FROM Circulos;

--NOTAS
--Ejercicios que me presentaron dificultad, falta pulir práctica con funciones de este éstilo.
--Voy agarrando más la mano igual sin tanta ayuda de la IA, pero estos ejercicios de guia si se me complican
--