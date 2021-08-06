CREATE DEFINER = CURRENT_USER 
TRIGGER `pruebas_appsocomm1`.`actualisar_stock_restar` 
AFTER INSERT ON `carrito` 
FOR EACH ROW update `productos` set productos.existencia=producto.existencia - new.cantidad where productos.id_producto=new.id_producto
