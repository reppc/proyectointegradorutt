USE `appsocom`;
DROP procedure IF EXISTS `cliente_buscar_producto_I`;

DELIMITER $$
USE `appsocom`$$
CREATE PROCEDURE cliente_buscar_producto_I (
  in nombre varchar(100)
) BEGIN
SELECT
  nombre,
  descripcion,
  stock,
  precio_unitario,
  categoria,
  imagen
FROM
  productos
WHERE
nombre=nombre;

END$$

DELIMITER ;

