<?php
require("database.php");
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
?>