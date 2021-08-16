DROP TRIGGER IF EXISTS `pruebasappsocom`.`act_stock_I`;

DELIMITER $$
USE `pruebasappsocom`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `pruebasappsocom`.`act_stock_I` 
AFTER INSERT ON `orden_detalle` FOR EACH ROW
BEGIN
update
  productos
set
  productos.stock = productos.stock - new.cantidad
where
  productos.id_producto = new.producto;
END$$
DELIMITER ;
