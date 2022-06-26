// Al cargar
var hash = '';
var estados = [];
$(document).ready(function() {
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
    
    function cambiar_hash(){
        hash = window.location.hash;
        hash = hash.substring(1);
        if(hash == ''){
            window.location.hash = '#inicio';
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
        var inputs = $('.form-horizontal').find(':input');
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
    // $.ajax({
    //     url: '../php/v/0/ver_reporte.php',
    //     type: 'POST',
    //     success: function(data){
    //         $('#contenido_modal').html(data);
    //         $('#Extra').modal('show');
    //     }
    // });
    // $(document).on('click', '#ver_reporte', function(){
        
    // });
    function print_div(){
        divName = 'card-body';
        var printContents = document.getElementsByClassName(divName)[1].innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }
    $(document).on('click', '#editar_cliente_form', function(){
        var id = $(this).data('id');
         // get all inputs of the form
         var inputs = $('.form-horizontal').find(':input');
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
         var inputs = $('.form-horizontal').find(':input');
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
         var inputs = $('.form-horizontal').find(':input');
        //  Agregar selects
        var selects = $('.form-horizontal').find('select');
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
         var inputs = $('.form-horizontal').find(':input');
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
         var inputs = $('.form-horizontal').find(':input');
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