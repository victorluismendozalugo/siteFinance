<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Instrucciones1.aspx.cs" Inherits="WebSystems2021.Instrucciones1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="css/jquery.bootstrapTypeahead.css" rel="stylesheet" />
        <link href="js/libs/jQuery-File-Upload-master/css/jquery.fileupload-noscript.css" rel="stylesheet" />
    <link href="js/libs/jQuery-File-Upload-master/css/jquery.fileupload-ui-noscript.css" rel="stylesheet" />
    <link href="js/libs/jQuery-File-Upload-master/css/jquery.fileupload-ui.css" rel="stylesheet" />
    <link href="js/libs/jQuery-File-Upload-master/css/jquery.fileupload.css" rel="stylesheet" />
        <style>
        #progressbar {
            background-color: black;
            background-repeat: repeat-x;
            border-radius: 13px;
            padding: 3px;
        }

            #progressbar > div {
                background-color: orange;
                width: 0%;
                height: 20px;
                border-radius: 10px;
            }
    </style>
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
                <ul class="nav ml-auto p-2">
                  <li class="nav-item"><a class="nav-link active" href="#tab_1" data-toggle="tab"></a></li>
                  <%--<li class="nav-item"><a class="nav-link" href="#tab_2" data-toggle="tab">Movimientos</a></li>--%>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1">
                      <P><b>BANCO: BBVA</b></P>
                      <P><b>BENEFICIARIO: PRESTA STAR-Z SAPI DE CV</b></P>
                      <P><b>CLABE: 012 730 00117852487 2</b></P>
                      <P><b>CUENTA: 011 785 2487</b></P>
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
          <div class="col-6">
            <div class="card">
                 <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active">
                      <P><b>Notificación de retiro</b></P>
                  </div>
                      <b-button variant="primary" class="" @click="notificacionRetiroModal()">
                        <i class="far fa-bell"></i> Enviar notificación
                    </b-button>
                </div>
                     </div>
                </div>
              </div> 
                     <div class="col-6">
            <div class="card">
                 <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane active">
                      <P><b>Notificación de depósito a mi cuenta</b></P>
                  </div>
                      <b-button variant="warning" class="" @click="notificacionDepositoModal()">
                        <i class="far fa-bell"></i> Enviar notificación
                    </b-button>
                </div>
                     </div>
                </div>
              </div>
                     </div>

                                <!--Modal solicitud retiro-->
                <div class="modal fade" id="modalNotificacionRetiro" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="">Solicitud de retiro de fondos</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Ingrese el monto a retirar</label>
                                        <b-form-input type="text" class="form-control" 
                                            placeholder="Ingrese el monto $" v-model="notificacion.monto"
                                            ></b-form-input>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <b-button type="button" variant="secondary" data-dismiss="modal">Cancelar</b-button>
                                <b-button type="button" variant="primary" @click="enviarNotificacion()">
                                    Solicitar
                                </b-button>
                            </div>
                        </div>
                    </div>
                </div>

                                <div class="modal fade" id="modalNotificacionDeposito" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="">Notificación de depósito a cuenta</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="card-body">
                                    <div class="row">
                                    <div class="form-group">
                                        <label>Ingrese el monto depositado</label>
                                        <b-form-input type="text" class="form-control" 
                                            placeholder="Ingrese el monto $" v-model="notificacion.monto"
                                            ></b-form-input>
                                    </div>
                                        </div>   
                                    <div class="row">
                                    <div class="form-group">
                                        <label>Imágen del depósito/transferencia</label>
                                     <%--  <b-button type="button" variant="primary">
                                        Cargar
                                    </b-button>--%>
                                        <div class="col-md-4">
                                        <br />
                                        <img id="imagen" src="#" alt="Seleciona una imagen" height="300" width="300" />

                                        <input type="file" name="file" id="btnFileUpload" accept="image/png, image/jpeg" style="color: transparent" />
                                        <br />
                                        <br />
                                       <%-- <b-button id="btnCargar" type="button" class="btn btn-info" variant="primary">
                                            <i class="fa fa-upload"></i>Guardar
                                        </b-button>--%>

                                    </div>
                                    </div>
                                        </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <b-button type="button" variant="secondary" data-dismiss="modal">Cancelar</b-button>
                                <b-button type="button" variant="primary" @click="enviarNotificacionDeposito()">
                                    Solicitar
                                </b-button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Modal solicitud correo-->
            </template>
        </div>
    </div>
    <script src="Theme/plugins/jquery/jquery.min.js"></script>
    <script src="js/libs/jQuery-File-Upload-master/js/vendor/jquery.ui.widget.js"></script>
    <script src="js/libs/jQuery-File-Upload-master/js/jquery.iframe-transport.js"></script>
    <script src="js/libs/jQuery-File-Upload-master/js/jquery.fileupload.js"></script>
    <script src="js/libs/jQuery-File-Upload-master/js/jquery.fileupload-process.js"></script>
    <script src="js/libs/jQuery-File-Upload-master/js/jquery.fileupload-image.js"></script>
    <script src="js/libs/jQuery-File-Upload-master/js/jquery.fileupload-validate.js"></script>
    <script src="js/libs/jQuery-File-Upload-master/js/jquery.fileupload-ui.js"></script>
    <script src="js/Instrucciones1.js?2.0.4"></script>
</asp:Content>
