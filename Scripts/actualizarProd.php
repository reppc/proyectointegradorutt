     <!DOCTYPE html>
     <html lang="en">
     <head>
         <meta charset="UTF-8">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="../inicio/css/bootstrap.min.css">
        <link rel="stylesheet" href="../inicio/css/navStyle.css">
        <link rel="stylesheet" href="../css/registrarse.css">
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
         <title>Registro actualizado</title>
     </head>
     <body class="body-g">
         
     <!---->
      <?php
        include 'database.php';
        $db= new Database();
        $db->conectarDB();
    

        if($_FILES['imagen']['error'])
        {
            switch($_FILES['imagen']['error'])
                {
                case 1: //exceso de tamaño de archivo permitido por php.ini

                    echo "El tamaño del archivo excede el permitido por el servidor";

                    break;

                case 2: //Error tamaño de archivo marcado en el formulario

                    echo "El tamaño de archivo excede los 20 MB";

                    break;

                case 3: //Corrupcion de archivo

                    echo "El envio del archivo se interrumpio";

                    break;

                case 4: //No se ha subido ningun fichero

                    echo "No se ha enviado ningun archivo";

                    break;      
            }
        }
        else
        {
            echo "<div class='alert alert-success'>Datos del articulo actualizados correctamente</div>";

            if((isset($_FILES['imagen']['name']) && ($_FILES['imagen']['error']==UPLOAD_ERR_OK)))
            {
                $destino_de_ruta="../articulos/imgProductos";

                move_uploaded_file($_FILES['imagen']['tmp_name'], $destino_de_ruta.$_FILES['imagen']['name']);

                echo "<div class='alert alert-warning'>El archivo " . $_FILES['imagen']['name'] . " se ha copiado en el directorio del ImgBlog</div>";
            }
            else{
                echo "<div class='alert alert-danger'>No se ha enviado ninguna imagen</div>";
            }
        }
        extract($_POST);

        if(!isset($_FILES['imagen']['name']))
        {
            $cadena="UPDATE productos SET nombre='$nombre', descripcion='$descripcion', precio_unitario='$precio', 
            categoria='$categoria', stock='$stock' WHERE id_producto='$id_prod'";    
        }else{
            $imagenL=$_FILES['imagen']['name'];

            $cadena="UPDATE productos SET nombre='$nombre', descripcion='$descripcion', precio_unitario='$precio', 
            categoria='$categoria', stock='$stock', imagen='$imagenL' WHERE id_producto='$id_prod'";
    
        }
    
        
        $db->ejecutaSQL($cadena);
        $db->desconectarDB();
    
        echo "<div id='contenedor'>
                    <div id='central'>
                      <div id='login'>
                        <div class='titulo'>
                          Registro completo
                        </div>
                        <div class='img-fluid img-c'>
                          <img class='img-tam' src='../login/imgLogin/checked-icon-clipart1.png'>
                        </div>
                      </div>
                    </div>
              </div>";

              header("refresh:2; ../PHPVistas/verProductos.php");
        ?>

</body>
</html>