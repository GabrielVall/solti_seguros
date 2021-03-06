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
    case 'referenciadores':
        $tabla = 'referenciador';
    break;
    case 'asistentes':
        $tabla = 'asistente';
    break;
    case 'aseguradoras':
        $tabla = 'aseguradora';
    break;
    case 'proveedores':
        $tabla = 'proveedor';
    break;
    case 'medicos':
        $tabla = 'medico';
    break;
    case 'especialidades':
        $tabla = 'tipo_medico';
    break;
    case 'informantes':
        $tabla = 'informante';
    break;
    case 'adelantos':
        $tabla = 'adelanto';
    break;
}
$resultado = $sql->obtenerResultadoSimple("CALL sp_delete_".$tabla."('".$_POST['id_cliente']."')");
if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => $tabla.' eliminado correctamente'));
}