
USE `appsocom`;
DROP procedure IF EXISTS `appsocom`.`admin_eliminar_usuario_I`;
;

DELIMITER $$
USE `appsocom`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_eliminar_usuario_I`(in usuario int)
BEGIN
 DELETE FROM `usuarios` WHERE usuario;
END$$

DELIMITER ;
;
