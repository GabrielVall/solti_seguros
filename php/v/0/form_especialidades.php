<?php 
if(session_status() == PHP_SESSION_NONE){
    session_start();
    // Si esta declarada la variable de sesion
}
// if string conatins 'clientes'
if(!strpos($_SERVER['REQUEST_URI'], 'form_especialidaddes') !== false){
    $hash = $_SERVER['REQUEST_URI'];
    $hash = substr($hash, strrpos($hash, '/') + 1);
    // remove extension     
    $hash = substr($hash, 0, strrpos($hash, '.'));
    $_SESSION['hash'] = $hash;   
}else{
    $hash = $_SESSION['hash'];
}

// Get url
// get text after last slash
?>
<div class="card  box-shadow-0">
    <div class="card-header">
        <h4 class="card-title mb-1">Formulario para <?php echo $hash; ?></h4>
        <p class="mb-2">Agrega  los datos basicos de tu registro.</p>
    </div>
    <div class="card-body pt-0">
        <div class="form-horizontal" >
            <div class="form-group">
                <input type="text" class="form-control" id="nombre" placeholder="Nombre especialidad">
            </div>
            <div class="form-group mb-0 mt-3 justify-content-end d-flex">
                <div>
                    <a class="btn btn-secondary ms-4" id="cancelar">Cancelar</a>
                    <a class="btn btn-primary" id="submit_form" data-action="agregar_especialidad">Agregar</a>
                </div>
            </div>
        </div>
    </div>
</div>