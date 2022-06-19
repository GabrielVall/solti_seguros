<?php 
session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();

$pass = password_hash($_POST['pass'], PASSWORD_DEFAULT);
$resultado = $sql->obtenerResultadoSimple("CALL sp_insertar_medico('".$_POST['nombre']."', '".$_POST['apellido_paterno']."', '".$_POST['apellido_materno']."', '".$_POST['telefono']."', '".$_POST['correo']."', '".$_POST['direccion']."', '".$_POST['ciudad']."', '".$_POST['fax']."', '".$_POST['usuario']."', '".$pass."', '".$_POST['id_aseguradora']."', '".$_POST['id_especialidad']."',@_ID)");

if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => 'Medico agregado correctamente'));
}