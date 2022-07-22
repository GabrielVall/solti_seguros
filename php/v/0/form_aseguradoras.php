<?php 
if(session_status() == PHP_SESSION_NONE){
    session_start();
    // Si esta declarada la variable de sesion
}
// if string conatins 'clientes'
if(!strpos($_SERVER['REQUEST_URI'], 'form_aseguradoras') !== false){
    $hash = $_SERVER['REQUEST_URI'];
    $hash = substr($hash, strrpos($hash, '/') + 1);
    // remove extension     
    $hash = substr($hash, 0, strrpos($hash, '.'));
    $_SESSION['hash'] = $hash;   
}else{
    $hash = $_SESSION['hash'];
}
if($_SESSION['hash'] == 'aseguradoras'){
    $hidden = array(
        'nombre' => true,
        'apellido_paterno' => true,
        'apellido_materno' => true,
        'correo' => true,
        'usuario' => true,
        'pass' => true,
        'fax' => true,
        'direccion' => true,
        'ciudad' => true,
        'fax' => true,
    );
}
// Get url
// get text after last slash
?>
<div class="card  box-shadow-0">
    <div class="card-header">
        <h4 class="card-title mb-1">Formulario para Aseguradoras</h4>
        <p class="mb-2">Agrega  los datos basicos de tu registro.</p>
    </div>
    <div class="card-body pt-0">
        <div class="form-horizontal" >
            <div class="form-group">
                <label for="nombre" >Nombre de la aseguradora</label>
                <input type="text" class="form-control" id="nombre_aseguradora" placeholder="Nombre de la aseguradora">
            </div>
            <div class="form-group" style="<?php if(isset($hidden['nombre'])){echo "display:none;";} ?>">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" <?php if(isset($hidden['nombre'])){echo 'value="Sin Valor"';} ?> id="nombre" placeholder="Nombre">
            </div>
            <div class="form-group" style="<?php if(isset($hidden['apellido_paterno'])){echo "display:none;";} ?>">
                <label for="apellido_paterno">Apellido paterno</label>
                <input type="text" class="form-control" id="apellido_paterno" <?php if(isset($hidden['apellido_paterno'])){echo 'value="Sin Valor"';} ?> placeholder="Apellido Paterno">
            </div>
            <div class="form-group" style="<?php if(isset($hidden['apellido_materno'])){echo "display:none;";} ?>">
                <label for="apellido_materno">Apellido materno</label>
                <input type="text" class="form-control" id="apellido_materno" <?php if(isset($hidden['apellido_materno'])){echo 'value="Sin Valor"';} ?> placeholder="Apellido Materno">
            </div>
            <div class="form-group">
                <label for="telefono">Telefono</label>
                <input type="text" class="form-control" id="telefono" placeholder="Telefono">
            </div>
            <div class="form-group" style="<?php if(isset($hidden['correo'])){echo "display:none;";} ?>">
                <label for="correo">Correo electronico</label>
                <input type="email" class="form-control" id="correo"  <?php if(isset($hidden['correo'])){echo 'value="Sin Valor"';} ?> placeholder="correo">
            </div>
            <div class="form-group" style="<?php if(isset($hidden['direccion'])){echo "display:none;";} ?>">
                <label for="direccion">Dirección</label>
                <input type="text" class="form-control" <?php if(isset($hidden['direccion'])){echo 'value="Sin Valor"';} ?> id="direccion" placeholder="Dirección">
            </div>
            <div class="form-group" style="<?php if(isset($hidden['ciudad'])){echo "display:none;";} ?>">
                <label for="ciudad">Ciudad</label>
                <select class="form-control" id="ciudad">
                    <?php if(isset($hidden['ciudad'])){ ?>
                        <option value="0" selected>Sin valor</option>
                    <?php } ?>
                    <option value="">Seleccione una ciudad</option>
                </select>
            </div>
            <div class="form-group" style="<?php if(isset($hidden['fax'])){echo "display:none;";} ?>">
                <label for="fax">Fax</label>
                <input type="text" class="form-control" id="fax" <?php if(isset($hidden['fax'])){echo 'value="Sin Valor"';} ?> placeholder="Fax">
            </div>
            <div class="form-group" style="<?php if(isset($hidden['usuario'])){echo "display:none;";} ?>">
                <label for="usuario">Nombre de usuario</label>
                <input type="text" class="form-control" id="usuario" <?php if(isset($hidden['usuario'])){echo 'value="Sin Valor"';} ?> placeholder="Usuario">
            </div>
            <div class="form-group" style="<?php if(isset($hidden['pass'])){echo "display:none;";} ?>">
                <label for="pass">Contraseña</label>
                <input type="password" class="form-control" id="usuario_pswd" <?php if(isset($hidden['pass'])){echo 'value="Sin Valor"';} ?> placeholder="Contraseña">
            </div>
            <div class="form-group mb-0 mt-3 justify-content-end d-flex">
                <div>
                    <a class="btn btn-secondary ms-4" id="cancelar">Cancelar</a>
                    <a class="btn btn-primary" id="submit_form" data-action="agregar_aseguradora">Agregar</a>
                </div>
            </div>
        </div>
    </div>
</div>