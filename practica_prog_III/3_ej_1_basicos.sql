--aseguramos schema
SET search_path TO practica_prog_iii;

-- Consignas Nivel 1
-- 1. Listar todos los terceros con su provincia y saldo de apertura.
-- 2. Obtener todas las facturas con el nombre del tercero asociado.
-- 3. Mostrar los pagos realizados en un rango de fechas determinado.
-- 4. Listar los pagos cuyo monto sea mayor a 10.000.
-- 5. Mostrar los ítems de facturas con su detalle y monto total (monto × cantidad).

-- 1_

select provincia, saldo_apertura
from terceros;

-- 2_

select f.*, t.nombre
from facturas f
join terceros t on f.id_tercero = t.id_tercero;

-- 3_

select *
from pagos
where fecha_pago between '2024-03-01' and '2024-12-31'
order by fecha_pago;

-- 4_

select *
from pagos
where monto_pago > 10000
order by monto_pago;

-- 5_

select detalle , monto, cantidad, (monto * cantidad) as "total_item"
from facturas_items