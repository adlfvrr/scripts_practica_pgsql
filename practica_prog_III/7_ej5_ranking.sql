-- Consignas Nivel 5
-- 1. Ranking de terceros por monto total pagado (de mayor a menor).
-- 2. Establecer un ranking de pagos (cantidad de pagos sumarizados) por Facultad.
-- 3. Calcular el porcentaje que representa cada pago sobre el total pagado por su tercero.
-- 4. Obtener el último pago realizado por cada tercero.
-- 5. Detectar terceros con pagos en más de un tipo de modalidad.
-- 6. Encontrar facturas cuyo total supere el promedio general.
-- 7. Generar un ranking mensual de facturación.

-- 1_

select t.id_tercero, t.nombre, sum(p.monto_pago) as "monto_total"
from terceros t
join pagos p on p.id_tercero = t.id_tercero 
group by t.id_tercero, t.nombre
order by monto_total desc;

-- 3_

select t.id_tercero, t.nombre, p.monto_pago, 
(p.monto_pago / sum(p.monto_pago) over (partition by t.id_tercero) * 100) as "porcentaje_pago", 
SUM(p.monto_pago) over (partition by t.id_tercero) as "total_pago"
from terceros t
join pagos p on p.id_tercero = t.id_tercero;

-- 4_

select distinct on (t.id_tercero)
t.id_tercero, t.nombre, p.fecha_pago, p.monto_pago
from terceros t
join pagos p on p.id_tercero = t.id_tercero
order by t.id_tercero, p.fecha_pago desc;

--si queremos verificar:
select * 
from pagos p
join terceros t on t.id_tercero = p.id_tercero
where t.id_tercero = --colocamos id del tercero
order by p.fecha_pago desc;

-- 5_

select t.id_tercero, t.nombre, COUNT(distinct p.modo_pago) as "cant_modos"
from terceros t
join pagos p on p.id_tercero = t.id_tercero
group by t.id_tercero, t.nombre
having count(distinct p.modo_pago) > 1;

-- 6_

-- 7_