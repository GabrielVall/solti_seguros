<?php
session_start();
include_once("../../m/SQLConexion.php");
$sql = new SQLConexion();
$password = $_POST['pass'];
$row = $sql->obtenerResultado("CALL sp_select_usuario_login('".test_input($_POST['usuario'])."')");
if(isset($row[0]['id_usuario'])){
    if (password_verify($password, $row[0]['password'])) {
        if($row[0]['id_estado_usuario'] == 0){
            $response_array['msg'] = 'Tu cuenta esta desactivada, contacta con el administrador';
        }else{
            $_SESSION['id_usuario'] = $row[0]['id_usuario'];
            $_SESSION['nivel_usuario'] = $row[0]['id_estado_usuario'];
            $response_array['msg'] = 'success';
        }
    }else{
        $response_array['msg'] = 'Contraseña incorrecta, intente nuevamente.';
    }
}else{
    $response_array['msg'] = 'este correo no esta asociado a ninguna cuenta';
}

header('Content-type: application/json');
echo json_encode($response_array);

function test_input($data) {
	return htmlspecialchars($data, ENT_QUOTES);
}