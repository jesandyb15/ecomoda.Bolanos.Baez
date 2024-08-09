-- DCL USUARIOS
use ecomoda;

Drop user if exists 'donarmando'@'localhost';
create user if not exists 'donarmando'@'localhost' IDENTIFIED BY 'Happy@123';
grant all on *.* to 'donarmando'@'localhost';
show grants for 'donarmando'@'localhost';

Drop user if exists 'marcelaventas'@'localhost';
create user'marcelaventas'@'localhost' IDENTIFIED BY 'Happy@123';
grant select, update, insert, delete on ecomoda.clientes to 'marcelaventas'@'localhost';
grant select, update, insert, delete on ecomoda.cuentas_cobrar to 'marcelaventas'@'localhost';
grant select, update, insert, delete on ecomoda.productos to 'marcelaventas'@'localhost';
grant select, update, insert, delete on ecomoda.orden_venta to 'marcelaventas'@'localhost';
grant execute on procedure  ecomoda.insertproducto to 'marcelaventas'@'localhost';
grant execute on procedure  ecomoda.precio_temporada_p to 'marcelaventas'@'localhost';
show grants for 'marcelaventas'@'localhost';

Drop user if exists 'bettyfinanzas'@'localhost';
create user 'bettyfinanzas'@'localhost' IDENTIFIED BY 'Happy@123';
grant select, update, insert, delete on ecomoda.audit_por_cobrar to 'bettyfinanzas'@'localhost';
grant select, update, insert, delete on ecomoda.audit_por_pagar to 'bettyfinanzas'@'localhost';
grant select, update, insert, delete on ecomoda.cuentas_cobrar to 'bettyfinanzas'@'localhost';
grant select, update, insert, delete on ecomoda.cuentas_pagar to 'bettyfinanzas'@'localhost';
grant select on ecomoda.view_ccobrar_clientes to 'bettyfinanzas'@'localhost';
GRANT EXECUTE ON ecomoda.* TO 'bettyfinanzas'@'localhost';

Drop user if exists 'cuartelfeascomprasylogistica' @'localhost';
Create user 'cuartelfeascomprasylogistica' @'localhost' IDENTIFIED BY 'Happy@123';
grant select, update, insert, delete on ecomoda.clientes to 'cuartelfeascomprasylogistica' @'localhost';
grant select, update, insert, delete on ecomoda.proveedores to 'cuartelfeascomprasylogistica' @'localhost';
grant select, update, insert, delete on ecomoda.orden_compra to 'cuartelfeascomprasylogistica' @'localhost';
grant select, update, insert, delete on ecomoda.materiales to 'cuartelfeascomprasylogistica' @'localhost';
grant select on ecomoda.advertencias to 'cuartelfeascomprasylogistica' @'localhost';
grant select on ecomoda.view_inventario_bajo to 'cuartelfeascomprasylogistica' @'localhost';
grant select on ecomoda.view_material to 'cuartelfeascomprasylogistica' @'localhost';
grant select on ecomoda.view_producto to 'cuartelfeascomprasylogistica' @'localhost';
grant select on ecomoda.view_inventario_total to 'cuartelfeascomprasylogistica' @'localhost';
grant execute on procedure  ecomoda.insertmaterial to 'cuartelfeascomprasylogistica' @'localhost';

