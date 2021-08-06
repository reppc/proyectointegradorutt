-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2021 a las 02:06:21
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_cat` int(10) NOT NULL,
  `categoria` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  MODIFY `id_carrito` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_cat` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `id_domicilio` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id_metodo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  MODIFY `id_orden` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden_detalle`
--
ALTER TABLE `orden_detalle`
  MODIFY `id_det` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT;

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
