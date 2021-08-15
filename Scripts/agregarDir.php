<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Registro exitoso</title>
  <link rel="stylesheet" href="../inicio/css/bootstrap.min.css">
    <link rel="stylesheet" href="../inicio/css/navStyle.css">
    <style>
      #contenedor {
    display: flex;
    align-items: center;
    justify-content: center;
    
    margin: 0;
    padding: 0;
    min-width: 100vw;
    min-height: 100vh;
    width: 100%;
    height: 100%;
    }
    .titulo {
        font-size: 250%;
        color:#56c93f;
        text-align: center;
        margin-bottom: 20px;
    }

    #central {
        max-width: 320px;
        width: 100%;
    }
    #login {
        width: 100%;
        padding: 50px 30px;
        background-color: #eafff1;
        
        -webkit-box-shadow: 0px 0px 5px 5px rgba(0,0,0,0.15);
        -moz-box-shadow: 0px 0px 5px 5px rgba(0,0,0,0.15);
        box-shadow: 0px 0px 5px 5px rgba(0,0,0,0.15);
        
        border-radius: 3px 3px 3px 3px;
        -moz-border-radius: 3px 3px 3px 3px;
        -webkit-border-radius: 3px 3px 3px 3px;
        
        box-sizing: border-box;
    }
    .body-g{
        background-color: #2aa13e;
    }
    .img-c{
      text-align: center;
    }
    .img-tam{
      width: 50%;
    }
    </style>
</head>
<style type="text/css">
	.body-g{
        background-color: #2aa13e;
    }
</style>
<body class="body-g">

<?php 
 include 'database.php';
 $db=new Database();
       $db->conectarDB();

extract($_POST);
       session_start();
$iduser=$_SESSION["usuario"];


        $miconsulta="INSERT INTO domicilio (cliente, calle, codigo_postal, numeroExt, numeroInt, telefono, colonia) VALUES ((SELECT usuarios.id_usuario FROM usuarios WHERE usuarios.nombre_usuario='$iduser'),'$calle','$codigop','$numeroE','$numeroI','$telefono','$colonia')";

        $db->ejecutaSQL($miconsulta);
        $db->desconectarDB();

        echo "<div id='contenedor'>
        <div id='central'>
          <div id='login'>
            <div class='titulo'>
              Dirección agregada
            </div>
                <div class='img-fluid img-c'>
                <img class='img-tam' src='../login/imgLogin/checked-icon-clipart1.png'>
                </div>
                
            </div>
            </div>
        </div>";
        header("refresh:2 ../PHPVistas/MisDirecciones.php");

?>
</body>
</html>