  
<?php
    class Database
    {
        private $basededatos="appsocom";
        private $PDOLocal;
        private $user="root";
        private $password="admin";
        private $server="mysql:host=localhost; dbname=appsocom";

        function conectarDB()
        {
            try{
                $this->PDOLocal = new PDO($this->server, $this->user, $this->password);
            }
            catch(PDOException $e){
                echo $e->getMessage();
            }
        }

        function desconectarDB()
        {
            try{
                $this->PDOLocal=null;
            }
            catch(PDOException $e){
                echo $e->getMessage();
            }
        }

        function seleccionar($consulta)//funcion de consultas
        {
            try
            {
                $resultado = $this ->PDOLocal -> query($consulta);
                $fila = $resultado->fetchAll(PDO::FETCH_OBJ);

                return $fila;
            }
            catch(PDOException $e){
                echo $e->getMessage();
            }
        }
        function ejecutaSQL($query)//funcion de ejecucion
        {
            try{
                $this->PDOLocal->query($query);
            }
            catch(PDOException $e){
                echo $e->getMessage();
            }
        }

        function verificaLogin($usuario, $contra)
        {
            try
            {
                $pase=0;
                $query="SELECT * FROM usuarios WHERE nombre_usuario='$usuario'";
                $consulta=$this->PDOLocal->query($query);
                while($renglon=$consulta->fetch(PDO::FETCH_ASSOC))
                {
                    if(password_verify($contra,$renglon['contraseña']))
                    {
                        $pase++;
                    }
                    else{
                        if($contra==$renglon['contraseña'])
                        {
                            $pase++;
                        }
                    }
                }



                if($pase>0)
                {
                    session_start();
                    $_SESSION["usuario"]=$usuario;
                    echo "<div id='contenedor'>
                    <div id='central'>
                      <div id='login'>
                        <div class='titulo'>
                          Bienvenido <br> " . $_SESSION['usuario'] . "
                        </div>
                        <div class='img-fluid img-c'>
                          <img class='img-tam' src='../login/imgLogin/checked-icon-clipart1.png'>
                        </div>
                      </div>
                    </div>
              </div>";
        header("refresh:2; ../inicio/index copy.php");
        
                }
                else{
                    echo "<div id='contenedor'>
                    <div id='central'>
                      <div id='login'>
                        <div class='titulo'>
                          Usuario o contraseña incorrectos
                        </div>
                        <div class='img-fluid img-c'>
                          <img class='img-tam' src='../login/imgLogin/uncheck-icon-17.jpg'>
                        </div>
                      </div>
                    </div>
                 </div>";
                    header("refresh:2; ../login/login.php");
                }
            }
            catch(PDOException $e){
                echo $e->getMessage();
            }
        }

        function cerrarSesion()
        {
            session_start();
            session_destroy();
            header("Location:../inicio/index copy.php");
        }
    }
?>