<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../inicio/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../inicio/css/navStyle.css" />
    <link rel="stylesheet" href="../css/estilo.css" />
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
    <title>Registrarse</title>
</head>
<body class="body-g">
<div id='contenedor'>
  <form method="get">
    <select class="form-control" width="100px" name="seleccion_pago" id="">
      <option value="1">efectivo</option>
      <option value="2">tarjeta</option>
      <option value="3">transaccion</option>
    </select>
    <input type="submit" name="finalizar" value="siguiente">
  </form>
      <!---->
        <?php
        //us=$us?total=$total_env?domicilio=$res->id_domicilio'
        echo $_GET['us'];
        echo $_GET['total'];
        echo $_GET['domicilio'];
    
        echo "
              <div id='central'>
                <div id='login'>
                  <div class='titulo'>
                    se creo la orden
                  </div>
                  <div class='img-fluid img-c'>
                    <img class='img-tam' src='../../../../login/imgLogin/checked-icon-clipart1.png'>
                  </div>
                </div>
              </div>
              ";
              //header("refresh:2; ./finalizacion/finalizacion compra.php");
              //ob_end_flush(); ?>
</div>
</body>
</html>