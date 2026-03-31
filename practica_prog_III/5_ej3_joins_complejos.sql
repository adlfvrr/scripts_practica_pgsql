-- Consignas Nivel 3
-- 1. Mostrar cada factura con su total calculado (sumatoria de ítems).
-- 2. Listar terceros que no tienen pagos registrados. 
-- 3. Obtener facturas que no tienen ítems asociados. 
-- 4. Mostrar pagos con detalle de instrumento (solo los que tienen detalle).

-- 1_

select f.*, sum(f_items.monto * f_items.cantidad) as "total_calculado"
from facturas f 
left join facturas_items f_items on f_items.id_factura = f.id_factura
group by f.id_factura
order by total_calculado;

-- 2_

select t.*, p.id_pagos 
from terceros t
left join pagos p on p.id_tercero = t.id_tercero 
where p.id_pagos is null;

-- 3_

select f.*, f_items.id_items
from facturas f 
left join facturas_items f_items on f.id_factura = f_items.id_factura 
where f_items.id_factura is null;

-- 4_

select p.*, p_detalle.instrumentnumber
from pagos p
inner join pagos_detalle p_detalle on p.id_pagos = p_detalle.id_pagos
