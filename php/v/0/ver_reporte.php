<?php 
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$reporte = $sql->obtenerResultado('CALL sp_select_reporte("'.$_POST['id'].'")');
$total_reporte = count($reporte);
$cliente = $sql->obtenerResultado('CALL sp_select_cliente("'.$reporte[0]['id_cliente'].'")');
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
    <div class="modal-header">
        <h6 class="modal-title">Detalles del reporte #<?php echo $_POST['id']; ?></h6><button aria-label="Close" class="btn-close" data-bs-dismiss="modal" type="button"><span aria-hidden="true">×</span></button>
    </div>
    <div class="modal-body" style="margin: 0;padding: 0;">
    <div class="card custom-card" style="margin-bottom:0px;">
        <div class="card-body">
            <div class="d-lg-flex">
                <h6 class="main-content-label mb-1"><span class="d-flex mb-4"><a href="#"><img src="logo2_white.png" class="sign-favicon ht-40" alt="logo"></a></span></h6>
                <div class="ms-auto">
                    <p class="mb-1"><span class="font-weight-bold">Folio: <?php echo $_POST['id']; ?></span></p>
                </div>
            </div>
            <div class="row row-sm">
                <div class="col-lg-6 ">
                    <p class="h3">Datos del reporte:</p>
                    <address>
                        Fecha reporte: <?php echo $reporte[0]['fecha_reporte']; ?><br>
                        Ubicación: <?php echo ciudad_name($reporte[0]['id_ciudad']); ?>, <?php echo estado_name($reporte[0]['id_ciudad']); ?><br>
                        Abogado acargo: <?php echo $reporte[0]['nombre_abogado'] ?><br>
                        Asistente: <?php echo $reporte[0]['nombre_asistente'] ?><br>
                        Referenciado: <?php echo $reporte[0]['referenciado'] ?><br>
                        
                        Reclamo: <?php echo $reporte[0]['numero_reclamo'] ?><br>
                    </address>
                    <div class="">
                        <p class="mb-1"><span class="font-weight-bold">Fecha del reporte:</span></p>
                            <address>
                            <?php echo $reporte[0]['fecha_reporte']; ?>
                            </address>
                    </div>
                </div>
                <div class="col-lg-6 text-end">
                    <p class="h3">Datos cliente:</p>
                    <address>
                        Street Address<br>
                        <?php echo $cliente[0]['nombre']; ?> <?php echo $cliente[0]['apellido_paterno']; ?>  <?php echo $cliente[0]['apellido_materno']; ?><br>
                        Tipo: <?php echo $reporte[0]['tipo'] ?><br>
                        Aseguradora: <?php echo $reporte[0]['nombre_aseguradora'] ?><br>
                        Telefono:<?php echo $cliente[0]['telefono'] ?><br>
                        Reporte policial: <?php echo $reporte[0]['reporte_policia'] ?><br>
                        
                    </address>
                    <div class="">
                        <p class="mb-1"><span class="font-weight-bold">Fecha del accidente:</span></p>
                            <address>
                            <?php echo $reporte[0]['fecha_accidente']; ?> <?php echo $reporte[0]['hora_accidente']; ?>
                            </address>
                    </div>
                </div>
                
            </div>
            <div class="table-responsive mg-t-40">
                <table class="table table-invoice table-bordered">
                    <thead>
                        <tr>
                            <th class="wd-20p">Folio adelanto</th>
                            <th class="wd-40p">Fecha</th>
                            <th class="tx-center">Descripción</th>
                            <th class="tx-right">Cambio</th>
                            <th class="tx-right">Cargo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#2022982</td>
                            <td class="tx-12">16 de agosto del 2022</td>
                            <td class="tx-center">Compra de equipo medico</td>
                            <td class="tx-right">USD</td>
                            <td class="tx-right">$1200.00</td>
                        </tr>
                        <tr>
                            <td>#2022986</td>
                            <td class="tx-12">18 de agosto del 2022</td>
                            <td class="tx-center">Gastos de movilidad</td>
                            <td class="tx-right">USD</td>
                            <td class="tx-right">$400.00</td>
                        </tr>
                        <tr>
                            <td>#2022989</td>
                            <td class="tx-12">20 de agosto del 2022</td>
                            <td class="tx-center">Gastos hospital privado</td>
                            <td class="tx-right">USD</td>
                            <td class="tx-right">$5200.00</td>
                        </tr>
                        <tr>
                            <td class="valign-middle" colspan="2" rowspan="4">
                                <div class="invoice-notes">
                                    <label class="main-content-label tx-13">Comentarios del reporte</label>
                                    <p>Los incidentes ocurrieron el lunes pasado en el museo de arte moderno. Como cualquier día, todos los empleados se retiraron del museo a las siete y media y a las ocho el guardia de seguridad cerró las puertas.
                                    Según contaron los testigos, a las nueve vieron salir a un hombre que llevaba un objeto con forma rectangular y que se subió a un auto, que estaba enfrente del museo. Se cree que el hombre ingresó al museo después de que este cerrara, pero también cabe la posibilidad de que el hombre haya entrado antes del cierre.
                                    </p>
                                </div>
                                <!-- invoice-notes -->
                            </td>
                            <td class="tx-right">Total de aseguranza</td>
                            <td class="tx-right" colspan="2">$100,000.00</td>
                        </tr>
                        <tr>
                            <td class="tx-right">Comsión lawfirm (40%)</td>
                            <td class="tx-right" colspan="2">$40,000.00</td>
                        </tr>
                        <tr>
                            <td class="tx-right">Total adelantos</td>
                            <td class="tx-right" colspan="2">$6,800.00</td>
                        </tr>
                        <tr>
                            <td class="tx-right tx-uppercase tx-bold tx-inverse">Entregado al cliente</td>
                            <td class="tx-right" colspan="2">
                                <h4 class="tx-bold">$53,200.00</h4>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="card-footer text-end">
            <button type="button" class="btn ripple btn-primary mb-1"><i class="fe fe-credit-card me-1"></i> Marcar como terminada</button>
            <button type="button" class="btn ripple btn-secondary mb-1"><i class="fe fe-send me-1"></i> Enviar reporte</button>
            <button type="button" class="btn ripple btn-info mb-1" onclick="javascript:window.print();"><i class="fe fe-printer me-1"></i> Imprimir Invoice</button>
        </div>
    </div>
    </div>
