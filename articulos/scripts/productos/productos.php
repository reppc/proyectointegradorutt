<?php
class Database
{
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
class producto extends Database
{
    private $conexion;
    function cargar_productos($cantidad_a_mostrar)
    {
        $this->conexion=new Database();
        $consulta="select * from productos where productos.id_producto<=$cantidad_a_mostrar;";
        /*conexion*/ 
            try{
                $this->conexion->conectarDB();
            }
            catch(PDOException $e){
                echo "ERROR-CONEXION:"." ".$e->getMessage();
            }
        /*fin*/
        /*seleccion del carrucel*/
            try {
                $consulta=$this->conexion->seleccionar($consulta);
                return $consulta;
            } catch (PDOException $e) {
                echo "ERROR-CONSULTA:".$e->getMessage();
            }
        /*fin*/
        /*desconectar*/
            try {
                $this->conexion->desconectarDB();
            } catch (PDOException $e) {
                echo "ERROR-DESCONECTAR:".$e->getMessage();
            }
        /*fin*/
    }
        function cargar_categorias()
    {
        $this->conexion=new Database();
        $consulta="select categoria.categoria from categoria;";
        /*conexion*/ 
            try{
                $this->conexion->conectarDB();
            }
            catch(PDOException $e){
                echo "ERROR-CONEXION:"." ".$e->getMessage();
            }
        /*fin*/
        /*seleccion del carrucel*/
            try {
                $consulta=$this->conexion->seleccionar($consulta);
                return $consulta;
            } catch (PDOException $e) {
                echo "ERROR-CONSULTA:".$e->getMessage();
            }
        /*fin*/
        /*desconectar*/
            try {
                $this->conexion->desconectarDB();
            } catch (PDOException $e) {
                echo "ERROR-DESCONECTAR:".$e->getMessage();
            }
        /*fin*/
    }
}
class carga_carrito()
{

}
?>
<div class="contenedor_carrito">
    <!--columnas-->
    <div class="row contenido_carro">
        <div class="col">
        <p>nombre</p>
        </div>
        <div class="col">
        <p>opcion</p>
        </div>
    </div>
    <!--contenido del carro-->
        <div class="row contenido_carro">
        <p>contenido del carro</p>
        </div>
    <!---->
    <!--boton-->
    <div class="row contenido_carro">
        <form action="">
        <input class="boton_carro" type="submit" value="siguiente" />
        </form>
    </div>
    <!---->
</div>