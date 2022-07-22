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
    case 'asistentes':
        $tabla = 'asistente';
    break;
    case 'adelantos':
        $tabla = 'adelantos';
    break;
}

$resultado = $sql->obtenerResultadoSimple("CALL sp_insertar_".$tabla."('".$_POST['folio_adelanto']."', '".$_POST['adelanto']."',@_ID)");

if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => 'Adelanto agregado correctamente'));
}
// $total_resultado = count($resultado);