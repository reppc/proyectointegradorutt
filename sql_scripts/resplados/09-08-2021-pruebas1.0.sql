-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-08-2021 a las 00:58:36
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `appsocom`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_eliminar_usuario_I` (IN `usuario` INT)  BEGIN
 DELETE FROM `usuarios` WHERE usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cliente_buscar_producto_I` (IN `nombre` VARCHAR(100))  BEGIN
SELECT
  nombre,
  descripcion,
  stock,
  precio_unitario,
  categoria,
  imagen
FROM
  productos
WHERE
nombre=nombre;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_domicilio_I` (IN `cliente` INT, IN `calle` VARCHAR(100), IN `ciudad` VARCHAR(100), IN `meroExt` INT, IN `meroInt` INT, IN `codigo_postal` INT, IN `elefono` INT, IN `colonia` VARCHAR(100))  BEGIN
UPDATE
  domicilio
SET
  cliente = cliente,
  calle = calle,
  ciudad = ciudad,
  numeroExt = numeroExt,
  numeroInt = numeroInt,
  codigo_postal = codigo_postal,
  telefono = telefono,
  colonia = colonia
  WHERE
  id_domicilio=id_domicilio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_usuario_cliente_I` (IN `id_usuario` INT, IN `nombre_usuario` VARCHAR(40), IN `nombres` VARCHAR(40), IN `ap_paterno` VARCHAR(40), IN `ap_materno` VARCHAR(40), IN `correo` VARCHAR(40), IN `contraseña` VARCHAR(40))  BEGIN
UPDATE usuarios SET 
nombre_usuario=nombre_usuario,
nombres=nombres,
ap_paterno=ap_paterno,
ap_materno=ap_materno,
contraseña=contraseña,
correo=correo
WHERE id_usuario=id_usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editar_usuario_empleado_I` (IN `id_usuario` INT, IN `nombre_usuario` VARCHAR(40), IN `nombres` VARCHAR(40), IN `ap_paterno` VARCHAR(40), IN `ap_materno` VARCHAR(40), IN `correo` VARCHAR(40), IN `contraseña` VARCHAR(40), IN `Rol` INT)  BEGIN
UPDATE usuarios SET 
nombre_usuario=nombre_usuario,
nombres=nombres,
ap_paterno=ap_paterno,
ap_materno=ap_materno,
contraseña=contraseña,
correo=correo,
Rol=Rol
WHERE id_usuario=id_usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_dimicilio_I` (IN `id_domicilio` INT)  BEGIN

DELETE FROM `domicilio` WHERE 	id_domicilio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_usuario_cliente_I` (IN `usuario` INT, IN `rol` INT)  BEGIN
/*no podra eliminar si el rol estro que no sea cliente*/
if rol=1 then
 DELETE FROM `usuarios` WHERE usuario;
 end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `historial_de_compras_cliente_filtro_I` (IN `cliente` INT, IN `fecha` DATETIME, IN `nombre_producto` VARCHAR(200))  BEGIN
select
    orden_compra.id_orden as 'N°orden',
    metodo_pago.nombre as 'metodo de pago',
    orden_compra.fecha_pedido as 'fecha del pedido',
    orden_compra.total,
    CONCAT(
      domicilio.calle,
      domicilio.numeroExt,
      domicilio.numeroInt,
      domicilio.codigo_postal,
      domicilio.colonia,
      domicilio.ciudad
    ) as 'direccion',
    productos.imagen as '',
    productos.nombre,
    orden_detalle.cantidad,
    productos.precio_unitario as 'precio individual'
   from orden_compra
   INNER JOIN metodo_pago
   on metodo_pago.id_metodo=orden_compra.metodoPago
   INNER JOIN domicilio
   on domicilio.id_domicilio=orden_compra.domicilio
   INNER JOIN orden_detalle
   on orden_detalle.orden=orden_compra.id_orden
   INNER JOIN productos
   on productos.id_producto=orden_detalle.producto
   INNER JOIN usuarios
   on usuarios.id_usuario=orden_compra.cliente
   where orden_compra.cliente=cliente or orden_compra.fecha_pedido=fecha or productos.nombre=nombre_producto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_productos_usuario_I` (IN `cliente` INT, IN `producto` INT, IN `cantidad` INT, IN `confirmacion` TINYINT(1))  BEGIN if confirmacion = 0 or confirmacion=null or confirmacion='' then
INSERT INTO
  carrito(
    cliente,
    producto,
    cantidad,
    confirmacion
  )
VALUES
  (
    cliente,
    producto,
    cantidad,
    0
  );
  elseif confirmacion=1 then
  INSERT INTO
  carrito(
    cliente,
    producto,
    cantidad,
    confirmacion
  )
VALUES
  (
    cliente,
    producto,
    cantidad,
    confirmacion
  );
