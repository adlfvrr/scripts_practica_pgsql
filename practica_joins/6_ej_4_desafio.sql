-- Ejercicio 5: Desafío
-- 1. ¿Qué clientes nunca hicieron un pedido? (usando JOIN, sin NOT IN).
-- 2. Listar las categorías que no tienen ningún producto vendido
--    (es decir, que no aparecen en ningún pedido_productos).

-- 1_

SELECT c.nombre, p.id_pedido, p.estado
FROM clientes c
LEFT JOIN pedidos p ON p.id_cliente = c.id_cliente
WHERE p.id_cliente IS NULL;

--AYUDA DE CLAUDE EN: NO ERA JOIN, ERA LEFT JOIN
--                    NO ES p.id_cliente = NULL, ES IS NULL

-- 2_

SELECT cat.nombre
FROM categorias cat
LEFT JOIN productos prod ON cat.id_categoria = prod.id_categoria
LEFT JOIN pedido_productos ped_prod ON ped_prod.id_producto = prod.id_producto
WHERE ped_prod.id_producto IS NULL;

--AYUDA DE CLAUDE EN: NO ERA LEFT JOIN Y DESPUES JOIN, ERA DOS LEFT JOIN
--                    AL HACER JOIN DESPUES INTENTA ENCONTRAR MATCHES,
--                    DANDO RESULTADO EN BLANCO
--                   -NO ES prod.id_producto IS NULL,
--                    ES ped_prod.id:_producto IS NULL