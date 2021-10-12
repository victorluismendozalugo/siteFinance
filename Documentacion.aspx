<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Documentacion.aspx.cs" Inherits="WebSystems2021.Documentacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="vuePage">
        <div class="container">
            <template>

             <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">Datos del acreditado</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                         <div class="col-md-3 col-xs-6">
                          <label>Nombre</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.nombre" disabled></b-form-input>
                            </div>
                          <div class="col-md-3 col-xs-6">
                          <label>A. Paterno</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.apaterno" disabled></b-form-input>
                            </div>
                         <div class="col-md-3 col-xs-6">
                          <label>A. Materno</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.amaterno" disabled></b-form-input>
                            </div>
                      <div class="col-md-3 col-xs-6">
                          <label>Género</label>
                          <b-form-select class="form-control" v-model="documentacion.genero" :options="optionsGenero">
                        </b-form-select>
                    </div>
                </div>
                     <div class="row">
                          <div class="col-md-3 col-xs-6">
                          <label>Fecha nacimiento</label>
                            <b-form-input type="date" class="form-control" v-model="documentacion.fechaNacimiento"></b-form-input>
                            </div>
                          <div class="col-md-3 col-xs-6">
                          <label>Edad</label>
                            <b-form-input type="number" class="form-control" v-model="documentacion.edad"></b-form-input>
                            </div>
                          <div class="col-md-3 col-xs-6">
                          <label>Pais de nacimiento</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.paisNacimiento"></b-form-input>
                            </div>
                         <div class="col-md-3 col-xs-6">
                          <label>Nacionalidad</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.nacionalidad"></b-form-input>
                            </div>
                </div>
                      <div class="row">
                         <div class="col-md-4 col-xs-6">
                          <label>CURP</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.curp"></b-form-input>
                            </div>
                         <div class="col-md-4 col-xs-6">
                          <label>RFC</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.rfc"></b-form-input>
                            </div>
                         <div class="col-md-4 col-xs-6">
                          <label>Nivel de estudios</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.nivelEstudios"></b-form-input>
                            </div>
                        </div>
                     <div class="row">
                         <div class="col-md-4 col-xs-6">
                          <label>Estado civil</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.edoCivil"></b-form-input>
                            </div>
                         <div class="col-md-4 col-xs-6">
                          <label>Ocupacion</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.ocupacion"></b-form-input>
                            </div>
                          <div class="col-md-4 col-xs-6">
                          <label>Correo electrónico</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.correo" disabled></b-form-input>
                            </div>
                        </div>

                       <div class="row">
                         <div class="col-md-6 col-xs-12">
                          <label>Domicilio(calle y número)</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.calleNumero"></b-form-input>
                            </div>
                         <div class="col-md-4 col-xs-3">
                          <label>Colonia</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.colonia"></b-form-input>
                            </div>
                         <div class="col-md-2 col-xs-3">
                          <label>CP</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.codigoPostal"></b-form-input>
                            </div>
                        </div>

                       <div class="row">
                         <div class="col-md-3 col-xs-6">
                          <label>Municipio</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.municipio"></b-form-input>
                            </div>
                       <div class="col-md-3 col-xs-6">
                          <label>Estado</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.estado"></b-form-input>
                            </div>
                          <div class="col-md-3 col-xs-6">
                          <label>País</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.pais"></b-form-input>
                            </div> 
                            <div class="col-md-3 col-xs-6">
                          <label>Tiempo de vivir (años)</label>
                            <b-form-input type="number" class="form-control" v-model="documentacion.tiempoVivir"></b-form-input>
                            </div>
                        </div>

                        <div class="row">
                              <div class="col-md-3 col-xs-6">
                          <label>Tipo vivienda</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.tipoVivienda" maxlength="30"></b-form-input>
                            </div>
                         <div class="col-md-3 col-xs-6">
                          <label>Teléfono</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.telefonoCasa"></b-form-input>
                            </div>
                         <div class="col-md-3 col-xs-6">
                          <label>Celular</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.celular" disabled></b-form-input>
                            </div>
                         <div class="col-md-3 col-xs-6">
                          <label>Entidad Fed. Nacimiento</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.entidadFederativa"></b-form-input>
                            </div>
                        </div>
                   </div>
            </div>

            <div class="card card-info">
                  <div class="card-header">
                    <h3 class="card-title">Empleo</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 col-xs-6">
                          <label>Nombre de la empresa para la que trabaja </label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.nombreEmpresa"></b-form-input>
                            </div>
                         <div class="col-md-6 col-xs-6">
                          <label>Domicilio(calle y número)</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.calleNumeroEmpresa"></b-form-input>
                            </div>
                        </div>

                        <div class="row">
                               <div class="col-md-3 col-xs-6">
                          <label>Colonia</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.coloniaEmpresa"></b-form-input>
                            </div>
                               <div class="col-md-3 col-xs-6">
                          <label>Municipio</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.municipioEmpresa"></b-form-input>
                            </div>
                         <div class="col-md-3 col-xs-6">
                          <label>Estado</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.estadoEmpresa"></b-form-input>
                            </div>
                       <div class="col-md-3 col-xs-6">
                          <label>CP</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.codigoPostalEmpresa"></b-form-input>
                            </div>
                         </div>

                     <div class="row">
                             <div class="col-md-3 col-xs-6">
                          <label>Teléfono</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.telefonoEmpresa"></b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-4">
                          <label>Antigúedad (años)</label>
                            <b-form-input type="number" class="form-control" v-model="documentacion.antiguedad"></b-form-input>
                            </div>
                       <div class="col-md-3 col-xs-6">
                          <label>Ingreso Mensual</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.ingresoMensual"></b-form-input>
                            </div>
                          <div class="col-md-3 col-xs-6">
                          <label>Frecuencia de pago</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.frecuenciaPago"></b-form-input>
                            </div>

                         </div>
                </div>
            </div>

           <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">Datos del conyuge</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                         <div class="col-md-4 col-xs-6">
                          <label>Nombre</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.nombreConyugue"></b-form-input>
                            </div>
                  <div class="col-md-4 col-xs-6">
                          <label>A. Paterno</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.apellidoPConyugue"></b-form-input>
                            </div>
                          <div class="col-md-4 col-xs-6">
                          <label>A. Materno</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.apellidoMConyugue"></b-form-input>
                         </div>
                     </div>
                     <div class="row">
                   <div class="col-md-3 col-xs-6">
                          <label>Teléfono</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.telefonoConyugue"></b-form-input>
                            </div>
                       <div class="col-md-3 col-xs-6">
                          <label>Celular</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.celularConyugue"></b-form-input>
                            </div>
                        <div class="col-md-3 col-xs-6">
                          <label>Ocupación</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.ocupacionConyugue"></b-form-input>
                         </div>
                       <div class="col-md-3 col-xs-6">
                          <label>Ingreso Mensual</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.ingresoMensualConyugue"></b-form-input>
                         </div>
                     </div>
                </div>
           </div>

                 <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">Datos de cuenta del deudor para transferencia electrónica</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                         <div class="col-12">
                          <label>Institución de crédito</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.bancoCredito"></b-form-input>
                            </div>
                     </div>
                      <div class="row">
                         <div class="col-12">
                          <label>Cta. CLABE o Tarjeta Bancaria</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.ctaClabeTarjeta"></b-form-input>
                            </div>
                     </div>
                </div>
           </div>

            <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">Referencias</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-8 col-xs-12">
                            <label>Referencia</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre1"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.referenciaNombre1 = v.toUpperCase()}"></b-form-input>
                        </div>
                        <div class="col-sm-4 col-xs-8">
                            <label>Tel. referencia</label>
                            <input type="text" class="form-control" v-model="documentacion.referenciaTelefono1" name="Teléfono"
                                maxlength="10" />
                        </div>
                    </div>
                    <div class="row">
                         <div class="col-sm-8 col-xs-6">
                            <label>Referencia</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre2"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.referenciaNombre2 = v.toUpperCase()}"></b-form-input>
                        </div>
                      <div class="col-sm-4 col-xs-8">
                            <label>Tel. referencia</label>
                            <input type="text" class="form-control" v-model="documentacion.referenciaTelefono2" name="Teléfono"
                                maxlength="10" />
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-sm-8 col-xs-12">
                            <label>Referencia</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre3"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.referenciaNombre3 = v.toUpperCase()}"></b-form-input>
                        </div>
                     <div class="col-sm-4 col-xs-8">
                            <label>Tel. referencia</label>
                            <input type="text" class="form-control" v-model="documentacion.referenciaTelefono3" name="Teléfono"
                                maxlength="10" />
                        </div>
                    </div>
                     <div class="row">
                     <div class="col-sm-8 col-xs-12">
                            <label>Referencia</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre4"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.referenciaNombre4 = v.toUpperCase()}"></b-form-input>
                        </div>
                       <div class="col-sm-4 col-xs-8">
                            <label>Tel. referencia</label>
                            <input type="text" class="form-control" v-model="documentacion.referenciaTelefono4" name="Teléfono"
                                maxlength="10" />
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
            <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">Documentación</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4 col-xs-12">
                            <label for="files1" class="custom-input btn btn-success col fileinput-button"><i
                                    class="fas fa-upload"></i>&nbsp; Cargar
                                identificación</label>
                            <input @change="handleImage1" class="custom-input btn btn-success col fileinput-button" type="file"
                                accept="image/*,application/pdf" style="visibility:hidden;" id="files1">
                            <img class="imgCargas" :src="identificacion" alt="" style="width:100%; max-width:150px;">
                            <div class="container" id="ident">
                                <iframe :src="PDFidentificacion" tyle="width:100%; max-width:150px;" frameborder="0"></iframe>
                            </div>
                        </div>

                       <div class="col-sm-4 col-xs-12">
                            <label for="files2" class="custom-input btn btn-success col fileinput-button"><i
                                    class="fas fa-upload"></i>&nbsp; Cargar
                                comprobante de domicilio</label>
                            <input @change="handleImage2" class="custom-input btn btn-success col fileinput-button" type="file"
                                accept="image/*,application/pdf" style="visibility:hidden;" id="files2">
                            <img class="imgCargas" :src="compDomicilio" alt="" style="width:100%; max-width:150px;">
                            <div class="container">
                                <iframe :src="PDFcompDomicilio" style="width:100%; max-width:150px;" frameborder="0"></iframe>
                            </div>
                        </div>

                        <div class="col-sm-4 col-xs-12">
                            <label for="files3" class="custom-input btn btn-success col fileinput-button"><i
                                    class="fas fa-upload"></i>&nbsp; Cargar
                                comprobante de ingresos</label>
                            <input @change="handleImage3" class="custom-input btn btn-success col fileinput-button" type="file"
                                accept="image/*,application/pdf" style="visibility:hidden;" id="files3">
                            <img class="imgCargas" :src="compIngresos" alt="" style="width:100%; max-width:150px;">
                            <div class="container">
                                <iframe :src="PDFcompIngresos" style="width:100%; max-width:150px;" frameborder="0"></iframe>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
          


              <div class="form-group row">
                    <div class="col">
                     <b-button variant="primary" class="float-right" @click="GuardarDocumentacion()">
                        <i class="fas fa-save"></i> Guardar
                    </b-button>
                       <b-button variant="info" class="float-right" @click="GeneraSolicitud()">
                        <i class="fas fa-download"></i> Descargar solicitud
                    </b-button>
                    </div>
                
              </div>
           
                <%--modal reporte--%>
