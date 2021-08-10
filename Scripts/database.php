<?php
    class Database
    {
        private $basededatos="appsocompruebas";
        private $PDOLocal;
        private $user="root";
        private $password="admin";
        private $server="mysql:host=localhost; dbname=pruebas_appsocom";

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
                $query="SELECT * FROM usuarios WHERE user='$usuario'";
                $consulta=$this->PDOLocal->query($query);
                while($renglon=$consulta->fetch(PDO::FETCH_ASSOC))
                {
                    if(password_verify($contra,$renglon['password']))
                    {
                        $pase++;
                    }
                }

                if($pase>0)
                {
                    session_start();
                    $_SESSION["usuario"]=$usuario;
                    echo "<div class='alert alert-success'>";
                    echo "<h2 align='center'>Bienvenido ".$_SESSION["usuario"]."</h2>";
                    echo "</div>";
                    header("refresh:2; ../index.php");
                }
                else{
                    echo "<div class='alert alert-danger'>";
                    echo "<h2 align='center'>Usuario o password incorrecto</h2>";
                    echo "</div>";
                    header("refresh:2; ../php/FormLogin.php");
                }
            }
            catch(PDOException $e){
                echo $e->getMessage();
            }
        }
    }
?>