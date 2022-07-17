<?php 
// ruta
$location = '../../../images/temp/';
$file = $_POST['nombre'];
// delete file
$file_location = $location.$file;
if(file_exists($file_location)){
    unlink($file_location);
    // return json
    echo JSON_encode(array('status' => 'success'));
}else{
    echo JSON_encode(array('status' => 'error'));
}