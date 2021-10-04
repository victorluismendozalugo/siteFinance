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
                         <div class="col-3">
                          <label>Nombre</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.nombre" disabled></b-form-input>
                            </div>
                         <div class="col-3">
                          <label>A. Paterno</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.apaterno" disabled></b-form-input>
                            </div>
                         <div class="col-3">
                          <label>A. Materno</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.amaterno" disabled></b-form-input>
                            </div>
                      <div class="col-3">
                          <label>Género</label>
                          <b-form-select class="form-control" v-model="documentacion.genero" :options="optionsGenero">
                        </b-form-select>
                    </div>
                </div>
                     <div class="row">
                         <div class="col-3">
                          <label>Fecha nacimiento</label>
                            <b-form-input type="date" class="form-control" v-model="documentacion.fechaNacimiento"></b-form-input>
                            </div>
                         <div class="col-3">
                          <label>Edad</label>
                            <b-form-input type="number" class="form-control" v-model="documentacion.edad"></b-form-input>
                            </div>
                         <div class="col-3">
                          <label>Pais de nacimiento</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.paisNacimiento"></b-form-input>
                            </div>
                        <div class="col-3">
                          <label>Nacionalidad</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.nacionalidad"></b-form-input>
                            </div>
                </div>
                      <div class="row">
                         <div class="col-4">
                          <label>CURP</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.curp"></b-form-input>
                            </div>
                         <div class="col-4">
                          <label>RFC</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.rfc"></b-form-input>
                            </div>
                         <div class="col-4">
                          <label>Nivel de estudios</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.nivelEstudios"></b-form-input>
                            </div>
                        </div>
                     <div class="row">
                         <div class="col-4">
                          <label>Estado civil</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.edoCivil"></b-form-input>
                            </div>
                         <div class="col-4">
                          <label>Ocupacion</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.ocupacion"></b-form-input>
                            </div>
                         <div class="col-4">
                          <label>Correo electrónico</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.correo" disabled></b-form-input>
                            </div>
                        </div>

                       <div class="row">
                         <div class="col-6">
                          <label>Domicilio(calle y número)</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.calleNumero"></b-form-input>
                            </div>
                         <div class="col-4">
                          <label>Colonia</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.colonia"></b-form-input>
                            </div>
                         <div class="col-2">
                          <label>CP</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.codigoPostal"></b-form-input>
                            </div>
                        </div>

                       <div class="row">
                         <div class="col-3">
                          <label>Municipio</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.municipio"></b-form-input>
                            </div>
                         <div class="col-3">
                          <label>Estado</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.estado"></b-form-input>
                            </div>
                         <div class="col-3">
                          <label>País</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.pais"></b-form-input>
                            </div> 
                           <div class="col-3">
                          <label>Tiempo de vivir (años)</label>
                            <b-form-input type="number" class="form-control" v-model="documentacion.tiempoVivir"></b-form-input>
                            </div>
                        </div>

                        <div class="row">
                         <div class="col-4">
                          <label>Teléfono</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.telefonoCasa"></b-form-input>
                            </div>
                         <div class="col-4">
                          <label>Celular</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.celular" disabled></b-form-input>
                            </div>
                         <div class="col-4">
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
                            <div class="col-6">
                          <label>Nombre de la empresa para la que trabaja </label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.nombreEmpresa"></b-form-input>
                            </div>
                         <div class="col-6">
                          <label>Domicilio(calle y número)</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.calleNumeroEmpresa"></b-form-input>
                            </div>
                        </div>

                        <div class="row">
                               <div class="col-3">
                          <label>Colonia</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.coloniaEmpresa"></b-form-input>
                            </div>
                               <div class="col-3">
                          <label>Municipio</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.municipioEmpresa"></b-form-input>
                            </div>
                         <div class="col-3">
                          <label>Estado</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.estadoEmpresa"></b-form-input>
                            </div>
                         <div class="col-3">
                          <label>CP</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.codigoPostalEmpresa"></b-form-input>
                            </div>
                         </div>

                     <div class="row">
                               <div class="col-3">
                          <label>Teléfono</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.telefonoEmpresa"></b-form-input>
                            </div>
                               <div class="col-3">
                          <label>Antigúedad (años)</label>
                            <b-form-input type="number" class="form-control" v-model="documentacion.antiguedad"></b-form-input>
                            </div>
                         <div class="col-3">
                          <label>Ingreso Mensual</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.ingresoMensual"></b-form-input>
                            </div>
                         <div class="col-3">
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
                         <div class="col-4">
                          <label>Nombre</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.nombreConyugue"></b-form-input>
                            </div>
                         <div class="col-4">
                          <label>A. Paterno</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.apellidoPConyugue"></b-form-input>
                            </div>
                         <div class="col-4">
                          <label>A. Materno</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.apellidoMConyugue"></b-form-input>
                         </div>
                     </div>
                     <div class="row">
                         <div class="col-3">
                          <label>Teléfono</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.telefonoConyugue"></b-form-input>
                            </div>
                         <div class="col-3">
                          <label>Celular</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.celularConyugue"></b-form-input>
                            </div>
                         <div class="col-3">
                          <label>Ocupación</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.ocupacionConyugue"></b-form-input>
                         </div>
                         <div class="col-3">
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
                        <div class="col-8">
                            <label>Referencia</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre1"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.referenciaNombre1 = v.toUpperCase()}"></b-form-input>
                        </div>
                        <div class="col-4">
                            <label>Tel. referencia</label>
                            <input type="text" class="form-control" v-model="documentacion.referenciaTelefono1" name="Teléfono"
                                maxlength="10" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <label>Referencia</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre2"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.referenciaNombre2 = v.toUpperCase()}"></b-form-input>
                        </div>
                        <div class="col-4">
                            <label>Tel. referencia</label>
                            <input type="text" class="form-control" v-model="documentacion.referenciaTelefono2" name="Teléfono"
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
                        <div class="col-4">
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

                        <div class="col-4">
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

                        <div class="col-4">
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
                        <b-button variant="info" class="float-right" @click="Imprimir()">
                        <i class="fas fa-print"></i> Imprimir
                    </b-button>
                    </div>
                
              </div>
                                 <%--   <pre>{{this.documentacion}}</pre>--%>

        </template>
        </div>
    </div>
    <script src="js/Documentacion.js"></script>
</asp:Content>