end if;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_usuarios_I` (IN `nombre_usuario` VARCHAR(40), IN `nombres` VARCHAR(40), IN `ap_paterno` VARCHAR(40), IN `ap_materno` VARCHAR(40), IN `contraseña` VARCHAR(40), IN `correo` VARCHAR(40))  BEGIN
insert into usuarios(nombre_usuario,nombres,ap_paterno, ap_materno,contraseña,correo,Rol,fecha_creacion)
values(nombre_usuario,nombres,ap_paterno, ap_materno,contraseña,correo,1,CURRENT_DATE);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccion_universal_I` (IN `nombre_tabla` VARCHAR(90))  BEGIN
SELECT * FROM nombre_tabla ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_cliente_domicilio_insertar_I` (IN `cliente` INT, IN `calle` VARCHAR(100), IN `ciudad` VARCHAR(100), IN `numeroExt` INT, IN `numeroInt` INT, IN `codigo_postal` INT, IN `telefono` INT, IN `colonia` VARCHAR(70))  BEGIN
INSERT INTO
  domicilio(
    cliente,
    calle,
    ciudad,
    numeroExt,
    numeroInt,
    codigo_postal,
    telefono,
    colonia
  )
VALUES
  (
    cliente,
    calle,
    ciudad,
    numeroExt,
    numeroInt,
    codigo_postal,
    telefono,
    colonia
  );
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(10) NOT NULL,
  `cliente` int(10) DEFAULT NULL,
  `producto` int(10) DEFAULT NULL,
  `cantidad` int(2) NOT NULL,
  `confirmacion` tinyint(1) DEFAULT 0,
  `fecha_agregado` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `cliente`, `producto`, `cantidad`, `confirmacion`, `fecha_agregado`) VALUES
(1, 9, 1, 1, 0, '2021-08-09 21:29:30'),
(2, 1, 1, 2, 0, '2021-08-09 21:29:30'),
(3, 2, 2, 3, 0, '2021-08-09 21:29:30'),
(4, 3, 3, 4, 0, '2021-08-09 21:29:30'),
(5, 4, 3, 5, 0, '2021-08-09 21:29:30'),
(6, 5, 8, 6, 0, '2021-08-09 21:29:30'),
(7, 6, 20, 7, 0, '2021-08-09 21:29:30'),
(8, 1, 20, 8, 0, '2021-08-09 21:29:30'),
(9, 2, 9, 9, 0, '2021-08-09 21:29:30'),
(10, 3, 10, 10, 0, '2021-08-09 21:29:30'),
(11, 4, 11, 11, 0, '2021-08-09 21:29:30'),
(12, 5, 12, 12, 0, '2021-08-09 21:29:30'),
(13, 6, 13, 13, 0, '2021-08-09 21:29:30'),
(14, 7, 14, 14, 0, '2021-08-09 21:29:30'),
(15, 1, 15, 15, 0, '2021-08-09 21:29:30'),
(16, 8, 16, 16, 0, '2021-08-09 21:29:30'),
(17, 12, 14, 17, 0, '2021-08-09 21:29:30'),
(18, 20, 12, 18, 0, '2021-08-09 21:29:30'),
(19, 12, 7, 19, 0, '2021-08-09 21:29:30'),
(20, 3, 3, 20, 0, '2021-08-09 21:29:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_cat` int(10) NOT NULL,
  `categoria` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_cat`, `categoria`) VALUES
(1, 'accesorios'),
(2, 'limpieza'),
(3, 'refacciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `id_domicilio` int(10) NOT NULL,
  `cliente` int(10) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `numeroExt` int(5) DEFAULT NULL,
  `numeroInt` int(5) DEFAULT NULL,
  `codigo_postal` int(5) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `colonia` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`id_domicilio`, `cliente`, `calle`, `ciudad`, `numeroExt`, `numeroInt`, `codigo_postal`, `telefono`, `colonia`) VALUES
(1, 3, 'AZTECAS', 'TORREÓN', 395, NULL, 27040, '8713509720', 'LAS CAROLINAS'),
(2, 4, 'PEDRO CAMINO', 'TORREÓN', 108, NULL, 27260, '8703985297', 'AMPLIACION LOS ANGELES'),
(3, 5, 'JUAN E GARCIA', 'TORREÓN', 63, NULL, 27000, '8701986529', 'TORREON CENTRO'),
(4, 6, 'PASEO DE LA DANZA', 'TORREÓN', 506, 1, 27250, '8715987462', 'CAMPESTRE LA ROSITA'),
(5, 7, 'SALTILLO 400', 'TORREÓN', 951, NULL, 27250, '2015894537', 'CAMPESTRE LA ROSITA'),
(6, 8, 'BERLIN', 'TORREÓN', 201, NULL, 27100, '8215453097', 'SAN ISIDRO'),
(7, 9, 'AVE JUAREZ', 'TORREÓN', NULL, NULL, 27089, '8741203698', 'FRAC CALIFORNIA'),
(8, 10, 'HIDALGO', 'TORREÓN', 1440, 4, 27000, '8587410398', 'TORREON CENTRO'),
(9, 11, 'AV. PRESIDENTE CARRANZA', 'TORREÓN', 881, NULL, 27000, '8712036592', 'CENTRO'),
(10, 12, 'SALTILLO', 'TORREÓN', 400, 951, 27250, '8745120369', 'CAMPESTRE LA ROSITA'),
(11, 13, 'JUAREZ', 'TORREÓN', 3254, NULL, 27000, '8745103685', 'TORREON CENTRO'),
(12, 14, 'PASEO DE LA DANZA', 'TORREÓN', 506, 1, 27250, '8745120398', 'CAMPESTRE LA ROSITA'),
(13, 15, 'PASEO DE LA DANZA', 'TORREÓN', 506, 2, 27250, '8745196320', 'CAMPESTRE LA ROSITA'),
(14, 16, 'PASEO DE LA DANZA', 'TORREÓN', 506, 3, 27250, '8745120398', 'CAMPESTRE LA ROSITA'),
(15, 17, 'CARR MATAMOROS TORREON', 'TORREÓN', 309, NULL, 27087, '8695741203', 'LA AMISTAD'),
(16, 18, 'CONSTITUCION', 'TORREÓN', 1111, NULL, 27130, '2987451203', 'LAS MARGARITAS'),
(17, 19, 'AV PDTE CARRANZA', 'TORREÓN', 1499, NULL, 27000, '8795698730', 'CENTRO'),
(18, 20, 'DE LAS PAPAS', 'TORREÓN', 169, 170, 27020, '8745129837', 'ABASTOS'),
(19, 21, 'HIDALGO', 'TORREÓN', 1130, NULL, 27000, '8745120398', 'TORREON CENTRO'),
(20, 22, 'PASEO DE LA ROSITA', 'TORREÓN', 1578, NULL, 27015, '8976541230', 'CENTRO'),
(21, 23, 'CALLE SAN JOAQUIN', 'TORREÓN', 1710, NULL, 27020, '8754198762', 'CENTRO'),
(22, 24, 'AVENIDA REFORMA', 'TORREÓN', 878, NULL, 27000, '8749512398', 'CENTRO'),
(23, 25, 'PROLONGACION HIDALGO', 'TORREÓN', 554, NULL, 27000, '8741520398', 'CENTRO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id_metodo` int(10) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id_metodo`, `nombre`) VALUES
(1, 'efectivo'),
(2, 'tarjeta'),
(3, 'transaccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_compra`
--

