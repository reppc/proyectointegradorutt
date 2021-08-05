CREATE DEFINER = CURRENT_USER 
TRIGGER `proyecto1`.`actualisar_stock` AFTER INSERT ON `carrito` 
FOR EACH ROW
BEGIN
	update productos set productos.existencia=producto.existencia - new.cantidad
	where productos.id_producto=new.id_producto
END;
