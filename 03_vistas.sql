 
-- vistas
use ecomoda;
Create or replace view view_material as 
Select id_material, cantidad, descripcion
From materiales;
--
Create or replace view view_producto  as 
Select id_producto, cantidad, descripcion
From productos;

-- 
Create or replace view view_inventario_total as
select id_material as id,
cantidad, 
'material' as tipo
from materiales
union all
select id_producto as id, 
cantidad,
'producto' as tipo
from productos;
select * from view_inventario_total;

--
create or replace view view_ccobrar_clientes as
select 
cuentas_cobrar.id_cuenta_cobrar,
cuentas_cobrar.documento_referencia,
cuentas_cobrar.estado,
cuentas_cobrar.valor,
clientes.nombre_cliente,
clientes.direccion,
clientes.telefono
from cuentas_cobrar
join
orden_venta on orden_venta.id_orden_venta = cuentas_cobrar.documento_referencia
join 
clientes on clientes.nombre_cliente = orden_venta.nombre_cliente
where estado = 'por cobrar';

select * from view_ccobrar_clientes;

--
create or replace view view_inventario_bajo as
select * from view_inventario_total where cantidad < 50;

select *from view_inventario_bajo;
--

create or replace view view_clientes_top as
select 
orden_venta.id_orden_venta,
orden_venta.nombre_cliente,
orden_venta.id_producto,
orden_venta.descripcion_producto,
orden_venta.cantidad,
orden_venta.precio,
cuentas_cobrar.valor,
cuentas_cobrar.estado
from orden_venta
left join cuentas_cobrar on documento_referencia = id_orden_venta
where valor > 3000 and estado = 'saldada';
 
select * from view_clientes_top;
