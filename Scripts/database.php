  
<?php
    class Database
    {
        /*private $basededatos="appsocom"; pruebas_appsocom*/
        private $PDOLocal;
        private $PDOLocal1;
        private $user="root";
        private $password="admin";
        private $server="mysql:host=localhost; dbname=appsocompruebas";

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
                $query="SELECT * FROM usuarios INNER JOIN rol_usuario ON rol_usuario.id_rol=usuarios.Rol 
                        WHERE nombre_usuario='$usuario'";

                $queryR= "SELECT rol_usuario.tipo_usuario FROM usuarios 
                            INNER JOIN rol_usuario ON rol_usuario.id_rol=usuarios.Rol 
                            WHERE usuarios.nombre_usuario = '$usuario'";
                $consulta1=$this->PDOLocal->query($query);
                $nUsuario=$consulta1->fetch(PDO::FETCH_ASSOC);

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

                    //Variables de sesión con los datos propios del usuario en sesion activa
                    //use estas variables si necesita una referencia de algun tipo de este usuario
                    $_SESSION["usuario"]=$usuario;
                    $_SESSION['rol']=$nUsuario['tipo_usuario'];
                    $_SESSION['id']=$nUsuario['id_usuario'];
                    $_SESSION['nombres']=$nUsuario['nombres'];         //use la variable de sesion deseada
                    $_SESSION['ap_paterno']=$nUsuario['ap_paterno'];
                    $_SESSION['ap_materno']=$nUsuario['ap_materno'];
                    $_SESSION['correo']=$nUsuario['correo'];
                    $_SESSION['fecha_creacion']=$nUsuario['fecha_creacion'];
                    
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