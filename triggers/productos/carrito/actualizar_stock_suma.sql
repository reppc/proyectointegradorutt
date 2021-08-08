DROP TRIGGER IF EXISTS `stock_sumar_pruebaI`;
CREATE DEFINER = `root` @`localhost` TRIGGER `stock_sumar_pruebaI`
AFTER
  DELETE ON `carrito` FOR EACH ROW
update
  productos
set
  productos.stock = producto.stock + carrito.cantidad
where
  productos.id_producto = carrito.producto