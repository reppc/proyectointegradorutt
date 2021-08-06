CREATE DEFINER = CURRENT_USER 
TRIGGER `pruebas_appsocomm1`.`actualisar_stock_sumar` 
AFTER DELETE ON `carrito` FOR EACH ROW 
FOR EACH ROW
BEGIN
	update productos set productos.existencia=producto.existencia + new.cantidad
	where productos.id_producto=new.id_producto
END;