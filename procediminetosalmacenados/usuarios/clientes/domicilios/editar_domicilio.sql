USE `appsocom`;
DROP procedure IF EXISTS `editar_domicilio_I`;

DELIMITER $$
USE `appsocom`$$
CREATE PROCEDURE editar_domicilio_I (
in cliente int,
in calle varchar(100),
in ciudad varchar(100),
in meroExt int,
in meroInt int,
in codigo_postal int,
in elefono int,
in colonia  varchar(100)
) BEGIN
UPDATE
  domicilio
SET
  cliente = cliente,
  calle = calle,
  ciudad = ciudad,
  numeroExt = numeroExt,
  numeroInt = numeroInt,
  codigo_postal = codigo_postal,
  telefono = telefono,
  colonia = colonia
  WHERE
  id_domicilio=id_domicilio;
END$$

DELIMITER ;

