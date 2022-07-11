<?php 
include_once('../../m/SQLConexion.php');
$sql = new SQLConexion();
$reporte = $sql->obtenerResultado('CALL sp_select_reporte("'.$_POST['id'].'")');
// force num to 8 zeros
$_POST['id'] = sprintf("%08d", $_POST['id']);
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
$nombre_c = $cliente[0]['nombre'];
$id_c = $_POST['id'];
$mensaje = "
¡Hola {$nombre_c}!, el reporte fue aceptado y esta siendo procesado ahora mismo, si tienes alguna duda puedes contactarnos desde http://lawfirmgloria.com/ y te atenderemos rápidamente.
Seras informado por este medio cada que tengamos más información sobre tu reporte.
Folio num.: {$id_c}.
";
// transform $mensaje into url string
$mensaje = urlencode($mensaje);
$tel_cliente = $cliente[0]['telefono'];
$ref = "https://api.whatsapp.com/send?phone={$tel_cliente}&text={$mensaje}";
?>
    <div class="modal-header">
        <h6 class="modal-title">Detalles del reporte #<?php echo $_POST['id']; ?></h6><button aria-label="Close" class="btn-close" data-bs-dismiss="modal" type="button"><span aria-hidden="true">×</span></button>
    </div>
    <div class="modal-body" style="margin: 0;padding: 0;">
    <div class="card custom-card" style="margin-bottom:0px;">
        <div class="card-body" id="contenedor_reporte">
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
            <a href="<?php echo $ref ?>" target="_blank" type="button" class="btn ripple btn-primary mb-1">
            <svg xmlns="http://www.w3.org/2000/svg" style="fill:white; width:15px;" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7.9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg>
             Enviar WhatsApp</a>
            <!-- <button type="button" class="btn ripple btn-secondary mb-1"><i class="fe fe-send me-1"></i> Enviar reporte</button> -->
            <button type="button" class="btn ripple btn-info mb-1" id="print_div" data-div="contenedor_reporte"><i class="fe fe-printer me-1"></i> Imprimir </button>
        </div>
    </div>
    </div>
