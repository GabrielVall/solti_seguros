<?php 
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$resultado = $sql->obtenerResultado('CALL sp_select_clientes()');
$total_resultado = count($resultado);
?>
<div class="row">
    <div class="col-lg-6 col-xl-6 col-md-12 col-sm-12" id="form_cliente_content">
        <?php include('../../v/0/form_clientes.php'); ?>
    </div>
    <div class="col-lg-6 col-xl-6 col-md-12 col-sm-12">
        <div class="card">
            <div class="card-header pb-0">
                <div class="d-flex justify-content-between">
                    <h4 class="card-title mg-b-0">Registros</h4>
                </div>
                <p class="tx-12 tx-gray-500 mb-2">Mostrando resultados </p>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped mg-b-0 text-md-nowrap">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
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
                        </tbody>
                    </table>
                </div>
                <!-- bd -->
            </div>
            <!-- bd -->
        </div>
        <!-- bd -->
    </div>
    </div>