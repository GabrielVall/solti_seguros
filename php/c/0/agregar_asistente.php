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

$pass = password_hash($_POST['usuario_pswd'], PASSWORD_DEFAULT);
$resultado = $sql->obtenerResultadoSimple("CALL sp_insertar_".$tabla."('".$_POST['nombre']."', '".$_POST['apellido_paterno']."', '".$_POST['apellido_materno']."', '".$_POST['telefono']."', '".$_POST['correo']."', '".$_POST['direccion']."', '".$_POST['ciudad']."', '".$_POST['fax']."', '".$_POST['usuario']."', '".$pass."',@_ID)");

if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => 'Cliente agregado correctamente'));
}
// $total_resultado = count($resultado);