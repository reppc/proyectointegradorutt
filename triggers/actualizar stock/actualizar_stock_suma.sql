/*trigger actualiza el stock si se elimina un producto del carrito*/
CREATE TRIGGER stock_sumar_pruebaI
AFTER
INSERT
  ON carrito FOR EACH ROW
update
  productos
set
  productos.stock = producto.stock + carrito.cantidad
where
  productos.id_producto = carrito.producto