<?php
  include("../../../../Scripts/productos.php");
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../../../inicio/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../../../inicio/css/navStyle.css" />
    <link rel="stylesheet" href="css/estilos.css" />
    <title>comprobacion datos</title>
  </head>
  <body>
<?php
if(!session_start() && $_SESSION['usuario']==null)
{
  echo "no hay session";
}
?>
  <form action="" method="get"> 
    <input type="radio"  name="pradio" value="prueba">prueba
    <input type="submit" name="seleccionar" value="asd">
    
  </form>
  <?php
    if (isset($_GET['pradio'])) 
    {
      echo "xd";
      header("Location: commprobacion_datos.php");
    }
    else {
      echo "chale";
    }
  ?>
<!---->
<!-- #region js-->
  <script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
  crossorigin="anonymous"
  ></script>
<!-- #endregion -->
  </body>
</html>
