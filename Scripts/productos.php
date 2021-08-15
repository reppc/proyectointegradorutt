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
                                    width='30%'
                                    height='50%'
                                    src='$productos->imagen'
                                    class='d-block w-2'
                                    alt='#'
                                />
                                </div>
                            </div>
                            <!--precio del producto-->
                            <div class='row'>
                                <p>$$productos->precio_unitario</p>
                            </div>
                            <!--botones-->
                                <form action='' method='POST'>
                                    <div class='row'>
                                    <div class='col-1'>
                                        <input
                                        class='boton'
                                        name='ver'
                                        type='submit'
                                        value='Ver detalles'
                                        />
                                    </div>
                                    <div class='col' style='margin-left:10px;width:auto;'>
                                        <select name='cantidad_producto' class='form-select-sm' 
                                        aria-label='Default select example'>
                                            <option selected>cantidad</option>
                                            <option from='cantidad_producto' value='1'>1</option>
                                            <option from='cantidad_producto' value='2'>2</option>
                                            <option from='cantidad_producto' value='3'>3</option>
                                            <option from='cantidad_producto' value='4'>4</option>
                                            <option from='cantidad_producto' value='5'>5</option>
                                        </select>
                                    </div>
                                    <div class='col'>
                                        <button
                                        class='boton'
                                        name='agregar_productos_al_carro_prueba'
                                        type='submit'
                                        value='$productos->id_producto'
                                        >
                                            agregar al carrito
                                        </button>
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
    function insertar_carro($cliente,$producto,$cantidad)
    {
        $this->conexion=new Database();
        $articulo="INSERT INTO carrito(cliente, producto, cantidad) 
        VALUES ($cliente,$producto,$cantidad);";
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
                $consulta=$this->conexion->seleccionar($articulo);
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
    function carga_carrito($usuario)
    {
        $this->conexion=new Database();
        $articulo="
        SELECT carrito.id_carrito, carrito.cantidad, productos.nombre 
        FROM carrito inner JOIN productos on 
        productos.id_producto=carrito.id_carrito 
        WHERE carrito.cliente=$usuario and carrito.id_carrito<=4;";
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
                $consulta=$this->conexion->seleccionar($articulo);
                foreach ($consulta as $resultado) {
                    echo
                    "
                        <!--contenido del carro-->
                            <div class='row contenido_carro'>
                            <div class='col'>
                            <p>$resultado->nombre</p>
                            </div>
                            <div class='col'>
                            <p>$resultado->cantidad</p>
                            </div>
                            </div>
                            <hr>
                        <!---->
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
    function carga_de_los_articulos_a_comprar($usuario)
    {
        $this->conexion=new Database();
        $articulo=
        "
        SELECT carrito.id_carrito, 
        carrito.cantidad,
        productos.nombre, 
        productos.precio_unitario,
        productos.imagen 
        FROM carrito inner 
        JOIN productos 
        on productos.id_producto=carrito.id_carrito 
        WHERE carrito.cliente=$usuario;
        ";
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
                $consulta=$this->conexion->seleccionar($articulo);
                foreach ($consulta as $resultado) 
                {
                    /*<?php
                                
                          ?>*/
                    echo
                    "
                    
                    <tr>
                        <td width='100px'><img width='20%' src='$resultado->imagen' alt='' /></td>
                        <td><p style='margin:4px;'>$resultado->nombre</p></td>
                        <td>cantidad:($resultado->cantidad)</td>
                        <td><p style='margin:4px;'>$$resultado->precio_unitario</p></td>
                        <td>
                            <!--boton para eliminar productos-->
                            <div class='col'>
                                <form action='' method='POSTT'>
                                <button type='submit' name='eliminar_p' value='$resultado->id_carrito' class='boton_eliminar'>
                                    <!--figura para el boton-->
                                    <!--boton eliminar-->
                                    <svg
                                        style='
                                        margin-bottom: 5px;
                                        margin-top: 5px;
                                        margin-left: -2px;
                                        '
                                        width='40'
                                        height='20'
                                        viewBox='0 0 43 28'
                                        fill='none'
                                        xmlns='http://www.w3.org/2000/svg'
                                    >
                                        <g filter='url(#filter0_dd)'>
                                        <path
                                            d='M22 5.95508H30.0893C38.577 6.90852 39.2403 18.998 30.9051 20.8623C30.3629 20.9835 29.8089 21.0447 29.2533 21.0447H22H14.8053C14.211 21.0447 13.6187 20.9748 13.0407 20.8362C4.82807 18.8679 5.52602 6.96437 13.9107 5.95508H22Z'
                                            fill='#A4B9A5'
                                        />
                                        </g>
                                        <defs>
                                        <filter
                                            id='filter0_dd'
                                            x='0.238281'
                                            y='0.955078'
                                            width='42.5802'
                                            height='26.0897'
                                            filterUnits='userSpaceOnUse'
                                            color-interpolation-filters='sRGB'
                                        >
                                            <feFlood
                                            flood-opacity='0'
                                            result='BackgroundImageFix'
                                            />
                                            <feColorMatrix
                                            in='SourceAlpha'
                                            type='matrix'
                                            values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0'
                                            result='hardAlpha'
                                            />
                                            <feOffset dx='2' dy='2' />
                                            <feGaussianBlur stdDeviation='2' />
                                            <feColorMatrix
                                            type='matrix'
                                            values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0'
                                            />
                                            <feBlend
                                            mode='normal'
                                            in2='BackgroundImageFix'
                                            result='effect1_dropShadow'
                                            />
                                            <feColorMatrix
                                            in='SourceAlpha'
                                            type='matrix'
                                            values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0'
                                            result='hardAlpha'
                                            />
                                            <feOffset dx='-3' dy='-1' />
                                            <feGaussianBlur stdDeviation='2' />
                                            <feColorMatrix
                                            type='matrix'
                                            values='0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 0'
                                            />
                                            <feBlend
                                            mode='normal'
                                            in2='effect1_dropShadow'
                                            result='effect2_dropShadow'
                                            />
                                            <feBlend
                                            mode='normal'
                                            in='SourceGraphic'
                                            in2='effect2_dropShadow'
                                            result='shape'
                                            />
                                        </filter>
                                        </defs>
                                    </svg>
                                    <!---->
                                    <!---->
                                </button>
                                </form>
                            </div>
                        </td>
                        <td>
                            <!-- Button trigger modal -->
                            <form method='POST' class='row' style='background-color:white; 
                            margin:5px; height:50px;'>
                            <div class='col'>
                            <button style='margin-top:5px;' type='submit' 
                            value='$resultado->id_carrito' name='edicion_cant' class='btn btn-success'>
                            editar
                            </button>
                            </div>
                            <div class='col'>
                            <select name='edicion_producto' style='margin-top:10px;'>
                                <option from='edicion_producto' value='1'>1</option>
                                <option from='edicion_producto' value='2'>2</option>
                                <option from='edicion_producto' value='3'>3</option>
                                <option from='edicion_producto' value='4'>4</option>
                                <option from='edicion_producto' value='5'>5</option>
                            </select>
                            </div>
                        </td>
                    </tr>
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
    function total_carrito($usuario)
    {
        $this->conexion=new Database();
        $articulo=
        "
        SELECT carrito.id_carrito, carrito.cantidad, productos.nombre, productos.precio_unitario,productos.imagen
        FROM carrito inner JOIN productos on 
        productos.id_producto=carrito.id_carrito 
        WHERE carrito.cliente=$usuario;
        ";
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
                $consulta=$this->conexion->seleccionar($articulo);
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
    function carga_de_domicilios($usuario)
    {
        $this->conexion=new Database();
        $articulo="
        select domicilio.id_domicilio, 
        domicilio.cliente,
         domicilio.calle,
          domicilio.ciudad,
           domicilio.numeroExt,
            domicilio.numeroInt,
             domicilio.codigo_postal,
              domicilio.telefono,
               domicilio.colonia 
               from domicilio 
               INNER JOIN usuarios 
               on domicilio.cliente=usuarios.id_usuario 
               where usuarios.id_usuario=$usuario;"
            ;
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
                $consulta=$this->conexion->seleccionar($articulo);
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
    function carga_de_domicilios_selects($usuario)
    {
        $this->conexion=new Database();
        $articulo="
        select 
        domicilio.id_domicilio, 
        domicilio.cliente, 
        domicilio.calle, 
        domicilio.numeroExt, 
        domicilio.numeroInt, 
        domicilio.codigo_postal, 
        domicilio.telefono, 
        domicilio.colonia 
        from domicilio 
        INNER JOIN usuarios 
        on domicilio.cliente=usuarios.id_usuario 
        where usuarios.id_usuario='$usuario';";
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
                $consulta=$this->conexion->seleccionar($articulo);
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
    function carga_final_carro($usuario)
    {
        $this->conexion=new Database();
        $articulo="
        SELECT * FROM `carrito` 
        WHERE carrito.cliente='$usuario'
        ";
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
                $consulta=$this->conexion->seleccionar($articulo);
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
    function carga_orden($usuario)
    {
        $this->conexion=new Database();
        $articulo="
                SELECT 
                orden_compra.id_orden,
                usuarios.nombres,
                metodo_pago.nombre,
                orden_compra.total,
                concat(
                    domicilio.calle,
                    domicilio.numeroExt,
                    domicilio.numeroInt,
                    domicilio.codigo_postal,
                    domicilio.colonia,
                    domicilio.telefono,
                    domicilio.colonia)as 'domicilio',
                orden_compra.fecha_pedido 
                FROM orden_compra
                INNER JOIN usuarios
                on usuarios.id_usuario=orden_compra.cliente
                INNER JOIN metodo_pago
                on metodo_pago.id_metodo=orden_compra.metodoPago
                INNER JOIN domicilio
                on orden_compra.domicilio=domicilio.id_domicilio
                        WHERE orden_compra.cliente='$usuario';
        ";
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
                $consulta=$this->conexion->seleccionar($articulo);
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
    function carga_productos($usuario)
    {
        $this->conexion=new Database();
        $articulo="
        SELECT 
        productos.id_producto, 
        productos.nombre, 
        productos.precio_unitario, 
        orden_detalle.cantidad 
        FROM orden_detalle 
        INNER JOIN productos 
        on productos.id_producto=orden_detalle.producto 
        where orden_detalle.orden=(select orden_compra.id_orden from orden_compra
        WHERE orden_compra.id_orden=(select usuarios.id_usuario from usuarios where usuarios.id_usuario=$usuario));
        ";
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
                $consulta=$this->conexion->seleccionar($articulo);
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
    function eliminar_articulo($id)
    {
        $this->conexion=new Database();
        $articulo=
        "
        DELETE FROM `carrito` WHERE id_carrito=$id;
        ";
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
                $consulta=$this->conexion->seleccionar($articulo);
                foreach ($consulta as $resultado) 
                {
                    /*<?php
                                
                          ?>*/
                    echo
                    "
                    
                    <tr>
                        <td><img width='20%' src='$resultado->imagen' alt='' /></td>
                        <td><p style='margin:4px;'>$resultado->nombre</p></td>
                        <td>cantidad:($resultado->cantidad)</td>
                        <td><p style='margin:4px;'>$$resultado->precio_unitario</p></td>
                        <td>
                            <!--boton para eliminar productos-->
                            <div class='col'>
                                <form action='' method='POSTT'>
                                <button type='submit' name='eliminar_p' value='$resultado->id_carrito' class='boton_eliminar'>
                                    <!--figura para el boton-->
                                    <!--boton eliminar-->
                                    <svg
                                        style='
                                        margin-bottom: 5px;
                                        margin-top: 5px;
                                        margin-left: -2px;
                                        '
                                        width='40'
                                        height='20'
                                        viewBox='0 0 43 28'
                                        fill='none'
                                        xmlns='http://www.w3.org/2000/svg'
                                    >
                                        <g filter='url(#filter0_dd)'>
                                        <path
                                            d='M22 5.95508H30.0893C38.577 6.90852 39.2403 18.998 30.9051 20.8623C30.3629 20.9835 29.8089 21.0447 29.2533 21.0447H22H14.8053C14.211 21.0447 13.6187 20.9748 13.0407 20.8362C4.82807 18.8679 5.52602 6.96437 13.9107 5.95508H22Z'
                                            fill='#A4B9A5'
                                        />
                                        </g>
                                        <defs>
                                        <filter
                                            id='filter0_dd'
                                            x='0.238281'
                                            y='0.955078'
                                            width='42.5802'
                                            height='26.0897'
                                            filterUnits='userSpaceOnUse'
                                            color-interpolation-filters='sRGB'
                                        >
                                            <feFlood
                                            flood-opacity='0'
                                            result='BackgroundImageFix'
                                            />
                                            <feColorMatrix
                                            in='SourceAlpha'
                                            type='matrix'
                                            values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0'
                                            result='hardAlpha'
                                            />
                                            <feOffset dx='2' dy='2' />
                                            <feGaussianBlur stdDeviation='2' />
                                            <feColorMatrix
                                            type='matrix'
                                            values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0'
                                            />
                                            <feBlend
                                            mode='normal'
                                            in2='BackgroundImageFix'
                                            result='effect1_dropShadow'
                                            />
                                            <feColorMatrix
                                            in='SourceAlpha'
                                            type='matrix'
                                            values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0'
                                            result='hardAlpha'
                                            />
                                            <feOffset dx='-3' dy='-1' />
                                            <feGaussianBlur stdDeviation='2' />
                                            <feColorMatrix
                                            type='matrix'
                                            values='0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 0'
                                            />
                                            <feBlend
                                            mode='normal'
                                            in2='effect1_dropShadow'
                                            result='effect2_dropShadow'
                                            />
                                            <feBlend
                                            mode='normal'
                                            in='SourceGraphic'
                                            in2='effect2_dropShadow'
                                            result='shape'
                                            />
                                        </filter>
                                        </defs>
                                    </svg>
                                    <!---->
                                    <!---->
                                </button>
                                </form>
                            </div>
                        </td>
                        <td>
                            <!-- Button trigger modal -->
                            <form method='POST' class='row' style='background-color:white; 
                            margin:5px; height:50px;'>
                            <div class='col'>
                            <button style='margin-top:5px;' type='submit' 
                            value='$resultado->id_carrito' name='edicion_cant' class='btn btn-success'>
                            editar
                            </button>
                            </div>
                            <div class='col'>
                            <select name='edicion_producto' style='margin-top:10px;'>
                                <option from='edicion_producto' value='1'>1</option>
                                <option from='edicion_producto' value='2'>2</option>
                                <option from='edicion_producto' value='3'>3</option>
                                <option from='edicion_producto' value='4'>4</option>
                                <option from='edicion_producto' value='5'>5</option>
                            </select>
                            </div>
                        </td>
                    </tr>
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
}
/*
                      if(isset($_GET['cargar_domicilios']))
                      {
                        $mostrar=implode($carga_dom_s->carga_de_domicilios_selects($_SESSION['usuario']));
                        $calle=$mostrar;
                        echo $calle;
                      }*/
?>