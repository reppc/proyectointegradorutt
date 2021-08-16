CREATE DEFINER = CURRENT_USER TRIGGER appsocom.confirmar_pedido_I
AFTER
UPDATE
  ON carrito FOR EACH ROW BEGIN if carrito.confirmacion = 1 THEN
  else if productos.stock != 0 and productos.stock = > carrito.cantidad then
/*actualizar stock*/
update
  productos
set
  productos.stock = producto.stock - old.cantidad
where
  productos.id_producto = old.producto;
/*orden_detalle*/
/*insercion de 
    producto
    cantidad
    precio
    */
INSERT INTO
  orden_detalle(producto, cantidad, precio)
VALUES
  (
    (
      select
        carrito.producto
      from
        carrito
      where
        carrito.id_carrito = old.id_carrito
    ),
    (
      select
        carrito.cantidad
      from
        carrito
      where
        carrito.id_carrito = old.id_carrito
    ),
    (
      select
        DISTINCT productos.precio_unitario
      from
        productos
        inner join carrito on productos.id_producto = carrito.producto
      where
        carrito.producto = old.id_carrito
    )
  )
  /*final de la insercion*/
end if;
end if;
END
current_datestamp