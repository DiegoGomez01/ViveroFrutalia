/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var clientes;
var contadorNuevos = 0;
var lineas = new Array();


function editarCompra(id) {
    window.location = "compras_consultar.htm?id=" + id;
    //$.post("compras_consultar.htm?id=" + id, {}, function (respuesta) {
        //console.log(respuesta);
        //location.reload(true);
    //});
}
function redimensionar(i, ii, j) {
    
    
    var today = new Date();
    var dd = today.getDate();
    var mm= today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    var yyyyMin=yyyy;
    var mmMin=mm;
    
    if(mmMin===1){
        yyyyMin--;
        mmMin=12;
    }else{
        mmMin--;
    }

    if(dd<10){
        dd='0'+dd;
    } 
    if(mm<10){
        mm='0'+mm;
        mmMin='0'+mmMin;
    }

    today = yyyy+'-'+mm+'-'+dd;
    var minDate = yyyyMin+'-'+mmMin+'-'+dd;

    document.getElementById("fecha").max=today;
    document.getElementById("fecha").value=today;
    document.getElementById("fecha").min=minDate;
    
    document.getElementById("panelEdicion").setAttribute("style", " visibility: visible ");
    document.getElementById("panelVista").setAttribute("class", " col-xs-" + i + " col-xs-offset-" + ii);
}
function agregarCompra() {

    $("#cedula").val = "";
    $("#nombre").val = "";
    $("#apellido").val = "";
    $("#telefono").val = "";
    $("#correo").val = "";
    redimensionar(10, 1, 10);
}
function eliminarCompra(id) {
    window.location = "compras_eliminar.htm?id=" + id;
}

function redirigir() {
    redimensionar(8, 2, 0);
    document.getElementById("panelEdicion").setAttribute("style", " visibility: hidden ");
}

function eliminarNuevaLineaCompra(id) {
    for (var i = 0; i < lineas.length; i++) {
        if (lineas[i].attr("id").substring(11) === id) {
            lineas.splice(i, 1);
            break;
        }
    }
    $('#panelNuevo_' + id).remove();
}
function eliminarLineaCompraAdicionada(id) {
    for (var i = 0; i < lineas.length; i++) {
        if (lineas[i].attr("id").substring(11) == id) {
            lineas.splice(i, 1);
            break;
        }
    }
    $('#panelNuevo_' + id).remove();
}

function changeSuministro(id){
    var suministros = JSON.parse(localStorage.getItem('suministros'));
    for (var i = 0; i < suministros.length; i++) {
        if(suministros[i]["id"] == document.getElementById("idSuministro_"+(id-1)).value){
           document.getElementById("descripcionSuministro_"+(id-1)).value = suministros[i]["descripcion"]; 
           break;
        }
    }
}

function crearTDLineaSuministro() {
    mensaje =
            "<td >" +
            "<div  class='col-xs-12 frm form-group'>" +
            "<div style='margin-bottom:10px;' class=' col-xs-1 col-xs-offset-11'>" +
            "<div onclick='eliminarNuevaLineaCompra(" + contadorNuevos + " )' class='btn btn-danger'>Eliminar</div>" +
            "</div>" +
            "<div class='col-xs-3'>" +
            "<label class='control-label'>Nombre suministro</label>" +
            "</div>" +
            "<div class='col-xs-9'>" +
            "<select id='idSuministro_" + contadorNuevos + "' class='form-control' onchange='changeSuministro(contadorNuevos)'>";
                var suministros = JSON.parse(localStorage.getItem('suministros'));
                for (var i = 0; i < suministros.length; i++) {
                    mensaje += '<option value="'+suministros[i]["id"]+'">';
                    mensaje += suministros[i]["nombre"] + ' (' + suministros[i]["id"] + ')';
                    mensaje += '</option>';
                }
                mensaje +=
            "</select>" +
            "</div>" +
            "</div>" +
            "<div class='col-xs-12 frm form-group'>" +
            "<div class='col-xs-3'>" +
            "<label class='control-label'>Descripción </label>" +
            "</div>" +
            "<div class='col-xs-9'>" +
                "<textarea disabled class='form-control' rows='4' id='descripcionSuministro_" + contadorNuevos + "'></textarea>"+
            "</div>" +
            "</div>" +
            "<div class='col-xs-12 frm form-group'>" +
            "<div class='col-xs-3'>" +
            "<label class='control-label'>Valor Compra </label>" +
            "</div>" +
            "<div class='col-xs-3'>" +
            "<input type='number' class='form-control' value='0' id='pCompra_" + contadorNuevos + "' >" +
            "</div>" +
            "<div class='col-xs-3'>" +
            "<label class='control-label'>Cantidad </label>" +
            "</div>" +
            "<div class='col-xs-3'>" +
            "<input type='text' class='form-control' value='0'  id='cantidad_Suministro_" + contadorNuevos + "' >" +
            "</div>" +
            "</div>" +
            "</td>";
    contadorNuevos++;

    return mensaje;
}

