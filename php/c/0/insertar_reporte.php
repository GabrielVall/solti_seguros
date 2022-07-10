<?php 
// cliente:
// fecha: 
// hora: 
// ciudad:
// comentarios: 
// referenciado:
// tipo:
// estado:
// abogado:
// asistente:
// poliza:
// aseguradora:
// reporte_policial:
// reclamo:
session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();

$resultado = $sql->obtenerResultadoSimple("CALL sp_insertar_reporte('".$_POST['cliente']."', '".$_POST['fecha']."', '".$_POST['hora']."', '".$_POST['ciudad']."', '".$_POST['comentarios']."', '".$_POST['referenciado']."', '".$_POST['tipo']."', '".$_POST['estado']."', '".$_POST['abogado']."', '".$_POST['asistente']."', '".$_POST['poliza']."', '".$_POST['aseguradora']."', '".$_POST['reporte_policial']."', '".$_POST['reclamo']."')");

if($resultado){
    echo JSON_encode(array('status' => 'success', 'message' => 'Tu reporte fue agregado correctamente'));
}