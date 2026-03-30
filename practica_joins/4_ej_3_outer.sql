-- Ejercicio 3: OUTER JOIN
-- Hacer un FULL OUTER JOIN entre clientes y pedidos. ¿Qué filas extra aparecen respecto al LEFT JOIN?

SELECT c.id_cliente, c.nombre, p.id_pedido, p.estado, p.fecha
FROM clientes c
FULL OUTER JOIN pedidos p ON c.id_cliente = p.id_cliente;

--No aparece ninguna fila extra