<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Saldo.aspx.cs" Inherits="WebSystems2021.Saldo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="js/libs/DataTables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href="js/libs/DataTables/Select-1.3.0/css/select.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div id="vuePage">
        <div class="container">
            <template>
                <style>
                    td:empty {
                        visibility: hidden;
                    }

                    .grande {
                        font-size: xx-large;
                    }
                </style>
                <div id="tabla">
                <p>Fecha de actualización: {{saldos.fechaRegistro}}</p>
                  <div class="table-responsive">
                   <table id="wrapper" class="table table-bordered" style="width: 100%">
                  </table>
                  </div>
                    </div>
                    <a href="javascript:PrintDiv()" type="button" class="btn btn-primary">Imprimir</a>
            </template>
        </div>
    </div>
    <script src="Theme/plugins/jquery/jquery.min.js"></script>
    <script src="js/libs/DataTables/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="js/libs/DataTables/DataTables-1.10.18/js/dataTables.bootstrap4.min.js"></script>
    <script src="js/libs/DataTables/Select-1.3.0/js/dataTables.select.min.js"></script>
    <script src="js/libs/xlsx.full.min.js"></script>
    <script src="js/Saldo.js"></script>
</asp:Content>
