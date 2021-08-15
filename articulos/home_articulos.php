<?php
include("../Scripts/productos.php");
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--links-->
      <link rel="stylesheet" href="../../../css/navStyle.css" />
      <link rel="stylesheet" href="../css/bootstrap.min.css" />
      <link
        rel="stylesheet"
        href="interfaces/categorias/css/estilo botones.css"
      />
      <link rel="stylesheet" href="../../css/navStyle.css" />
      <link rel="stylesheet" href="../../css/bootstrap.min.css" />
      <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
      />
      <link rel="stylesheet" href="css/estilo_articulos_cartas.css" />
      <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous"
      />
  <style>
      /*Estilos propios del NavBar*/
      .redondeado{
          margin-top: 2px;
          border-top-left-radius: 37px;
          border-top-right-radius: 37px;
          border-bottom-left-radius: 37px;
          border-bottom-right-radius: 37px;
          overflow: hidden;
      }
      .logo{
          width: 20pt;
      }
      .navli{
          margin-left: 50pt;
      }
      .btn-acceder{
      text-decoration: none;
      color: white;
      }
      .btn-acceder:hover{
          color: black;
      }
      /*Fin de los estilos propios del NavBar*/
      .jumbotronfm{
         background-color: #1c8ee0;
          color: white;
      }
      .cuadrojum{
          padding-left: 25pt;
          padding-top: 15pt;
      }
      .titulos{
          color: rgb(25, 155, 38);
      }
      .bordcard{
          border-radius: 20px;
      }
      .imgcard{
          width: 100%;
      }
      .cardmargin{
          margin-top: 25pt;
          margin-bottom: 25pt;
      }
      .btnverde{
          background-color: rgb(111, 217, 80);
          border: rgb(111, 217, 80);
          border-radius: 50px;
      }
      .scblog{
          background-color: rgb(45, 42, 42);
      }
      footer {
      background-color:#1A1A1A;
      height: 50%;
      color: white;
      padding: 15px;
      }
  
      .main1 { 
      display:flex;
      margin:0 auto;
      }
  
  </style>
    <title>Articulos</title>
  </head>
  <body>
  <?php
        session_start();
    ?>

    <!--Barra navegadora-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <!--logo-->
        <div class="container-fluid">
          <img class="logo navbar-brand md" src="../inicio/Imagenes/logo-sin-letras2.png" alt="">
          <a class="navbar-brand" href="">Soporte y servicios informaticos</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <!--Inicio-->
                <li class="nav-item navli">
                    <a class="nav-link active" aria-current="page" href="../inicio/index copy.php">
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
                            <a class="dropdown-item" href="../articulos/home_articulos.php">Articulos</a>
                          </li>
                          <?php
                            if(isset($_SESSION["usuario"]) && $_SESSION['rol']=='Administrador')
                            {

                            ?>
                          <div class="dropdown-divider"></div>
                          <li>
                             <a class="dropdown-item" href="../PHPVistas/verProductos.php"> Ver registros de Productos</a>
                            </li>
                          <li>
                            <a class="dropdown-item" href="../PHPVistas/verMetodosPago.php">Ver registros de  metodos de pago</a>
                          </li>

                            <a class="dropdown-item" href="../PHPVistas/HistorialPedidos.php">Historial de pedidos</a>
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
                            <a class="dropdown-item" href="../Blog/blog-informativo.php" >Informativo</a>
                          </li>
                          <li>
                              <a class="dropdown-item" href="../Blog/blog-consejos.php">Consejos</a>
                          </li>
                          <li>
                              <a class="dropdown-item" href="../Blog/blog-sugerencias.php">Sugerencias</a>
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
                            <a class="dropdown-item" <?php if(isset($_SESSION["usuario"])){echo "href='../PHPVistas/MiPerfil.php'";}else{echo "href='../login/login.php'";}?> >Mi perfil</a>
                          </li>

                          <?php
                            if(isset($_SESSION["usuario"]) && $_SESSION['rol']=='Cliente')
                            {

                            ?>

                          <li>
                              <a class="dropdown-item" <?php if(isset($_SESSION["usuario"])){echo "href='../PHPVistas/HistorialCompras.php'";}else{echo "href='../login/login.php'";}?>>Mis pedidos</a>
                          </li>
                          <li>
                              <a class="dropdown-item" <?php if(isset($_SESSION["usuario"])){echo "href='../PHPVistas/MisDirecciones.php'";}else{echo "href='../login/login.php'";}?>>Mis direcciones</a>
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
                              <a class="dropdown-item" href="../PHPVistas/VerUsuarios.php">Ver usuarios</a>
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
                            <a class="dropdown-item" href="../Scripts/cerrarSesion.php">Cerrar sesion</a>
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
                          <a href='../login/login.php' class='btn btn-outline-light redondeado' style='text-decoration: none;'>Acceder</a>
                        </form>
                    <!-- #endregion -->";
                    }
                ?>
                
          </div>
        </div>
      </nav>

            <!--Seccion de presentacion-->
            <div class="row jumbotron jumbotronfm">
            <div class="col cuadrojum ">
                <h1 class="">Articulos</h1>
                <br>
                <p class="offset-1 col-2 col-sm-3"> <i>Entregas en el area de Torreón</i></p>
                </a>
            </div>
                <div class="col col-lg-3 d-none d-lg-block d-md-block">
                <!--barra de busqueda-->
              <div class="col">

                <div class="row">
                  
                  <!--input de busqueda-->

                  <div class="col">
                    <input class="form-control" type="text" name="articulos_a_buscar" id="" style="width: 250px; margin-top: 15px; margin-right: 5px">
                  </div>

                  <!--boton de busqueda-->
                  <div class="col">
                    <button class="btn btn-outline-light" name="buscar_producto" style="margin-top:15px; margin-left:-25px;" type="submit" value="" name="buscar_articulo" class="btn btn-submit">
                      <i class="bi bi-search"></i>
                    </button>
                  </div>

                </div>
              </div>
                </div>
      </div>
      <br><br>

    <!---->
    <!-- #region contenido home articulos-->
    <!--barra de busqueda-->
    <!--
      <div class="row">
        <div
          class="col"
          style="background-color: #1c8ee0; width: 100%; height: 50px">
          <form class="form" action="" method="POST">
            <div class="row">
              titulo
              <div class="col-3">
                <h2 class="tect-center" style="color: white">Articulos</h2>
              </div>
              barra de busqueda
              <div class="col">

                <div class="row">

                  input de busqueda

                  <div class="col">
                    <input class="form-control" type="text" name="articulos_a_buscar" id="" style="width: 500px; margin-top: 5px; margin-right: 5px">
                  </div>

                  boton de busqueda

                  <div class="col">
                    <button name="buscar_producto" style="margin-top:5px; margin-left:-25px;" type="submit" value="" name="buscar_articulo" class="btn btn-submit">
                      <i class="bi bi-search"></i>
                    </button>
                  </div>

                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
                  -->
    <!--carrusel-->
      <div
        id="carouselExampleControls"
        class="carousel slide"
        data-bs-ride="carousel"
      >
        <div class="carousel-inner">
          <!--codigo php para la carga de los articulos que apareseran en el carrusel-->
          <?php
          $producto1=new producto();
          /*item activo*/
          $fila=$producto1->cargar_productos(1); foreach ($fila as $resultado) {
          if ($resultado->id_producto=1) 
          { echo"
            <div class='carousel-item active'>
              <img
                style='margin-left: 10%'
                width='150px'
                height='300px'
                src='$resultado->imagen'
                class='d-block w-25'
                alt='#'
              />
              <div class='carousel-caption d-none d-md-block'>
                <h5 style='color: black'>$resultado->nombre</h5>
                <p style='color: black'>$$resultado->precio_unitario</p>
              </div>
            </div>"; 
          } } 
          $fila=$producto1->cargar_productos(3); 
          foreach ($fila as $resultado) { 
            if ($resultado->id_producto!=1) 
            { echo"
              <div class='carousel-item'>
                <img
                  style='margin-left: 10%'
                  width='150px'
                  height='300px'
                  src='$resultado->imagen'
                  class='d-block w-25'
                  alt='#'
                />
                <div class='carousel-caption d-none d-md-block'>
                  <h5 style='color: black'>$resultado->nombre</h5>
                  <p style='color: black'>$$resultado->precio_unitario</p>
                </div>
              </div>"; 
            } 
          } ?>
        </div>
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselExampleControls"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselExampleControls"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    <!---->
    <!--titulo-->
        <!--son 3 colores dependiendo la categoria
          Accesorios: #1C8EE0
          Limpueza PC: #6FD950
          Refacciones: #A4A3A3
          hacer que cambie de color ademas de cargar los articulos referentes a su categoria con php
          -->
        <form action="" method="post" class="row">
            
          <div class="col" style="background-color: #1C8EE0; color: white">
            <p style="margin: 20px">
            <?php
              if(isset($_POST['filtro']))
              {
                $xd=$_POST['filtro'];
                echo "$xd";
              }
              else{
                echo "Articulos disponibles";
              }
            ?>
            </p>
          </div>
          <div class="col" style="background-color: #1c8ee0; color: white">
            <div class="dropdown" type="select" style="margin-top:10px;">
              <button
                class="btn btn-secondary dropdown-toggle"
                type="button"
                id="dropdownMenuButton1"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                name="categorias"
              >
              Seleccione una categoria
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                  <li>
                    <button type='submit option' class='dropdown-item' name='filtro' value='todos'>
                    Todos</button>
                  </li>
                  <!--carga de categorias-->
                <?php
                  $carga=new producto();
                  $categorias=$carga->cargar_categorias();
                  foreach ($categorias as $mostrar) 
                  {
                    echo "<li>
                    <button type='submit' class='dropdown-item' name='filtro' value='$mostrar->categoria'>
                    $mostrar->categoria</button></li>";
                  }
                ?>
              </ul>
            </div>
          </div>
        </form>
    <!---->
    <!--articulos-->
      <div class="row">
        
        <!--carga de articulos segun su categoria-->
        <div class="col">
            <?php
              $carga_de_los_productos_filtrados=new producto();
              if(!empty($_POST['filtro']))
                {
                  $control_filtros="todos";
                }
                if(isset($_POST['filtro']))
                {
                  $control_filtros=$_POST['filtro'];
                }
                if(!isset($_POST['filtro']))
                {
                  $control_filtros="todos";
                }
                if(isset($_POST['buscar_articulo']))
                {
                  $buscar_articulo_nombre=new articulo();
                  $resultado_busqueda=$buscar_articulo_nombre->buscar($_POST['articulos_a_buscar']);
                }
                else
                {
                  $carga_de_los_productos_filtrados->carga_todo($control_filtros,session_status());
                }
            ?>
        </div>
        <!---->
        <!--carrito-->
        <div class="col-2">
          <div class="contenedor_carrito">
            <!--columnas-->
            <div class="row contenido_carro">
              <div class="col">
                <p>Nombre</p>
              </div>
              <div class="col">
                <p>Cantidad</p>
              </div>
            </div>
            <!--contenido del carro-->
              <?php
              $carga_del_carrito=new producto();
              if(session_status()==0 || session_status()==1)
              {
                echo
                "
                <!--contenido del carro-->
                  <div class='row contenido_carro'>
                  <div class='col'>
                  <p></p>
                  </div>
                  <div class='col'>
                  <p></p>
                  </div>
                  </div>
                  <hr>
                <!---->
                ";
              }
              else
              {
                
                $carga_del_carrito->carga_carrito($_SESSION['id']);
              }
              ?>
              
              </table>
                  </div>
            <!---->
            <!--boton-->
            <div class="row contenido_carro">
              <div class="col" style="width:auto;">
              <?php
                if (session_status()!=0 || session_status()!=1) {
                  echo"<a class='btn btn-secondary' 
                  style='padding:5px;' 
                  href='interfaces/carrito/carrito.php'>
                  siguiente</a>";
                }
                else
                {
                  echo"<a class='btn btn-secondary' 
                  style='padding:5px;' 
                  href='#'>
                  siguiente</a>";
                }
              ?>
            </div>
            </div>
            <!---->
          </div>
        </div>
        <!---->
      </div>
    <!-- #endregion -->
    <?php
      /*agregado de producto al carrito*/
      $insertar_carro=new producto();
      if(session_status()==PHP_SESSION_ACTIVE)
      {
        if (isset($_POST['agregar_productos_al_carro_prueba'])) 
        {
          if 
          (
            $_POST['cantidad_producto']>0 
            && $_POST['cantidad_producto']!=null 
            && $_POST['cantidad_producto']!="cantidad"
          ) 
          {
            $usuario=$_SESSION['id'];
            $cantidad_productos=$_POST['agregar_productos_al_carro_prueba'];
            $id_producto=$_POST['cantidad_producto'];
            $insertar_carro->insertar_carro(
            $usuario,
            $cantidad_productos,
            $id_producto);
          }
        }
      }
      else{
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
  <?php
    echo $_SESSION['id'];
  ?>
  </body>
</html>
