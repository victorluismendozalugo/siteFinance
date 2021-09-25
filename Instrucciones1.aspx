<%--<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Instrucciones1.aspx.cs" Inherits="WebSystems2021.Instrucciones1" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="vuePage">
        <div class="container">
            <template>
                 <h5 class="mt-4 mb-2">Instrucciónes de Retiros/Depósitos en cuentas de inversión</h5>

        <div class="row">
          <div class="col-12">
            <!-- Custom Tabs -->
            <div class="card">
              <div class="card-header d-flex p-0">
                <h3 class="card-title p-3">Si desea realizar un retiro o invertir nuevamente en su cuenta favor de notificarlo mediante el botón Enviar notificación situado en la parte de abajo de esta pantalla</h3>
                <ul class="nav nav-pills ml-auto p-2">
                  <li class="nav-item"><a class="nav-link active" href="#tab_1" data-toggle="tab">Retiro</a></li>
                  <%--<li class="nav-item"><a class="nav-link" href="#tab_2" data-toggle="tab">Movimientos</a></li>--%>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1">
                      <P><b>OXXO:</b></P>
                      <P><b>BANCO:</b></P>
                      <P><b>SPEI:</b></P>
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_2">
                 <%--   The European languages are members of the same family. Their separate existence is a myth.
                    For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ
                    in their grammar, their pronunciation and their most common words. Everyone realizes why a
                    new common language would be desirable: one could refuse to pay expensive translators. To
                    achieve this, it would be necessary to have uniform grammar, pronunciation and more common
                    words. If several languages coalesce, the grammar of the resulting language is more simple
                    and regular than that of the individual languages.--%>
                  </div>
                  <!-- /.tab-pane -->
<%--                  <div class="tab-pane" id="tab_3">
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                    Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
                    when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                    It has survived not only five centuries, but also the leap into electronic typesetting,
                    remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset
                    sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
                    like Aldus PageMaker including versions of Lorem Ipsum.
                  </div>--%>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- ./card -->
          </div>
          <!-- /.col -->
        </div>
                 <div class="row">
          <div class="col-12">
            <!-- Custom Tabs -->
            <div class="card">
                 <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active">
                      <P><b>Notificar al ejecutivo</b></P>
                  </div>
                      <b-button variant="primary" class="" @click="enviarNotificacion()">
                        <i class="far fa-bell"></i> Enviar notificación
                    </b-button>
                </div>
                     </div>
                </div>
              </div>
                     </div>
            </template>
        </div>
    </div>
    <script src="js/Instrucciones1.js"></script>
</asp:Content>
