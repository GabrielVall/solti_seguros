<?php 
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$resultado = $sql->obtenerResultado('CALL sp_select_clientes()');
$total_resultado = count($resultado);

if ($total_resultado > 0) {
    for($i = 0; $i < $total_resultado; $i++){ ?>
        <tr>
            <th scope="row">#<?php echo $resultado[$i]['id_cliente']; ?></th>
            <td><?php echo $resultado[$i]['nombre']; ?></td>
            <td style="display:flex;justify-content:space-around;" data-id="<?php echo $resultado[$i]['id_cliente']; ?>">
                <a href="javascript:void(0);" class="btn btn-success btn-sm" id="editar_cliente">
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