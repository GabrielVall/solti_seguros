<?php
session_start();
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();

switch ($_SESSION['hash']) {
    case 'clientes':
        $tabla = 'cliente';
        break;
    case 'abogados':
        $tabla = 'abogado';
    break;
    case 'asistentes':
        $tabla = 'asistente';
    break;
    case 'adelantos':
        $tabla = 'adelanto';
    break;
}
$slash = $_SERVER['REQUEST_URI'];
$slash = substr($slash, strrpos($slash, '/') + 1);
// if includes clientes
// if($slash == 'adelantos.php' || $slash == 'editar_adelantos.php'){
//     $hidden = array(
//         'fax' => true,
//         'usuario' => true,
//     );
// }
$adelanto = $sql->obtenerResultado("CALL sp_select_".$tabla."('".$_POST['id']."')");
$reportes = $sql->obtenerResultado("CALL sp_select_reportes_adelanto()");
$total_reportes = COUNT($reportes);
?>
<div class="card  box-shadow-0">
    <div class="card-header">
        <h4 class="card-title mb-1">Editar adelanto</h4>
        <p class="mb-2">Edita los datos de un adelanto.</p>
    </div>
    <div class="card-body pt-0">
        <div class="form-horizontal" >
        <div class="form-group">
                <label for="folio">Folio del reporte</label>
                <select class="form-control" id="folio_adelanto">
                    <option value="">Seleccione una folio</option>
                    <?php if($total_reportes>0){
                        for ($i=0; $i < $total_reportes; $i++) {  
                            $año = explode("-",$reportes[$i]['fecha_accidente']);
                            $id_reportes = sprintf("%03d", $reportes[$i]['id_reporte']);
                            $folio_reporte = $id_reportes.'-'.$año[0];?>
                    <option <?php if($reportes[$i]['id_reporte']==$adelanto[0]['id_reporte']){ echo 'selected';}?> value="<?php echo $reportes[$i]['id_reporte']?>"><?php echo $folio_reporte?></option>
                        <?php }
                    }?>
                </select>
            </div>
            <label for="adelanto">Cantidad a adelantar</label>
                <input type="text" class="form-control" id="adelanto" value="<?php echo $adelanto[0]['dinero_adelantado']?>" placeholder="Adelanto">
            </div>
            <p class="mb-2" id="total_adelantado"></p>
            <div class="form-group mb-0 mt-3 justify-content-end d-flex">
                <div>
                    <a class="btn btn-secondary ms-4" id="cancelar_editar_adelanto">Cancelar</a>
                    <a class="btn btn-primary" id="editar_adelanto_form" data-id="<?php echo $_POST['id']; ?>">Agregar</a>
                </div>
            </div>
        </div>
    </div>
</div>
