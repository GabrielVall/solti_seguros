<?php 
if(session_status() == PHP_SESSION_NONE){
    session_start();
    // Si esta declarada la variable de sesion
}
// if string conatins 'clientes'
if(!strpos($_SERVER['REQUEST_URI'], 'form_adelantos') !== false){
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
// Get url
// get text after last slash
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$reportes = $sql->obtenerResultado("CALL sp_select_reportes_adelanto()");
$total_reportes = COUNT($reportes);
?>
<div class="card  box-shadow-0">
    <div class="card-header">
        <h4 class="card-title mb-1">Formulario para <?php echo $hash; ?></h4>
        <p class="mb-2">Agrega  los datos basicos de tu registro.</p>
    </div>
    <div class="card-body pt-0">
        <div class="form-horizontal" >
            <div class="form-group">
            <div class="form-group">
                <label for="folio">Folio del reporte</label>
                <select class="form-control" id="folio_adelanto">
                    <option value="">Seleccione una folio</option>
                    <?php if($total_reportes>0){
                        for ($i=0; $i < $total_reportes; $i++) {  
                            $año = explode("-",$reportes[$i]['fecha_accidente']);
                            $id_reportes = sprintf("%03d", $reportes[$i]['id_reporte']);
                            $folio_reporte = $id_reportes.'-'.$año[0];?>
                    <option value="<?php echo $reportes[$i]['id_reporte']?>"><?php echo $folio_reporte?></option>
                        <?php }
                    }?>
                </select>
            </div>
            <label for="adelanto">Cantidad a adelantar</label>
                <input type="text" class="form-control" id="adelanto" placeholder="Adelanto">
            </div>
            <p class="mb-2" id="total_adelantado"></p>
            <div class="form-group mb-0 mt-3 justify-content-end d-flex">
                <div>
                    <a class="btn btn-secondary ms-4" id="cancelar">Cancelar</a>
                    <a class="btn btn-primary" id="submit_form" data-action="agregar_adelanto">Agregar</a>
                </div>
            </div>
        </div>
    </div>
</div>