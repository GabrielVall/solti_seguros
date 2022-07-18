<?php 

session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();

if ($_POST['referenciado']=="Calle") {
    $informante = $_POST['informante'];
}else{
    $informante = 0;
}
$resultado = $sql->obtenerResultadoID("CALL sp_insertar_reporte('".$_POST['cliente']."', '".$_POST['fecha']."', '".$_POST['hora']."', '".$_POST['ciudad']."', '".$_POST['comentarios']."', '".$_POST['referenciado']."', '".$_POST['tipo']."', '".$_POST['estado']."', '".$_POST['abogado']."', '".$_POST['asistente']."', '".$_POST['poliza']."', '".$_POST['aseguradora']."', '".$_POST['reporte_policial']."', '".$_POST['reclamo']."', '".$informante."',@_ID)");

$clientes_adicionales = explode("," , $_POST['clientes_adicionales']);
for ($i=0; $i < count($clientes_adicionales); $i++) { 
    $rpta2 = $sql->obtenerResultadoSimple("CALL sp_insertar_clientes_adicionales_reporte('".$resultado[0][0]."','".$clientes_adicionales[$i]."')");
}
if($resultado){
    // Movemos las imagenes a una carpeta permanente
    // id folder
    $id_folder = $resultado[0][0];
    // creamos una carpeta con el id del reporte
    $carpeta = "../../../images/reportes/".$id_folder;
    mkdir($carpeta, 0777, true);
    // movemos los archivos del arreglo a la carpeta creada

    $imagenes=json_decode($_POST['imagenes'],true); 
    $total_imagenes=count($imagenes);
    for($i=0;$i<$total_imagenes;$i++){
        $temp_name = $imagenes[$i]['name'];
        $new_name = $imagenes[$i]['og_name'];
        $file_location = "../../../images/temp/".$temp_name;
        $new_location = $carpeta."/".$new_name;
        rename($file_location, $new_location);
    }
    echo JSON_encode(array('status' => 'success', 'message' => 'Tu reporte fue agregado correctamente'));
}