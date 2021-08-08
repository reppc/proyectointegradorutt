USE `appsocom`;
DROP procedure IF EXISTS `editar_usuario_cliente_I`;

DELIMITER $$
USE `appsocom`$$
CREATE PROCEDURE editar_usuario_cliente_I(in id_usuario int,in nombre_usuario varchar(40),in nombres varchar(40),in ap_paterno varchar(40),in ap_materno varchar(40),in correo varchar(40),in contraseña varchar(40),in Rol int)
BEGIN
UPDATE usuarios SET 
nombre_usuario=nombre_usuario,
nombres=nombres,
ap_paterno=ap_paterno,
ap_materno=ap_materno,
contraseña=contraseña,
correo=correo
WHERE id_usuario=id_usuario;
END$$

DELIMITER ;