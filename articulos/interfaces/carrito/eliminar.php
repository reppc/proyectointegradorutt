<?php
session_start();
if($_SESSION['usuario']=="" && $_SESSION['rol']=="")
        {
            header("location:../../../login/login.php");
        }
if(!isset($_GET["id"])) exit();
$id = $_GET["id"];
include_once "../../../scripts/productos.php";
$base_de_datos=new producto();
$sentencia = $base_de_datos->eliminar_producto_del_carro($id);
	header("Location: ./carrito.php");
	exit;
?>