<?php
session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$resultado = $sql->obtenerResultadoSimple("CALL sp_delete_reporte('".$_POST['id']."')");
if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' =>'Reporte eliminado correctamente'));
}