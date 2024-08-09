-- Triggers

USE ecomoda;
DROP TABLE IF EXISTS audit_por_cobrar;
CREATE TABLE audit_por_cobrar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cuenta_cobrar INT NOT NULL,
    estado ENUM('por cobrar', 'saldada') NOT NULL,
    valor DOUBLE NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    paz_y_salvo ENUM('si', 'no') NOT NULL,
    FOREIGN KEY (id_cuenta_cobrar) REFERENCES cuentas_cobrar(id_cuenta_cobrar)
);

DELIMITER //

DROP TRIGGER IF EXISTS update_cuentas_cobrar;
CREATE TRIGGER update_cuentas_cobrar
AFTER UPDATE ON cuentas_cobrar
FOR EACH ROW
BEGIN
    INSERT INTO audit_por_cobrar (id_cuenta_cobrar, estado, valor, paz_y_salvo)
    VALUES (NEW.id_cuenta_cobrar, NEW.estado, NEW.valor, 
            CASE WHEN NEW.estado = 'saldada' and NEW.VALOR = 0  THEN 'si' ELSE 'no' END);
END //

DELIMITER ;

UPDATE cuentas_cobrar
SET estado = 'saldada', valor = 0 
WHERE id_cuenta_cobrar = 9961;

select * from cuentas_cobrar;
-- 2
DROP TABLE IF EXISTS audit_por_pagar;
CREATE TABLE audit_por_pagar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cuentas_pagar INT NOT NULL,
    estado ENUM('por pagar', 'saldada') NOT NULL,
    valor DOUBLE NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    paz_y_salvo ENUM('si', 'no') NOT NULL,
    FOREIGN KEY (id_cuentas_pagar) REFERENCES cuentas_pagar(id_cuentas_pagar)
);

DELIMITER //

DROP TRIGGER IF EXISTS update_cuentas_pagar;
CREATE TRIGGER update_cuentas_pagar
AFTER UPDATE ON cuentas_pagar
FOR EACH ROW
BEGIN
    INSERT INTO audit_por_pagar(id_cuentas_pagar, estado, valor, paz_y_salvo)
    VALUES (NEW.id_cuentas_pagar, NEW.estado, NEW.valor, 
            CASE WHEN NEW.estado = 'saldada' and NEW.VALOR = 0  THEN 'si' ELSE 'no' END);
END //

DELIMITER ;

update cuentas_pagar 
SET estado = 'saldada', valor = 0 
where id_cuentas_pagar = 8851;

select * from cuentas_pagar;

-- 3 

drop table if exists advertencias;
create table advertencias(
id int auto_increment primary key, 
mensaje varchar(200),
fecha timestamp default current_timestamp
);

DELIMITER //
drop trigger if exists ordenar_material;
create trigger ordenar_material
after update on materiales
for each row
begin

if new.cantidad < 100 then 
insert into advertencias (mensaje)
values ('nivel de inventario bajo, ordenar mas materiales al proveedor');

end if;

end //

DELIMITER ;

update materiales
set cantidad = 70 where id_material = 103;
select * from materiales; 
select * from advertencias;

