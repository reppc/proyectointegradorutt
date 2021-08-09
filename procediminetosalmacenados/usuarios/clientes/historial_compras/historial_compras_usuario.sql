USE `appsocom`;
DROP procedure IF EXISTS `historial_de_compras_cliente_filtro_I`;

DELIMITER $$
USE `appsocom`$$
CREATE PROCEDURE `historial_de_compras_cliente_filtro_I` (
in cliente int,
in fecha datetime,
in nombre_producto varchar(200)
)
BEGIN
select
    orden_compra.id_orden as 'N°orden',
    metodo_pago.nombre as 'metodo de pago',
    orden_compra.fecha_pedido as 'fecha del pedido',
    orden_compra.total,
    CONCAT(
      domicilio.calle,
      domicilio.numeroExt,
      domicilio.numeroInt,
      domicilio.codigo_postal,
      domicilio.colonia,
      domicilio.ciudad
    ) as 'direccion',
    productos.imagen as '',
    productos.nombre,
    orden_detalle.cantidad,
    productos.precio_unitario as 'precio individual'
   from orden_compra
   INNER JOIN metodo_pago
   on metodo_pago.id_metodo=orden_compra.metodoPago
   INNER JOIN domicilio
   on domicilio.id_domicilio=orden_compra.domicilio
   INNER JOIN orden_detalle
   on orden_detalle.orden=orden_compra.id_orden
   INNER JOIN productos
   on productos.id_producto=orden_detalle.producto
   INNER JOIN usuarios
   on usuarios.id_usuario=orden_compra.cliente
   where orden_compra.cliente=cliente or 
   orden_compra.fecha_pedido=fecha or 
   productos.nombre=nombre_producto;
END$$

DELIMITER ;

