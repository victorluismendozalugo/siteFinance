<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Documentacion.aspx.cs" Inherits="WebSystems2021.Documentacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <%--PARA LAS FIRMAS--%>
    <link href="js/libs/jq-signature/css/default.css" rel="stylesheet" />
    <%--PARA LAS FIRMAS--%>
  
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

            .canvas {
                box-sizing: border-box;
                width: 300px !important;
                height: 200px;
                border: 1px solid black;
                background: rgb(255, 255, 255);
                cursor: crosshair;
            }

            canvas {
                box-sizing: border-box;
                width: 300px !important;
                height: 200px;
                border: 1px solid black;
                background: rgb(255, 255, 255);
                cursor: crosshair;
            }
            .texto-justificado{
                text-align: justify;
                }
        </style>
    <div id="vuePage">
        <div class="container">
            <template>

             <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title" v-if="usuario.tipoUsuario == 'PRESTAMO'">Datos del acreditado</h3>
                    <h3 class="card-title" v-else>Datos del cliente</h3>
                </div>
                <div class="card-body">

                     <div class="row" v-if="usuario.tipoUsuario == 'PRESTAMO'">
                        <div class="col-md-6 col-xs-6">
                            <label>Nombre del verificador</label>
                            <b-form-select class="form-control" v-model="documentacion.verificador" :options="optionsVerificadores">
                        </b-form-select>
                        </div>
                    </div>

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

            <div class="card card-info" v-if="usuario.tipoUsuario == 'PRESTAMO'">
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
                    <h3 class="card-title">Datos de cuenta para transferencia electrónica</h3>
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
                    <h3 class="card-title" v-if="usuario.tipoUsuario == 'PRESTAMO'">Referencias</h3>
                    <h3 class="card-title" v-else>Beneficiario</h3>
                </div>
                   <div class="card-body" v-if="usuario.tipoUsuario == 'INVERSION'">
                    <div class="row">
                        <div class="col-sm-6 col-xs-12">
                            <label>Nombre</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre1"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.referenciaNombre1 = v.toUpperCase()}"></b-form-input>
                        </div>
                         <div class="col-sm-3 col-xs-12">
                            <label>Parentesco</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.parentesco1"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.parentesco1 = v.toUpperCase()}"></b-form-input>
                        </div>
                        <div class="col-sm-3 col-xs-8">
                            <label>Fecha nacimiento</label>
                            <input type="text" class="form-control" v-model="documentacion.referenciaTelefono1" name="Teléfono"
                                maxlength="10" />
                        </div>
                    </div>
                       <br />
                       <div class="row">
                           <div class="col-sm-6 col-xs-6">
                            <label>Nombre de quién recomendó?</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre2"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.referenciaNombre2 = v.toUpperCase()}"></b-form-input>
                        </div>
                       </div>
                    </div>
                <div class="card-body" v-else>
                    <div class="row">
                        <div class="col-sm-6 col-xs-12">
                            <label>Referencia familiar</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre1"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.referenciaNombre1 = v.toUpperCase()}"></b-form-input>
                        </div>
                         <div class="col-sm-3 col-xs-12">
                            <label>Parentesco</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.parentesco1"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.parentesco1 = v.toUpperCase()}"></b-form-input>
                        </div>
                        <div class="col-sm-3 col-xs-8">
                            <label>Tel. referencia</label>
                            <input type="text" class="form-control" v-model="documentacion.referenciaTelefono1" name="Teléfono"
                                maxlength="10" />
                        </div>
                    </div>
                    <div class="row">
                         <div class="col-sm-6 col-xs-6">
                            <label>Referencia familiar</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre2"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.referenciaNombre2 = v.toUpperCase()}"></b-form-input>
                        </div>
                          <div class="col-sm-3 col-xs-12">
                            <label>Parentesco</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.parentesco2"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.parentesco2 = v.toUpperCase()}"></b-form-input>
                        </div>
                      <div class="col-sm-3 col-xs-8">
                            <label>Tel. referencia</label>
                            <input type="text" class="form-control" v-model="documentacion.referenciaTelefono2" name="Teléfono"
                                maxlength="10" />
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-sm-6 col-xs-12">
                            <label>Referencia amistad</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre3"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.referenciaNombre3 = v.toUpperCase()}"></b-form-input>
                        </div>
                           <div class="col-sm-3 col-xs-12">
                            <label>Parentesco</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.parentesco3"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.parentesco3 = v.toUpperCase()}"></b-form-input>
                        </div>
                     <div class="col-sm-3 col-xs-8">
                            <label>Tel. referencia</label>
                            <input type="text" class="form-control" v-model="documentacion.referenciaTelefono3" name="Teléfono"
                                maxlength="10" />
                        </div>
                    </div>
                     <div class="row">
                     <div class="col-sm-6 col-xs-12">
                            <label>Referencia amistad</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre4"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.referenciaNombre4 = v.toUpperCase()}"></b-form-input>
                        </div>
                           <div class="col-sm-3 col-xs-12">
                            <label>Parentesco</label>
                            <b-form-input type="text" class="form-control" v-model="documentacion.parentesco4"
                                name="Referencia" maxlength="100"
                                @input="v => { documentacion.parentesco4 = v.toUpperCase()}"></b-form-input>
                        </div>
                       <div class="col-sm-3 col-xs-8">
                            <label>Tel. referencia</label>
                            <input type="text" class="form-control" v-model="documentacion.referenciaTelefono4" name="Teléfono"
                                maxlength="10" />
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>

             <div class="card card-info" v-if="usuario.tipoUsuario=='PRESTAMO'">
                <div class="card-header">
                    <h3 class="card-title">Datos del préstamo</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                          <div class="col-sm-4 col-xs-8">
                           <label>Monto solicitado</label>
                          <b-form-select class="form-control" v-model="documentacion.montoSolicitado" :options="optionsMontoSolicitado" @change="calculaPagos">
                        </b-form-select>
                        </div>

                         <div class="col-sm-4 col-xs-8">
                           <label>Interés ordinario</label>
                       <input type="number" class="form-control" v-model="documentacion.interesOrdinario" name="Interés ordinario"
                              readonly />
                        </div>

                          <div class="col-sm-4 col-xs-8">
                           <label>Total a pagar</label>
                       <input type="number" class="form-control" v-model="documentacion.totalPagar" name="Total a pagar"
                              readonly />
                        </div>

                    </div>
                     <div class="row">
                     
                         <div class="col-sm-4 col-xs-8">
                           <label>Número de pagos</label>
                       <input type="number" class="form-control" v-model="numeroPagos"
                              readonly />
                        </div>

                         <div class="col-sm-4 col-xs-8">
                           <label>Frecuencia de pagos</label>
                                <b-form-input type="text" class="form-control w-100" v-model="frecuenciaPagosCredito" disabled></b-form-input>
                        </div>

                          <div class="col-sm-4 col-xs-8">
                           <label>Valor de cada pago</label>
                       <input type="number" class="form-control" v-model="documentacion.valorXpago" name="Valor de cada pago"
                              readonly />
                        </div>

                    </div>
                </div>
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

                        <div class="col-sm-4 col-xs-12" v-if="usuario.tipoUsuario == 'PRESTAMO'">
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
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-primary shadow-none">
                            <div class="card-header">
                                <h3 class="card-title">Contrato</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body" style="display: block;">
                                <p><image src="images/logoContrato.png" style="align-items:center;"></image></p>
                                <p class="texto-justificado">
                                    Contrato de Mutuo de Inversión que celebran por una parte PRESTA STAR-Z, S.A.P.I. ,de C.V. , SOFOM, E.N.R que en lo sucesivo se le denomina 
                                    “MUTUARIO/EMISOR”, y la persona cuyo nombre y firma se señalan abajo en los apartados de datos del contrato y en la carátula, 
                                    actuando en lo sucesivo como el “MUTUANTE/INVERSOR”.
                                </p>
                                <p>
                                <b>
                                    VI.- DECLARACIONES
                                </b>
                                    </p>
                                <p class="texto-justificado">
                                   A)	Declara el “INVERSOR” que : (I) Es una persona física o moral y que cuenta con la capacidad legal para la celebración de este acto; (II) Señala como domicilio los datos citados anteriormente; (III) Desea otorgar mediante un contrato de inversión y en beneficio del “EMISOR” la cantidad de dinero M.N./M.E. que le ha solicitado para que este lo utilice en la ejecución del negocio de PRESTA STAR-Z , S.A.P.I. de C.V., SOFOM, E.N.R., y para el seguimiento de consultas, solicitudes, aclaraciones, reclamaciones o quejas, el “INVERSOR” deberá de comunicarse a la unidad especializada del “EMISOR” de atención a usuarios ubicada en el estado de contratación de la inversión, cuyo domicilio, correo electrónico y teléfono son los siguientes: Correo electrónico: director@prestastar-z.com.mx; Domicilio: Calle Francisco Villa 202-3 Col. Centro, Culiacán, Sinaloa ,México C.P. 80000; Teléfono: 6672758518. El inversor a su vez, podrá acudir a la CONDUSEF en caso de cualquier queja o reclamación, los datos de contacto de la CONDUSEF son los siguientes: Teléfono: 01 800 999 8080 / 534 00 999; Página de internet: www.condusef.gob.mx o al correo electrónico: opinion@condusef.gob.mx
                                </p>
                                 <p class="texto-justificado">
                                   B)  Declara el “EMISOR”, por medio de su apoderado legal, bajo protesta de decir verdad que: (I) Es una Sociedad Anónima Promotora de Inversión de Capital Variable Sociedad Financiera de Objeto Múltiple, y para su constitución y operación no requiere autorización por parte de la SHCP, para la realización de sus operaciones de crédito, incluyendo la celebración del presente contrato. El domicilio principal del negocio del “EMISOR” se encuentra ubicado en Calle Francisco Villa 202-3 Col. Centro, Culiacán, Sinaloa, México C.P. 80000; (II) Su representante legal cuenta con los poderes y facultades suficientes para celebrar este contrato; (III) Libremente desea celebrar este contrato, previo a la firma del presente contrato; El “EMISOR” le informó al “INVERSOR” sobre la tasa de rendimiento, el monto total a pagar y el plazo, según se acordó en este instrumento; (IV) El “EMISOR” acepta tener pleno conocimiento de la inversión y los  cargos  correspondientes;  habiéndole  proporcionado  los  conceptos  debidamente  desglosados;  Está  consciente  y  conoce  todas  las obligaciones asumidas por virtud de la celebración de este contrato, no habiendo error, gozando plenamente de sus facultades mentales y contando con capacidad económica e ingresos suficientes para hacer frente a las obligaciones antes mencionadas y que no existe lesión, conducta inapropiada, dolo, mala fe, abuso o cargos ocultos; Y asume las obligaciones de pago derivadas de este contrato sin que exista alguna ventaja de posible apuro económico, necesidad urgente, extrema miseria, suma ignorancia o notoria inexperiencia del “EMISOR”.
                                 </p>
                                 <p>
                                <b>
                                    VII.- CLAUSULAS
                                </b>
                                    </p>
                                <p class="texto-justificado">
                                    1)	SERVICIOS  Y  ATENCIÓN  AL  CLIENTE,  RECIBOS,  ESTADOS  DE  CUENTA  Y  SERVICIOS  ADICIONALES.  Las  partes  acuerdan  que  el  “EMISOR”  no  está  obligado  a  enviar  al domicilio del “INVERSOR” estados de cuenta relacionados con la inversión. Los estados de cuenta estarán disponibles en todo momento para el “INVERSOR” en la pagina web www.prestastar-z.com.mx durante la vigencia de su inversión. Dichos estados de cuenta se generarán por periodos mensuales  con fecha de corte al último día calendario del mes que se trate. En caso de que el “INVERSOR” lo solicite al “EMISOR”, le expedirá el recibo correspondiente. En caso de que el “INVERSOR” desee presentar una consulta, aclaración, inconformidad o queja con el presente contrato, lo deberá presentar por medio de correo electrónico a director@prestastar-z.com.mx Dicha aclaración deberá ser acompañada con copia del presentes contrato, copia de su identificación vigente y el escrito de la queja
                                    <br />
                                    <br />
