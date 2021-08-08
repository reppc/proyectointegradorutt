  --productos
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

  --fin
  --metodo pago
  INSERT INTO `metodo_pago` (`id_metodo`, `nombre`) VALUES
(1, 'efectivo'),
(2, 'tarjeta'),
(3, 'transaccion');

 
 --categoria
 INSERT INTO `categoria` (`id_cat`, `categoria`) VALUES
(1, 'accesorios'),
(2, 'limpieza'),
(3, 'refacciones');
--carrito
insert into
  carrito(cliente,producto, cantidad)
VALUES
  (9, 1, 1),
  (1, 1, 2),
  (2, 2, 3),
  (3, 3, 4),
  (4, 3, 5),
  (5, 8, 6),
  (6, 20, 7),
  (1, 20, 8),
  (2, 9, 9),
  (3, 10, 10),
  (4, 11, 11),
  (5, 12, 12),
  (6, 13, 13),
  (7, 14, 14),
  (1, 15, 15),
  (8, 16, 16),
  (12, 14, 17),
  (20, 12, 18),
  (12, 7, 19),
  (3, 3, 20);
--fin
ALTER TABLE
  orden_compra AUTO_INCREMENT = 1;
alter table orden_compra AUTO_INCREMENT=1;
 --orden_compra
insert into
  orden_compra(cliente,metodoPago,total,domicilio,fecha_pedido)
values
  (1, 1, 1698, 1, '2019-08-12'),
  (2, 2, 1647, 2, '2019-09-29'),
  (3, 3, '377.28', 3, '2019-10-1'),
  (4, 3, '628.8', 4, '2019-11-2'),
  (5, 2, 2394, 5, '2019-12-15'),
  (6, 1, 17493, 6, '2020-01-17'),
  (7, 2, '9113.86', 7, '2020-02-18'),
  (8, 3, '9914.56', 8, '2020-03-20'),
  (9, 1, 849, 9, '2020-04-29');

 --orden_detalle
insert into
  orden_detalle(orden,producto, cantidad, precio)
VALUES
  (1, 1, 2, 849),
  (2, 2, 3, 549),
  (3, 3, 4, '125.76'),
  (4, 3, 5, '125.76'),
  (5, 8, 8, 399),
  (6, 20, 7, 2499),
  (7, 14, 14,'650.99'),
  (8, 16, 16, '619.66'),
  (9, 1, 1, 849);