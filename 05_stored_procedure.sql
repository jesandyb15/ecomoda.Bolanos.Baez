-- Stored Procedure
USE ecomoda;

DELIMITER // 
Drop procedure if exists insertmaterial;
CREATE PROCEDURE insertmaterial (
    IN p_descripcion VARCHAR(45),
    IN p_tipo ENUM('hilo', 'tela'),
    IN p_cantidad INT,
    IN p_precio DECIMAL(10,2)
)
BEGIN
        INSERT INTO materiales (descripcion, tipo, cantidad, precio)
        VALUES (p_descripcion, p_tipo, p_cantidad, p_precio);
END //

DELIMITER ;


call insertmaterial('tela beige seda', 'tela', 500, 1500);
call insertmaterial('tela marron seda', 'tela', 500, 1500);
select * from materiales;

--
DELIMITER //
Drop procedure if exists insertproducto;
CREATE PROCEDURE InsertProducto (
    IN p_descripcion VARCHAR(45),
    IN p_cantidad INT,
    IN p_precio_unidad DOUBLE
)
BEGIN

        INSERT INTO productos (descripcion, cantidad, precio_unidad)
        VALUES (p_descripcion, p_cantidad, p_precio_unidad);
  
END //

DELIMITER ;
call INSERTproducto('blazer negro oficina', 1000, 400);
call INSERTproducto('blazer verde oficina', 1000, 400);
call INSERTproducto('blazer amarillo oficina', 1000, 400);
select * from productos;

--
DELIMITER //
Drop procedure if exists precio_temporada_p;
CREATE PROCEDURE precio_temporada_p(
 IN p_id_producto int,
 IN porcentaje_temporada double
)
BEGIN
   UPDATE productos
   SET precio_unidad = precio_unidad + (precio_unidad * porcentaje_temporada / 100)
   where p_id_producto = id_producto;
END //
DELIMITER ;

call precio_temporada_p(205,12);
select * from productos;