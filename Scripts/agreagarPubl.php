<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../inicio/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/recPass.css">
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
    <title>Registro exitoso</title>
</head>
<body class="body-g">

<?php
        include 'database.php';
        $db=new Database();
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
            echo "<div class='alert alert-success'>Entrada subida correctamente</div>";

            if((isset($_FILES['imagen']['name']) && ($_FILES['imagen']['error']==UPLOAD_ERR_OK)))
            {
                $destino_de_ruta="../ImgBlog/";

                move_uploaded_file($_FILES['imagen']['tmp_name'], $destino_de_ruta.$_FILES['imagen']['name']);

                echo "<div class='alert alert-warning'>El archivo " . $_FILES['imagen']['name'] . " se ha copiado en el directorio del ImgBlog</div>";
            }
            else{
                echo "<div class='alert alert-danger'>El archivo no se ha podido copiar en el directorio de ImgBlog</div>";
            }
        }
        extract($_POST);
        $imagenL=$_FILES['imagen']['name'];
        $lafecha=date("Y-m-d H:i:s");

        $miconsulta="INSERT INTO publicaciones (titulo_pub,contenido,tema,imagen,fecha_pub,autor)
        VALUES ('$titulo','$contenido','$tema','$imagenL','".$lafecha."',2)";

        $db->ejecutaSQL($miconsulta);
        $db->desconectarDB();

        echo "<div id='contenedor'>
        <div id='central'>
          <div id='login'>
            <div class='titulo'>
              Publicacion realizada
            </div>
                <div class='img-fluid img-c'>
                <img class='img-tam' src='../login/imgLogin/checked-icon-clipart1.png'>
                </div>
                
            </div>
            </div>
        </div>";
        header("refresh:3 ../AdminBlog/FormAddBlog.php");
?>
</body>
</html>