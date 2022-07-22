<?php
if(session_status() == PHP_SESSION_NONE){
    session_start();
}
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$resultado = $sql->obtenerResultado('CALL sp_select_'.$_SESSION['hash'].'()');
$total_resultado = count($resultado);

if ($total_resultado > 0) {
    for($i = 0; $i < $total_resultado; $i++){ 
        $año = explode("-",$resultado[$i]['fecha_accidente']);
        $id_reportes = sprintf("%03d", $resultado[$i]['id_reporte']);
        $folio_reporte = $id_reportes.'-'.$año[0];?>
        <tr>
            <th scope="row">#<?php echo $resultado[$i][0]; ?></th>
            <td><?php echo $folio_reporte?></td>
            <td>$ <?php echo $resultado[$i]['dinero_adelantado']; ?></td>
            <td style="display:flex;justify-content:space-around;" data-id="<?php echo $resultado[$i][0]; ?>">
                <a href="javascript:void(0);" class="btn btn-success btn-sm" id="editar_adelanto">
                    <i class="fa fa-edit"></i>
                </a>
                <a href="javascript:void(0);" class="btn btn-danger btn-sm" id="eliminar_registro">
                    <i class="fa fa-trash"></i>
                </a>
            </td>
        </tr>      
    <?php }   
}else{ ?>
    <tr class="text-center" > <td colspan="4">No se encontraron registros</td> </tr>
<?php }
?>