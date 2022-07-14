<?php 
// foreach $_FILES
$num = 0;
$file_names = array();
foreach($_FILES as $image){
    $num++;
    $nombre_archivo = 'reporte'.$num.'_'.date('YmdHisu');
    // print year month day hour minute second and microseconds
    $location = '../../../images/temp/';
    if (!file_exists($location)) {
        mkdir($location, 0777, true);
    }
    /* Subir  archivo */
    $path = $image['name'];
    $extension = pathinfo($path, PATHINFO_EXTENSION);
    $extension = strtolower($extension);
    // ubicacion + nombre
    $file_location = $location.$nombre_archivo.'.'.$extension;
    if(move_uploaded_file($image['tmp_name'],$file_location)){
        $file_names[] = $nombre_archivo.'.'.$extension;
    }
}
    echo JSON_encode(array('status' => 'success', 'files' => $file_names));


