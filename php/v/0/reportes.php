<?php
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$resultado = $sql->obtenerResultado('CALL sp_select_reportes()');
$total_resultado = count($resultado);
$ciudades = file_get_contents('../../../admin/js/estados-municipios.json');
$ciudades = json_decode($ciudades, true);
function ciudad_name($id){
    global $ciudades;
    foreach($ciudades as $ciudad){
        if($ciudad['id'] == $id){
            return $ciudad['name'];
        }
    }
}
function estado_name($id){
    global $ciudades;
    foreach($ciudades as $ciudad){
        if($ciudad['id'] == $id){
            return $ciudad['state'];
        }
    }
}
?>

<div class="row">
<div class="row d-flex justify-content-between w-100">
    <div class="col-xl-5">
        <div class="col-xl-12 col-lg-12 col-md-12 col-xs-12">
            <div class="card h-100">
                <div class="card-body">
                    <div class="row">
                        <div class="col-xl-9 col-lg-7 col-md-6 col-sm-12">
                            <div class="text-justified align-items-center">
                                <h3 class="text-dark font-weight-semibold mb-2 mt-0">Hola, Bienvenido de vuelta <span class="text-primary">Administrador!</span></h3>
                                <p class="text-dark tx-14 mb-3 lh-3"> Has atendido todos los reportes, te notificaremos cuendo recibas uno nuevo.</p>
                                <button class="btn btn-primary shadow">Ver reportes anteriores</button>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-5 col-md-6 col-sm-12 d-flex align-items-center justify-content-center">
                            <div class="chart-circle float-md-end mt-4 mt-md-0" data-value="0.85" data-thickness="8" data-color=""><canvas width="96" height="96"></canvas><canvas width="100" height="100"></canvas>
                                <div class="chart-circle-value circle-style"><div class="tx-18 font-weight-semibold">100%</div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header pb-0">
                <div class="d-flex justify-content-between">
                    <h4 class="card-title mg-b-0">Ultimos reportes</h4>
                    <a class="btn ripple btn-primary shadow float-end" href="#reportes?modal=agregar_reporte">Agregar reporte</a>
                </div>
                <p class="tx-12 tx-gray-500 mb-2">Estos son los reportes más recientes</p>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped mg-b-0 text-md-nowrap">
                        <thead>
                            <tr>
                                <th>No de reporte</th>
                                <th>Fecha registro</th>
                                <th>Fecha accidente</th>
                                <th>Nombre</th>
                                <th>Apellido paterno</th>
                                <th>Apellido materno</th>
                                <th>Telefono</th>
                                <!-- <th>Reporte</th> -->
                                <th>Ciudad</th>
                                <th>Estado</th>
                                <th>Hora accidente</th>
                                <th>Comentarios</th>
                                <th>Tipo</th>
                                <th>Status</th>
                                <th>Abogado</th>
                                <th>Asistente de abogado</th>
                                <th>Referenciados</th>
                                <th>Informante</th>
                                <th>Numero reporte policial</th>
                                <th>Aseguradora</th>
                                <th>Numero poliza</th>
                                <th>Numero de reclamo</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            foreach($resultado as $reporte){ ?>
                            <tr>
                                <?php echo '<td>'.$reporte[0].'</td>'; ?>
                                <?php echo '<td>'.$reporte[1].'</td>'; ?>
                                <?php echo '<td>'.$reporte[2].'</td>'; ?>
                                <?php echo '<td>'.$reporte[3].'</td>'; ?>
                                <?php echo '<td>'.$reporte[4].'</td>'; ?>
                                <?php echo '<td>'.$reporte[5].'</td>'; ?>
                                <?php echo '<td>'.$reporte[6].'</td>'; ?>
                                
                                <?php echo '<td>'.ciudad_name($reporte[8]).'</td>'; ?>
                                <?php echo '<td>'.estado_name($reporte[8]).'</td>'; ?>
                                <?php echo '<td>'.$reporte[8].'</td>'; ?>
                                <?php echo '<td>'.$reporte[9].'</td>'; ?>
                                <?php echo '<td>'.$reporte[10].'</td>'; ?>
                                <?php echo '<td>'.$reporte[11].'</td>'; ?>
                                <?php echo '<td>'.$reporte[12].'</td>'; ?>
                                <?php echo '<td>'.$reporte[13].'</td>'; ?>
                                <?php echo '<td>'.$reporte[14].'</td>'; ?>
                                <?php echo '<td>'.$reporte[15].'</td>'; ?>
                                <?php echo '<td>'.$reporte[16].'</td>'; ?>
                                <?php echo '<td>'.$reporte[17].'</td>'; ?>
                                <?php echo '<td>'.$reporte[18].'</td>'; ?>
                                <?php echo '<td>'.$reporte[19].'</td>'; ?>
                                <td>
                                    <div class="btn-group">
                                        <a  href="#reportes?modal=ver_reporte[id=<?php echo $reporte[0]; ?>]" class="btn btn-primary btn-sm">
                                            <i class="fa fa-eye"></i>
                                        </a>
                                        <a href="javascript:void(0);" id="eliminar_reporte" data-id="<?php echo $reporte[0]; ?>" class="btn btn-danger btn-sm">
                                            <i class="fa fa-trash"></i>
                                        </a>
                                    </div>
                            </td></tr>
                           <?php } ?>
                        </tbody>
                    </table>
                    <!-- <div class="not-found-items">
                        <script src="https://cdn.lordicon.com/xdjxvujz.js"></script>
                        <div class="w-100">
                            <lord-icon
                                src="https://cdn.lordicon.com/lupuorrc.json"
                                trigger="loop"
                                style="width:150px;height:150px">
                            </lord-icon>
                        </div>
                        <h3 class="w-100">¡Hurra!, No hay reportes pendientes.</h3>
                    </div> -->
                </div>
                <!-- bd -->
            </div>
            <!-- bd -->
        </div>
        <!-- bd -->
    </div>
</div>