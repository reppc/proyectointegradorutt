-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-08-2021 a las 19:46:07
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
-- Base de datos: `appsocomm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(10) NOT NULL,
  `cliente` int(10) DEFAULT NULL,
  `producto` int(10) DEFAULT NULL,
  `cantidad` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `cliente`, `producto`, `cantidad`) VALUES
(1, 9, 1, 1),
(2, 1, 1, 2),
(3, 2, 2, 3),
(4, 3, 3, 4),
(5, 4, 3, 5),
(6, 5, 8, 6),
(7, 6, 20, 7),
(8, 1, 20, 8),
(9, 2, 9, 9),
(10, 3, 10, 10),
(11, 4, 11, 11),
(12, 5, 12, 12),
(13, 6, 13, 13),
(14, 7, 14, 14),
(15, 1, 15, 15),
(16, 8, 16, 16),
(17, 12, 14, 17),
(18, 20, 12, 18),
(19, 12, 7, 19),
(20, 3, 3, 20);

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
  `telefono` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`id_domicilio`, `cliente`, `calle`, `ciudad`, `numeroExt`, `numeroInt`, `codigo_postal`, `telefono`) VALUES
(1, 1, 'AZTECAS, LAS CAROLINAS', 'TORREÓN', 395, NULL, 27040, NULL),
(2, 2, 'PEDRO CAMINO, AMPLIACION LOS ANGELES', 'TORREÓN', 108, NULL, 27260, NULL),
(3, 3, 'JUAN E GARCIA, TORREON CENTRO', 'TORREÓN', 63, NULL, 27000, NULL),
(4, 4, 'PASEO DE LA DANZA, CAMPESTRE LA ROSITA', 'TORREÓN', 506, 1, 27250, NULL),
(5, 5, 'SALTILLO 400, CAMPESTRE LA ROSITA', 'TORREÓN', 951, NULL, 27250, NULL),
(6, 6, 'BERLIN, SAN ISIDRO', 'TORREÓN', 201, NULL, 27100, NULL),
(7, 7, 'AVE JUAREZ, FRAC CALIFORNIA', 'TORREÓN', NULL, NULL, 27089, NULL),
(8, 8, 'HIDALGO, TORREON CENTRO', 'TORREÓN', 1440, 4, 27000, NULL),
(9, 9, 'AV. PRESIDENTE CARRANZA, CENTRO', 'TORREÓN', 881, NULL, 27000, NULL),
(10, 10, 'SALTILLO, CAMPESTRE LA ROSITA', 'TORREÓN', 400, 951, 27250, NULL),
(11, 11, 'JUAREZ, TORREON CENTRO', 'TORREÓN', 3254, NULL, 27000, NULL),
(12, 12, 'PASEO DE LA DANZA, CAMPESTRE LA ROSITA', 'TORREÓN', 506, 1, 27250, NULL),
(13, 13, 'PASEO DE LA DANZA, CAMPESTRE LA ROSITA', 'TORREÓN', 506, 2, 27250, NULL),
(14, 14, 'PASEO DE LA DANZA, CAMPESTRE LA ROSITA', 'TORREÓN', 506, 3, 27250, NULL),
(15, 15, 'CARR MATAMOROS TORREON, LA AMISTAD', 'TORREÓN', 309, NULL, 27087, NULL),
(16, 16, 'CONSTITUCION, LAS MARGARITAS', 'TORREÓN', 1111, NULL, 27130, NULL),
(17, 17, 'AV PDTE CARRANZA, CENTRO', 'TORREÓN', 1499, NULL, 27000, NULL),
(18, 18, 'DE LAS PAPAS, ABASTOS', 'TORREÓN', 169, 170, 27020, NULL),
(19, 19, 'HIDALGO, TORREON CENTRO', 'TORREÓN', 1130, NULL, 27000, NULL),
(20, 20, 'FALCON, CENTRO', 'TORREÓN', 157, NULL, 27000, NULL);

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
  `metodoPago` int(10) NOT NULL,
  `total` int(10) NOT NULL,
  `domicilio` int(10) NOT NULL,
  `fecha_pedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden_compra`
--

INSERT INTO `orden_compra` (`id_orden`, `cliente`, `metodoPago`, `total`, `domicilio`, `fecha_pedido`) VALUES
(1, 1, 1, 1698, 1, '2019-08-12'),
(2, 2, 2, 1647, 2, '2019-09-29'),
(3, 3, 3, 377, 3, '2019-10-01'),
(4, 4, 3, 629, 4, '2019-11-02'),
(5, 5, 2, 2394, 5, '2019-12-15'),
(6, 6, 1, 17493, 6, '2020-01-17'),
(7, 7, 2, 9114, 7, '2020-02-18'),
(8, 8, 3, 9915, 8, '2020-03-20'),
(9, 9, 1, 849, 9, '2020-04-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_detalle`
--

CREATE TABLE `orden_detalle` (
  `id_det` int(10) NOT NULL,
  `orden` int(10) NOT NULL,
  `producto` int(10) NOT NULL,
  `cantidad` int(5) NOT NULL,
  `precio` int(10) NOT NULL
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
  `nombre` varchar(80) DEFAULT NULL,
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
  `titulo_pub` varchar(90) NOT NULL,
  `contenido` text NOT NULL,
  `imagen` varchar(60) DEFAULT NULL,
  `tema` enum('informativa','consejos','sugerencias') NOT NULL,
  `me_gusta` int(10) DEFAULT NULL,
  `hora_pub` time NOT NULL,
  `fecha_pub` date NOT NULL,
  `autor` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'Administrador'),
(2, 'Administrador_Blog'),
(3, 'Cliente');

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
(3, 'xxjuan77', 'Juan Manuel', 'Fernandez', 'Hernandez', 'santi123', 'fosaf47575@gmail.com', 3, '2021-01-20'),
(4, 'AleL55', 'Alejandra', 'Luna', 'Perez', 'iozo133', 'jseham_20@gmail.com', 3, '2021-01-22'),
(5, 'Leo33', 'Leon Daniel', 'Martinez', 'Hopi', 'dan934', 'vzlo_1@gmail.com', 3, '2021-01-23'),
(6, 'MariLaiu_5', 'Maria Rocio', 'Liu', 'Sanchez', 'letan123', '9hunjun@gmail.com', 3, '2021-01-25'),
(7, 'Jorch123', 'Jorge', 'Cisneros', 'Martinez', 'fueg_1', 'qhic_1@gmail.com', 3, '2021-01-27'),
(8, 'Pablolike55', 'Pablo', 'Contreras', 'Siller', '54senda', 'gsenyoo_5@gmail.com', 3, '2021-01-28'),
(9, 'ManuGar', 'Manuel', 'Garcia', 'Perez', 'nome35', 'boussama179@gmail.com', 3, '2021-01-29'),
(10, 'GarayEle23', 'Elsa Patricia', 'Garay', 'de la Cruz', 'spider123', '2ishwarya@gmail.com', 3, '2021-01-30'),
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
  ADD KEY `fk_carrito_producto` (`producto`);

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
  MODIFY `id_domicilio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `cve_pub` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  MODIFY `id_rol` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  ADD CONSTRAINT `fk_cliente_carr` FOREIGN KEY (`cliente`) REFERENCES `usuarios` (`id_usuario`);

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
