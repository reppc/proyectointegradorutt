CREATE DEFINER = CURRENT_USER TRIGGER appsocom.confirmar_pedido_I
AFTER
UPDATE
  ON carrito FOR EACH ROW BEGIN if carrito.confirmacion = 1 then
  /*orden_compra*/
INSERT INTO
  orden_compra(
    id_orden,
    cliente,
    metodoPago,
    total,
    domicilio,
    fecha_pedido
  )
VALUES
  (
      id_orden,
    cliente,
    metodoPago,
    total,
    domicilio,
    fecha_pedido
  )
  /*orden_detalle*/
  /*carrito*/
  /*stock*/
end if;
END