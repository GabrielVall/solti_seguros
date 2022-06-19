<?php 
session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();

$resultado = $sql->obtenerResultadoSimple("CALL sp_insertar_especialidad('".$_POST['nombre']."')");

if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => 'Especialidad agregada correctamente'));
}