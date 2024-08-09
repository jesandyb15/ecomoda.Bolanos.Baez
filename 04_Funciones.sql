-- Funciones
USE ecomoda;

DELIMITER $$
DROP FUNCTION IF EXISTS fn_cuentas_pagar;
CREATE FUNCTION fn_cuentas_pagar(
    param_estado VARCHAR(20)
) RETURNS DOUBLE
READS SQL DATA
BEGIN
    DECLARE total_valor DOUBLE;
    IF param_estado = 'por pagar' THEN
        SELECT SUM(valor) INTO total_valor 
        FROM cuentas_pagar
        WHERE estado = 'por pagar';
    ELSEIF param_estado = 'saldada' THEN
        SELECT SUM(valor) INTO total_valor
        FROM cuentas_pagar
        WHERE estado = 'saldada';
    ELSE
        SET total_valor = 0;  
    END IF;
    
    RETURN total_valor;
END$$

DELIMITER ;

SELECT fn_cuentas_pagar('por pagar') ;
SELECT fn_cuentas_pagar('saldada');

-- 
-- 
DELIMITER //
drop function if exists fn_rentabilidad; 
create function fn_rentabilidad()
returns double
DETERMINISTIC
begin 

Declare diferencia double;

SET DIFERENCIA = (select sum(precio) from orden_venta) - (select sum(precio) from orden_compra);
RETURN DIFERENCIA;

end //

DELIMITER ;

select fn_rentabilidad();
--
DELIMITER $$
DROP FUNCTION IF EXISTS fn_cuentas_cobrar;
CREATE FUNCTION fn_cuentas_cobrar(
    param_estado VARCHAR(20)
) RETURNS DOUBLE
READS SQL DATA
BEGIN
    DECLARE total_valor DOUBLE;
    IF param_estado = 'por cobrar' THEN
        SELECT SUM(valor) INTO total_valor 
        FROM cuentas_cobrar
        WHERE estado = 'por cobrar';
    ELSEIF param_estado = 'saldada' THEN
        SELECT SUM(valor) INTO total_valor
        FROM cuentas_cobrar
        WHERE estado = 'saldada';
    ELSE
        SET total_valor = 0;  
    END IF;
    
    RETURN total_valor;
END$$

DELIMITER ;

SELECT fn_cuentas_cobrar('por cobrar') ;
SELECT fn_cuentas_cobrar('saldada');
