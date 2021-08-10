<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../css">
	<title>Tu Carrito</title>
</head>
<body>
	<div class="container">
		<h1>Carrito</h1>
		<?php 

			include 'database.php';
			$conexion= new database();
			$conexion->conectarDB();

			$consulta="SELECT productos.imagen, productos.descripcion, carrito.cantidad, productos.precio_unitario,
(productos.precio_unitario * carrito.cantidad) 
FROM productos INNER JOIN carrito ON productos.id_producto= carrito.producto 
INNER JOIN usuarios ON carrito.cliente= usuarios.id_usuario 
WHERE carrito.cliente= '5'";
			
			$tabla=$conexion->seleccionar($consulta);

			echo "<table class='table table-hover'>
	<thead class='table-dark'>
	<tr>
	<th>Imagen</th><th>Descripcion</th><th>Cantidad</th><th>Precio Unitario</th><th>Precio total</th><th>Eliminar</th>
	</tr>
	</thead>
	<tbody>";

	foreach($tabla as $registro)
	{
		echo "<tr>";
		echo "<td>$registro->imagen</td>";
		echo "<td>$registro->descripcion</td>";
		echo "<td>$registro->cantidad</td>";
		echo "<td>$registro->precio_unitario</td>";
		echo "<td>$registro->precio_unitario * carrito.cantidad</td>";
		echo "</tr>";
	}
	echo "</tbody>
	</table>";
			$conexion->desconectarDB();

		?>

	</div>
</body>
</html>