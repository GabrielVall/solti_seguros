<div class="modal-header">
    <h6 class="modal-title">Agregar un reporte</h6><button aria-label="Close" class="btn-close" data-bs-dismiss="modal" type="button"><span aria-hidden="true">×</span></button>
</div>
<div class="modal-body">
    <h6>Agrega los campos para continuar</h6>
    
    <div class="form-horizontal">
        <div class="form-group">
        <input type="file" class="form-control">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="fecha_reporte">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="fecha_accidente">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="hora_accidente">
        </div>
        <div class="form-group">
            <select class="form-control">
                <option>Referenciado</option>
                <option>Cliente 1</option>
                <option>Cliente 2</option>
            </select>
        </div>
        <div class="form-group">
            <select class="form-control">
                <option>Tipo</option>
                <option>Cliente 1</option>
                <option>Cliente 2</option>
            </select>
        </div>
        <div class="form-group">
            <select class="form-control">
                <option>Seleccione un cliente</option>
                <option>Cliente 1</option>
                <option>Cliente 2</option>
            </select>
        </div>
        <div class="form-group">
            <select class="form-control">
                <option>Abogado</option>
                <option>Cliente 1</option>
                <option>Cliente 2</option>
            </select>
        </div>
        <div class="form-group">
            <select class="form-control">
                <option>Asistente</option>
                <option>Cliente 1</option>
                <option>Cliente 2</option>
            </select>
        </div>
        <div class="form-group">
            <select class="form-control">
                <option>Seleccione una ciudad</option>
                <option>Cliente 1</option>
                <option>Cliente 2</option>
            </select>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="num_poliza">
        </div>
        <div class="form-group">
            <select class="form-control">
                <option>Seleccione una aseguradora</option>
                <option>Cliente 1</option>
                <option>Cliente 2</option>
            </select>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="reporte_policia">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="num_reclamo">
        </div>
        <div class="form-group mb-0 mt-3 justify-content-end d-flex">
            <div>
                <a class="btn btn-secondary ms-4" id="cancelar">Cancelar</a>
                <a class="btn btn-primary" id="submit_form" data-action="agregar_cliente">Agregar</a>
            </div>
        </div>
    </div>
</div>
<div class="modal-footer">
    <button class="btn ripple btn-primary" type="button">Continuar</button>
    <button class="btn ripple btn-secondary" data-bs-dismiss="modal" type="button">Cancelar</button>
</div>