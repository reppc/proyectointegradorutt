CREATE DATABASE AppSoCom;
USE AppSoCom;

CREATE TABLE Rol_usuario
(
id_rol INT(10) UNIQUE PRIMARY KEY AUTO_INCREMENT NOT NULL,
tipo_usuario VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE categoria
(
id_cat int(10) auto_increment primary key not null,
categoria varchar(25) not null unique
);

CREATE TABLE usuarios 
(
id_usuario INT(10) UNIQUE PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_usuario varchar(25),
nombres varchar(35) not null,
ap_paterno varchar(28) not null,
ap_materno varchar(28) not null,
contraseña VARCHAR(500) NOT NULL,
correo VARCHAR(40) UNIQUE NOT NULL,
Rol INT(10) NOT NULL,
fecha_creacion date,
CONSTRAINT fk_rol_usuario FOREIGN KEY (Rol) REFERENCES Rol_usuario(id_rol)
);

CREATE TABLE publicaciones (
cve_pub int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
titulo_pub varchar(90) NOT NULL UNIQUE, 
contenido text NOT NULL,
imagen varchar(60), 
tema enum('informativa','consejos','sugerencias') NOT NULL, 
me_gusta int(10), 
hora_pub time NOT NULL, 
fecha_pub date NOT NULL,
autor int(10) not null,
CONSTRAINT fk_usuario FOREIGN KEY (autor) REFERENCES usuarios(id_usuario)
);

CREATE TABLE productos (
id_producto int(10) PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT, 
nombre varchar(35) NOT NULL UNIQUE, 
descripcion text NOT NULL,
stock int(10) NOT NULL, 
precio_unitario double NOT NULL, 
categoria int(10), 
imagen varchar(65),
CONSTRAINT fk_categoria FOREIGN KEY (categoria) REFERENCES categoria(id_cat)
);

/*Tabla domicilio*/
CREATE TABLE Domicilio (
id_domicilio int (10) PRIMARY KEY AUTO_INCREMENT not null,
cliente int(10) not null,
calle varchar (50) not null,
ciudad varchar (50) not null,
numeroExt int(5),
numeroInt int(5),
codigo_postal int (5) not null,
telefono varchar(10),
CONSTRAINT fk_cliente FOREIGN KEY (cliente) REFERENCES usuarios(id_usuario)
);

/*tabla metodo de pago*/
CREATE TABLE metodo_pago(
id_metodo int (10) PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (20)
);

/*tabla carrito*/
CREATE TABLE carrito(
id_carrito int (10) PRIMARY KEY AUTO_INCREMENT,
cliente int(10),
producto int (10),
cantidad int(2) not null,
CONSTRAINT fk_cliente_carr FOREIGN KEY (cliente) REFERENCES usuarios(id_usuario),
CONSTRAINT fk_producto_carr FOREIGN KEY (producto) REFERENCES productos(id_producto)
);

/*tabla orden compra*/
CREATE TABLE orden_compra(
id_orden int  (10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
cliente int (10) not null,
metodoPago int (10) not null,
total int(10) not NULL ,
domicilio int (10) NOT  NULL,
fecha_pedido date not NULL,
CONSTRAINT fk_cliente_ord FOREIGN KEY (cliente) REFERENCES usuarios(id_usuario),
CONSTRAINT fk_metodoPago_ord FOREIGN KEY (metodoPago) REFERENCES metodo_pago(id_metodo),
CONSTRAINT fk_domicilio_ord FOREIGN KEY (domicilio) REFERENCES domicilio(id_domicilio)
);

/*Tabla orden_detalle*/
CREATE TABLE orden_detalle(
id_det int (10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
orden int (10) not null,
producto int (10) not null,
cantidad int (5) not null,
precio int (10) not null,
CONSTRAINT fk_ordende FOREIGN KEY (orden) REFERENCES orden_compra(id_orden),
CONSTRAINT fk_productoo_det FOREIGN KEY (producto) REFERENCES productos(id_producto)
);

