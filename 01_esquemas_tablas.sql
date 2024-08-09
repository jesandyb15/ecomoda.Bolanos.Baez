DROP SCHEMA IF EXISTS ecomoda;
CREATE SCHEMA ecomoda;
USE ecomoda;

-- creacion tablas
drop table if exists materiales;
CREATE TABLE materiales (
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(45) NOT NULL UNIQUE,
    tipo ENUM('hilo', 'tela'),
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

drop table if exists proveedores;
CREATE TABLE proveedores (
    nombre_proveedor VARCHAR(25) NOT NULL PRIMARY KEY,
    id_material INT NOT NULL,
    descripcion_material VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    telefono INT NOT NULL,
    FOREIGN KEY (id_material) REFERENCES materiales(id_material)
);

drop table if exists orden_compra;
CREATE TABLE orden_compra (
    id_orden_compra INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(25) NOT NULL,
    id_material INT NOT NULL,
    cantidad INT NOT NULL,
    precio DOUBLE NOT NULL,
    FOREIGN KEY (nombre_proveedor) REFERENCES proveedores(nombre_proveedor),
    FOREIGN KEY (id_material) REFERENCES materiales(id_material)
);

drop table if exists productos;
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(45) NOT NULL UNIQUE,
    cantidad INT NOT NULL,
    precio_unidad DOUBLE NOT NULL
);

drop table if exists clientes;
CREATE TABLE clientes (
    nombre_cliente VARCHAR(45) PRIMARY KEY,
    id_producto INT NOT NULL,
    descripcion_producto VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    telefono INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (descripcion_producto) REFERENCES productos(descripcion)
);

drop table if exists orden_venta;
CREATE TABLE orden_venta (
    id_orden_venta INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(45) NOT NULL,
    id_producto INT NOT NULL,
    descripcion_producto VARCHAR(45) NOT NULL,
    cantidad INT NOT NULL,
    precio DOUBLE NOT NULL,
    FOREIGN KEY (nombre_cliente) REFERENCES clientes(nombre_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (descripcion_producto) REFERENCES productos(descripcion)
);

drop table if exists cuentas_cobrar;
CREATE TABLE cuentas_cobrar (
    id_cuenta_cobrar INT AUTO_INCREMENT PRIMARY KEY,
    documento_referencia INT NOT NULL,
    estado ENUM('por cobrar', 'saldada') NOT NULL,
    valor DOUBLE NOT NULL,
    FOREIGN KEY (documento_referencia) REFERENCES orden_venta(id_orden_venta)

);


DROP TABLE IF EXISTS Cuentas_pagar;
CREATE TABLE cuentas_pagar (
    id_cuentas_pagar INT AUTO_INCREMENT PRIMARY KEY,
    documento_referencia INT NOT NULL,
    estado ENUM('por pagar', 'saldada') NOT NULL,
    valor DOUBLE NOT NULL,
    FOREIGN KEY (documento_referencia) REFERENCES orden_compra(id_orden_compra)
);
