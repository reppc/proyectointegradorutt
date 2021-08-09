USE `appsocom`;
DROP procedure IF EXISTS `usuario_cliente_domicilio_insertar_I`;

DELIMITER $$
USE `appsocom`$$
CREATE PROCEDURE usuario_cliente_domicilio_insertar_I (
  in cliente int,
  in calle varchar(100),
  in ciudad varchar(100),
  in numeroExt int,
  in numeroInt int,
  in codigo_postal int,
  in telefono int,
  in colonia varchar(70)
) BEGIN
INSERT INTO
  domicilio(
    cliente,
    calle,
    ciudad,
    numeroExt,
    numeroInt,
    codigo_postal,
    telefono,
    colonia
  )
VALUES
  (
    cliente,
    calle,
    ciudad,
    numeroExt,
    numeroInt,
    codigo_postal,
    telefono,
    colonia
  );
END$$

DELIMITER ;

