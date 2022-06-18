<div class="row">
    <div class="col-lg-6 col-xl-6 col-md-12 col-sm-12" id="form_aseguradora_content">
        <?php include('../../v/0/form_aseguradoras.php'); ?>
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
                        <tbody id="tabla_consulta">
                        <?php include('../../v/0/tabla_aseguradoras.php'); ?>
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