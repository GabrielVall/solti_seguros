<?php 
function get_directory_size($dir){
    $size = 0;
    
    foreach (glob(rtrim($dir, '/').'/*', GLOB_NOSORT) as $each) {
        $size += is_file($each) ? filesize($each) : folderSize($each);
    }

    return $size;
}
function percentage_of_files($total_bytes, $bytes_used){
    $percentage = ($bytes_used / $total_bytes) * 100;
    $percentage = number_format($percentage, 2);
    return $percentage;
}

function bytes_to_other($bytes){
    if($bytes < 1024){
        return $bytes.' bytes';
    }elseif($bytes < 1048576){
        return round($bytes/1024, 2).' KB';
    }elseif($bytes < 1073741824){
        return round($bytes/1048576, 2).' MB';
    }else{
        return round($bytes/1073741824, 2).' GB';
    }
}

$porcentaje = percentage_of_files(1073741824, get_directory_size('../../../images/*'));

$files_size = bytes_to_other(get_directory_size('../../../images/*'));
?>
<div class="main-container container-fluid">

<div class="breadcrumb-header justify-content-between">
    <div class="left-content">
        <span class="main-content-title mg-b-0 mg-b-lg-1">Administrador de archivos</span>
    </div>
    <div class="justify-content-center mt-2">
        <ol class="breadcrumb">
            <li class="breadcrumb-item tx-15"><a href="javascript:void(0);">Inicio</a></li>
            <li class="breadcrumb-item active" aria-current="page">Archivos</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-4 col-xl-3">
        <div class="card">
            <div class="main-content-left main-content-left-mail card-body">
                <a class="btn btn-primary btn-compose disabled" id="btnCompose" data-bs-target="#Vertically" data-bs-toggle="modal" href=""><i class="fa fa-plus me-2"></i> Crear carpeta</a>
                <div class="main-mail-menu">
                    <nav class="nav main-nav-column">
                        <a class="nav-link thumb active " href="javascript:void(0);"><i class="fe fe-image"></i> Imagenes </a>
                        <a class="nav-link thumb" href="javascript:void(0);"><i class="fe fe-music"></i> Audios</a>
                        <a class="nav-link thumb" href="javascript:void(0);"><i class="fe fe-video"></i> Videos</a>
                        <a class="nav-link thumb" href="javascript:void(0);"><i class="fe fe-trash"></i> Cache</a>
                        <a class="nav-link thumb" href="javascript:void(0);"><i class="fe fe-grid "></i> Otros</a>
                    </nav>
                </div>

                <div class="card custom-card mt-3 pb-0 mb-0">
                    <div class="card-header font-weight-bold"><i class="fe fe-hard-drive me-2"></i>Almacenamiento</div>
                    <div class="card-body pt-0">
                        <div class="progress fileprogress mg-b-10">
                            <div class="progress-bar progress-bar-xs wd-15p" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width:<?php echo $porcentaje; ?>%;"></div>
                        </div>
                        <div class="text-muted font-weight-semibold tx-13 mb-1"><?php echo $files_size; ?> usados de 1GB</div>
                        <div class="tx-13 text-primary font-weight-semibold">Solicitar espacio</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-8 col-xl-9">
        <div class="text-muted mb-2 tx-16">Archivos</div>
            <!-- <div class="row">
                <div class="col-xl-3 col-md-4 col-sm-6">
                    <div class="card p-0 ">
                        <div class="d-flex align-items-center px-3 pt-3">
                            <label class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" name="example-checkbox2" value="option2">
                                <span class="custom-control-label"></span>
                            </label>
                            <div class="float-end ms-auto">
                                <a href="javascript:void(0);" class="option-dots" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fe fe-more-vertical"></i></a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="javascript:void(0);"><i class="fe fe-edit me-2"></i> Edit</a>
                                    <a class="dropdown-item" href="javascript:void(0);"><i class="fe fe-share me-2"></i> Share</a>
                                    <a class="dropdown-item" href="javascript:void(0);"><i class="fe fe-download me-2"></i> Download</a>
                                    <a class="dropdown-item" href="javascript:void(0);"><i class="fe fe-trash me-2"></i> Delete</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body pt-0 text-center">
                        <div class="file-manger-icon">
                                <a href="https://codeigniter.spruko.com/nowa/nowa_demo/file-details">
                                    <img src="https://codeigniter.spruko.com/nowa/nowa_demo/assets/img/files/file.png" alt="img" class="br-7">
                                </a>
                            </div>
                            <h6 class="mb-1 font-weight-semibold">document.pdf</h6>
                            <span class="text-muted">23kb</span>
                        </div>
                    </div>
                </div>
            </div> -->
        </div>
    </div>
</div>
<!-- End Row -->

<div class="modal fade" id="Vertically">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content modal-content-demo">
            <div class="modal-header">
                <h6 class="modal-title">Add file</h6><button aria-label="Close" class="btn-close" data-bs-dismiss="modal" type="button"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <div class="mb-2">
                    <div class="dropify-wrapper" style="height: 212px;"><div class="dropify-message"><span class="file-icon"> <p>Drag and drop a file here or click</p></span><p class="dropify-error">Ooops, something wrong appended.</p></div><div class="dropify-loader"></div><div class="dropify-errors-container"><ul></ul></div><input type="file" class="dropify" data-height="200"><button type="button" class="dropify-clear">Remove</button><div class="dropify-preview"><span class="dropify-render"></span><div class="dropify-infos"><div class="dropify-infos-inner"><p class="dropify-filename"><span class="dropify-filename-inner"></span></p><p class="dropify-infos-message">Drag and drop or click to replace</p></div></div></div></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn ripple btn-primary" type="button">Add</button>
                <button class="btn ripple btn-secondary" data-bs-dismiss="modal" type="button">Cancel</button>
            </div>
        </div>
    </div>
</div>


</div>