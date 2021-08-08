USE `appsocom`;
DROP procedure IF EXISTS `eliminar_usuario_cliente_I`;

DELIMITER $$
USE `appsocom`$$
CREATE PROCEDURE `eliminar_usuario_cliente_I` (in usuario int, in rol int)
BEGIN
/*no podra eliminar si el rol estro que no sea cliente*/
if rol=1 then
 DELETE FROM `usuarios` WHERE usuario;
 end if;
END$$

DELIMITER ;
