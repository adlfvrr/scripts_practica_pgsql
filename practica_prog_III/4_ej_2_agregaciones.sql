--Consignas Nivel 2
-- 1. Calcular el total facturado por cada tercero.
-- 2. Obtener la cantidad de facturas emitidas por cada tercero.
-- 3. Calcular el monto total pagado por cada tercero.
-- 4. Listar el promedio de monto de pagos por tipo de pago (EFECTIVO, TRANSFERENCIA, etc.).
-- 5. Obtener la cantidad de pagos por banco.

-- 1_

select t.nombre, SUM(f_item.monto * f_item.cantidad) as "total_tercero"
from facturas_items f_item
join facturas f on f.id_factura = f_item.id_factura 
join terceros t on f.id_tercero = t.id_tercero
group by t.nombre
order by total_tercero desc;

-- 2_

select t.id_tercero, t.nombre, COUNT(id_factura) as "facturas_emitidas"
from terceros t
join facturas f on t.id_tercero = f.id_tercero
group by t.id_tercero, t.nombre
order by facturas_emitidas desc;

-- 3_

select t.id_tercero, t.nombre, SUM(p.monto_pago) as "monto_total"
from terceros t
join pagos p on p.id_tercero = t.id_tercero
group by t.id_tercero, t.nombre 
order by monto_total desc;

-- 4_

select modo_pago, trunc(AVG(monto_pago), 2) as "promedio_por_tipo"
from pagos 
group by modo_pago
order by promedio_por_tipo desc;

-- 5_

select banco, COUNT(id_pagos) as "cantidad_pagos"
from pagos_detalle
group by banco
order by cantidad_pagos;