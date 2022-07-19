<?php 
session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();

$pass = password_hash($_POST['usuario_pswd'], PASSWORD_DEFAULT);
$resultado = $sql->obtenerResultadoSimple("CALL sp_insertar_aseguradora('".$_POST['nombre_aseguradora']."', '".$_POST['nombre']."', '".$_POST['apellido_paterno']."', '".$_POST['apellido_materno']."', '".$_POST['telefono']."', '".$_POST['correo']."', '".$_POST['direccion']."', '".$_POST['ciudad']."', '".$_POST['fax']."', '".$_POST['usuario']."', '".$pass."',@_ID)");

if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => 'Cliente agregado correctamente'));
}