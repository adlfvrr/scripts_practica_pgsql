--Ejercicio 1: INNER JOIN
-- 1. Listar los pedidos mostrando el nombre del cliente y la fecha del pedido.
-- 2. Mostrar cada producto con el nombre de su categoría (solo los que tienen categoría).
-- 3. Listar los pedidos junto con el nombre del vendedor que los atendió.

-- 1
SELECT c.id_cliente, c.nombre, p.id_pedido, p.fecha
FROM pedidos p
INNER JOIN clientes c ON c.id_cliente = p.id_cliente;

--2
SELECT prod.id_producto, prod.nombre, cat.nombre AS "Categoria"
FROM productos prod
INNER JOIN categorias cat ON cat.id_categoria = prod.id_categoria;

--3
SELECT p.id_pedido, p.estado, p.fecha, v.nombre
FROM pedidos p
INNER JOIN vendedores v ON v.id_vendedor = p.id_vendedor;