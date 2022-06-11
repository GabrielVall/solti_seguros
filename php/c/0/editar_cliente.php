<?php 
session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();

switch ($_SESSION['hash']) {
    case 'clientes':
        $tabla = 'cliente';
        break;
    case 'abogados':
        $tabla = 'abogado';
    break;
}

$resultado = $sql->obtenerResultadoSimple("CALL sp_editar_".$tabla."('".$_POST['nombre']."', '".$_POST['apellido_paterno']."', '".$_POST['apellido_materno']."', '".$_POST['telefono']."', '".$_POST['correo']."', '".$_POST['direccion']."', '".$_POST['ciudad']."', '".$_POST['fax']."', '".$_POST['usuario']."','".$_POST['id']."')");

if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => 'Usuario editado correctamente'));
}
// $total_resultado = count($resultado);