CREATE TABLE `orden_compra` (
  `id_orden` int(10) NOT NULL,
  `cliente` int(10) NOT NULL,
  `metodoPago` int(10) DEFAULT NULL,
  `total` int(10) NOT NULL,
  `domicilio` int(10) NOT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden_compra`
--

INSERT INTO `orden_compra` (`id_orden`, `cliente`, `metodoPago`, `total`, `domicilio`, `fecha_pedido`) VALUES
(1, 1, 1, 1698, 1, '2021-03-12 06:00:00'),
(2, 2, 2, 1647, 2, '2021-03-14 06:00:00'),
(3, 3, 3, 377, 3, '2021-03-19 06:00:00'),
(4, 4, 3, 629, 4, '2021-03-24 06:00:00'),
(5, 5, 2, 2394, 5, '2019-03-29 06:00:00'),
(6, 6, 1, 17493, 6, '2021-04-03 06:00:00'),
(7, 7, 2, 9114, 7, '2021-04-07 05:00:00'),
(8, 8, 3, 9915, 8, '2021-04-11 05:00:00'),
(9, 9, 1, 849, 9, '2021-04-20 05:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_detalle`
--

CREATE TABLE `orden_detalle` (
  `id_det` int(10) NOT NULL,
  `orden` int(10) DEFAULT NULL,
  `producto` int(10) DEFAULT NULL,
  `cantidad` int(5) DEFAULT NULL,
  `precio` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden_detalle`
--

INSERT INTO `orden_detalle` (`id_det`, `orden`, `producto`, `cantidad`, `precio`) VALUES
(1, 1, 1, 2, 849),
(2, 2, 2, 3, 549),
(3, 3, 3, 4, 126),
(4, 4, 3, 5, 126),
(5, 5, 8, 8, 399),
(6, 6, 20, 7, 2499),
(7, 7, 14, 14, 651),
(8, 8, 16, 16, 620),
(9, 9, 1, 1, 849);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `stock` int(10) NOT NULL,
  `precio_unitario` double NOT NULL,
  `categoria` int(10) DEFAULT NULL,
  `imagen` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `stock`, `precio_unitario`, `categoria`, `imagen`) VALUES
(1, 'Disco Duro Interno 1TB WD', 'Disco Duro Interno 1TB 3.5 SATA3 7200RPM Nuevo WD WD10EZEX', 66, 849, 3, NULL),
(2, 'Unidad de estado solido SSD 120GB', 'Unidad de estado solido SSD 120GB 2.5\" SATA3 Kingston A400 / SA400S37/120G', 30, 549, 3, NULL),
(3, 'Aire Comprimido Silimex', 'Aire comprimido Silimex / Teclados y electronicos / Circuitos mecánicos 660Ml', 85, 125.76, 2, NULL),
(4, 'Liquido Limpiador Perfect Choice', 'Liquido Limpiador Alcohol Isopropilico / Para electronicos / PC-033066', 10, 69, 2, NULL),
(5, 'Toallitas Limpiadoras Perfect Choice', 'Toallitas Limpiadoras Perfect Choice / Ideal para pantallas', 8, 49, 2, NULL),
(6, 'Mouse Gamer Logitech G203 Lightsync Black', 'Mouse Gamer Logitech G203 Lightsync Black / Optico / USB / 8000DPI / Led RGB/', 300, 429, 2, NULL),
(7, 'Mouse Gamer Yaguaret Mantis', 'Mouse Gamer Yaguaret Mantis / Optico / USB / 6400DPI / Led RGB/ GMMANTISYGT / 7 Botones', 288, 299.99, 2, NULL),
(8, 'Teclado Mecanico Gamer Naceb Black Cobra RGB', 'Teclado Mecanico Gamer Naceb Black Cobra RGB / USB / NA-0944 / Switch Red / Antighosting / Reposamuñecas desmontable', 26, 399, 2, NULL),
(9, 'Teclado Gamer Naceb', 'Teclado Gamer Naceb NA-0912 Retroiluminado / Antighosting / Efecto rainbow', 205, 219, 2, NULL),
(10, 'Memoria RAM Kingston HyperX DDR3', 'Memoria RAM Kingston HyperX 4GB 1x4GB DDR3L 1866Mhz / Sodimm HX318LS11IB/4/ para Laptop', 12, 518.18, 3, NULL),
(11, 'Memoria RAM DDR4', 'Memoria RAM DDR4 4GB 2666MHz Kingston HyperX Fury 1 Modulo Negro HX426C16FB3/4', 38, 549, 3, NULL),
(12, 'Memoria RAM DDR3', 'Memoria RAM DDR3 4GB 1333MHz Kingston Value 1 Modulo / KVR13N9S8/4', 52, 779, 3, NULL),
(13, 'Pasta Termica Cooler Master', 'Pasta Termica Cooler Master MasterGel Pro V2 / MGY-ZOSG-N15M-R3', 235, 299.99, 2, NULL),
(14, 'Fuente de poder 400W EVGA', 'Fuente de poder 400W EVGA Continuous Power Active PFC 75%Ef. / 100-N1-0400-L1', 158, 650.99, 3, NULL),
(15, 'Fuente de poder Getttech', 'Fuente de poder Getttech 500W - FG500WBX', 250, 259, 3, NULL),
(16, 'Disipador para CPU Disipador y Ventilador para Procesador', 'Disipador para CPU Disipador y Ventilador para Procesador Thermaltake Contact Silent 12 - 120mm X1 Intel y AMD', 64, 619.66, 3, NULL),
(17, 'Disipador y Ventilador para Procesador', 'Disipador y Ventilador para Procesador Cooler Master Hyper T4 - 120mm X1 Intel y AMD', 55, 300.5, 3, NULL),
(18, 'Tarjeta Madre Asus', 'Tarjeta Madre Asus PRIME A320M-K Socket AM4 AMD A320 Micro ATX / DDR4', 190, 1379.55, 3, NULL),
(19, 'Tarjeta Madre Intel', 'Tarjeta Madre MSI H310M PRO-VDH PLUS Socket 1151-v2 Intel H310 Micro-ATX', 10, 1299.99, 3, NULL),
(20, 'Tarjeta de video NVIDIA', 'Tarjeta de video NVIDIA GeForce GT 1030 2GB GDDR4 / Gigabyte / HDMI, DVI / GV-N1030D4-2GL', 20, 2499, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `cve_pub` int(10) NOT NULL,
  `titulo_pub` varchar(150) NOT NULL,
  `contenido` text NOT NULL,
  `imagen` varchar(60) DEFAULT NULL,
  `tema` enum('informativa','consejos','sugerencias') NOT NULL,
  `me_gusta` int(10) DEFAULT NULL,
  `hora_pub` time NOT NULL,
  `fecha_pub` date NOT NULL,
  `autor` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`cve_pub`, `titulo_pub`, `contenido`, `imagen`, `tema`, `me_gusta`, `hora_pub`, `fecha_pub`, `autor`) VALUES
(1, 'Conociendo la BIOS para prestar un mejor servicio en la Reparación de la PC', 'La BIOS es un programa que se carga en la memoria ROM (memoria de solo lectura) , que en el momento de encender la PC o reiniciar la misma realiza un chequeo del hardware que se encuentra conectado a la misma.\nDurante este proceso realiza realmente un diagnostico al cual comúnmente se le llama POST o prueba automática de encendido, lo cual entenderás es muy importante a tener en cuenta cuando se trata de establecer fallas en un proceso de reparación de la PC.', 'https:img/n', 'informativa', 50, '09:00:00', '2021-06-01', 2),
(2, 'Solucionando problemas con lo zócalos durante la reparación de la PC', 'Si alguno de estos componentes presenta problemas  sin duda alguna todo el funcionamiento de la computadora se vera afectado, a continuación me permito explicarte como resolver problemas con la tarjeta principal, específicamente cuando se presenta problemas con los slots o zócalos donde se insertan los diferentes componentes como el procesador, la memoria, tarjetas de interface, entre otros.', 'https:img/log/h', 'informativa', 70, '14:00:00', '2021-06-05', 2),
(3, 'Solucionando problemas con los drivers', 'Cuando un driver genera problemas, nuestro sistema operativo no se carga adecuadamente, se generan mensajes de error y el equipo se reinicia, esto ocurre porque el sistema busca protegerse y comenzar una instancia anterior a la carga del controlador defectuoso. Lo ideal entonces es que durante el proceso de reinicio presionemos la tecla F8 y seleccionemos la opción “volver a la ultima configuración que funciono correctamente”, de esta manera el equipo iniciara correctamente.', 'https:img/log/h', 'sugerencias', 30, '10:00:00', '2021-06-05', 2),
(4, 'Solucionando problemas con el teclado', 'Su funcionamiento esta gobernado por el microprocesador y los circuitos de control, cada tecla al ser presionada cierra un circuito, estos son detectados por el microprocesador y acude a la memoria ROM del teclado en donde se encuentran los mapas de caracteres asociados a cada tecla.Sus fallas son muy evidentes, ya que podemos evidenciarlas fácilmente, pero lo mas importante antes de entrar a repararlo es considerar si es mejor adquirir uno nuevo o repararlo.', 'https:img/log/h', 'consejos', 25, '11:00:00', '2021-06-06', 2),
(5, 'La PC no enciende: Fallas con la Fuente?', 'Bien,  si prestas atención a lo que te voy a explicar, vas a  conocer el funcionamiento de la fuente de poder y la manera adecuada de detectar y solucionar los diferentes  problemas que se puedan presentar con esta.La función principal de la fuente de poder es convertir la energía del tomacorriente (corriente alterna) de la pared en aquello que sea utilizable por los diferentes circuitos de la computadora (corriente continua), por lo tanto asegura un suministro estable de corriente para que los diferentes componentes del equipo funcionen adecuadamente.', 'https:img/log/h', 'informativa', 65, '14:00:00', '2021-06-10', 2),
(6, 'Solucionando problemas con programas que se cargan al inicio', 'En muchas ocasiones observamos que se presentan problemas durante la carga del sistema operativo, es decir el sistema no carga adecuadamente y tal vez no sabemos a que se deba, y peor aun no sabemos como abordar esta problemática.Una de las primeras actividades que deberás hacer para abordar esta problemática es deshabilitar los programas que se cargan al inicio del sistema, que pueden estar fallando y generando problemas con el sistema operativo e impiden que este cargue normalmente.', 'https:img/log/h', 'informativa', 70, '12:00:00', '2021-06-15', 2),
(7, 'Identificando la principales actividades de optimización y mejoramiento de la PC', 'Es de mucha importancia que dentro del proceso de mantenimiento y reparación de la PC, aprendas a identificar las principales herramientas que existen en el mercado, y que ayudaran a optimizar y mejorar el desempeño de la PC, y los cuales se deben considerar esenciales en cualquier kit de herramientas de toda persona que se dedique a esta actividad ya sea de carácter profesional o a nivel personal.Dentro de las principales actividades de optimización y mejoramiento que se debe realizar a una computadora están:', 'https:img/log/h', 'informativa', 35, '15:20:00', '2021-06-15', 2),
(8, 'Identificando las herramientas básicas de trabajo', 'Destornilladores de dado de 3/16  y 1/4 de pulgada,Destornilladores de cruz pequeños y medianos,Destornilladores planos pequeños y medianos,Extractores e insertores de chips,Pinzas (sujeta tornillos, común, para circuitos integrados),Sujetadores de pinzas tipo garra,Destornilladores Torx T10 y T15,Linterna pequeña,Cortador / removedor de cable Lima,Pulsera antiestática,Recipiente porta tornillosMultimetro', 'https:img/log/h', 'consejos', 15, '14:00:00', '2021-06-20', 2),
(9, 'LA MEMORIA RAM: Conociéndola para detectar problemas relacionados con la misma', 'importante conocer el funcionamiento de la memoria RAM en la PC, ya que esta hace parte de de uno de los componentes principales que conforman el sistema de computo, por lo cual un problema  en la misma ocasiona fallas en la computadora.La memoria RAM (Memoria de acceso aleatorio). Es el lugar donde la computadora guarda sus datos de manera temporal, para  luego ser accesados por el procesador  de manera más rápida, es decir estos datos se pierden cuando se apaga la computadora, solo permanecerán aquellos que hallan sido guardados en el disco duro.', 'https:img/log/h', 'sugerencias', 100, '16:10:00', '2021-06-22', 2),
(10, 'Problemas con el procesador: efectuando un acertado diagnostico.', 'Entre los principales síntomas que se presentan cuando el procesador esta fallando se encuentran:Al encender  nuestra computadora, no tenemos señal de video en el monitor, y ya hemos descartado las otras dos posibilidades: fallas en la tarjeta madre o fallas en la tarjeta de video, entonces el problema puede estar en el procesador.En algunas ocasiones se inicia la computadora, carga el sistema de video y se muestra la versión de la BIOS, se inicia la rutina POST, pero pueden aparecer letras extrañas en la pantalla y las rutinas no se completan adecuadamente, y el sistema deja de funcionar, este caso podría ser un problema con el procesador, ya sea por fallas de fabrica o por sobrecalentamiento y lo han dañado, en tal situación se deberá adquirir un nuevo microprocesador.', 'https:img/log/h', 'consejos', 20, '18:15:00', '2021-06-23', 2),
(11, 'Mantenimiento de computadoras: Que debo tener presente antes de desarmar mi PC ?', 'Antes del desarmado de cualquier sistema deberás tener presente varios aspectos:Prevenir las descargas estáticas  en los diferentes componentes de la PC, ya que nuestro cuerpo puede tener una gran carga de voltaje que podría dañar los componentes de la computadora, por lo tanto para evitar esta situación podrías realizar dos cosas:', 'https:img/log/h', 'consejos', 15, '15:30:00', '2021-06-24', 2),
(12, 'Mantenimiento de la PC: Como protegerte contra los virus informáticos', 'sadilla.Primero quiero que comprendas que un virus no es mas que un programa con unas características muy particulares que se introducen en los computadores de formas muy diversas como a través del correo electrónico, la Internet, u otras formas y que se reproducen infectando otros archivos o programas, y al ejecutarse realizan acciones molestas y/o dañinas para los usuarios de las computadoras.', 'https:img/log/h', 'sugerencias', 60, '14:40:00', '2021-06-25', 2),
(13, 'Reparación de la PC: Entendiendo el proceso de arranque de la computadora.', 'Desde el momento que en que prendemos la computadora, internamente se están ejecutando una serie de procedimientos que permiten verificar que todos los componentes de la computadora funcionan de manera correcta, estos procedimientos reciben el nombre de POST (Power-On-SelfTest) que no es mas que un sistema de auto prueba que realiza la computadora sobre sus componentes.', 'https:img/log/h', 'consejos', 300, '16:50:00', '2021-06-25', 2),
(14, 'Reparación de la PC: Entendiendo los elementos que intervienen en el encendido de la computadora', ' La red domiciliaria nos permite obtener  la energía que nuestra  computadora requiere para funcionar, inicialmente llega con tensiones de 110-120 ACV.,Nos encontramos luego con un regulador de voltaje, quien deberá estar entre la red domiciliaria y la fuente de alimentación de la PC, este me permite mantener los niveles de energía estables y de esta manera evitar bajas o altas de tensión que puedan dañar los diferentes componentes de la computadora.,Posteriormente la Fuente de poder que se encuentra en nuestra computadora es quien recibe la corriente de la red domiciliaria desde el regulador de voltaje, en este momento la corriente alterna que esta llegando de la red domiciliaria es transformada en corriente continua a través de un proceso de rectificación. Entonces es enviada a través de los diferentes cables de poder a nuestro PC para alimentar cada uno de sus componentes.', 'https:img/log/h', 'informativa', 1000, '14:15:00', '2021-06-28', 2),
(15, 'Mantenimiento del PC: Respaldando la información', 'Es por esto que es  fundamental contar  con un método de respaldo de la información que sea confiable.Existen muchos métodos para realizar respaldos de la información y diferentes medios de  almacenamiento con los que podemos contar  al momento de resguardar los datos, hoy  voy a abordar las herramientas que nos ofrecen los sistemas operativos, para este caso me concentrare la herramienta para la realización de copias de respaldo de Windows XP.', 'https:img/log/h', 'informativa', 80, '16:00:00', '2021-06-25', 2),
(16, 'Mantenimiento de la Computadora: Identificando la causa de los problemas más comunes que se presentan al inicio del sistema.', 'Revisa que las conexiones de la red eléctrica estén bien conectadas al computador, si todo anda bien entonces estaremos descartando que el problema proceda de una inadecuada conexión a la red eléctrica.El segundo paso es asegurarte  que el problema no proceda de la Fuente de poder, que suministra corriente regulada a el computador, para este caso deberás hacer los siguientes pasos:Desconecta totalmente el equipo de la energía y con mucho cuidado abre el gabinete de la computadora y verifica que el conector grande de la fuente de poder este bien conectado a la tarjeta principal, y esta sea la razón por la cual no llega la tensión o voltaje adecuado a la computadora para iniciar.De no ser este el problema, muy seguramente el mal funcionamiento provenga de algún componente integrado a la tarjeta principal, de ser así deberás evaluar la conveniencia de repararla o comprar una nueva.', 'https:img/log/h', 'sugerencias', 35, '14:10:00', '2021-07-01', 2),
(17, 'Mantenimiento de la PC: Explorando el interior de la Computadora', 'Tarjeta Principal: es uno de los elementos  más importantes de la PC, es allí donde donde se conectan los diferentes componentes indispensables para el funcionamiento de la PC,  sobre los cuales se realiza el flujo y proceso de la información.En ella encontramos los conectores que permiten la alimentación de energía desde la fuente de poder, las ranuras de expansión o slots que es donde se instalan las tarjetas de interface, las ranuras para la memoria RAM, y los circuitos electrónicos integrados que permiten el procesamiento y control como el procesador y Chipsets  de soporte, por todo lo anterior se constituye en el modulo principal de la computadora.', 'https:img/log/h', 'sugerencias', 15, '19:15:00', '2021-07-01', 2),
(18, 'Mantenimiento de la PC: Conociendo como viajan los datos al interior de la Computadora.', 'Al estar sentados frente a nuestro computador y escribir un texto cualquiera, esta informacion viaja a traves del puerto PS2 del teclado (periferico de entrada), y se envia a traves de un CHIP llamado puente sur al Procesador.La informacion viaja por unos BUSES (o caminos) a traves de la TARJETA MADRE intercomunicando todos los dispositivos.Luego esta informacion se encuentra con un CHIP llamado PUENTE NORTE, el cual sirve de conexión entre la PLACA MADRE y los principales componentes de la PC: microprocesador, memoria RAM y tarjeta de vídeo AGP o PCI Express.En la memoria RAM o memoria principal se almacenan los datos temporalmente para luego ser procesados por el Microprocesador.La informacion llega al Microprocesador quien se ancarga de procesarla y enviarla de regreso al CHIP Puente Norte para ser retransmitida al dispositivo de video.', 'https:img/log/h', 'informativa', 10, '15:28:00', '2021-07-05', 2),
(19, 'Mantenimiento de la PC: identificando las fallas de acuerdo a la etapa en que se manifiesten 2da Parte.', 'computadora de acuerdo a la etapa en que se presenten, ya que el observar el momento en que se presenta el problema es fundamental para poder detectarlo y resolverlo de manera efectiva.En el primer articulo hablamos de la clasificación de las fallas de acuerdo a su comportamiento, y determinamos que existen fallas que se clasifican como evidentes, sistemáticas y aleatorias, y profundizamos un poco en cada uno de ellos, a continuación avanzaremos en esta temática hablando de la importancia de aprender a establecer la falla  de a cuerdo a su etapa de manifestación.', 'https:img/log/h', 'sugerencias', 60, '16:30:00', '2021-07-06', 2),
(20, 'Mantenimiento de la PC: identificando las fallas de acuerdo a la etapa en que se manifiesten.', ' clasificación de las fallas de acuerdo a su comportamiento, entonces  podremos decir que existen fallas que se clasifican como evidentes, ya que se manifiestan a simple vista, un ejemplo es cuando una PC no enciende ni da “señales de Vida”. Pero también existen las fallas sistemáticas son aquellas que se repiten siempre en el mismo punto de un proceso determinado, por ejemplo cuando al ejecutar una aplicación o programa especifico la PC siempre se queda en su rendimiento normal, no importa cuantas veces hagamos lo mismo. Y por ultimo están las fallas aleatorias es cuando tenemos que la falla se presenta de manera cambiante, es decir no se produce bajo alguna circunstancia especifica, se da en cualquier etapa del proceso de funcionamiento de la computadora: al encenderse, cargar el sistema operativo o simplemente cargar alguna aplicación o programa, generalmente estas fallas se generan por excesos de temperatura o contactos flojos en el cable de datos o de alimentación de energía.', 'https:img/log/h', 'informativa', 50, '14:20:00', '2021-05-10', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_usuario`
--

CREATE TABLE `rol_usuario` (
  `id_rol` int(10) NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol_usuario`
--

INSERT INTO `rol_usuario` (`id_rol`, `tipo_usuario`) VALUES
(4, 'Administrador'),
(3, 'Administrador_Blog'),
(1, 'Cliente'),
(2, 'Tecnico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) NOT NULL,
  `nombre_usuario` varchar(25) DEFAULT NULL,
  `nombres` varchar(35) NOT NULL,
  `ap_paterno` varchar(28) NOT NULL,
  `ap_materno` varchar(28) NOT NULL,
  `contraseña` varchar(500) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `Rol` int(10) NOT NULL,
  `fecha_creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `nombres`, `ap_paterno`, `ap_materno`, `contraseña`, `correo`, `Rol`, `fecha_creacion`) VALUES
(1, 'Vic_555', 'Victor Isaac', 'Rodriguez', 'Garcia', 'papwi123', '4abduhosny_2012@gmail.com', 1, '2021-01-15'),
(2, 'NairaUri1', 'Naira', 'Uribe', 'Macias', 'dan123', 'zahmadn@gmail.com', 2, '2021-01-17'),
(3, 'xxjuan77', 'Juan Manuel', 'Fernandez', 'Lujan', 'santi123', 'fosaf47575@gmail.com', 3, '2021-01-20'),
(4, 'AleL55', 'Alejandra', 'Luna', 'Perez', 'iozo133', 'jseham_20@gmail.com', 3, '2021-01-22'),
(5, 'Leo33', 'Leon Daniel', 'Martinez', 'Hopi', 'dan934', 'vzlo_1@gmail.com', 3, '2021-01-23'),
(6, 'MariLaiu_5', 'Maria Rocio', 'Liu', 'Sanchez', 'letan123', '9hunjun@gmail.com', 3, '2021-01-25'),
(7, 'Jorch123', 'Jorge', 'Cisneros', 'Martinez', 'fueg_1', 'qhic_1@gmail.com', 3, '2021-01-27'),
(8, 'Pablolike55', 'Pablo', 'Contreras', 'Siller', '54senda', 'gsenyoo_5@gmail.com', 3, '2021-01-28'),
(9, 'ManuGar', 'Manuel', 'Garcia', 'Perez', 'nome35', 'boussama179@gmail.com', 3, '2021-01-29'),
(10, 'GarayEle23', 'Elsa Patricia', 'Garay', 'Puentes', 'spider123', '2ishwarya@gmail.com', 3, '2021-01-30'),
(11, '77Leslie', 'Leslie', 'Cuellar', 'Oropeza', 'itsjust123', '2reyeslam991@gmail.com', 3, '2021-02-01'),
(12, 'Wilv935', 'Wilbert', 'Guajardo', 'Gutierrez', 'ch123', 'giwanttokilluman@gmail.com', 3, '2021-02-01'),
(13, 'HMigue_75', 'Hector Miguel', 'De Santiago', 'Adame', 'desplant123', 'ospaco.red@gmail.com', 3, '2021-02-01'),
(14, 'ArtePa_77xx', 'Paola', 'Arteaga', 'Garcia', 'bait123', 'zakaria12_@gmail.com', 3, '2021-02-03'),
(15, 'DanMP55', 'Tamara', 'Plascencia', 'Lopez', 'mason123', 'jennifer.mou_@gmail.com', 3, '2021-02-04'),
(16, 'Patrick-bob', 'Patricio Emanuel', 'Miron', 'Perez', 'papas123', 'ujames_1@gmail.com', 3, '2021-02-05'),
(17, 'ElisaMuro-Rey', 'Elisa', 'Muro', 'Reynoso', 'cuatra123', 'elovee_21@gmail.com', 3, '2021-02-06'),
(18, 'Tomas-Sylver777', 'Tomas', 'Corral', 'Lazarin', 'pali123', 'PaloArt55@gmail.com', 3, '2021-02-06'),
(19, 'MariLu-1999', 'Maria Lucia', 'Muñoz', 'De la rosa', '123mma', 'ela_ou_55@outlook.es', 3, '2021-02-06'),
(20, 'ImaGamer555', 'Imanol', 'Arzate', 'Rivera', 'inten193', 'Imas_a_331@outlook.es', 3, '2021-02-12'),
(21, 'WhizMar31', 'Marcos', 'Martinez', 'Jimenez', 'marde123', 'Maride_la_55@outlook.com', 3, '2021-02-16'),
(22, 'Fel-Ma', 'Felipe', 'Macias', 'Adame', 'bronce143', 'Tom_mas_55@outlook.es', 3, '2021-02-19'),
(23, 'Josepe:)', 'Joseph', 'De la Rosa', 'Esquivel', 'menis123', 'Santi_00_2@outlook.es', 3, '2021-02-19'),
(24, 'AxaRyu', 'Isaac', 'Lopez', 'Gonzales', 'qatar123', 'pbito123_4@gmail.com', 3, '2021-02-24'),
(25, 'JorPe-77', 'Jorge', 'Perez', 'Cuellar', 'gtqwe546', 'jorgdnz@gmail.com', 3, '2021-02-28'),
(26, 'DanBri-Gamerx', 'Daniel', 'Brizuela', 'De la cruz', 'delha1', 'Luna123_s@gmail.com', 3, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `fk_cliente_carr` (`cliente`),
  ADD KEY `fk_producto_carr` (`producto`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_cat`),
  ADD UNIQUE KEY `categoria` (`categoria`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`id_domicilio`),
  ADD KEY `fk_cliente` (`cliente`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id_metodo`);

--
-- Indices de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `fk_cliente_ord` (`cliente`),
  ADD KEY `fk_metodoPago_ord` (`metodoPago`),
  ADD KEY `fk_domicilio_ord` (`domicilio`);

--
-- Indices de la tabla `orden_detalle`
--
ALTER TABLE `orden_detalle`
  ADD PRIMARY KEY (`id_det`),
  ADD KEY `fk_ordende` (`orden`),
  ADD KEY `fk_productoo_det` (`producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `fk_categoria` (`categoria`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`cve_pub`),
  ADD UNIQUE KEY `titulo_pub` (`titulo_pub`),
  ADD KEY `fk_usuario` (`autor`);

--
-- Indices de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `tipo_usuario` (`tipo_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `fk_rol_usuario` (`Rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_cat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `id_domicilio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id_metodo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  MODIFY `id_orden` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `orden_detalle`
--
ALTER TABLE `orden_detalle`
  MODIFY `id_det` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `cve_pub` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  MODIFY `id_rol` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `fk_cliente_carr` FOREIGN KEY (`cliente`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `fk_producto_carr` FOREIGN KEY (`producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD CONSTRAINT `fk_cliente_ord` FOREIGN KEY (`cliente`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `fk_domicilio_ord` FOREIGN KEY (`domicilio`) REFERENCES `domicilio` (`id_domicilio`),
  ADD CONSTRAINT `fk_metodoPago_ord` FOREIGN KEY (`metodoPago`) REFERENCES `metodo_pago` (`id_metodo`);

--
-- Filtros para la tabla `orden_detalle`
--
ALTER TABLE `orden_detalle`
  ADD CONSTRAINT `fk_ordende` FOREIGN KEY (`orden`) REFERENCES `orden_compra` (`id_orden`),
  ADD CONSTRAINT `fk_productoo_det` FOREIGN KEY (`producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id_cat`);

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`autor`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_rol_usuario` FOREIGN KEY (`Rol`) REFERENCES `rol_usuario` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
