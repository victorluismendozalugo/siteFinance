
$(document).ready(function () {

    var table = $("#dataTable").dataTable();

});



var vue2 = new Vue({
    el: '#vuePage',
    data: {
        cobranza: {
            IDVerificador: 0,
            IDSucursal: 1
        },
        verificador: 0,
        optionsVerificadores: [],
        cobranzaReporte: []
    },
    computed: {

    },
    mounted() {
        this.ObtieneVerificadores()
    },
    methods: {

        ObtieneVerificadores() {
            var datos = {
                "IDVerificador": 0,
                "IDSucursal": 1
            }
            http.postLoader('verificadores/consulta', datos).then(response => {
                if (response.data.data.codigoError == 0) {
                    this.optionsVerificadores = response.data.data.data;
                }
            })
                .catch(e => {
                    console.log(e);
                })
        },
        ObtieneCobranzaXVerificador() {
            http.postLoader('verificadores/consulta/cobranza', this.cobranza).then(response => {
                if (response.data.data.codigoError == 0) {

                    $("#dataTable").dataTable().fnDestroy();

                    $('#dataTable').DataTable({
                        "paging": true,
                        dom: '<"dt-top-container"<l><"dt-center-in-div"B><f>r>t<"dt-filter-spacer"f><ip>',
                        buttons: [
                            'print',
                            'excel',
                            {
                                extend: 'pdfHtml5',
                                orientation: 'landscape',
                                pageSize: 'LEGAL',
                                messageTop: 'Reporte',
                                customize: function (doc) {
                                    doc.content.splice(1, 0, {
                                        margin: [0, 0, 0, 12],
                                        alignment: 'center',
                                        image: 'data:image/png;base64,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'
                                    });
                                }
                            }

                        ],
                        "select": false,
                        "data": response.data.data.data,
                        "columns": [
                            { data: "iDCredito" },
                            { data: "nombreCompleto" },
                            { data: "montoSolicitado" },
                            { data: "totalPagar" },
                            { data: "saldoPendiente" },
                            { data: "valorXPago" },
                            { data: "ultimoAbono" },
                            { data: "numeroPagos" },
                            { data: "totalPagos" },
                            { data: "fechaDeposito" },
                            { data: "vencido"},
                        ],
                        "columnDefs": [
                            { "width": "25%", "targets": 1 }
                        ]
                    });

                }
            })
                .catch(e => {
                    console.log(e);
                })
        },
        ObtieneDetalleCobranzaXcliente(idCredito, cliente) {

            this.$bvModal.show('modal-detalle-cobranza');

            var datos = {
                "IDCredito": idCredito,
                "IDSucursal": 1
            }
            http.postLoader('verificadores/consulta/cobranza/detalle', datos).then(response => {
                if (response.data.data.codigoError == 0) {

                    $("#dataTableDetalleCobranza").dataTable().fnDestroy();
                    $('#dataTableDetalleCobranza').DataTable({
                        "paging": false,
                        //dom: '<"dt-top-container"<l><"dt-center-in-div"B><f>r>t<"dt-filter-spacer"f><ip>',
                        dom: 'lBrtip', //si se activa esta opción se muestran los botones
                        buttons: [
                            'print',
                            'excel',
                            {
                                extend: 'pdfHtml5',
                                orientation: 'portrait',
                                pageSize: 'LEGAL',
                                messageTop: 'Cliente: ' + cliente + '    Fecha de impresión: ' + moment().format('L'),
                                customize: function (doc) {
                                    doc.content.splice(1, 0, {
                                        margin: [0, 0, 0, 12],
                                        alignment: 'center',
                                        image: 'data:image/png;base64,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'
                                    });
                                }
                            }

                        ],
                        "select": false,
                        "data": response.data.data.data,
                        "columns": [
                            { data: "semana" },
                            { data: "fechaAabonar" },
                            { data: "numeroAbono" },
                            { data: "fechaAbono" },
                            { data: "montoAbonado" },
                            { data: "saldoRestante" },

                        ]
                    });
                }
            });
        },
        ObtieneDetallePagosVencidosXcliente(idCredito, cliente) {

            var datos = {
                "IDCredito": idCredito,
                "IDSucursal": 1
            }
            http.postLoader('verificadores/consulta/pagos/vencidos', datos).then(response => {
                if (response.data.data.codigoError == 0) {

                    $("#dataTablePagosVencidos").dataTable().fnDestroy();
                    $('#dataTablePagosVencidos').DataTable({
                        "paging": false,
                        dom: 'lBrtip', 
                        buttons: [
                            'print',
                            'excel',
                            {
                                extend: 'pdfHtml5',
                                orientation: 'portrait',
                                pageSize: 'LEGAL',
                                messageTop: 'Cliente: ' + cliente + '    Fecha de impresión: ' + moment().format('L'),
                                customize: function (doc) {
                                    doc.content.splice(1, 0, {
                                        margin: [0, 0, 0, 12],
                                        alignment: 'center',
                                        image: 'data:image/png;base64,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'
                                    });
                                }
                            }

                        ],
                        "select": false,
                        "data": response.data.data.data,
                        "columns": [
                            { data: "semana" },
                            { data: "fechaAabonar" },
                            { data: "pagoRequerido" },
                            { data: "vencido" },
                            { data: "saldoCliente" },
                            { data: "numeroAbono" },
                            { data: "fechaAbono" },
                            { data: "montoAbonado" },
                            { data: "saldoRestante" },
                        ]
                    });
                }
            });
        }
    }
});

$("#dataTable").on("click", "tbody tr", function (event) {

    let ID = parseInt($(this)[0].cells[0].innerText)
    let CLIENTE = $(this)[0].cells[1].innerText
    vue2.ObtieneDetalleCobranzaXcliente(ID, CLIENTE)
    vue2.ObtieneDetallePagosVencidosXcliente(ID, CLIENTE)
});