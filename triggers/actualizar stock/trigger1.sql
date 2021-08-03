USE `proyecto1`;
CREATE DEFINER = CURRENT_USER TRIGGER `DemoDos`.`restarStock` after INSERT 
ON `carrito` FOR EACH ROW
BEGIN
Update `productos` set `existencia` = `STexistenciaOCK` - `New.cantidad`
where `id_producto` = `id_producto`;
END