<%--                   <b-modal id="modal-reporte" size="lg" hide-footer>

                   <div id="tablaReporte" class="demo">
                             <table style="border-collapse:collapse;margin-left:5.834pt" cellspacing="0">
                <tr style="height:19pt">
                    <td style="width:395pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="6" rowspan="2">
                        <p style="text-indent: 0pt;text-align: left;"><br /></p>
                        <p style="padding-left: 94pt;text-indent: 0pt;text-align: left;"><span><img width="244" height="39"
                                    alt="image" src="images/Logo.jpeg" /></span></p>
                    </td>
                    <td
                        style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Fecha</p>
                    </td>
                </tr>
                <tr style="height:19pt">
                    <td
                        style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="llenarTabla">{{documentacion.fechaRegistro}}</p>
                    </td>
                </tr>
                <tr style="height:19pt">
                    <td style="width:395pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="6" rowspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">¿porque
                            medio se entero?</p>
                    </td>
                    <td
                        style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Numero de
                            solicitud</p>     
                    </td>
                </tr>
                <tr style="height:19pt">
                    <td
                        style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                               <p class="llenarTabla">{{documentacion.iDSolicitud}}</p>
                    </td>
                </tr>
                <tr style="height:19pt">
                    <td style="width:276pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="4">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Nombre del
                            Verificador:</p>
                    </td>
                    <td style="width:277pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Ciudad y
                            Estado:</p>
                    </td>
                </tr>
                <tr style="height:10pt">
                    <td style="width:553pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="7" bgcolor="#2F5395">
                        <p class="s3"
                            style="padding-left: 122pt;padding-right: 122pt;text-indent: 0pt;line-height: 8pt;text-align: center;">
                            DATOS DEL ACREDITADO</p>
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Nombre(s)</p>
                        <p class="llenarTabla">{{documentacion.nombre}}</p>
                    </td>
                    <td
                        style="width:79pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">A. Paterno</p>
                        <p class="llenarTabla">{{documentacion.apaterno}}</p>
                    </td>
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">A. Materno</p>
                             <p class="llenarTabla">{{documentacion.amaterno}}</p>
                        </td>
                    <td
                        style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Genero</p>
                   <p class="llenarTabla">{{documentacion.genero}}</p>
                        </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Fecha de
                            nacimiento</p>
                         <p class="llenarTabla">{{documentacion.fechaNacimiento}}</p>
                    </td>
                    <td
                        style="width:79pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Edad</p>
                         <p class="llenarTabla">{{documentacion.edad}}</p>  
                    </td>
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Pais de
                            Nacimiento</p>
                           <p class="llenarTabla">{{documentacion.paisNacimiento}}</p>
                    </td>
                    <td
                        style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">
                            Nacionalidad</p>
                           <p class="llenarTabla">{{documentacion.nacionalidad}}</p>
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:197pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Curp</p>
                         <p class="llenarTabla">{{documentacion.curp}}</p>
                    </td>
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">RFC</p>
                         <p class="llenarTabla">{{documentacion.rfc}}</p>
                    </td>
                    <td
                        style="width:198pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Nivel de
                            Estudios</p>
                         <p class="llenarTabla">{{documentacion.nivelEstudios}}</p>  
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Estado
                            Civil</p>
                            <p class="llenarTabla">{{documentacion.edoCivil}}</p>  
                    </td>
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Ocupacion
                        </p>
                          <p class="llenarTabla">{{documentacion.ocupacion}}</p>  
                    </td>
                    <td style="width:237pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Correo
                            Electronico</p>
                        <p class="llenarTabla">{{documentacion.correo}}</p>  
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:276pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="4">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">
                            Domicilio(Calle, Numero exterior e interior)</p>
                             <p class="llenarTabla">{{documentacion.calleNumero}}</p>  
                    </td>
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Colonia</p>
                         <p class="llenarTabla">{{documentacion.colonia}}</p>  
                    </td>
                    <td
                        style="width:119pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Codigo
                            Postal</p>
                         <p class="llenarTabla">{{documentacion.codigoPostal}}</p>  
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Municipio
                        </p>
                          <p class="llenarTabla">{{documentacion.municipio}}</p>  
                    </td>
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Estado</p>
                          <p class="llenarTabla">{{documentacion.estado}}</p>  
                    </td>
                    <td
                        style="width:118pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Pais</p>
                          <p class="llenarTabla">{{documentacion.pais}}</p>  
                    </td>
                    <td
                        style="width:119pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Tiempo de
                            vivir ahí</p>
                          <p class="llenarTabla">{{documentacion.tiempoVivir}}</p>  
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:118pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Tipo de
                            vivienda</p>
                         <p class="llenarTabla">{{documentacion.tipoVivienda}}</p>  
                    </td>
                    <td
                        style="width:119pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Telefono de
                            Casa</p>
                         <p class="llenarTabla">{{documentacion.telefonoCasa}}</p>  
                    </td>
                    <td style="width:118pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Telefono
                            Celular</p>
                         <p class="llenarTabla">{{documentacion.celular}}</p>  
                    </td>
                    <td
                        style="width:198pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Entidad
                            Federativa de Nacimiento</p>
                          <p class="llenarTabla">{{documentacion.entidadFederativa}}</p>  
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:237pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Nombre de
                            la Empresa ala que trabaja</p>
                         <p class="llenarTabla">{{documentacion.nombreEmpresa}}</p>  
                    </td>
                    <td style="width:316pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="4">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">
                            Domicilio(Calle, Numero exterior e interior)</p>
                         <p class="llenarTabla">{{documentacion.calleNumeroEmpresa}}</p>  
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Colonia</p>
                         <p class="llenarTabla">{{documentacion.coloniaEmpresa}}</p>  
                    </td>
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Municipio
                        </p>
                         <p class="llenarTabla">{{documentacion.municipioEmpresa}}</p>  
                    </td>
                    <td
                        style="width:118pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Estado</p>
                           <p class="llenarTabla">{{documentacion.estadoEmpresa}}</p>  
                    </td>
                    <td
                        style="width:119pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Codigo
                            Postal</p>
                            <p class="llenarTabla">{{documentacion.codigoPostalEmpresa}}</p>  
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Telefono y
                            Extension</p>
                         <p class="llenarTabla">{{documentacion.telefonoEmpresa}}</p>  
                    </td>
                    <td style="width:118pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Antigüedad
                        </p>
                         <p class="llenarTabla">{{documentacion.antiguedad}}</p>  
                    </td>
                    <td style="width:119pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Ingreso
                            Mensual</p>
                         <p class="llenarTabla">{{documentacion.ingresoMensual}}</p>  
                    </td>
                    <td
                        style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Frecuencia
                            de Pago</p>
                         <p class="llenarTabla">{{documentacion.frecuenciaPago}}</p>  
                    </td>
                </tr>
                <tr style="height:10pt">
                    <td style="width:553pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="7" bgcolor="#2F5395">
                        <p class="s3"
                            style="padding-left: 122pt;padding-right: 122pt;text-indent: 0pt;line-height: 8pt;text-align: center;">
                            DATOS DEL CONYUGUE</p>
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:237pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Nombre(s)
                        </p>
                           <p class="llenarTabla">{{documentacion.nombreConyugue}}</p> 
                    </td>
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Apellido
                            Paterno</p>
                           <p class="llenarTabla">{{documentacion.apellidoPConyugue}}</p> 
                    </td>
                    <td
                        style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Apellido
                            Materno</p>
                        <p class="llenarTabla">{{documentacion.apellidoMConyugue}}</p> 
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="2">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Telefono de
                            Casa</p>
                          <p class="llenarTabla">{{documentacion.telefonoConyugue}}</p> 
                    </td>
                    <td style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Telefono
                            Celular</p>
                          <p class="llenarTabla">{{documentacion.celularConyugue}}</p> 
                    </td>
                    <td
                        style="width:118pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Ocupacion
                        </p>
                        <p class="llenarTabla">{{documentacion.ocupacionConyugue}}</p> 
                    </td>
                    <td
                        style="width:119pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Ingreso
                            Mensual</p>
                        <p class="llenarTabla">{{documentacion.ingresoMensualConyugue}}</p> 
                    </td>
                </tr>
                <tr style="height:10pt">
                    <td style="width:553pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="7" bgcolor="#2F5395">
                        <p class="s3"
                            style="padding-left: 122pt;padding-right: 122pt;text-indent: 0pt;line-height: 8pt;text-align: center;">
                            PORFAVOR PROPORCIONE DOS REFERENCIAS QUE NO VIVAN CON USTED</p>
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td
                        style="width:64pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Nombre(s)
                        </p>
                         <p class="llenarTabla">{{documentacion.referenciaNombre1}}</p> 
                        
                    </td>
                    <td
                        style="width:94pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p class="s1" style="padding-left: 23pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Apellido
                            Paterno</p>
                    </td>
                    <td
                        style="width:79pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p class="s1" style="padding-left: 6pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Apellido
                            Materno</p>
                    </td>
                    <td
                        style="width:39pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p style="text-indent: 0pt;text-align: left;"><br /></p>
                    </td>
                    <td
                        style="width:40pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p style="text-indent: 0pt;text-align: left;"><br /></p>
                    </td>
                    <td
                        style="width:118pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Parentesco
                        </p>
                    </td>
                    <td
                        style="width:119pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Telefono
                            Cel o Local</p>
                           <p class="llenarTabla">{{documentacion.referenciaTelefono1}}</p> 
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td
                        style="width:64pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Nombre(s)
                        </p>
                          <p class="llenarTabla">{{documentacion.referenciaNombre2}}</p> 
                    </td>
                    <td
                        style="width:94pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p class="s1" style="padding-left: 23pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Apellido
                            Paterno</p>
                    </td>
                    <td
                        style="width:79pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p class="s1" style="padding-left: 6pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Apellido
                            Materno</p>
                    </td>
                    <td
                        style="width:39pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p style="text-indent: 0pt;text-align: left;"><br /></p>
                    </td>
                    <td
                        style="width:40pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p style="text-indent: 0pt;text-align: left;"><br /></p>
                    </td>
                    <td
                        style="width:118pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Parentesco
                        </p>
                    </td>
                    <td
                        style="width:119pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Telefono
                            Cel o Local</p>
                          <p class="llenarTabla">{{documentacion.referenciaTelefono2}}</p> 
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td
                        style="width:64pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Nombre(s)
                        </p>
                    </td>
                    <td
                        style="width:94pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p class="s1" style="padding-left: 23pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Apellido
                            Paterno</p>
                    </td>
                    <td
                        style="width:79pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p class="s1" style="padding-left: 6pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Apellido
                            Materno</p>
                    </td>
                    <td
                        style="width:39pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p style="text-indent: 0pt;text-align: left;"><br /></p>
                    </td>
                    <td
                        style="width:40pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p style="text-indent: 0pt;text-align: left;"><br /></p>
                    </td>
                    <td
                        style="width:118pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Parentesco
                        </p>
                    </td>
                    <td
                        style="width:119pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Telefono
                            Cel o Local</p>
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td
                        style="width:64pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Nombre(s)
                        </p>
                    </td>
                    <td
                        style="width:94pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p class="s1" style="padding-left: 23pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Apellido
                            Paterno</p>
                    </td>
                    <td
                        style="width:79pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p class="s1" style="padding-left: 6pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Apellido
                            Materno</p>
                    </td>
                    <td
                        style="width:39pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt">
                        <p style="text-indent: 0pt;text-align: left;"><br /></p>
                    </td>
                    <td
                        style="width:40pt;border-top-style:solid;border-top-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p style="text-indent: 0pt;text-align: left;"><br /></p>
                    </td>
                    <td
                        style="width:118pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Parentesco
                        </p>
                    </td>
                    <td
                        style="width:119pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s1" style="padding-left: 1pt;text-indent: 0pt;line-height: 11pt;text-align: left;">Telefono
                            Cel o Local</p>
                    </td>
                </tr>
                <tr style="height:10pt">
                    <td style="width:553pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="7" bgcolor="#2F5395">
                        <p class="s4"
                            style="padding-left: 122pt;padding-right: 122pt;text-indent: 0pt;line-height: 8pt;text-align: center;">
                            DATOS DE LA CUENTA DEL DEUDOR PARA TRANSFERENCIA ELECTRONICA</p>
                    </td>
                </tr>
                <tr style="height:20pt">
                    <td style="width:553pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="7">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Institucion
                            de Credito:</p>
                       <p class="llenarTabla">{{documentacion.bancoCredito}}</p> 
                    </td>
                </tr>
                <tr style="height:20pt">
                    <td style="width:553pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="7">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Numero de
                            Cuenta CLABE o Tarjeta Bancaria:</p>
                           <p class="llenarTabla">{{documentacion.ctaClabeTarjeta}}</p> 
                    </td>
                </tr>
                <tr style="height:10pt">
                    <td style="width:553pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="7" bgcolor="#2F5395">
                        <p class="s3"
                            style="padding-left: 122pt;padding-right: 122pt;text-indent: 0pt;line-height: 8pt;text-align: center;">
                            DESCRIPCION DEL CREDITO SOLICITADO</p>
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:197pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Monto del
                            Credito</p>
                    </td>
                    <td style="width:198pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Intereses
                            Ordinario</p>
                    </td>
                    <td
                        style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Total a
                            Pagar</p>
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:197pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Numero de
                            Pagos</p>
                    </td>
                    <td style="width:198pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Frecuencia
                            de Pago</p>
                    </td>
                    <td
                        style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Valor de
                            cada Pago</p>
                    </td>
                </tr>
                <tr style="height:10pt">
                    <td style="width:553pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="7" bgcolor="#2F5395">
                        <p class="s3"
                            style="padding-left: 122pt;padding-right: 120pt;text-indent: 0pt;line-height: 8pt;text-align: center;">
                            DESCRIPCION DEL CREDITO AUTORIZADO</p>
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:197pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Monto del
                            Credito</p>
                    </td>
                    <td style="width:198pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Intereses
                            Ordinario</p>
                    </td>
                    <td
                        style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Total a
                            Pagar</p>
                    </td>
                </tr>
                <tr style="height:21pt">
                    <td style="width:197pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Numero de
                            Pagos</p>
                    </td>
                    <td style="width:198pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"
                        colspan="3">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Frecuencia
                            de Pago</p>
                    </td>
                    <td
                        style="width:158pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                        <p class="s2" style="padding-left: 1pt;text-indent: 0pt;line-height: 10pt;text-align: left;">Valor de
                            cada Pago</p>
                    </td>
                </tr>
            </table>
