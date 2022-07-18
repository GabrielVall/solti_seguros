<?php 
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
function folderSize($dir){
    $size = 0;
    
    foreach (glob(rtrim($dir, '/').'/*', GLOB_NOSORT) as $each) {
        $size += is_file($each) ? filesize($each) : folderSize($each);
    }

    return $size;
}
if(!isset($_POST['folder'])){
    $tipo = 'carpetas';
}else{
    $tipo = $_POST['folder'];
}
if($tipo != 'carpetas'){
    $folder = $tipo;
    // print each file name
        $files = scandir('../../../images/'.$folder);
        foreach($files as $file){
            if($file != "." && $file != ".."){
                // get file extension
                $ext = pathinfo($file, PATHINFO_EXTENSION);
                // if file is folder
                if(is_dir('../../../images/'.$folder.'/'.$file)){
                    $ext = 'folder';
                    // get size from all files in folder
                    $size = folderSize('../../../images/'.$folder.'/'.$file);
                    $size = bytes_to_other($size);
                    $ref = $folder.'/'.$file;
                    $file = 'Folio #'.$file;
                }else{
                    // size from this file
                    $size = filesize('../../../images/'.$folder.'/'.$file);
                    $size = bytes_to_other($size);
                    $ref = 0;
                }
                switch($ext){
                    case 'jpg':
                    case 'jpeg':
                    case 'png':
                    case 'gif':
                        $img = '../images/'.$folder.'/'.$file;
                        break;
                    case 'folder':
                        $img = '../img/folder.png';
                    break;
                    default:
                        $img = '../img/documents.png';
                    break;
                }
                ?>
                <div class="col-xl-3 col-md-4 col-sm-6">
                    <div class="card p-0 ">
                        <div class="d-flex align-items-center px-3 pt-3">
                            <label class="custom-control custom-checkbox">
                                <span class="custom-control-label"></span>
                            </label>
                            <div class="float-end ms-auto">
                                <a href="javascript:void(0);" class="option-dots" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fe fe-more-vertical"></i></a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="javascript:void(0);"><i class="fe fe-download me-2"></i> Descargar</a>
                                    <a class="dropdown-item" href="javascript:void(0);"><i class="fe fe-trash me-2"></i> Borrar</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body pt-0 text-center">
                            <div class="file-manger-icon">
                                <a id="mover_carpeta" 
                                <?php if($ref !== 0){ ?>
                                data-folder="<?php echo $ref; ?>" 
                                <?php } ?>
                                href="javascript:void(0)">
                                    <img src="<?php echo $img; ?>"
                                    <?php if($ref !== 0){ ?>
                                    folder
                                    <?php } ?>
                                    alt="img"  class="br-7">
                                </a>
                            </div>
                            <h6 class="mb-1 font-weight-semibold"><?php echo $file ?></h6>
                            <span class="text-muted"><?php echo $size; ?></span>
                        </div>
                    </div>
                </div>
                <?php
            }
        }
}else{ ?>
    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
            <div class="card primary-custom-card1">
                <div class="card-body">
                    <div class="row align-items-center justify-content-around d-flex">
                        <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 ">
                                <img class="img-fluid" src="../img/empty-folder.png" style="object-fit:cover;max-width: 200px;max-height: 200px" alt="">
                        </div>
                        <div class="col-xl-8 col-lg-6 col-md-12 col-sm-12">
                            <div class="text-justified align-items-center">
                                <h2 class="text-dark font-weight-semibold mb-3 mt-2">Selecciona una carpeta para <span class="text-primary">ver los archivos</span></h2>
                                <p class="text-dark tx-17 mb-2 lh-3"> El espacio de almacenamiento marcado tienes es 100% tuyo y no es ocupado por <span class="text-primary"> ningún archivo del proyecto.</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <?php
}
?>