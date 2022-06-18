<?php 
session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$last = 0;
switch ($_SESSION['hash']) {
    case 'clientes':
        $tabla = 'cliente';
        break;
    case 'abogados':
        $tabla = 'abogado';
    break;
    case 'aseguradoras':
        $tabla = 'aseguradora';
        $last = $_POST['nombre_aseguradora'];
    break;
}
$resultado = $sql->obtenerResultadoSimple("CALL sp_editar_".$tabla."('".$_POST['nombre']."', '".$_POST['apellido_paterno']."', '".$_POST['apellido_materno']."', '".$_POST['telefono']."', '".$_POST['correo']."', '".$_POST['direccion']."', '".$_POST['ciudad']."', '".$_POST['fax']."', '".$_POST['usuario']."','".$_POST['id']."', '".$last."')");

if($tabla != 'aseguradora'){
    echo JSON_encode(array('status' => 'success', 'message' => 'Usuario editado correctamente', 'tipo' => 0 ) );
}else{
    echo JSON_encode(array('status' => 'success', 'message' => 'Aseguradora editada correctamente', 'tipo' => 1 ) );
}
// $total_resultado = count($resultado);