2)	OBJETO DEL PRESENTE CONTRATO DE INVERSIÓN Y MEDIOS DE PAGO PERMITIDOS. El “EMISOR” se obliga incondicionalmente a pagar en su totalidad al “INVERSOR” el monto total señalado en la sección III (DATOS DE LA INVERSIÓN) que es el monto de los intereses generados en el mes corriente y señalados en la sección III. El “INVERSOR” otorga en beneficio del “EMISOR” en calidad de mutuo por inversión con interés, la cantidad señalada en la sección III, conviniendo las partes en el interés señalado en la sección III, IVA INCLUIDO; la inversión se otorga por el período señalado en la sección III contado a partir de la suscripción del contrato, quedando de mutuo acuerdo el pago mensual del interés. El pago del rendimiento de la inversión será exigible de forma mensual durante la vigencia de la inversión conforme acordado por las partes, después de la fecha de firma del presente contrato y a partir de que haya sido aprobada la inversión por parte del “EMISOR” y hasta que sea retornado el monto total de la inversión, el presente contrato estará vigente, hasta en tanto sea retornado el monto total de la inversión al inversor y no sea prorrogable con la finalidad de garantizar y dar cumplimiento a las obligaciones que asume el “EMISOR” por virtud del presente contrato.

 Con 30 días de anticipación al término de la vigencia del contrato, el cliente deberá solicitar por medio su cuenta de inversionista en la pagina de www.prestastar-z.com.mx en la sección de RETIROS la inversión inicial que se establece en la sección III (DATOS DE LA INVERSION).

