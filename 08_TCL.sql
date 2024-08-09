-- TCL seguir pasos
-- 1 DTL, rollback to savepoint

use ecomoda;
start transaction;
call INSERTproducto('Blusa Floral Bohemia', 1020, 300);
call INSERTproducto('Blusa metalica Bohemia', 1050, 350);
call INSERTproducto('falda Floral Bohemia', 500, 200);
call INSERTproducto('mini vestido negro', 2000, 450);
savepoint SP_P1;
select * from productos;
-- ejecutar hasta aqui primero

call INSERTproducto('mini vestido azul',2000, 450);
call INSERTproducto('mini vestido verde',2000, 450);
call INSERTproducto('mini vestido rojo',2000, 450);
call INSERTproducto('mini vestido morado',2000, 450);

Rollback to SP_P1;
select * from productos;

-- 2 ROLLBACK
start transaction;

call INSERTproducto('pantalon azul',3000, 450);
call INSERTproducto('jean descaderado verde',1000, 400);
call INSERTproducto('vestido largo rojo',2000, 600);
call INSERTproducto('mini vestido plateado',700, 80);

select * from productos;
rollback;

select * from productos;

-- 3 Commit
start transaction;
call INSERTproducto('mini falda azul',2000, 450);
call INSERTproducto('mini falda verde',2000, 450);
call INSERTproducto('mini falda roja',2000, 450);
call INSERTproducto('mini falda morada',2000, 450);
commit;
select * from productos;