<%--                           <br />
                           <br />
                           <br />
                           <div class="row">
                                <p style="text-indent: 0pt;text-align: left;"><br /></p>
                            <p style="padding-left: 126pt;text-indent: 0pt;line-height: 1pt;text-align: left;"><span><img width="408" height="2"
                                        alt="image" src="images/firma.png" /></span></p>
                             <p style="padding-left: 17rem; text-indent: 0pt; line-height: 1pt; text-align: center;"><span>NOMBRE Y FIRMA DEL SOLICITANTE</span></p>
                        </div>
                        </div>

                   <div class="modal-footer">
                           <b-button variant="info" class="float-right" @click="GeneraSolicitud()">
                        <i class="fas fa-download"></i> Descargar solicitud
                    </b-button>
                </div>

                   </b-modal>--%>

        </template>
        </div>
    </div>
    <script src="js/Documentacion.js"></script>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            text-indent: 0;
        }

        .s1 {
            color: black;
            font-family: Calibri, sans-serif;
            font-style: italic;
            font-weight: normal;
            text-decoration: none;
            font-size: 9pt;
            margin: 0pt;
        }

        .s2 {
            color: black;
            font-family: Calibri, sans-serif;
            font-style: italic;
            font-weight: normal;
            text-decoration: none;
            font-size: 8pt;
            margin: 0pt;
        }

        .s3 {
            color: black;
            font-family: Calibri, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 10pt;
            margin: 0pt;
        }

        .s4 {
            color: black;
            font-family: Calibri, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 9pt;
            margin: 0pt;
        }

        /*        p {
            color: black;
            font-family: Calibri, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 11pt;
            margin: 0pt;
        }*/
        .llenarTabla {
            color: black;
            font-family: Calibri, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 11pt;
            margin: 0pt;
        }

        table,
        tbody {
            vertical-align: top;
            overflow: visible;
        }
    </style>
</asp:Content>
