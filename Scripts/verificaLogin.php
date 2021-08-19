<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../inicio/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/login.css">
<style>
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
      .body-g{
      background-color: #2aa13e;
      }
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
        color:rgb(104, 173, 64);
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
        background-color: white;
        
        -webkit-box-shadow: 0px 0px 5px 5px rgba(0,0,0,0.15);
        -moz-box-shadow: 0px 0px 5px 5px rgba(0,0,0,0.15);
        box-shadow: 0px 0px 5px 5px rgba(0,0,0,0.15);
        
        border-radius: 3px 3px 3px 3px;
        -moz-border-radius: 3px 3px 3px 3px;
        -webkit-border-radius: 3px 3px 3px 3px;
        
        box-sizing: border-box;
    }
    .body-g{
        background-color: rgb(40, 80, 36);
    }
    .img-c{
      text-align: center;
    }
    .img-tam{
      width: 50%;
    }
    </style>
    <title>Login</title>
</head>
<body class="body-g">
        <?php
        include 'database.php';
        $db=new Database();
        $db->conectarDB();
        extract($_POST);
        $db->verificaLogin("$usuario","$password");
        $db->desconectarDB();
        ?>
</body>
</html>