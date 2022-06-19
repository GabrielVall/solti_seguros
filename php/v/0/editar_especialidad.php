<?php
session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();

$cliente = $sql->obtenerResultado("CALL sp_select_especialidad('".$_POST['id']."')");
?>
<div class="card  box-shadow-0">
    <div class="card-header">
        <h4 class="card-title mb-1">Editar especialidad</h4>
    </div>
    <div class="card-body pt-0">
        <div class="form-horizontal" >
            <div class="form-group">
                <input type="text" class="form-control" id="nombre_tipo_medico" placeholder="Nombre especialidad" value="<?php echo $cliente[0]['nombre_tipo_medico']; ?>">
            </div>
            <div class="form-group mb-0 mt-3 justify-content-end d-flex">
                <div>
                    <a class="btn btn-secondary ms-4" id="cancelar_editar_especialidad">Cancelar</a>
                    <a class="btn btn-primary" id="editar_especialidad_form" data-id="<?php echo $_POST['id']; ?>">Agregar</a>
                </div>
            </div>
        </div>
    </div>
</div>