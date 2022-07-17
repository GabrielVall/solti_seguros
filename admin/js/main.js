// Al cargar
var hash = '';
var estados = [];
$(document).ready(function() {
    $(document).on('click', '#cerrar_sesion', function() {
        $.ajax({
            type: 'POST',
            url: '../php/c/0/cerrar_sesion.php',
            success: function() {
                location.reload();
            }
        });
    });
    cambiar_hash();
    $(document).ajaxStart(function() {
        NProgress.start();
        NProgress.set(0.4);
    });
    $(document).ajaxComplete(function() {
        NProgress.done();
    });
    // Al cambiar el hash
    $(window).on('hashchange', function() {
        cambiar_hash();
    });
    $(document).on('click', '.btn-close', function(e) {
        // get hash
        var hash = window.location.hash;
        // remove text after ?
        hash = hash.split('?')[0];
        window.location.hash = hash;
    });
    function cambiar_hash(){
        hash = window.location.hash;
        hash = hash.substring(1);
        // delete string after [
        hash = hash.split('[')[0];
        // if contains ?
        if(hash.indexOf('?') != -1){
            get_search_params();
        }else{
            // hide any modal
            $('.modal').modal('hide');
        }
        // if hash has ?
        if(hash.indexOf('?') != -1){
        // remove text after ?
        hash = hash.split('?')[0];
        }
        if(hash == ''){
            window.location.hash = '#reportes';
        }else{
            $('[href]').removeClass('active');
            $('[href="#'+hash+'"]').addClass('active');
            $.ajax({
                url: '../php/v/0/'+hash+'.php',
                success: function(data){
                    $('#contenido').html(data);
                    cargar_funciones_hash();
                },error: function(data){
                    window.location.hash = 'error';
                    // Scroll bottom
                    $('html, body').animate({
                        scrollTop: $(document).height()
                    }, 100);
                }
            });
        }
    }
    $(document).on('click', '#eliminar_reporte', function(e) {
        var id = $(this).data('id');
        alertify.confirm('Alerta', '¿Estas seguro de realizar esta acción?, ¡esto no podra deshacerse!.', function(){
            $.ajax({
                type: 'POST',
                url: '../php/c/0/eliminar_reporte.php',
                data: {id: id},
                success: function(data) {
                    alertify.set('notifier','position', 'top-right');
                    alertify.success('Registro eliminado');
                    if(window.location.hash = 'reportes[]'){
                    window.location.hash = 'reportes';
                    }else{
                        window.location.hash = 'reportes[]';
                    }
                }
            });
        }, function(){
            alertify.error('Acción cancelada');
        });
        
    });
    var uploaded_files = [];
    $(document).on('change','[type="file"]',function(e){
        var formData = new FormData();
        // append each file to the formdata object
        var files = e.target.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            formData.append('file_'+i, file, file.name);
        }
        $.ajax({
            type: 'POST',
            url: '../php/c/0/temporal_files.php',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function() {
                $(e.target).parent().append(`<div id="spin_reporte" class="row mt-4 justify-content-center d-flex"><div class="spinner-border text-success" role="status"><span class="sr-only">Cargando imagene(s)...</span></div></div>`);
                $(e.target).prop('disabled', true);
            },
            success: function(data) {
                data = JSON.parse(data);
                if(data.status == 'success'){
                    // push to array
                    uploaded_files.push(data.files);
                    // solve arrays
                    uploaded_files = uploaded_files.flat();

                }
                $(e.target).prop('disabled', false);
                $('#spin_reporte').remove();
                mostrar_archivos(uploaded_files);
            }
        });
    });
    function mostrar_archivos(uploaded_files){
        
        var div = '<div class="row ">';
        var total_files = uploaded_files.length;
        for(var i = 0; i < total_files; i++){
            var name = uploaded_files[i].name;
            var x = $('[data-name="'+name+'"]');
            if(x.length == 0){
                var location = uploaded_files[i].location;
                var size = bytes_to_megabytes(uploaded_files[i].size);
                var og_name = uploaded_files[i].og_name;
                div += `
                <div class="col-12">
                    <div class="card"  style="background-color:#3b3b3b !important;">
                        <a href="javascript:void(0)">
                            <div class="card-body ">
                                <div class="tx-16 mb-1">
                                    <svg class="file-manager-icon me-2" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24"><path fill="#fbb8c7" d="M18.12158,11.88672c-1.18039-1.14226-3.05327-1.14485-4.23681-0.00586l-1.58985,1.58008c-0.39155,0.38922-0.39343,1.02216-0.00421,1.41371c0.00043,0.00043,0.00085,0.00086,0.00128,0.00129l4.67481,4.68457L17.14148,20H19c1.65611-0.00181,2.99819-1.34389,3-3v-0.83008c-0.00009-0.26567-0.10585-0.52039-0.29395-0.708L18.12158,11.88672z"></path><path fill="#f74f75" d="M5,20h14c0.355-0.00278,0.70662-0.06923,1.03815-0.19617l-9.91657-9.91711C8.94094,8.74376,7.06706,8.74161,5.88379,9.88184L2.294,13.46191c-0.18812,0.1876-0.2939,0.44232-0.294,0.708V17C2.00181,18.65611,3.34389,19.99819,5,20z"></path><path fill="#fa95ac" d="M19,4H5C3.34387,4.00183,2.00183,5.34387,2,7v7.16992c0.00012-0.26569,0.1059-0.52039,0.29401-0.70801l3.58978-3.58008c1.18329-1.14026,3.05713-1.13806,4.23779,0.00488l2.87585,2.87604l0.88733-0.8819c1.18353-1.13898,3.05646-1.13641,4.23682,0.00586l3.58447,3.5752c0.18811,0.18762,0.29388,0.44232,0.29395,0.70801V7C21.99817,5.34387,20.65613,4.00183,19,4z"></path></svg>
                                    ${og_name}
                                    <div class="float-end tx-13 text-muted mt-1">
                                    ${size} 
                                    <a id="borrar_archivo" data-name="${name}" href="javascript:void(0);"><i class="fe fe-trash me-2"></i> Borrar</a>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>`;
            }
        }
        div += '</div>';
        $('#archivos').parent().parent().append(div);
    }
    function bytes_to_megabytes(bytes){
        if(bytes < 1024){
            return bytes + ' bytes';
        }
        if(bytes < 1048576){
            return (bytes/1024).toFixed(2) + ' kb';
        }
        if(bytes < 1073741824){
            return (bytes/1048576).toFixed(2) + ' mb';
        }
        return (bytes/1073741824).toFixed(2) + ' gb';
    }
    $(document).on('click','#borrar_archivo',function(e){
        alertify.confirm('Alerta', '¿Estas seguro de realizar esta acción?, ¡Esto no podra deshacerse!.', function(){
        var nombre = $(e.target).data('name');
        $.ajax({
            type: 'POST',
            url: '../php/c/0/borrar_temp.php',
            data: { nombre: nombre },
            beforeSend: function() {
                $(e.target).parent().parent().parent().parent().remove();
            },
            success: function(data) {
                data = JSON.parse(data);
                if(data.status == 'success'){
                    // remove from array
                    uploaded_files = uploaded_files.filter(function(item){
                        return item.name != $(e.target).data('name');
                    });
                    // solve arrays
                    uploaded_files = uploaded_files.flat();
                    mostrar_archivos(uploaded_files);
                }
            }
        });
        }, function(){
        });
    });
    function cargar_fechas(){
        flatpickr("[type='date']", {
            locale: {
                firstDayOfWeek: 1,
                weekdays: {
                  shorthand: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
                  longhand: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],         
                }, 
                months: {
                  shorthand: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Оct', 'Nov', 'Dic'],
                  longhand: ['Enero', 'Febreo', 'Мarzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                },
              },
        });
        flatpickr("[type='time']", {
            enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
            locale: {
                firstDayOfWeek: 1,
                weekdays: {
                  shorthand: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
                  longhand: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],         
                }, 
                months: {
                  shorthand: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Оct', 'Nov', 'Dic'],
                  longhand: ['Enero', 'Febreo', 'Мarzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                },
              },
        });
    }
    function get_search_params(url){
        //get string after ?
        var url = hash;
        var url = url.split('?');
        var url = url[1];
        // if contains modal
        if(url.indexOf('modal') != -1){
            // get text after = 
            var url = url.split('=');
            var url = url[1];
            show_modal(url);
        }
    }
    function show_modal(file){
        var info = window.location.hash;
        // remove text begore [
            // if string has [
        if(info.indexOf('[') != -1){
        info = info.split('[')[1];
        }
        // if string has ]
        if(info.indexOf(']') != -1){
        // remove ] from string
        info = info.split(']')[0];
        }
        // data to post
        $.ajax({
            url: '../php/v/0/'+file+'.php',
            type: 'POST',
            data: info,
            success: function(data){
                $('#modaldemo3').find('.modal-content').html(data);
                $('#modaldemo3').modal('show');
                setTimeout(function(){
                    cargar_fechas();
                },500);
            }
        });
    }
    function cargar_funciones_hash(){
        cargar_estados_selects();
        append_button_usuario();
        append_button_pass();
        cargar_tablas();
        cargar_selects();
    }
    
    function cargar_estados_selects(){
        $.ajax({
            url: 'js/estados-municipios.json',
            success: function(data){
                estados = data;
                // Ceate options for selects
                var options = '';
                
                for(var i in data){
                    options += '<option value="'+data[i].id+'">'+data[i].name+'</option>';
                }
                // Append options to selects
                $('#ciudad').append(options);
            }
        });
    }
    // $.ajax({url: 'js/estados-municipios.json',success: function(data){
    //     var cities = [];
    //     estados = data;
    //     var n = 0;
    //     var citi_id = 0;
    //     for(var i in data){
    //         n++;
    //         console.log(n,i);
    //         for(var j in data[i]){
    //             citi_id++;
    //             cities.push({id: citi_id, name: estados[i][j], state_id: n});
                // console.log(citi_id,estados[i][j]);
    //         }
    //     }
    //     console.log(cities);
    // }});
    // $(document).on('change', '#estado', function(){
        // Text for select
    //     var text = $(this).find('option:selected').text();
    //     var options = '';
    //     var n = 0;
    //     var length = estados[text].length;
    //     for( var i = 0; i < length; i++){
    //         n++;
    //         console.log(estados[text][i]);
    //         options += '<option value="'+n+'">'+estados[text][i]+'</option>';
    //     }
    //     $('#ciudad').html(options);
    // });
    function cargar_tablas(){
        $('table').DataTable({
            language: {
                "decimal": "",
                "emptyTable": "No hay información",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ Entradas",
                "loadingRecords": "Cargando...",
                "processing": "Procesando...",
                "search": "Buscar:",
                "zeroRecords": "Sin resultados encontrados",
                "paginate": {
                    "first": "Primero",
                    "last": "Ultimo",
                    "next": "Siguiente",
                    "previous": "Anterior"
                }
            }
        });
    }
    function cargar_selects(){
        $('select').select2({
			placeholder: 'Escoger una opción',
			searchInputPlaceholder: 'Buscar..',
            "language": {
                "noResults": function(){
                    return "No se encontraron resultados";
                }
            },
		});
    }
    function append_button_usuario(){
        var btn = `
        <button type="button" class="btn btn-light btn-sm mb-1 button_input" id="generar_usuario">
            <i class="mdi mdi-account-convert" data-bs-toggle="tooltip" title="" data-bs-original-title="mdi-account-convert" aria-label="mdi-account-convert"></i>
        </button>
        `;
        $('[for="usuario"]').append(btn);
    }
    function append_button_pass(){
        var btn = `
        <button type="button" class="btn btn-light btn-sm mb-1 button_input" id="generar_pass">
            <i class="mdi mdi-key" data-bs-toggle="tooltip" title="" data-bs-original-title="mdi-key" aria-label="mdi-key"></i>
        </button>
        <button type="button" class="btn btn-primary btn-sm mb-1 button_input" id="copiar_pass"  style="padding-top:5px !important;" >
            <i class="si si-docs" data-bs-toggle="tooltip" title="" data-bs-original-title="si-docs" aria-label="si-docs"></i>
        </button>
        `;
        $('[for="pass"]').append(btn);
    }
    $(document).on('click', '#generar_usuario', function(e){
        generar_usuario();
    });
    $(document).on('click', '#generar_pass', function(e){
        $('#pass').val(generar_pass());
    });
    $(document).on('click', '#copiar_pass', function(e){
          /* Get the text field */
        var copyText = document.getElementById("pass");

        /* Select the text field */
        copyText.select();
        copyText.setSelectionRange(0, 99999); /* For mobile devices */

        /* Copy the text inside the text field */
        navigator.clipboard.writeText(copyText.value);

        /* Alert the copied text */
        alertify.success('Copiado al portapapeles: ' + copyText.value);
    });
    function generar_pass(){
        var length = 8,
        charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
        retVal = "";
        for (var i = 0, n = charset.length; i < length; ++i) {
            retVal += charset.charAt(Math.floor(Math.random() * n));
        }
        return retVal;
    }
    // On focus
    $(document).on('focus', '#usuario', function(e){
        generar_usuario();
    });

    function generar_usuario(){
        // Creamos un usuario aleatorio en base al nombre y apellido
        var nombre = $('#nombre').val();
        var apellido = $('#apellido_paterno').val();
        if(nombre == '' || apellido == ''){
            alertify.notify('Debe ingresar los datos del usuario');
            return;
        }
        // if random 1,2
        var random = Math.floor(Math.random() * 2) + 1;
        if(random == 1){
            var usuario = nombre.substring(0,1)+'_'+apellido;
        }else{
            var usuario = apellido.substring(0,2)+'_'+nombre;
        }
        var usuario = usuario.toLowerCase();
        // Momento actual
        var momento = new Date();
        var momento = momento.getTime();
        // Ultimos 2 caracteres
        var ultimos_2 = momento.toString().substring(momento.toString().length-2);
        // Primeros 2 caracteres
        var primeros_2 = momento.toString().substring(0,2);
        // Generamos el usuario
        var usuario = usuario+ultimos_2+primeros_2;
        $('#usuario').val(usuario);
    }
    $(document).on('click','#submit_form', function(e){
        // get all inputs of the form
        var inputs = $('.form-horizontal:not(.ignore)').find(':input');
        // add in form data
        var form_data = new FormData();
        for(var i=0; i<inputs.length; i++){
            form_data.append(inputs[i].id, inputs[i].value);
        }
        $.ajax({
            url: '../php/c/0/'+$(e.target).data('action')+'.php',
            type: 'POST',
            processData: false,
            contentType: false,
            data: form_data,
            success: function(data){
                data = JSON.parse(data);
                if(data.status == 'success'){
                    vaciar_inputs();
                    imprimir_vista('#tabla_consulta','tabla_'+hash+'.php',0);
                    alertify.set('notifier','position', 'top-right');
                    alertify.success('Registro agregado correctamente');
                }
            }
        });
    });

    $(document).on('click','#cancelar', function(e){
        vaciar_inputs();
    });

    function vaciar_inputs(){
        $('body').find(':input').each(function(){
            $(this).val('');
        });
    }

    $(document).on('click','#cancelar_editar_cliente', function(e){
        imprimir_vista('#form_cliente_content','form_clientes.php',0);
    });

    $(document).on('click','#cancelar_editar_aseguradora', function(e){
        imprimir_vista('#form_aseguradora_content','form_proveedores.php',0);
    });

    $(document).on('click','#cancelar_editar_especialidad', function(e){
        imprimir_vista('#form_cliente_content','form_especialidades.php',0);
    });

    $(document).on('click', '#eliminar_registro', function(e){
        alertify.confirm('Alerta', '¿Estas seguro de realizar esta acción?, ¡esto no podra deshacerse!.', function(){
            var id_cliente = $(e.target).parent().data('id');
            $.ajax({
                url: '../php/c/0/eliminar_cliente.php',
                type: 'POST',
                data: {id_cliente: id_cliente},
                success: function(data){
                    data = JSON.parse(data);
                    if(data.status == 'success'){
                        $(e.target).parent().parent().remove();
                    }
                }
            });
        }, function(){
            alertify.error('Acción cancelada');
        });
    });

    $(document).on('click', '#editar_cliente', function(){
        var id = $(this).parent().data('id');
        imprimir_vista('#form_cliente_content','editar_cliente.php',id);
    });

    $(document).on('click', '#editar_especialidad', function(){
        var id = $(this).parent().data('id');
        imprimir_vista('#form_cliente_content','editar_especialidad.php',id);
    });

    $(document).on('click', '#editar_aseguradora', function(){
        var id = $(this).parent().data('id');
        imprimir_vista('#form_aseguradora_content','editar_aseguradora.php',id);
    });

    $(document).on('click', '#editar_proveedor', function(){
        var id = $(this).parent().data('id');
        imprimir_vista('#form_aseguradora_content','editar_proveedor.php',id);
    });
    $(document).on('click', '#editar_medico', function(){
        var id = $(this).parent().data('id');
        imprimir_vista('#form_medico_content','editar_medico.php',id);
    });

    $(document).on('click', '#editar_referenciador', function(){
        var id = $(this).parent().data('id');
        imprimir_vista('#form_cliente_content','editar_referenciador.php',id);
    });

    $(document).on('click', '#editar_informante', function(){
        var id = $(this).parent().data('id');
        imprimir_vista('#form_cliente_content','editar_informante.php',id);
    });
    
    $(document).on('click', '#ver_reporte', function(){
        $.ajax({
            url: '../php/v/0/ver_reporte.php',
            type: 'POST',
            success: function(data){
                $('#contenido_modal').html(data);
                $('#Extra').modal('show');
            }
        });
    });
    $(document).on('click', '#modal_agregar_reporte', function(){
        $.ajax({
            url: '../php/v/0/modal_reporte.php',
            type: 'POST',
            success: function(data){
                $('#modaldemo3').find('.modal-content').html(data);
                $('#modaldemo3').modal('show');
            }
        });
    });
    $(document).on('click', '#print_div', function(){
        var content = $(this).data('div');
        print_div(content);
    });
    function print_div(divName){
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }
    $(document).on('click', '#editar_cliente_form', function(){
        var id = $(this).data('id');
         // get all inputs of the form
         var inputs = $('.form-horizontal:not(.ignore)').find(':input');
         // add in form data
         var form_data = new FormData();
         for(var i=0; i<inputs.length; i++){
             form_data.append(inputs[i].id, inputs[i].value);
         }
         form_data.append('id', id);
         $.ajax({
             url: '../php/c/0/editar_cliente.php',
             type: 'POST',
             processData: false,
             contentType: false,
             data: form_data,
             success: function(data){
                 data = JSON.parse(data);
                 if(data.status == 'success'){
                    if(data.tipo == 0){
                        imprimir_vista('#form_cliente_content','form_clientes.php',0);
                        imprimir_vista('#tabla_consulta','tabla_clientes.php',0);
                    }else{
                        imprimir_vista('#form_aseguradora_content','form_'+hash+'.php',0);
                        imprimir_vista('#tabla_consulta','tabla_'+hash+'.php',0);
                    }
                     alertify.set('notifier','position', 'top-right');
                     alertify.success('Registro modificado');
                 }
             }
         });
    });

    $(document).on('click', '#editar_especialidad_form', function(){
        var id = $(this).data('id');
         // get all inputs of the form
         var inputs = $('.form-horizontal:not(.ignore)').find(':input');
         // add in form data
         var form_data = new FormData();
         for(var i=0; i<inputs.length; i++){
             form_data.append(inputs[i].id, inputs[i].value);
         }
         form_data.append('id', id);
         $.ajax({
             url: '../php/c/0/editar_especialidad.php',
             type: 'POST',
             processData: false,
             contentType: false,
             data: form_data,
             success: function(data){
                 data = JSON.parse(data);
                 if(data.status == 'success'){
                    imprimir_vista('#form_cliente_content','form_especialidades.php',0);
                    imprimir_vista('#tabla_consulta','tabla_especialidades.php',0);
                    alertify.set('notifier','position', 'top-right');
                    alertify.success('Registro modificado');
                 }
             }
         });
    });

    $(document).on('click', '#editar_medico_form', function(){
        var id = $(this).data('id');
         // get all inputs of the form
         var inputs = $('.form-horizontal:not(.ignore)').find(':input');
        //  Agregar selects
        var selects = $('.form-horizontal:not(.ignore)').find('select');
         // add in form data
         var form_data = new FormData();
         for(var i=0; i<inputs.length; i++){
             form_data.append(inputs[i].id, inputs[i].value);
         }
         for(var i=0; i<selects.length; i++){
                form_data.append(selects[i].id, selects[i].value);
         }
         form_data.append('id', id);
         $.ajax({
             url: '../php/c/0/editar_medico.php',
             type: 'POST',
             processData: false,
             contentType: false,
             data: form_data,
             success: function(data){
                 data = JSON.parse(data);
                 if(data.status == 'success'){
                     imprimir_vista('#form_medico_content','form_medicos.php',0);
                     imprimir_vista('#tabla_consulta','tabla_medicos.php',0);
                     alertify.set('notifier','position', 'top-right');
                     alertify.success('Registro modificado');
                 }
             }
         });
    });
    

    $(document).on('click', '#editar_referenciador_form', function(){
        var id = $(this).data('id');
         // get all inputs of the form
         var inputs = $('.form-horizontal:not(.ignore)').find(':input');
         // add in form data
         var form_data = new FormData();
         for(var i=0; i<inputs.length; i++){
             form_data.append(inputs[i].id, inputs[i].value);
         }
         form_data.append('id', id);
         $.ajax({
             url: '../php/c/0/editar_referenciador.php',
             type: 'POST',
             processData: false,
             contentType: false,
             data: form_data,
             success: function(data){
                 data = JSON.parse(data);
                 if(data.status == 'success'){
                     imprimir_vista('#form_cliente_content','form_referenciadores.php',0);
                     imprimir_vista('#tabla_consulta','tabla_referenciadores.php',0);
                     alertify.set('notifier','position', 'top-right');
                     alertify.success('Registro modificado');
                 }
             }
         });
    });

    $(document).on('click', '#editar_informante_form', function(){
        var id = $(this).data('id');
         // get all inputs of the form
         var inputs = $('.form-horizontal:not(.ignore)').find(':input');
         // add in form data
         var form_data = new FormData();
         for(var i=0; i<inputs.length; i++){
             form_data.append(inputs[i].id, inputs[i].value);
         }
         form_data.append('id', id);
         $.ajax({
             url: '../php/c/0/editar_informante.php',
             type: 'POST',
             processData: false,
             contentType: false,
             data: form_data,
             success: function(data){
                 data = JSON.parse(data);
                 if(data.status == 'success'){
                     imprimir_vista('#form_cliente_content','form_informantes.php',0);
                     imprimir_vista('#tabla_consulta','tabla_informantes.php',0);
                     alertify.set('notifier','position', 'top-right');
                     alertify.success('Registro modificado');
                 }
             }
         });
    });
    $(document).on('click', '#agregar_reporte', function(){
        insertar_datos('#form_reporte');
    });
    $(document).on('click', '#cliente', function(){
        var id_cliente = $(this).val();
        $('.dis_'+id_cliente).prop('disabled', 'disabled');
    });
    $(document).on('change', '#referenciado', function(){
        var referenciado = $(this).val();
        if (referenciado=="Calle") {
            $("#if_referenciado").slideDown(1000);
        } else {
            $("#if_referenciado").slideUp(500);
        }
        $('.dis_'+id_cliente).prop('disabled', 'disabled');
    });
    function insertar_datos(contenedor){
        var inputs = $(contenedor).find(':input:not(:disabled):not(:submit):not(:reset):not(:button):not(hidden)');
        var form_data = new FormData();
        for(var i=0; i<inputs.length; i++){
            // Si el input no es file
            if(inputs[i].type != 'file'){
                //  si es arrt multiple
                if(inputs[i].multiple){
                    var id = inputs[i].id;
                    form_data.append(id, $('#'+id).val());
                }
                else{
                    // if value is array
                    if(inputs[i].value == ''){
                        inputs[i].value = ' ';
                    }
                    form_data.append(inputs[i].id, inputs[i].value);
                }
            }
        }
        $.ajax({
            url: '../php/c/0/insertar_reporte.php',
            type: 'POST',
            processData: false,
            contentType: false,
            data: form_data,
            success: function(data){
                data = JSON.parse(data);
                if(data.status == 'success'){
                    window.location.href = '#reportes';
                    alertify.set('notifier','position', 'top-right');
                    alertify.success('Registro agregado');
                    
                }
            }
        });
    }
    function validar_inputs(contenedor){
        var inputs = $(contenedor).find(':input');
        var valido = 0;
        for(var i=0; i<inputs.length; i++){
            if(inputs[i].value == ''){
                valido++;
            }
        }
        return valido;
    }
    function imprimir_vista(id,file,datos){
        $.ajax({
            url: '../php/v/0/'+file,
            type: 'POST',
            data: {id: datos},
            success: function(data){
                $(id).html(data);
                // Si existe data-val in select
                if($(id).find('select').attr('data-val').length > 0){
                    $('select').select2({
                        placeholder: 'Escoger una opción',
                        searchInputPlaceholder: 'Buscar..',
                        "language": {
                            "noResults": function(){
                                return "No se encontraron resultados";
                            }
                        },
                    });
                    cargar_select_ciudad();
                }
            }
        });
    }

    function cargar_select_ciudad(){
        var selected_id = $('#ciudad').data('val');
        $.ajax({
            url: 'js/estados-municipios.json',
            success: function(data){
                estados = data;
                // Ceate options for selects
                var options = '';
                
                for(var i in data){
                    if(i == selected_id-1){
                        options += '<option value="'+data[i].id+'" selected>'+data[i].name+'</option>';
                    }else{
                        options += '<option value="'+data[i].id+'">'+data[i].name+'</option>';
                    }
                    
                }
                // Append options to selects
                $('#ciudad').append(options);
            }
        });
    }

});