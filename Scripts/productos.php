<?php
require("database.php");
class producto extends Database
{
    private $conexion;
    function cargar_productos($cantidad_a_mostrar)
    {
        $this->conexion=new Database();
        $consulta="select * from productos where productos.id_producto<=$cantidad_a_mostrar and productos.stock!=0;";
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
        $consulta="SELECT id_cat, categoria FROM categoria;";
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
    function filtro_contenido($categoria)
    {
        $this->conexion=new Database();
        $consulta="select productos.id_producto,productos.nombre,productos.descripcion,productos.stock,productos.precio_unitario,
        categoria.categoria,productos.imagen from productos 
        INNER JOIN categoria 
                on categoria.id_cat=productos.categoria where categoria.categoria='$categoria' and  productos.stock!=0;";
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
    function carga_todo($control_filtro)
    {
        $this->conexion=new Database();
        /*control del filtro*/
            if($control_filtro!="todos")
            {
                $consulta=
                "
                    select 
                    productos.id_producto,
                    productos.nombre,
                    productos.descripcion,
                    productos.stock,
                    productos.precio_unitario,
                    categoria.categoria,
                    productos.imagen from productos 
                    INNER JOIN categoria 
                    on categoria.id_cat=productos.categoria 
                    where categoria.categoria='$control_filtro' and  productos.stock!=0;
                ";
            }
            elseif ($control_filtro="todos") 
                {
                    $consulta=
                "
                    select 
                    productos.id_producto,
                    productos.nombre,
                    productos.descripcion,
                    productos.stock,
                    productos.precio_unitario,
                    categoria.categoria,
                    productos.imagen from productos 
                    INNER JOIN categoria 
                    on categoria.id_cat=productos.categoria 
                    where productos.stock!=0;
                ";
                }
        /*conexion*/ 
            try{
                $this->conexion->conectarDB();
            }
            catch(PDOException $e){
                echo "ERROR-CONEXION:"." ".$e->getMessage();
            }
        /*fin*/
        /*seleccion por filtro*/
            try 
            {
                $resultado=$this->conexion->seleccionar($consulta);
                foreach ($resultado as $productos) 
                {
                    echo "
                    <div class='row'>
                        <div class='col'>
                        <!--nombre-->
                        <div class='row'>
                            <p>$productos->nombre</p>
                        </div>
                        <!--descripcion y foto-->
                        <div class='row'>
                            <div class='col'>
                            <p>$productos->descripcion</p>
                            </div>
                            <div class='col'>
                            <img
                                width='60%'
                                height='60%'
                                src='$productos->imagen'
                                class='d-block w-3'
                                alt='#'
                            />
                            </div>
                        </div>
                        <!--precio del producto-->
                        <div class='row'>
                            <p>$productos->precio_unitario</p>
                        </div>
                        <!--botones-->
                        <form action='' method='POST'>
                            <div class='row'>
                            <div class='col'>
                                <input
                                class='boton'
                                name='ver'
                                type='submit'
                                value='Ver detalles'
                                />
                            </div>
                            <div class='col'>
                                <input
                                class='boton'
                                name='agregar_productos_al_carro'
                                type='submit'
                                value='$productos->producto'
                                />
                            </div>
                            </div>
                        </form>
                        </div>
                        <hr />
                        </div>
                "; 
                }
            } 
            catch (PDOException $e) 
            {
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
    function buscar($nombre)
    {
        $this->conexion=new Database();
        $consulta="
            select 
            productos.id_producto,
            productos.nombre,
            productos.descripcion,
            productos.stock,
            productos.precio_unitario,
            categoria.categoria,productos.imagen 
            from productos 
            INNER JOIN categoria 
            on categoria.id_cat=productos.categoria where productos.nombre like'%Aire%' 
            and  productos.stock!=0;";
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
                foreach ($resultado as $productos) 
                {
                    echo "
                    <div class='row'>
                        <div class='col'>
                        <!--nombre-->
                        <div class='row'>
                            <p>$productos->nombre</p>
                        </div>
                        <!--descripcion y foto-->
                        <div class='row'>
                            <div class='col'>
                            <p>$productos->descripcion</p>
                            </div>
                            <div class='col'>
                            <img
                                width='60%'
                                height='60%'
                                src='$productos->imagen'
                                class='d-block w-3'
                                alt='#'
                            />
                            </div>
                        </div>
                        <!--precio del producto-->
                        <div class='row'>
                            <p>$productos->precio_unitario</p>
                        </div>
                        <!--botones-->
                        <form action='' method='POST'>
                            <div class='row'>
                            <div class='col'>
                                <input
                                class='boton'
                                name='ver'
                                type='submit'
                                value='Ver detalles'
                                />
                            </div>
                            <div class='col'>
                                <input
                                class='boton'
                                name='agregar'
                                type='submit'
                                value='Agregar al carro'
                                />
                            </div>
                            </div>
                        </form>
                        </div>
                        <hr />
                        </div>
                "; 
                }
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
    function insertar_carro($articulo)
    {
        $this->conexion=new Database();
        $consulta="SELECT id_cat, categoria FROM categoria;";
        /*conexion*/ 
            try{
                $this->conexion->conectarDB();
            }
            catch(PDOException $e){
                echo "ERROR-CONEXION:"." ".$e->getMessage();
            }
        /*fin*/
        /*agregar producto al carro*/
            try 
            {
                $consulta=$this->conexion->ejecutaSQL($articulo);
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