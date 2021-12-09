
var tabla = "";
var table3 = $('#wrapper').DataTable({
    "paging": true,
    "columnDefs": [
        { "visible": false, "targets": [3] },
        { "visible": false, "targets": [5] },
    ],
    select: true
});


function PrintDiv() {
    html2canvas(document.getElementById('tabla'), {
        onrendered: function (canvas) {
            var data = canvas.toDataURL();
            var docDefinition = {
                content: [{
                    image: data,
                    width: 500
                }]
            };
            pdfMake.createPdf(docDefinition).download("rptCta" + String(Date.now()) + ".pdf");
        }
    });
}


var vue2 = new Vue({
    el: '#vuePage',
    data: {
        saldo: {
            movimiento: 0,
            usuario: localStorage.getItem('Usuario'),
            sucursal: 1,
            tablaDocumento: '',
        },
        saldos: [],
    },
    computed: {

    },
    mounted() {
        this.ConsultaSaldo()
    },
    methods: {
        ConsultaSaldo() {
            http.postLoader('saldos/consulta', this.saldo).then(response => {
                if (response.data.data.codigoError == 0) {

                    this.saldos = response.data.data.data[0];
                    var doc = this.saldos.tablaDocumento.replace('data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,', '')
                    var data = Uint8Array.from(atob(doc), c => c.charCodeAt(0))

                    var wb = XLSX.read(data, { type: 'array' });
                    var htmlstr = XLSX.write(wb, { sheet: "INFORMACION", type: 'binary', bookType: 'html' });
                    $('#wrapper')[0].innerHTML += htmlstr;


                    if ($('#wrapper tr td')[0].innerHTML != "CAPITAL INICIAL") {

                        //esto es para el tipo usuario de préstamos
                        //esto es para el tipo usuario de préstamos
                        //esto es para el tipo usuario de préstamos

                        //quita los tr y td vacios
                        var r = $('#wrapper tr td')
                        for (var i = 0; i < r.length; i++) {
                            if (r[i].innerHTML == '') {
                                r[i].remove()
                            }
                        }

                        //agrega un estilo mas grande al encabezado
                        for (var i = 0; i < 6; i++) {
                            $('#wrapper tr')[i].style = "font-size: x-large;";
                        }

                        //quita todo lo que no sea encabezado
                        var remove = $('#wrapper tr')
                        for (var i = 6; i < remove.length; i++) {

                            tabla += remove[i].innerHTML;
                            remove[i].remove()
                        }
                        $('#wrapper').append("<tr style='font-size: x-large;'><td colspan='2' t='s' id='sjs-A5' v='SALDO AL DIA'>SALDO AL DIA</td>" +
                            "<td colspan='2' t='n' id='sjs-C5' v='7050'>$</td></tr >")
                        //esto es para el tipo usuario de préstamos
                        //esto es para el tipo usuario de préstamos
                        //esto es para el tipo usuario de préstamos
                    } else {
                        //esto es para el tipo usuario de préstamos
                        //esto es para el tipo usuario de préstamos
                        //esto es para el tipo usuario de préstamos

                        //quita los tr y td vacios
                        var r = $('#wrapper tr td')
                        for (var i = 0; i < r.length; i++) {
                            if (r[i].innerHTML == '') {
                                r[i].remove()
                            }
                        }

                        //agrega un estilo mas grande al encabezado
                        for (var i = 0; i < 4; i++) {
                            $('#wrapper tr')[i].style = "font-size: x-large;";
                        }

                        //quita todo lo que no sea encabezado
                        var remove = $('#wrapper tr')
                        for (var i = 4; i < remove.length; i++) {

                            tabla += remove[i].innerHTML;
                            remove[i].remove()
                        }

                        $('#wrapper').append("<tr style='font-size: x-large;'><td colspan='2' t='s' id='sjs-A5' v='RENDIMIENTO AL DIA'>RENDIMIENTO AL DIA</td>" +
                            "<td colspan='2' t='n' id='sjs-C5' v='7050'>$</td></tr >")
                        //esto es para el tipo usuario de préstamos
                        //esto es para el tipo usuario de préstamos
                        //esto es para el tipo usuario de préstamos
                    }


                    //aqui tomamos la tabla
                    var tabla = $('#wrapper tr') //+ tabla[i].cells[1].innerHTML +
                    var doc = ""
                    for (var i = 0; i < tabla.length; i++) {

                        doc += "<div class='col-lg-3 col-6'>"
                        doc += "<div class='small-box bg-info'>"
                        doc += "<div class='inner'>"
                        doc += "<h3>150</h3>"
                        doc += "<p>New Orders</p>"
                        doc += "</div>"
                        doc += "<div class='icon'>"
                        doc += "<i class='ion ion-bag'></i>"
                        doc += "</div>"
                        doc += "<a href='#' class='small-box-footer'>More info <i class='fas fa-arrow-circle-right'></i></a>"
                        doc += "</div>"
                        doc += "</div>"
                    }

                    $('#tabla').html("")
                    $('#tabla').append("<div class='row'>")
                    $('#tabla').append(doc)
                    $('#tabla').append("</div>")



                } else {
                    $.noticeError("ERROR " + response.data.data.mensajeBitacora);
                }
            })
                .catch(e => {
                    console.log(e);
                });
        }
    },
});