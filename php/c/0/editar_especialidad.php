<?php 
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();

$resultado = $sql->obtenerResultadoSimple("CALL sp_editar_especialidad('".$_POST['id']."','".$_POST['nombre_tipo_medico']."')");

if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => 'Especialidad editada correctamente'));
}