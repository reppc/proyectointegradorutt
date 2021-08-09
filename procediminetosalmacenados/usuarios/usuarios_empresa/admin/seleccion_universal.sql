USE `appsocom`;
DROP procedure IF EXISTS `seleccion_universal_I`;

DELIMITER $$
USE `appsocom`$$
CREATE PROCEDURE `seleccion_universal_I` (in nombre_tabla varchar(90))
BEGIN
SELECT * FROM nombre_tabla ;
END$$

DELIMITER ;