Se obliga al “EMISOR” a realizar cualquier pago pendiente que sea exigible conforme al presente contrato directamente al “INVERSOR” en las fechas estipuladas para ello en este contrato. Los pagos realizados por el “EMISOR”, podrán llevarse a cabo mediante pago en efectivo realizado en la sucursal del mismo o depósito en la cuenta bancaria que para el efecto este señale.
En caso de fallecimiento del inversor, el monto será entregado al beneficiario al término del presente contrato; en caso de que dicho beneficiario no presente solicitud de reclamación formal en un periodo de 60 días naturales, PRESTA STAR-Z , S.A.P.I. de C.V., SOFOM, E.N.R. se reserva el derecho sobre el monto recibido por parte del inversor.
<br />
 <br />
3)	 CANCELACIÓN ANTICIPADA. El “INVERSOR” o EL “BENEFICIARIO”  podrá cancelar y/o terminar el presente contrato de manera anticipada sin penalización alguna después de los 6 meses de la firma del contrato , si realiza la cancelación antes de los 6 meses será penalizado con el 30% del monto de inversión, el “EMISOR” cuenta con 30 días hábiles para reponer el 70% del monto de inversión estipulado en el presente contrato. El “EMISOR” podrá cancelar y/o terminar el presente contrato sin ninguna responsabilidad durante la vigencia del presente contrato posteriormente a la fecha que haya realizado la devolución del monto de la inversión. En caso de ejercer cancelación anticipada esta se deberá solicitar por escrito con 30 días de anticipación.
<br />
<br />
4)	MODIFICACIONES. El presente contrato podrá ser modificado únicamente para ampliar el plazo de inversión, para ello deberá firmarse un convenio entre ambas partes. En caso de requerir ampliación de capital de inversión deberá firmarse un contrato nuevo con su respectivo plazo forzoso.
<br />
<br />
5)	NOTIFICACIONES. Cualquier notificación al “EMISOR” deberá ser efectuada en el domicilio de dicho “EMISOR” conforme a derecho. Cualquier notificación al “INVERSOR” será efectuada en el domicilio proporcionado por el mismo en este contrato. El “INVERSOR” está obligado a notificar al “EMISOR” de cualquier cambio de domicilio dentro de los 10 días hábiles en que se hubiere efectuado, proporcionando a este último un comprobante de domicilio o alguna prueba del nuevo domicilio declarado.
<br />
<br />
6)	JURISDICCIÓN Y LEGISLACIÓN APLICABLE. Este contrato está sujeto a las leyes aplicables y jurisdicción de los tribunales del municipio de Culiacan , Sinaloa, renunciando las partes a la aplicación de cualquier otra ley o jurisdicción que pudiese corresponderles por virtud de sus domicilios presentes o futuros.
<br />
<br />
7)	CONSENTIMIENTO Y FIRMA. El “INVERSOR” reconoce y acepta con su firma que leyó, o le fue leído y explicado el presente contrato, previo a su firma, habiendo entendido la naturaleza y alcance de todas y cada una de las obligaciones estipuladas en este instrumento y obligándose en los términos que a continuación se establecen en el mismo. Leído el contrato y enteradas las partes de su alcance y contenido lo firman para obligarse en todos sus términos por triplicado, en la fecha indicada en sección III (DATOS DE LA INVERSIÓN) de datos de la inversión, quedando un ejemplar en poder del “INVERSOR” y dos ejemplares en poder del “EMISOR”.
<br />
<br />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="card card-info">
                    <div class="card-header">
                        <h3 class="card-title">Firma Contrato</h3>
                    </div>
                    <div class="card-body">
                        <div class="container">
                        	<div class="row">
				<div class="col-xs-12">
					<p>Su firma:</p>
					<div class="js-signature" data-width="300" data-height="200" data-border="1px solid black" 
                        data-line-color="#bc0000" data-auto-fit="true" ontouchmove="event.preventDefault();"></div>
					<p>

                              <b-button variant="default"  @click="clearCanvas()">
                                    <i class="fas fa-erase">
                                    </i> Limpiar
                            </b-button>

                                       <b-button variant="default"  @click="saveSignature()">
                                    <i class="fas fa-save">
                                    </i> Generar
                            </b-button>
                                </p>
                              <div id="signature">
						<p><em>Su firma aparecerá aquí cuando haga clic en "Guardar firma"</em></p>
					</div>
                            </div>
                        </div>
                            </div>
                    </div>
                </div>
                <div class="form-group row">
                        <div class="col">
                            <b-button variant="primary" class="float-right" @click="GuardarDocumentacion()">
                                <template  v-if="estaGuardando">
                                    <div class="text-center text-default my-2">
                                        <b-spinner small class="align-middle"></b-spinner>
                                        Guardando
                                    </div>
                                 </template>
                                 <template v-else>
                                    <i class="fas fa-save">
                                    </i> Guardar
                                 </template>
                            </b-button>
                        </div>
                    </div>
        </template>
        </div>
    </div>
    <script src="js/libs/jq-signature/js/jquery-1.11.0.min.js"></script>
    <script src="js/Documentacion.js?20.1.0"></script>
</asp:Content>
