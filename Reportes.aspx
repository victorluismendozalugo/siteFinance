<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="WebSystems2021.Reportes" %>

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

    <div class="col">
        <div class="card mb-2">
            <div class="card-header">
                <i class="fa fa-table"></i>
                Listado
            </div>
            <div class="card-body">
                <div class="dataTables_wrapper dt-bootstrap4">
                    <div class="row">
                        <div class="col-sm-12 table-responsive">
                            <table class="demo display dataTable table-striped" id="dataTable" style="width: 100%; font-size: 85%;">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <%--<th style="width: 400.016px;">Nombre</th>--%>
                                        <th>Registro</th>
                                        <th>Estatus</th>
                                        <th>Tipo</th>
                                        <th>Monto Solicitado</th>
                                        <th>Pago semanal</th>
                                        <th>Total Pagar</th>
                                        <th>Fec. Autorizacion</th>
                                        <th>Fec. Deposito</th>
                                        <th>Fec. UltimoAbono</th>
                                        <th>Ultimo Abono</th>
                                        <th>Verificador</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <%--<th style="width: 400.016px;">Nombre</th>--%>
                                        <th>Registro</th>
                                        <th>Estatus</th>
                                        <th>Tipo</th>
                                        <th>Monto Solicitado</th>
                                        <th>Pago semanal</th>
                                        <th>Total Pagar</th>
                                        <th>Fec. Autorizacion</th>
                                        <th>Fec. Deposito</th>
                                        <th>Fec. UltimoAbono</th>
                                        <th>Ultimo Abono</th>
                                        <th>Verificador</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--          </template>
        </div>
    </div>--%>

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
    <script src="js/Reportes.js?5.0.0"></script>
</asp:Content>