function crearTDLineaCompra() {
    mensaje =
            "<td >" +
            "<div  class='col-xs-12 frm form-group'>" +
            "<div style='margin-bottom:10px;' class=' col-xs-1 col-xs-offset-11'>" +
            "<div onclick='eliminarNuevaLineaCompra(" + contadorNuevos + " )' class='btn btn-danger'>-</div>" +
            "</div>" +
            "<div class='col-xs-3'>" +
            "<label class='control-label'>Planta</label>" +
            "</div>" +
            "<div class='col-xs-9'>" +
            "<select id='planta_" + contadorNuevos + "' class='form-control'>";
    //consultarPlantas();
    var plantas = JSON.parse(localStorage.getItem('plantas'));
    //alert(localStorage.getItem('plantas'));
    for (var i = 0; i < plantas.length; i++) {
        mensaje += '<option value="'+plantas[i]["id"]+'">';
        mensaje += plantas[i]["nombre"] + ' (' + plantas[i]["id"] + ')';
        mensaje += '</option>';
    }
    mensaje +=
            "</select>" +
            "</div>" +
            "</div>" +
            "<div class='col-xs-12 frm form-group'>" +
            "<div class='col-xs-3'>" +
            "<label class='control-label'>Etapa </label>" +
            "</div>" +
            "<div class='col-xs-9'>" +
            "    <select id='etapa_" + contadorNuevos + "' class='form-control'>";

    consultarEtapas();
    //alert(localStorage.getItem("etapas"));
    var etapas = JSON.parse(localStorage.getItem("etapas"));
    for (var i = 0; i < etapas.length; i++) {

        mensaje += '<option>';
        mensaje += (etapas[i][1] + ' (' + etapas[i][0] + ')');
        mensaje += '</option>';
    }
    mensaje += "</select>" +
            "</div>" +
            "</div>" +
            "<div class='col-xs-12 frm form-group'>" +
            "<div class='col-xs-3'>" +
            "<label class='control-label'>Cantidad </label>" +
            "</div>" +
            "<div class='col-xs-3'>" +
            "<input type='text' class='form-control' value='0'  id='cantidad_" + contadorNuevos + "' >" +
            "</div>" +
            "<div class='col-xs-3'>" +
            "<label class='control-label'>Descuento</label>" +
            "</div>" +
            "<div class='col-xs-3'>" +
            "<input type='text' class='form-control' value='0' id='descuento_" + contadorNuevos + "' >" +
            "</div>" +
            "</div>" +
            "<div class='col-xs-12 frm form-group'>" +
            "<div class='col-xs-3'>" +
            "<label class='control-label'>Valor Compra</label>" +
            "</div>" +
            "<div class='col-xs-9'>" +
            "<input type='number' class='form-control' value='0'  id='valorCompra_" + contadorNuevos + "' >" +
            "</div>" +
            "</div>" +
            "</td>";
    contadorNuevos++;

    return mensaje;

}
function limpiar() {

    lineas = new Array();
}
function agregarNuevaLineaCompra() {
    var mensaje =
            "<tr id = 'panelNuevo_" + contadorNuevos + "'>" +
            crearTDLineaCompra() +
            "</tr>";
    var elemento = $(mensaje);
    lineas.push(elemento);

    $('#tablaPlantas').append(elemento);
}

function agregarSuministro() {
    var mensaje =
            "<tr id = 'panelNuevo_" + contadorNuevos + "'>" +
            crearTDLineaSuministro() +
            "</tr>";
    var elemento = $(mensaje);
    lineas.push(elemento);

    $('#tablaPlantas').append(elemento);
}

function agregarLineaCompraAdicionada() {
    var mensaje =
            "<tr id = 'panelNuevo_" + contadorNuevos + "'> <td></td>" +
            crearTDLineaCompra() +
            "</tr>";
    var elemento = $(mensaje);
    lineas.push(elemento);
    $('#tablaPlantas').append(elemento);
}

function registrarCompra() {
    var data = {
        proveedor: $("#nombreProveedor").val(),
        fecha: $("#fecha").val().replace("-", "/").replace("-", "/"),
        factura: $("#factura").val()
    };
    var lines = new Array();
    var suministros = new Array();
    for (var i = 0; i < lineas.length; i++) {
        id = lineas[i].attr("id").substring(11);
        if($("#planta_" + id).val() === undefined){
            suministro = {
                
                idSuministro:$("#idSuministro_" + id).val(),
                valorCompra:$("#pCompra_" + id).val(),
                cantidadSuministro:$("#cantidad_Suministro_" + id).val()
            };
            suministros.push(suministro);
        }else{
            linea = {
                planta: $("#planta_" + id).val(),
                etapa: $("#etapa_" + id).val(),
                cantidad: $("#cantidad_" + id).val(),
                descuento: $("#descuento_" + id).val(),
                valorCompra: $("#valorCompra_" + id).val()
            };
            lines.push(linea);
        }   
    }
    data['lineas'] = lines;
    data['suministros'] = suministros;
    console.log(JSON.stringify(data));
    $.post("compras_registrar.htm", {data: JSON.stringify(data)}, function (respuesta) {
        //console.log(respuesta);
        //location.reload(true);
    });

}


function actualizarCompra() {

    var data = {
        id: $("#idGeneral").val(),
        proveedor: $("#nombreProveedor").val(),
        fecha: $("#fecha").val().replace("-", "/").replace("-", "/"),
        factura: $("#factura").val()
    }
    var lines = new Array();
    for (var i = 0; i < lineas.length; i++) {
        id = lineas[i].attr("id").substring(11);
        linea = {
            planta: $("#planta_" + id).val(),
            etapa: $("#etapa_" + id).val(),
            cantidad: $("#cantidad_" + id).val(),
            descuento: $("#descuento_" + id).val()
        }
        lines.push(linea);
    }
    data['lineas'] = lines;


    var linesExistentes = new Array();
    $('.viejo').each(function (key, value) {
        id = value.id.substring(15);

        linea = {
            id: $("#id_" + id).val(),
            planta: $("#plantaExistente_" + id).val(),
            etapa: $("#etapaExistente_" + id).val(),
            cantidad: $("#cantidadExistente_" + id).val(),
            descuento: $("#descuentoExistente_" + id).val()
        };
        linesExistentes.push(linea);

    });
    data['lineasExistentes'] = linesExistentes;
    console.log(data);
    $.post(
            "compras_actualizar.htm",
            {data: JSON.stringify(data)},
            function (respuesta) {
                location.reload(true);
            });
}