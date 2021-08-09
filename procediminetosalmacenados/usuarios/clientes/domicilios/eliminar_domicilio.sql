USE `appsocom`;
DROP procedure IF EXISTS `eliminar_dimicilio_I`;

DELIMITER $$
USE `appsocom`$$
CREATE PROCEDURE `eliminar_dimicilio_I` (in id_domicilio int)
BEGIN

DELETE FROM `domicilio` WHERE 	id_domicilio;
END$$

DELIMITER ;

