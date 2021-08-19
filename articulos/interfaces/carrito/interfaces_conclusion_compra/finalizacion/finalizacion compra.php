<?php
/* H:i:s agregar despues de "d con espacio para agregar la hora"*/
 date_default_timezone_set('America/Chihuahua');
 $hoys = date("d");
 $hoy = date("Y-m-$hoys");
  include("../../../../../Scripts/productos.php");
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../../../../inicio/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../../../../inicio/css/navStyle.css" />
    <link rel="stylesheet" href="css/estilo.css" />
    <title>finalizacion compra</title>
  </head>
  <body>
<?php
    session_start();
?>

    <!--Barra navegadora-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <!--logo-->
        <div class="container-fluid">
          <img class="logo navbar-brand md" src="../../../inicio/Imagenes/logo-sin-letras2.png" alt="">
          <a class="navbar-brand" href="">Soporte y servicios informaticos</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <!--Inicio-->
                <li class="nav-item navli">
                    <a class="nav-link active" aria-current="page" href="../../../../../inicio/index copy.php">
                        <svg style="margin-bottom: 5px;" width="30" height="15" viewBox="0 0 1 34" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M29.1667 11.0887L19.7917 2.65125L5.02917 15.9375H8.33333V30.9375H14.5833V19.6875H25V30.9375H31.25V15.9375H34.5542L31.25 12.9637V6.5625H29.1667V11.0887ZM0 17.8125L19.7917 0L27.0833 6.5625V4.6875H33.3333V12.1875L39.5833 17.8125H33.3333V32.8088H22.9167V21.5588H16.6667V32.8088H6.25V17.8125H0Z" fill="white"/>
                        </svg>
                        Inicio</a>
                </li>
                <!--articulos-->
                <li class="nav-item dropdown navli">
                  <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <svg style="margin-bottom: 5px;" width="15" height="19" viewBox="0 0 27 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M21.316 21.5658C22.0698 21.5658 22.7927 21.8652 23.3257 22.3982C23.8587 22.9312 24.1581 23.6541 24.1581 24.4079C24.1581 25.1617 23.8587 25.8846 23.3257 26.4176C22.7927 26.9506 22.0698 27.25 21.316 27.25C20.5622 27.25 19.8393 26.9506 19.3063 26.4176C18.7733 25.8846 18.4739 25.1617 18.4739 24.4079C18.4739 23.6541 18.7733 22.9312 19.3063 22.3982C19.8393 21.8652 20.5622 21.5658 21.316 21.5658ZM21.316 22.9868C20.9391 22.9868 20.5777 23.1366 20.3112 23.4031C20.0447 23.6696 19.8949 24.031 19.8949 24.4079C19.8949 24.7848 20.0447 25.1462 20.3112 25.4127C20.5777 25.6792 20.9391 25.8289 21.316 25.8289C21.6929 25.8289 22.0543 25.6792 22.3208 25.4127C22.5874 25.1462 22.7371 24.7848 22.7371 24.4079C22.7371 24.031 22.5874 23.6696 22.3208 23.4031C22.0543 23.1366 21.6929 22.9868 21.316 22.9868ZM8.5264 21.5658C9.28018 21.5658 10.0031 21.8652 10.5361 22.3982C11.0691 22.9312 11.3685 23.6541 11.3685 24.4079C11.3685 25.1617 11.0691 25.8846 10.5361 26.4176C10.0031 26.9506 9.28018 27.25 8.5264 27.25C7.77262 27.25 7.04971 26.9506 6.51671 26.4176C5.98371 25.8846 5.68427 25.1617 5.68427 24.4079C5.68427 23.6541 5.98371 22.9312 6.51671 22.3982C7.04971 21.8652 7.77262 21.5658 8.5264 21.5658ZM8.5264 22.9868C8.14951 22.9868 7.78806 23.1366 7.52155 23.4031C7.25505 23.6696 7.10533 24.031 7.10533 24.4079C7.10533 24.7848 7.25505 25.1462 7.52155 25.4127C7.78806 25.6792 8.14951 25.8289 8.5264 25.8289C8.90329 25.8289 9.26474 25.6792 9.53125 25.4127C9.79775 25.1462 9.94747 24.7848 9.94747 24.4079C9.94747 24.031 9.79775 23.6696 9.53125 23.4031C9.26474 23.1366 8.90329 22.9868 8.5264 22.9868ZM24.1581 4.51316H4.65115L8.27061 13.0395H19.8949C20.1159 13.0398 20.3339 12.9883 20.5313 12.8891C20.7288 12.7899 20.9002 12.6457 21.0318 12.4682L25.295 6.784H25.2964C25.454 6.57277 25.5498 6.32187 25.573 6.05935C25.5962 5.79683 25.5459 5.53303 25.4278 5.29742C25.3097 5.06182 25.1284 4.8637 24.9042 4.7252C24.68 4.58671 24.4217 4.51329 24.1581 4.51316ZM19.8949 14.4605H8.33598L7.24744 16.6774L7.10533 17.3026C7.10533 17.6795 7.25505 18.041 7.52155 18.3075C7.78806 18.574 8.14951 18.7237 8.5264 18.7237H24.1581V20.1447H8.5264C8.03154 20.145 7.54519 20.016 7.11547 19.7706C6.68576 19.5252 6.32757 19.1718 6.07635 18.7454C5.82513 18.3191 5.68958 17.8345 5.68313 17.3397C5.67667 16.8449 5.79952 16.357 6.03953 15.9242L7.0627 13.8296L1.90139 1.67105H0V0.25H2.84213L4.04862 3.09211H24.1581C24.6951 3.09216 25.2211 3.24433 25.6752 3.531C26.1292 3.81768 26.4928 4.22711 26.7237 4.7119C26.9547 5.19668 27.0435 5.73697 26.9801 6.27018C26.9166 6.8034 26.7034 7.30772 26.3651 7.72474L22.2241 13.2469C21.9622 13.6218 21.6138 13.9279 21.2083 14.1392C20.8027 14.3505 20.3522 14.4607 19.8949 14.4605Z" fill="white"/>
                        </svg>
                        Articulos</a>
                        <!--lista del dropdown de articulos-->
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <li>
                            <a class="dropdown-item" href="../../../../home_articulos.php">Articulos</a>
                          </li>
                          <?php
                            if(isset($_SESSION["usuario"]) && $_SESSION['rol']=='Administrador')
                            {

                            ?>
                          <div class="dropdown-divider"></div>
                          <li>
                             <a class="dropdown-item" href="../../../../../PHPVistas/verProductos.php"> Ver registros de Productos</a>
                            </li>
                          <li>
                            <a class="dropdown-item" href="../../../../../PHPVistas/verMetodosPago.php">Ver registros de  metodos de pago</a>
                          </li>

                            <a class="dropdown-item" href="../../../../../PHPVistas/HistorialPedidos.php">Historial de pedidos</a>
                            <div class="dropdown-divider"></div>
                            <?php
                            }
                            ?>
                        </ul>
                        <!---->
                        
                </li>
                <!--blog-->
                <li class="nav-item dropdown navli">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <svg style="margin-bottom: 5px;" width="17" height="17" viewBox="0 0 35 33" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M11.2 16C11.2 16.5304 10.9787 17.0391 10.5849 17.4142C10.1911 17.7893 9.65695 18 9.1 18C8.54305 18 8.0089 17.7893 7.61508 17.4142C7.22125 17.0391 7 16.5304 7 16C7 15.4696 7.22125 14.9609 7.61508 14.5858C8.0089 14.2107 8.54305 14 9.1 14C9.65695 14 10.1911 14.2107 10.5849 14.5858C10.9787 14.9609 11.2 15.4696 11.2 16ZM19.6 16C19.6 16.5304 19.3787 17.0391 18.9849 17.4142C18.5911 17.7893 18.057 18 17.5 18C16.943 18 16.4089 17.7893 16.0151 17.4142C15.6212 17.0391 15.4 16.5304 15.4 16C15.4 15.4696 15.6212 14.9609 16.0151 14.5858C16.4089 14.2107 16.943 14 17.5 14C18.057 14 18.5911 14.2107 18.9849 14.5858C19.3787 14.9609 19.6 15.4696 19.6 16ZM25.9 18C26.457 18 26.9911 17.7893 27.3849 17.4142C27.7787 17.0391 28 16.5304 28 16C28 15.4696 27.7787 14.9609 27.3849 14.5858C26.9911 14.2107 26.457 14 25.9 14C25.343 14 24.8089 14.2107 24.4151 14.5858C24.0212 14.9609 23.8 15.4696 23.8 16C23.8 16.5304 24.0212 17.0391 24.4151 17.4142C24.8089 17.7893 25.343 18 25.9 18Z" fill="white"/>
                            <path d="M4.73594 32.7165L4.77969 32.7076C8.78281 31.9054 11.2284 30.8467 12.3659 30.2655C14.0407 30.7167 15.7667 30.9441 17.5 30.9417C27.1644 30.9417 35 24.0152 35 15.4709C35 6.92653 27.1644 0 17.5 0C7.83562 0 0 6.92653 0 15.4709C0 19.3607 1.62531 22.919 4.30938 25.6375C4.12159 27.3837 3.73702 29.1025 3.16313 30.7605L3.15656 30.7848C2.99347 31.2597 2.81546 31.7292 2.62281 32.1927C2.45 32.6038 2.78469 33.0635 3.22 32.9927C3.72676 32.909 4.23214 32.8169 4.73594 32.7165ZM6.48594 25.8474C6.51658 25.5238 6.4762 25.1974 6.36768 24.8914C6.25917 24.5854 6.08518 24.3074 5.85812 24.0771C3.53938 21.7255 2.1875 18.7153 2.1875 15.4709C2.1875 8.41616 8.75875 2.21012 17.5 2.21012C26.2413 2.21012 32.8125 8.41616 32.8125 15.4709C32.8125 22.5278 26.2413 28.7316 17.5 28.7316C15.958 28.7339 14.4224 28.5318 12.9325 28.1305C12.4118 27.9895 11.858 28.0478 11.3772 28.294C10.5306 28.7272 8.66469 29.5538 5.61531 30.2677C6.04073 28.8248 6.3322 27.3449 6.48594 25.8474Z" fill="white"/>
                            </svg>
                            
                        Blog</a>
  
                        <!--lista del dropdown de articulos-->
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <li>
                            <a class="dropdown-item" href="../../../../../Blog/blog-informativo.php" >Informativo</a>
                          </li>
                          <li>
                              <a class="dropdown-item" href="../../../../../Blog/blog-consejos.php">Consejos</a>
                          </li>
                          <li>
                              <a class="dropdown-item" href="../../../../../Blog/blog-sugerencias.php">Sugerencias</a>
                            </li>
                            <?php
                            if(isset($_SESSION["usuario"]) && $_SESSION['rol']=='Administrador_Blog')
                            {

                            ?>
                          <div class="dropdown-divider"></div>
                          <li>
                            <a class="dropdown-item" href="../AdminBlog/FormAddBlog.php">Crear entrada</a>
                          </li>
                          <div class="dropdown-divider"></div>
                          <?php
                            }
                            ?>
                        </ul>        
                </li>
                

                <!--Perfil-->
                <li class="nav-item dropdown navli">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <svg style="margin-bottom: 5px;" width="17" height="17" viewBox="0 0 35 33" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M11.2 16C11.2 16.5304 10.9787 17.0391 10.5849 17.4142C10.1911 17.7893 9.65695 18 9.1 18C8.54305 18 8.0089 17.7893 7.61508 17.4142C7.22125 17.0391 7 16.5304 7 16C7 15.4696 7.22125 14.9609 7.61508 14.5858C8.0089 14.2107 8.54305 14 9.1 14C9.65695 14 10.1911 14.2107 10.5849 14.5858C10.9787 14.9609 11.2 15.4696 11.2 16ZM19.6 16C19.6 16.5304 19.3787 17.0391 18.9849 17.4142C18.5911 17.7893 18.057 18 17.5 18C16.943 18 16.4089 17.7893 16.0151 17.4142C15.6212 17.0391 15.4 16.5304 15.4 16C15.4 15.4696 15.6212 14.9609 16.0151 14.5858C16.4089 14.2107 16.943 14 17.5 14C18.057 14 18.5911 14.2107 18.9849 14.5858C19.3787 14.9609 19.6 15.4696 19.6 16ZM25.9 18C26.457 18 26.9911 17.7893 27.3849 17.4142C27.7787 17.0391 28 16.5304 28 16C28 15.4696 27.7787 14.9609 27.3849 14.5858C26.9911 14.2107 26.457 14 25.9 14C25.343 14 24.8089 14.2107 24.4151 14.5858C24.0212 14.9609 23.8 15.4696 23.8 16C23.8 16.5304 24.0212 17.0391 24.4151 17.4142C24.8089 17.7893 25.343 18 25.9 18Z" fill="white"/>
                            <path d="M4.73594 32.7165L4.77969 32.7076C8.78281 31.9054 11.2284 30.8467 12.3659 30.2655C14.0407 30.7167 15.7667 30.9441 17.5 30.9417C27.1644 30.9417 35 24.0152 35 15.4709C35 6.92653 27.1644 0 17.5 0C7.83562 0 0 6.92653 0 15.4709C0 19.3607 1.62531 22.919 4.30938 25.6375C4.12159 27.3837 3.73702 29.1025 3.16313 30.7605L3.15656 30.7848C2.99347 31.2597 2.81546 31.7292 2.62281 32.1927C2.45 32.6038 2.78469 33.0635 3.22 32.9927C3.72676 32.909 4.23214 32.8169 4.73594 32.7165ZM6.48594 25.8474C6.51658 25.5238 6.4762 25.1974 6.36768 24.8914C6.25917 24.5854 6.08518 24.3074 5.85812 24.0771C3.53938 21.7255 2.1875 18.7153 2.1875 15.4709C2.1875 8.41616 8.75875 2.21012 17.5 2.21012C26.2413 2.21012 32.8125 8.41616 32.8125 15.4709C32.8125 22.5278 26.2413 28.7316 17.5 28.7316C15.958 28.7339 14.4224 28.5318 12.9325 28.1305C12.4118 27.9895 11.858 28.0478 11.3772 28.294C10.5306 28.7272 8.66469 29.5538 5.61531 30.2677C6.04073 28.8248 6.3322 27.3449 6.48594 25.8474Z" fill="white"/>
                            </svg>
                            
                        <?php 

                        if(isset($_SESSION["usuario"]))
                        { 
                            echo $_SESSION['rol'] . ": " . $_SESSION['usuario'];
                        } else {
                            
                            echo "Perfil";
                        }
                        ?>
                        </a>
  
                        <!--lista del dropdown de perfil-->
                        
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <li>
                            <a class="dropdown-item" <?php if(isset($_SESSION["usuario"])){echo "href='../../../../../PHPVistas/MiPerfil.php'";}else{echo "href='../login/login.php'";}?> >Mi perfil</a>
                          </li>

                          <?php
                            if(isset($_SESSION["usuario"]) && $_SESSION['rol']=='Cliente')
                            {

                            ?>

                          <li>
                              <a class="dropdown-item" <?php if(isset($_SESSION["usuario"])){echo "href='../../../../../PHPVistas/HistorialCompras.php'";}else{echo "href='../login/login.php'";}?>>Mis pedidos</a>
                          </li>
                          <li>PHPVistas
                              <a class="dropdown-item" <?php if(isset($_SESSION["usuario"])){echo "href='../../../../../MisDirecciones.php'";}else{echo "href='../login/login.php'";}?>>Mis direcciones</a>
                          </li>

                            <?php
                            }
                            ?>

                          <?php
                            if(isset($_SESSION["usuario"]) && $_SESSION['rol']=='Administrador')
                            {

                            ?>
                            <div class="dropdown-divider"></div>
                            <li>
                              <a class="dropdown-item" href="../../../../../PHPVistas/VerUsuarios.php">Ver usuarios</a>
                            </li>
                            <div class="dropdown-divider"></div>
                            <?php
                            }
                            ?>

                            <?php
                            if(isset($_SESSION["usuario"]))
                            {

                            ?>
                          <li>
                            <a class="dropdown-item" href="../../../../../Scripts/cerrarSesion.php">Cerrar sesion</a>
                          </li>
                          <?php
                            }
                            ?>
                        </ul>
                             
                </li>

                </ul>
                <?php
                    if(!isset($_SESSION["usuario"]))
                    { 
                        echo "<!-- #region boton-->
                        <form class='d-flex'>
                          <a href='../login/login.php' class='btn btn-outline-light' style='text-decoration: none;' id='redondeado'>Acceder</a>
                        </form>
                    <!-- #endregion -->";
                    }
                ?>
                
          </div>
        </div>
      </nav>
    <!---->
    <!-- #region contenido inicio-->
    <!--titulo-->
    <div class="row">
      <h2 style="text-align: center">Confirmacion</h2>
    </div>
    <!---->
    <!--datos de la orden-->
    <div class="row" style="margin: 20px">
    <div class="row">
      <h2 style="text-align: center">detalle de orden</h2>
    </div>
      <table class="table">
        <title>detalle de la orden</title>
        <thead>
          <tr>
            <th scope="col">numero de orden</th>
            <th scope="col">metodo de pago</th>
            <th scope="col">fecha de pedido</th>
            <th scope="col">Monto total</th>
          </tr>
        </thead>
        <tbody>
            <?php
              $carga_orden=new producto();
              $cargar_ordenes=$carga_orden->carga_orden($_SESSION['id'],$hoy);
              $ord_total=0;
              $id_ord_compra=0;
              foreach ($cargar_ordenes as $value) 
              {
                echo
                "
                <tr>
                  <th scope='row'>$value->id_orden</th>
                  <td>$value->nombre</td>
                  <td>$value->fecha_pedido</td>
                  <td>$value->total</td>
                </tr>
                ";
                $ord_total+=$value->total;
                $id_ord_compra+=$value->id_orden;
              }
            ?>
        </tbody>
      </table>
      <!--domicilio-->
      <div class="row">
      <h2 style="text-align: center">domicilio de envio</h2>
    </div>
      <table class="table">
        <thead>
          <tr>
            <th scope="col">calle</th>
            <th scope="col">numeroExt</th>
            <th scope="col">numeroInt</th>
            <th scope="col">CP</th>
            <th scope="col">colonia</th>
            <th scope="col">telefono</th>
            <th scope="col">colonia</th>
          </tr>
        </thead>
        <tbody>
            <?php
              $carga_orden=new producto();
              $cargar_ordenes=$carga_orden->carga_orden($_SESSION['id'],$hoy);
              foreach ($cargar_ordenes as $value) 
              {
                echo
                "
                <tr>
                  <th scope='row'>$value->calle</th>
                  <td>$value->numeroExt</td>
                  <td>$value->numeroInt</td>
                  <td>$value->codigo_postal</td>
                  <td>$value->colonia</td>
                  <td>$value->telefono</td>
                  <td>$value->colonia</td>
                </tr>
                ";
              }
            ?>
        </tbody>
      </table>
    </div>
    <!---->
    <!--titulo-->
    <div class="row">
      <h2 style="text-align: center">Articulos a comprar</h2>
    </div>
    <!---->
    <!--datos productos-->
    <div class="row" style="margin: 20px">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">nombre del producto</th>
            <th scope="col">cantidad</th>
            <th scope="col">precio unitario</th>
            <th scope="col">total</th>
          </tr>
        </thead>
        <tbody>
          
            <?php
              $carga_articulos=new producto();
              $cont_art=$carga_articulos->carga_productos($_SESSION['id']);
              $sub_t=0;
              $total=0;
              foreach ($cont_art as $value) 
              {
                $sub_t=$value->precio_unitario*$value->cantidad;
                echo "
                <tr>
                <th scope='row'>$value->nombre</th>
                <td>$value->cantidad</td>
                <td>$$value->precio_unitario</td>
                <td>$sub_t</td>
                </tr>
                ";
                $total+=$sub_t;
              }
            ?>
          
        </tbody>
      </table>
      <hr>
      <div class="col">
        <p>total:</p>
      </div>
      <div class="col">
        <p><?php echo$total;?></p>
      </div>
      <?php 
      $act_total=new producto();
      $usuario=$_SESSION['id'];
        if($ord_total==$total)
        {
          
        }
        else 
        {
          
          $atcualizar=$act_total->actualizar_total($total,$usuario,$hoy);
        }
      ?>
    </div>
    <!---->
    <div class="row">
      <form action="">
        <div class="col" style="text-align: center">
          <a class="boton_atras btn" href="../comprobacion_datos.php">atras</a>
          <!-- Button trigger modal -->
          <button type="button" class="btn boton_finalizar" data-bs-toggle="modal" data-bs-target="#exampleModal">
            finalizar
          </button>
          <!-- Modal -->
          <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">importante</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  esta seguro de que todos los datos son correctos y desea comprar el o los articulos de la orden
                </div>
                <form  class="modal-footer" method="POST">
                  <button type="submit" name="cancelar" class="btn btn-secondary" data-bs-dismiss="modal">cancelar</button>
                  <button type="submit" name="comprar" class="btn btn-primary">comprar</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
    <?php
      $crear_detalle=new producto();
      $limpiar_carro=new producto();
      $proceso_ord_detalle=new producto();
      /*$crear_detalle=new producto();*/
      if (isset($_GET['comprar'])) 
      {
        $precarga=$proceso_ord_detalle->precarga_para_orden($_SESSION['id']);
        foreach ($precarga as $value) 
        {
            $creason_d=$crear_detalle->crear_orden_detalle($id_ord_compra, $value->producto, $value->cantidad,$value->precio_unitario);
            $limpiar_carro->eliminar_carrito($_SESSION['id']);
        }

        /*$crear_detalle->crear_orden_detalle($id_ord_compra, $producto, $cantidad,$precio)*/
      }
    ?>
    <!-- #endregion -->
    <!-- #region js-->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
    <!-- #endregion -->
  </body>
</html>
