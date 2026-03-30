-- Ejercicio 2: LEFT/RIGHT JOIN
-- 4. Mostrar todos los clientes, tengan pedidos o no. Si no tienen, que aparezca NULL en la columna del pedido.
-- 5. Mostrar todos los productos con su categoría. El producto sin categoría también debe aparecer.
-- 6. Listar todos los pedidos incluso los que no tienen vendedor asignado.

-- 4_
SELECT c.id_cliente, c.nombre, p.id_pedido, p.estado, p.fecha
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente;

-- 5_
SELECT prod.id_producto, prod.nombre, prod.precio, cat.nombre AS "categoria"
FROM productos prod
LEFT JOIN categorias cat ON prod.id_categoria = cat.id_categoria;

-- 6_
SELECT p.id_pedido, p.estado, p.fecha, v.nombre AS "vendedor"
FROM vendedores v
RIGHT JOIN pedidos p ON v.id_vendedor = p.id_vendedor;