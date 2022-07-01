<?php 
if(session_status() == PHP_SESSION_NONE){
    session_start();
    // Si esta declarada la variable de sesion
}
// if string conatins 'clientes'
if(!strpos($_SERVER['REQUEST_URI'], 'form_clientes') !== false){
    $hash = $_SERVER['REQUEST_URI'];
    $hash = substr($hash, strrpos($hash, '/') + 1);
    // remove extension     
    $hash = substr($hash, 0, strrpos($hash, '.'));
    $_SESSION['hash'] = $hash;   
}else{
    $hash = $_SESSION['hash'];
}
$slash = $_SERVER['REQUEST_URI'];
$slash = substr($slash, strrpos($slash, '/') + 1);
// if includes clientes
if($_SESSION['hash'] == 'clientes'){
    $hidden = array(
        'fax' => true,
        'usuario' => true,
        'direccion' => true,
    );
}
else if($_SESSION['hash'] == 'asistentes' ){
    $hidden = array(
        'direccion' => true,
    );
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
            <label for="nombre">Nombre del cliente</label>
                <input type="text" class="form-control" id="nombre" placeholder="Nombre">
            </div>
            <div class="form-group">
                <label for="apellido_paterno">Apellido paterno</label>
                <input type="text" class="form-control" id="apellido_paterno" placeholder="Apellido Paterno">
            </div>
            <div class="form-group">
                <label for="apellido_materno">Apellido materno</label>
                <input type="text" class="form-control" id="apellido_materno" placeholder="Apellido Materno">
            </div>
            <div class="form-group">
                <label for="telefono">Telefono</label>
                <input type="text" class="form-control" id="telefono" placeholder="Telefono">
            </div>
            <div class="form-group">
                <label for="correo">Correo electronico</label>
                <input type="email" class="form-control" id="correo" placeholder="correo">
            </div>
            <div class="form-group" style="<?php if(isset($hidden['direccion'])){echo "display:none;";} ?>">
                <label for="direccion">Dirección</label>
                <input type="text" class="form-control" <?php if(isset($hidden['direccion'])){echo 'value="Sin Valor"';} ?> id="direccion" placeholder="Dirección">
            </div>
            <div class="form-group">
                <label for="ciudad">Ciudad</label>
                <select class="form-control" id="ciudad">
                    <option value="">Seleccione una ciudad</option>
                </select>
            </div>
            <div class="form-group" style="<?php if(isset($hidden['fax'])){echo "display:none;";} ?>">
                <label for="fax">Fax</label>
                <input type="text" class="form-control" <?php if(isset($hidden['fax'])){echo 'value="Sin Valor"';} ?>  id="fax" placeholder="Fax">
            </div>
            <div class="form-group" style="<?php if(isset($hidden['usuario'])){echo "display:none;";} ?>">
                <label for="usuario">Nombre de usuario</label>
                <input type="text" class="form-control" <?php if(isset($hidden['usuario'])){echo 'value="Sin Valor"';} ?> id="usuario" placeholder="Usuario">
            </div>
            <div class="form-group">
                <label for="pass">Contraseña</label>
                <input type="password" class="form-control" id="pass" placeholder="Contraseña">
            </div>
            <div class="form-group mb-0 mt-3 justify-content-end d-flex">
                <div>
                    <a class="btn btn-secondary ms-4" id="cancelar">Cancelar</a>
                    <a class="btn btn-primary" id="submit_form" data-action="agregar_cliente">Agregar</a>
                </div>
            </div>
        </div>
    </div>
</div>