<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../../inicio/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../../inicio/css/navStyle.css" />
    <link rel="stylesheet" href="css/estylo.css" />
    <link rel="stylesheet" href="css/fontawesome-all.min.css">
    <title>Document</title>
</head>
<body>
    <div class="container">
<?php
if(!isset($_GET["id"])) exit();
$id = $_GET["id"];
include_once "../../../scripts/productos.php";
$base_de_datos=new producto();

$sentencia = $base_de_datos->seleccionar_carro($id);
if($sentencia === FALSE){
	echo "¡No existe algún producto con ese ID!";
	exit();
}
foreach ($sentencia as $value) 
{

?>
	<div class="col-xs-12">
        <p>ingrese al cantidad que sesea llevar</p>
		<form method="post" action="">
			<input type="hidden" name="id" value="<?php echo $value->id_carrito; ?>">

			<label for="descripcion">cantidad:</label>
			<!--<input value="<?php //echo $value->cantidad ?>" class="form-control" 
            name="precioVenta" required type="number" 
            id="cantidad" placeholder="cantidad">-->
			<select name="precioVenta" id="">
                <option from="precioVenta" value="1">1</option>
                <option from="precioVenta" value="2">2</option>
                <option from="precioVenta" value="3">3</option>
                <option from="precioVenta" value="4">4</option>
                <option from="precioVenta" value="5">5</option>
            </select>
            <br><br><input class="btn btn-info" type="submit" name="guardar" value="Guardar">
			<a class="btn btn-warning" href="carrito.php">Cancelar</a>
			<a class="btn btn-warning" href="carrito.php">atras</a>
		</form>
	</div>
<?php
}
$editar=new producto();
if (isset($_POST['guardar'])) 
{
    
    $editar->actualizar_cantidad($id,$_POST['precioVenta']);
    echo "actualizado";
}
?>
</div>
</body>
</html>