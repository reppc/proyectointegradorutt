USE `appsocom`;
DROP procedure IF EXISTS `insertar_productos_usuario_I`;
DELIMITER $ $ USE `appsocom` $ $ CREATE PROCEDURE `insertar_productos_usuario_I` (
  in cliente INt,
  in producto int,
  in cantidad int,
  in confirmacion tinyint(1)
) BEGIN if confirmacion = 0
or confirmacion = null
or confirmacion = '' then
INSERT INTO
  carrito(
    cliente,
    producto,
    cantidad,
    confirmacion
  )
VALUES
  (
    cliente,
    producto,
    cantidad,
    0
  );
elseif confirmacion = 1 then
INSERT INTO
  carrito(
    cliente,
    producto,
    cantidad,
    confirmacion
  )
VALUES
  (
    cliente,
    producto,
    cantidad,
    confirmacion
  );
end if;
END $ $ DELIMITER;