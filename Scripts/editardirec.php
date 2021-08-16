<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="../inicio/css/bootstrap.min.css">
    <link rel="stylesheet" href="../inicio/css/navStyle.css">
    <style>
            #contenedor {
    display: flex;
    align-items: center;
    justify-content: center;
    
    margin: auto;
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

 <script src="../inicio/js/bootstrap.min.js"></script>
	<title>Finalizado</title>
</head>
<body class="body-g">
<?php
        session_start();
    ?>

      <?php 
      include'database.php';
      $conexion= new Database();
      $conexion->conectarDB();
      $iduser=$_SESSION['id'];

      $calle=$_POST['calle'];
      $colonia=$_POST['colonia'];
      $numero1=$_POST['numero1'];
      $numero2=$_POST['numero2'];
      $codigo=$_POST['codigo'];
      $telefono=$_POST['telefono'];
      $id=$_POST['id'];

      $consulta="UPDATE domicilio
      SET domicilio.calle='$calle', domicilio.codigo_postal='$codigo', domicilio.numeroExt='$numero1', domicilio.numeroInt='$numero2', domicilio.telefono='$telefono',domicilio.colonia='$colonia'
      WHERE domicilio.cliente='$iduser' AND domicilio.id_domicilio='$id'";

      $conexion->ejecutaSQL($consulta);
      $conexion->desconectarDB();


      echo "<div id='contenedor'>
        <div id='central'>
          <div id='login'>
            <div class='titulo'>
              Direccion modificada
            </div>
                <div class='img-fluid img-c'>
                <img class='img-tam' src='../login/imgLogin/checked-icon-clipart1.png'>
                </div>
                
            </div>
            </div>
        </div>";
        header("refresh:3 ../PHPVistas/MisDirecciones.php"); ?>
</body>
</html>