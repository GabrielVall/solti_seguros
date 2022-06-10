<?php 
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();

$resultado = $sql->obtenerResultadoSimple("CALL sp_editar_cliente('".$_POST['nombre']."', '".$_POST['apellido_paterno']."', '".$_POST['apellido_materno']."', '".$_POST['telefono']."', '".$_POST['correo']."', '".$_POST['direccion']."', '".$_POST['ciudad']."', '".$_POST['fax']."', '".$_POST['usuario']."','".$_POST['id']."')");

if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => 'Cliente editado correctamente'));
}
// $total_resultado = count($resultado);