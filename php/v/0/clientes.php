<?php 
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$resultado = $sql->obtenerResultado('CALL sp_select_clientes()');
$total_resultado = count($resultado);
?>
<div class="row">
    <div class="col-lg-6 col-xl-6 col-md-12 col-sm-12">
        <div class="card  box-shadow-0">
            <div class="card-header">
                <h4 class="card-title mb-1">Agregar un cliente</h4>
                <p class="mb-2">Agrega  los datos basicos de un nuevo cliente.</p>
            </div>
            <div class="card-body pt-0">
                <div class="form-horizontal" >
                    <div class="form-group">
                        <input type="text" class="form-control" id="nombre" placeholder="Nombre">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="apellido_paterno" placeholder="Apellido Paterno">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="apellido_materno" placeholder="Apellido Materno">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="telefono" placeholder="Telefono">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" id="correo" placeholder="correo">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="direccion" placeholder="Dirección">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="estado" placeholder="Estado">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="ciudad" placeholder="Ciudad">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="fax" placeholder="Fax">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="usuario" placeholder="Contraseña">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pass" placeholder="Contraseña">
                    </div>
                    <div class="form-group mb-0 mt-3 justify-content-end d-flex">
                        <div>
                            <a class="btn btn-secondary ms-4" id="cancelar">Cancelar</a>
                            <a class="btn btn-primary" id="submit_form" data-action="agregar_cliente">Agregar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                                        <td style="display:flex;justify-content:space-around;">
                                            <a href="javascript:void(0);" class="btn btn-primary btn-sm">
                                                <i class="fa fa-eye"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-success btn-sm">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="btn btn-danger btn-sm">
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