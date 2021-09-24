<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Saldo.aspx.cs" Inherits="WebSystems2021.Saldo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div id="vuePage">
        <div class="container">
            <template>
                <p>Fecha de actualización: {{saldos.fechaRegistro}}</p>
                   <b-table id="wrapper" class="table table-striped table-responsive" responsive="sm">
                  </b-table>
            </template>
        </div>
    </div>
    <script src="js/libs/xlsx.full.min.js"></script>
    <script src="js/Saldo.js"></script>
</asp:Content>
