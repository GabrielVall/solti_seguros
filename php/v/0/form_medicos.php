<?php 
if(session_status() == PHP_SESSION_NONE){
    session_start();
    // Si esta declarada la variable de sesion
}
// if string conatins 'clientes'
if(!strpos($_SERVER['REQUEST_URI'], 'form_medicos') !== false){
    $hash = $_SERVER['REQUEST_URI'];
    $hash = substr($hash, strrpos($hash, '/') + 1);
    // remove extension     
    $hash = substr($hash, 0, strrpos($hash, '.'));
    $_SESSION['hash'] = $hash;   
}else{
    $hash = $_SESSION['hash'];
}
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$proveedores = $sql->obtenerResultado("CALL sp_select_proveedores()");
$tipos_medicos = $sql->obtenerResultado("CALL sp_select_tipos_medicos()");
?>
<div class="card  box-shadow-0">
    <div class="card-header">
        <h4 class="card-title mb-1">Formulario para medicos</h4>
        <p class="mb-2">Agrega  los datos basicos de un nuevo medico.</p>
    </div>
    <div class="card-body pt-0">
        <div class="form-horizontal" >
            <div class="form-group">
                <label for="nombre">Nombre del proveedor medico</label>
                <select class="form-control" id="id_aseguradora">
                    <option value="">Seleccione un proveedor</option>
                    <?php 
                        foreach($proveedores as $proveedor){
                            echo '<option value="'.$proveedor['id_proveedor'].'">'.$proveedor['nombre_proveedor'].'</option>';
                        }
                    ?>
                </select>
            </div>
            <div class="form-group">
            <label for="nombre">Especialidad del medico</label>
                <select class="form-control" id="id_especialidad">
                    <option value="">Seleccione una especialidad</option>
                    <?php 
                        foreach($tipos_medicos as $tipo_medico){
                            echo '<option value="'.$tipo_medico['id_tipo_medico'].'">'.$tipo_medico['nombre_tipo_medico'].'</option>';
                        }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="nombre">Nombre</label>
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
            <div class="form-group">
                <label for="direccion">Dirección</label>
                <input type="text" class="form-control" id="direccion" placeholder="Dirección">
            </div>
            <div class="form-group">
                <label for="ciudad">Ciudad</label>
                <select class="form-control" id="ciudad">
                    <option value="">Seleccione una ciudad</option>
                </select>
            </div>
            <div class="form-group">
                <label for="fax">Fax</label>
                <input type="text" class="form-control" id="fax" placeholder="Fax">
            </div>
            <div class="form-group">
                <label for="usuario">Nombre de usuario</label>
                <input type="text" class="form-control" id="usuario" placeholder="Usuario">
            </div>
            <div class="form-group">
                <label for="pass">Contraseña</label>
                <input type="password" class="form-control" id="pass" placeholder="Contraseña">
            </div>
            <div class="form-group mb-0 mt-3 justify-content-end d-flex">
                <div>
                    <a class="btn btn-secondary ms-4" id="cancelar">Cancelar</a>
                    <a class="btn btn-primary" id="submit_form" data-action="agregar_medico">Agregar</a>
                </div>
            </div>
        </div>
    </div>
</div>