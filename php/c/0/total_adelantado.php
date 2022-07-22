<?php 

session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();

$resultado = $sql->obtenerResultado("CALL sp_select_total_adelantado('".$_POST['id_reporte']."')");

echo JSON_encode(array('total' => $resultado[0]['total']));
