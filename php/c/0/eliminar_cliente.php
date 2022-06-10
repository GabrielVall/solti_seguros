<?php
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$resultado = $sql->obtenerResultadoSimple("CALL sp_delete_cliente('".$_POST['id_cliente']."')");
if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => 'Cliente eliminado correctamente'));
}