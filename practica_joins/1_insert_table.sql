--Hacemos insert a las tablas anteriormente creadas
--Insert generados por Claude AI

INSERT INTO categorias VALUES (1,'Electrónica'),(2,'Ropa'),(3,'Hogar'),(4,'Deportes');

INSERT INTO productos VALUES
(1,1,'Laptop',1200.00,10),(2,1,'Auriculares',80.00,50),
(3,2,'Remera',25.00,200),(4,3,'Silla',150.00,30),
(5,4,'Pelota',20.00,100),(6,NULL,'Producto sin cat',50.00,5);

INSERT INTO clientes VALUES
(1,'Ana García','ana@mail.com','Buenos Aires'),
(2,'Carlos López','carlos@mail.com','Rosario'),
(3,'María Paz','maria@mail.com','Córdoba'),
(4,'Juan Sosa','juan@mail.com','Mendoza');

INSERT INTO vendedores VALUES
(1,'Pedro Ruiz','Norte'),(2,'Lucía Gómez','Sur'),(3,'Tomás Vera','Centro');

INSERT INTO pedidos VALUES
(1,1,1,'2024-01-10','entregado'),
(2,1,2,'2024-02-15','entregado'),
(3,2,1,'2024-03-01','pendiente'),
(4,3,NULL,'2024-03-20','cancelado');

INSERT INTO pedido_productos VALUES
(1,1,1),(1,2,2),(2,3,3),(3,4,1),(3,5,2);