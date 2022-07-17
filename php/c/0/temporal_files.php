<?php 
// foreach $_FILES
$num = 0;
$files = array();
foreach($_FILES as $image){
    $num++;
    $nombre_archivo = 'tmp_name='.date('YmdHisu').'&name='.$image['name'];
    $og_name = $image['name'];
    // nombre original
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
    $file_location = $location.$nombre_archivo;
    if(move_uploaded_file($image['tmp_name'],$file_location)){
        $data  = array(
            'name' => $nombre_archivo,
            'location' => $file_location,
            'size' => $image['size'],
            'og_name' => $og_name,
        );
        $files[] = $data;
    }
}
    echo JSON_encode(array('status' => 'success', 'files' => $files));


