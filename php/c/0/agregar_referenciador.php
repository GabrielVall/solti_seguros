<?php 
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$pass = password_hash($_POST['usuario_pswd'], PASSWORD_DEFAULT);

$resultado = $sql->obtenerResultadoSimple("CALL sp_insertar_referenciador('".$_POST['nombre']."', '".$_POST['apellido_paterno']."', '".$_POST['apellido_materno']."', '".$_POST['telefono']."', '".$_POST['correo']."', '".$_POST['direccion']."', '".$_POST['ciudad']."', '".$_POST['fax']."', '".$_POST['usuario']."', '".$pass."', '".$_POST['codigo']."',@_ID)");

if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => 'Referenciador agregado correctamente'));
}
// $total_resultado = count($resultado);