<?php 
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
// nombre: 
// apellido_paterno: 
// apellido_materno: 
// telefono: 
// correo: 
// direccion: 
// estado: 
// ciudad: 
// fax: 
// usuario: 
// pass: 
$pass = password_hash($_POST['pass'], PASSWORD_DEFAULT);
$resultado = $sql->obtenerResultadoSimple("CALL sp_insertar_cliente('".$_POST['nombre']."', '".$_POST['apellido_paterno']."', '".$_POST['apellido_materno']."', '".$_POST['telefono']."', '".$_POST['correo']."', '".$_POST['direccion']."', '".$_POST['ciudad']."', '".$_POST['fax']."', '".$_POST['usuario']."', '".$pass."',@_ID)");

if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => 'Cliente agregado correctamente'));
}
// $total_resultado = count($resultado);