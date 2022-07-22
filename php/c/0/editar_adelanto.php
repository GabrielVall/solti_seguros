<?php 
session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$last = null;
switch ($_SESSION['hash']) {
    case 'clientes':
        $tabla = 'cliente';
        break;
    case 'abogados':
        $tabla = 'abogado';
    break;
    case 'aseguradoras':
        $tabla = 'aseguradora';
        $last = ",'".$_POST['nombre_aseguradora']."'";
    break;
    case 'asistentes':
        $tabla = 'asistente';
    break;
    case 'adelantos':
        $tabla = 'adelanto';
    break;
    case 'proveedores':
        $tabla = 'proveedor';
        $last = ",'".$_POST['nombre_proveedor']."'";
    break;
}
$resultado = $sql->obtenerResultadoSimple("CALL sp_editar_".$tabla."('".$_POST['id']."', '".$_POST['folio_adelanto']."', '".$_POST['adelanto']."')");

    echo JSON_encode(array('status' => 'success', 'message' => 'Adelanto editado correctamente') );
// $total_resultado = count($resultado);