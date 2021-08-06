/*se restara el stock si se agrega a carrito*/
CREATE TRIGGER stock_restar_pruebaI
AFTER
INSERT
  ON carrito FOR EACH ROW
update
  productos
set
  productos.stock = producto.stock - carrito.cantidad
where
  productos.id_producto = carrito.producto