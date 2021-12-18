<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cobranza.aspx.cs" Inherits="WebSystems2021.Cobranza" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="js/libs/DataTables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<%-- para mostrar los botones--%>
    <link href="js/libs/DataTables/Select-1.3.0/css/select.dataTables.min.css" rel="stylesheet" />
    <link href="js/libs/DataTables/Buttons-1.5.6/css/buttons.dataTables.min.css" rel="stylesheet" />
    <%-- para mostrar los botones--%>
        <style>
            div.dt-top-container {
                display: grid;
                grid-template-columns: auto auto auto;
            }

            div.dt-center-in-div {
                margin: 0 auto;
            }

            div.dt-filter-spacer {
                margin: 10px 0;
            }
        </style>

        <div id="vuePage">
            <div class="container">
                <template>
                    <section class="content">
                        <div class="row">
                            <div class="col-md-6 col-xs-6">
                                <label>Nombre del verificador</label>
                                <b-form-select class="form-control" v-model="cobranza.IDVerificador">
                                    <option v-for="item in optionsVerificadores" :value="item.iDVerificador">
                                        {{item.nombreCompleto}}</option>
                                </b-form-select>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Obtiene Cobranza</label>
                                <b-button variant="info" class="float-right" @click="ObtieneCobranzaXVerificador()"
                                    id="botonCobranza">
                                    Obtener Cobranza
                                </b-button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="card-body">
                                <div class="dataTables_wrapper dt-bootstrap4">
                                    <div class="row">
                                        <div class="col-sm-12 table-responsive">
                                            <table class="demo display dataTable table-striped" id="dataTable"
                                                style="width: 100%; font-size: 85%;">
                                                <thead>
                                                    <tr>
                                                        <th>ID Credito</th>
                                                        <th>Cliente</th>
                                                        <th>Monto Solicitado</th>
                                                        <th>Total a pagar</th>
                                                        <th>Saldo pendiente</th>
                                                        <th>Pago semanal</th>
                                                        <th>Fecha ultimo abono</th>
                                                        <th>Pagos realizados</th>
                                                        <th>Total de pagos</th>
                                                        <th>Fecha inicio del credito</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>ID Credito</th>
                                                        <th>Cliente</th>
                                                        <th>Monto Solicitado</th>
                                                        <th>Total a pagar</th>
                                                        <th>Saldo pendiente</th>
                                                        <th>Pago semanal</th>
                                                        <th>Fecha ultimo abono</th>
                                                        <th>Pagos realizados</th>
                                                        <th>Total de pagos</th>
                                                        <th>Fecha inicio del credito</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <b-modal id="modal-detalle-cobranza" title="Detalle por cliente" size="lg" hide-footer>

                            <div>
                                <b-card no-body>
                                    <b-tabs card>
                                        <b-tab title="Detalle Cobranza" active>
                                            <div class="row">
                                                <div class="card-body">
                                                    <div class="dataTables_wrapper dt-bootstrap4">
                                                        <div class="row">
                                                            <div class="col-sm-12 table-responsive">
                                                                <table class="demo display dataTable table-striped"
                                                                    id="dataTableDetalleCobranza"
                                                                    style="width: 100%; font-size: 85%;">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Semana</th>
                                                                            <th>Fecha estimada del abono</th>
                                                                            <th>Número de abono</th>
                                                                            <th>Fecha de abono</th>
                                                                            <th>Monto abonado</th>
                                                                            <th>Saldo restante</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tfoot>
                                                                        <tr>
                                                                            <th>Semana</th>
                                                                            <th>Fecha estimada del abono</th>
                                                                            <th>Número de abono</th>
                                                                            <th>Fecha de abono</th>
                                                                            <th>Monto abonado</th>
                                                                            <th>Saldo restante</th>
                                                                        </tr>
                                                                    </tfoot>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </b-tab>
                                        <b-tab title="Tab 2">
                                            <b-card-text>Saldos vencidos</b-card-text>
                                        </b-tab>
                                    </b-tabs>
                                </b-card>
                            </div>

                            <div class="modal-footer">
                                <%-- <b-button variant="info" class="float-right" @click="LlenarSolicitud()">
                                    <i class="fas fa-pen-square"></i> Llenar solicitud
                                    </b-button>
                                    <b-button variant="info" class="float-right" @click="GeneraSolicitud()">
                                        <i class="fas fa-download"></i> Descargar solicitud
                                    </b-button>--%>
                            </div>
                        </b-modal>
                    </section>
                </template>
            </div>
        </div>

<script src="Theme/plugins/jquery/jquery.min.js"></script>
<script src="js/libs/DataTables/DataTables-1.10.18/js/jquery.dataTables.min.js" defer></script>
<script src="js/libs/DataTables/DataTables-1.10.18/js/dataTables.bootstrap4.min.js" defer></script>

<%-- para mostrar los botones--%>
<script src="js/libs/DataTables/Buttons-1.5.6/js/dataTables.buttons.min.js" defer></script>
<script src="js/libs/DataTables/Buttons-1.5.6/js/buttons.print.min.js" defer></script>
<script src="js/libs/DataTables/Buttons-1.5.6/js/buttons.flash.min.js" defer></script>
<script src="js/libs/DataTables/JSZip-2.5.0/jszip.min.js" defer></script>
<script src="js/libs/DataTables/pdfmake-0.1.36/pdfmake.min.js" defer></script>
<script src="js/libs/DataTables/pdfmake-0.1.36/vfs_fonts.js" defer></script>
<script src="js/libs/DataTables/Buttons-1.5.6/js/buttons.html5.min.js" defer></script>
<script src="js/libs/DataTables/Buttons-1.5.6/js/buttons.print.min.js" defer></script>
<%-- para mostrar los botones--%>

<script src="js/libs/DataTables/Select-1.3.0/js/dataTables.select.min.js" defer></script>
<script src="js/Cobranza.js?16.0.0"></script>
</asp:Content>
