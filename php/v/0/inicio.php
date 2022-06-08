<?php 
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$resultado = $sql->obtenerResultado('CALL sp_select_reportes()');
$total_resultado = count($resultado);
?>
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
<div class="col-xl-9">
    <div class="card">
        <div class="card-header pb-0">
            <div class="d-flex justify-content-between">
                <h4 class="card-title mg-b-0">Ultimos reportes</h4>
            </div>
            <p class="tx-12 tx-gray-500 mb-2">Estos son los reportes más recientes</p>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-striped mg-b-0 text-md-nowrap">
                    <thead>
                        <tr>
                            <th>Id Reporte</th>
                            <th>Fecha Reporte</th>
                            <th>Fecha Accidente</th>
                            <th>Hora</th>
                            <th>Cliente</th>
                            <th>Ubicación</th>
                            <th>Comentarios</th>
                            <th>Referenciado</th>
                            <th>Tipo</th>
                            <th>Estado</th>
                            <th>Abogado</th>
                            <th>Asistente</th>
                            <th>No. Poliza</th>
                            <th>Aseguradora</th>
                            <th>Reporte policia</th>
                            <th>Número de reclamo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#9230</td>
                            <td>12/12/2019</td>
                            <td>12/12/2019</td>
                            <td>12:00</td>
                            <td>Juan Perez</td>
                            <td>Piedras Negras Coahuila</td>
                            <td>Sin comentarios</td>
                            <td>Calle / Oficina</td>
                            <td>Comercial</td>
                            <td>Pendiente</td>
                            <td>Juan Perez</td>
                            <td>Juan Perez</td>
                            <td>#123456789</td>
                            <td>Aseguradora Default</td>
                            <td>#1497821</td>
                            <td>#1234567</td>
                            <td>
                                <div class="btn-group">
                                    <a href="javascript:void(0);" class="btn btn-primary btn-sm">
                                        <i class="fa fa-eye"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-success btn-sm">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-danger btn-sm">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                </div>
                        </tr>
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
<div class="col-xl-3">
    <div class="card">
        <div class="card-header pb-3">
            <h3 class="card-title mb-2">Tareas pendientes</h3>
        </div>
        <div class="card-body p-0 customers mt-1">
            <div class="">
                
                <label class="p-2 mt-2 d-flex">
                    <span class="check-box mb-0 ms-2">
                        <span class="ckbox"><input type="checkbox"><span></span></span>
                    </span>
                    <span class="mx-3 my-auto">
                        Hay 1 reportes pendientes.
                    </span>
                    <span class="ms-auto"><span class="badge badge-primary font-weight-semibold px-2 py-1 tx-11 me-2 float-end">Hoy</span></span>
                </label>
                <label class="p-2 mt-2 d-flex">
                    <span class="check-box mb-0 ms-2">
                        <span class="ckbox"><input checked type="checkbox"><span></span></span>
                    </span>
                    <span class="mx-3 my-auto">
                        Se terminó el reporte #9230.
                    </span>
                    <span class="ms-auto"> <span class="badge badge-light-transparent font-weight-semibold px-2 py-1 tx-11 me-2">1 Day</span></span>
                </label>
                <label class="p-2 mt-2 d-flex">
                    <span class="check-box mb-0 ms-2">
                        <span class="ckbox"><input checked="" type="checkbox"><span></span></span>
                    </span>
                    <span class="mx-3 my-auto">
                        Se termino el reporte #9229.
                    </span>
                    <span class="ms-auto"> <span class="badge badge-light-transparent font-weight-semibold px-2 py-1 tx-11 me-2">2 Days</span></span>
                </label>
            </div>
        </div>
    </div>
</div>