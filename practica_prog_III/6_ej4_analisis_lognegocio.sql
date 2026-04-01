-- Consignas Nivel 4
-- 1. Calcular el saldo actual por tercero: saldo_apertura + total_facturado − total_pagado
-- 2. Listar los terceros con deuda (saldo positivo).
-- 3. Obtener los 5 terceros con mayor monto facturado.
-- 4. Listar los pagos que aún no fueron realizados (PAGOREALIZADO = false). 

-- 1_

select t.nombre, t.saldo_apertura + SUM(f_items.cantidad * f_items.monto ) - sum(p.monto_pago ) as "saldo_actual"
from terceros t
join facturas f on f.id_tercero = t.id_tercero 
join facturas_items f_items on f_items.id_factura = f.id_factura 
join pagos p on p.id_tercero = t.id_tercero
group by t.id_tercero, t.nombre;

-- 2_

select t.nombre, t.saldo_apertura + SUM(f_items.cantidad * f_items.monto ) - sum(p.monto_pago ) as "saldo_actual"
from terceros t
join facturas f on f.id_tercero = t.id_tercero 
join facturas_items f_items on f_items.id_factura = f.id_factura 
join pagos p on p.id_tercero = t.id_tercero
group by t.id_tercero, t.nombre
having (t.saldo_apertura + SUM(f_items.cantidad * f_items.monto ) - sum(p.monto_pago )) > 0;

-- 3_

select t.id_tercero, t.nombre, SUM(f_items.cantidad * f_items.monto) as "total_facturado"
from terceros t
join facturas f on f.id_tercero = t.id_tercero 
join facturas_items f_items on f_items.id_factura = f.id_factura
group by t.id_tercero, t.nombre
order by total_facturado desc
limit 5;

-- 4_

select * 
from pagos p
join pagos_detalle p_detalle on p_detalle.id_pagos = p.id_pagos
where p_detalle.pagorealizado = false;