<?php
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$clientes = $sql->obtenerResultado('CALL sp_select_clientes()');
$total_clientes = count($clientes);
$abogados = $sql->obtenerResultado('CALL sp_select_abogados()');
$total_abogados = count($abogados);
$asistentes = $sql->obtenerResultado('CALL sp_select_asistentes()');
$total_asistentes = count($asistentes);
$aseguradoras = $sql->obtenerResultado('CALL sp_select_aseguradoras()');
$total_aseguradoras = count($aseguradoras);
?>
<div class="modal-header">
    <h6 class="modal-title">Agregar un reporte</h6><button aria-label="Close" class="btn-close" data-bs-dismiss="modal" type="button"><span aria-hidden="true">×</span></button>
</div>
<div class="modal-body" id="form_reporte">
    <div class="form-horizontal">
        <div class="form-group">
            <label>Selecciona un cliente</label>
            <select class="form-control" id="cliente">
                <option>Selecciona un cliente</option>
                <?php 
                    foreach($clientes as $cliente){
                        echo '<option value="'.$cliente[0].'">'.$cliente[1].'</option>';
                    }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label>Fecha del accidente</label>
            <input class="form-control" type="date" id="fecha" placeholder="Introduce una fecha"/>
        </div>
        <div class="form-group">
            <label>Hora</label>
            <input class="form-control" type="time" placeholder="Selecciona una hora" id="hora"/>
        </div>
        <div class="form-group">
            <label>Ciudad de origen</label>
            <select class="form-control" id="ciudad">
            </select>
        </div>
        <div class="form-group">
            <label>Comentarios adicionales</label>
            <input class="form-control" type="text" id="comentarios" />
        </div>
        <div class="form-group">
            <label>Referenciado</label>
            <select class="form-control" id="referenciado">
                <option>Calle</option>
                <option>Oficina</option>
            </select>
        </div>
        <div class="form-group">
            <label>Tipo</label>
            <select class="form-control" id="tipo">
                <option>Comercio</option>
                <option>Regular</option>
            </select>
        </div>
        <div class="form-group">
            <label>Estado</label>
            <select class="form-control" id="estado">
                <option>Proceso</option>
                <option>Pago</option>
            </select>
        </div>
        <div class="form-group">
            <label>Abogado</label>
            <select class="form-control" id="abogado">
                <?php 
                foreach($abogados as $abogado){
                    echo '<option value="'.$abogado[0].'">'.$abogado[1].'</option>';
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label>Asistente</label>
            <select class="form-control" id="asistente">
                <?php 
                foreach($asistentes as $asistente){
                    echo '<option value="'.$asistente[0].'">'.$asistente[1].'</option>';
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label>Número de poliza</label>
            <input class="form-control" type="text" id="poliza" />
        </div>
        <div class="form-group">
            <label>Aseguradora</label>
            <select class="form-control" id="aseguradora">
                <?php 
                foreach($aseguradoras as $aseguradora){
                    echo '<option value="'.$aseguradora[0].'">'.$aseguradora[1].'</option>';
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label>Número de reporte policial</label>
            <input class="form-control" type="text" id="reporte_policial" />
        </div>
        <div class="form-group">
            <label>Número de reclamo</label>
            <input class="form-control" type="text" id="reclamo" />
        </div>
    </div>
</div>
<div class="modal-footer">
    <button class="btn ripple btn-primary" type="button" id="agregar_reporte">Continuar</button>
</div>