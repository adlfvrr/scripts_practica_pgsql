-- Ejercicio 4: Múltiples JOIN
-- 1. Listar los pedidos con: nombre del cliente, nombre del vendedor, y estado del pedido.
-- 2. Mostrar el detalle completo de los pedidos: 
--    número de pedido, nombre del cliente, nombre del producto, cantidad y precio unitario.
-- 3. Calcular el total gastado por cada cliente (cantidad × precio), incluyendo solo los clientes que 
--    hicieron al menos un pedido.

-- 1_
SELECT c.nombre AS "cliente", v.nombre AS "vendedor", p.estado AS "estado_pedido"
FROM pedidos p
JOIN clientes c ON c.id_cliente = p.id_cliente
JOIN vendedores v ON v.id_vendedor = p.id_vendedor

-- 2_
SELECT ped_prod.id_pedido, c.nombre, prod.nombre, ped_prod.cantidad, prod.precio AS "precio_unitario"
FROM pedido_productos ped_prod
JOIN productos prod ON prod.id_producto = ped_prod.id_producto
JOIN pedidos p ON p.id_pedido = ped_prod.id_pedido
JOIN clientes c ON c.id_cliente = p.id_cliente; 

-- 3_
SELECT c.nombre, prod.nombre, ped_prod.cantidad, SUM(ped_prod.cantidad * prod.precio) AS "total_pedido"
FROM pedido_productos ped_prod
JOIN pedidos p ON p.id_pedido = ped_prod.id_pedido
JOIN clientes c ON c.id_cliente = p.id_cliente
JOIN productos prod ON prod.id_producto = ped_prod.id_producto;

--CORREGIDO
--SELECT c.nombre, SUM(ped_prod.cantidad * prod.precio) AS total_gastado
--FROM pedido_productos ped_prod
--JOIN pedidos p ON p.id_pedido = ped_prod.id_pedido
--JOIN clientes c ON c.id_cliente = p.id_cliente
--JOIN productos prod ON prod.id_producto = ped_prod.id_producto
--GROUP BY c.nombre;

--CORRECCIÓN: DEBE APARECER SOLO UNA FILA CON EL MISMO CLIENTE (SUM)