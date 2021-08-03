CREATE DEFINER = CURRENT_USER TRIGGER `proyecto1`.`actualisar_stock` AFTER INSERT ON `carrito` FOR EACH ROW
BEGIN
	update productos set productos.id_producto
END;
