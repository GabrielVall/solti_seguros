<?php
session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();

$cliente = $sql->obtenerResultado("CALL sp_select_proveedor('".$_POST['id']."')");
?>
<div class="card  box-shadow-0">
    <div class="card-header">
        <h4 class="card-title mb-1">Editar proveedor</h4>
        <p class="mb-2">Edita los datos basicos de un proveedor.</p>
    </div>
    <div class="card-body pt-0">
        <div class="form-horizontal" >
            <div class="form-group">
                <input type="text" class="form-control" id="nombre_proveedor" placeholder="Nombre aseguradora" value="<?php echo $cliente[0]['nombre_proveedor']; ?>">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="nombre" placeholder="Nombre" value="<?php echo $cliente[0]['nombre']; ?>">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="apellido_paterno" placeholder="Apellido Paterno" value="<?php echo $cliente[0]['apellido_paterno']; ?>">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="apellido_materno" placeholder="Apellido Materno" value="<?php echo $cliente[0]['apellido_materno']; ?>">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="telefono" placeholder="Telefono" value="<?php echo $cliente[0]['telefono']; ?>">
            </div>
            <div class="form-group">
                <input type="email" class="form-control" id="correo" placeholder="correo" value="<?php echo $cliente[0]['mail']; ?>">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="direccion" placeholder="Dirección" value="<?php echo $cliente[0]['direccion']; ?>">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="estado" placeholder="Estado" >
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="ciudad" placeholder="Ciudad" value="<?php echo $cliente[0]['id_ciudad']; ?>">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="fax" placeholder="Fax" value="<?php echo $cliente[0]['fax']; ?>">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="usuario" placeholder="Usuario" value="<?php echo $cliente[0]['usuario']; ?>">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="pass" placeholder="Contraseña" >
            </div>
            <div class="form-group mb-0 mt-3 justify-content-end d-flex">
                <div>
                    <a class="btn btn-secondary ms-4" id="cancelar_editar_aseguradora">Cancelar</a>
                    <a class="btn btn-primary" id="editar_cliente_form" data-id="<?php echo $_POST['id']; ?>">Agregar</a>
                </div>
            </div>
        </div>
    </div>
</div>
