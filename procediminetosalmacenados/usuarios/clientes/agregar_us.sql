CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_usuarios_I`(
in nombre_usuario varchar(40),
in nombres varchar(40),
in ap_paterno VARCHAR(40), 
in ap_materno VARCHAR(40),
in contraseña VARCHAR(40), 
in correo  VARCHAR(40),
in Rol int
)
BEGIN
insert into usuarios(nombre_usuario,nombres,ap_paterno, ap_materno,contraseña,correo,Rol,fecha_creacion)
values(nombre_usuario,nombres,ap_paterno, ap_materno,contraseña,correo,Rol,CURRENT_DATE);
END