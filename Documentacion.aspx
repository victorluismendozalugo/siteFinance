<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Documentacion.aspx.cs" Inherits="WebSystems2021.Documentacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="js/libs/jq-signature/css/default.css" rel="stylesheet" />

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

        .texto-justificado {
            text-align: justify;
        }
    </style>
    <div id="vuePage">
        <div class="container">
            <template>

                <div class="card card-info">
                    <div class="card-header">
                        <h3 class="card-title" v-if="usuario.tipoUsuario == 'PRESTAMO'">Datos del acreditado
                        </h3>
                        <h3 class="card-title" v-else>Datos del cliente</h3>
                    </div>
                    <div class="card-body">

                        <div class="row" v-if="usuario.tipoUsuario == 'PRESTAMO'">
                            <div class="col-md-6 col-xs-6">
                                <label>Nombre del verificador</label>
                                <b-form-select class="form-control" v-model="documentacion.verificador"
                                    :options="optionsVerificadores">
                                </b-form-select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3 col-xs-6">
                                <label>Nombre</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.nombre" disabled>
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>A. Paterno</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.apaterno"
                                    disabled></b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>A. Materno</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.amaterno"
                                    disabled></b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Género</label>
                                <b-form-select class="form-control" v-model="documentacion.genero"
                                    :options="optionsGenero">
                                </b-form-select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-xs-6">
                                <label>Fecha nacimiento</label>
                                <b-form-input type="date" class="form-control" v-model="documentacion.fechaNacimiento">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Edad</label>
                                <b-form-input type="number" class="form-control" v-model="documentacion.edad">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Pais de nacimiento</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.paisNacimiento">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Nacionalidad</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.nacionalidad">
                                </b-form-input>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-xs-6">
                                <label>CURP</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.curp">
                                </b-form-input>
                            </div>
                            <div class="col-md-4 col-xs-6">
                                <label>RFC</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.rfc">
                                </b-form-input>
                            </div>
                            <div class="col-md-4 col-xs-6">
                                <label>Nivel de estudios</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.nivelEstudios">
                                </b-form-input>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-xs-6">
                                <label>Estado civil</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.edoCivil">
                                </b-form-input>
                            </div>
                            <div class="col-md-4 col-xs-6">
                                <label>Ocupacion</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.ocupacion">
                                </b-form-input>
                            </div>
                            <div class="col-md-4 col-xs-6">
                                <label>Correo electrónico</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.correo" disabled>
                                </b-form-input>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 col-xs-12">
                                <label>Domicilio(calle y número)</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.calleNumero">
                                </b-form-input>
                            </div>
                            <div class="col-md-4 col-xs-3">
                                <label>Colonia</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.colonia">
                                </b-form-input>
                            </div>
                            <div class="col-md-2 col-xs-3">
                                <label>CP</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.codigoPostal">
                                </b-form-input>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3 col-xs-6">
                                <label>Municipio</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.municipio">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Estado</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.estado">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>País</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.pais">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Tiempo de vivir (años)</label>
                                <b-form-input type="number" class="form-control" v-model="documentacion.tiempoVivir">
                                </b-form-input>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-xs-6">
                                <label>Tipo vivienda</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.tipoVivienda"
                                    maxlength="30"></b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Teléfono</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.telefonoCasa">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Celular</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.celular" disabled>
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Entidad Fed. Nacimiento</label>
                                <b-form-input type="text" class="form-control"
                                    v-model="documentacion.entidadFederativa"></b-form-input>
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
                                <b-form-input type="text" class="form-control" v-model="documentacion.nombreEmpresa">
                                </b-form-input>
                            </div>
                            <div class="col-md-6 col-xs-6">
                                <label>Domicilio(calle y número)</label>
                                <b-form-input type="text" class="form-control"
                                    v-model="documentacion.calleNumeroEmpresa"></b-form-input>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-xs-6">
                                <label>Colonia</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.coloniaEmpresa">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Municipio</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.municipioEmpresa">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Estado</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.estadoEmpresa">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>CP</label>
                                <b-form-input type="text" class="form-control"
                                    v-model="documentacion.codigoPostalEmpresa"></b-form-input>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-xs-6">
                                <label>Teléfono</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.telefonoEmpresa">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-4">
                                <label>Antigúedad (años)</label>
                                <b-form-input type="number" class="form-control" v-model="documentacion.antiguedad">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Ingreso Mensual</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.ingresoMensual">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Frecuencia de pago</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.frecuenciaPago">
                                </b-form-input>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="card card-info" v-if="usuario.tipoUsuario == 'PRESTAMO'">
                    <div class="card-header">
                        <h3 class="card-title">Datos del conyuge</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 col-xs-6">
                                <label>Nombre</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.nombreConyugue">
                                </b-form-input>
                            </div>
                            <div class="col-md-4 col-xs-6">
                                <label>A. Paterno</label>
                                <b-form-input type="text" class="form-control"
                                    v-model="documentacion.apellidoPConyugue"></b-form-input>
                            </div>
                            <div class="col-md-4 col-xs-6">
                                <label>A. Materno</label>
                                <b-form-input type="text" class="form-control"
                                    v-model="documentacion.apellidoMConyugue"></b-form-input>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-xs-6">
                                <label>Teléfono</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.telefonoConyugue">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Celular</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.celularConyugue">
                                </b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Ocupación</label>
                                <b-form-input type="text" class="form-control"
                                    v-model="documentacion.ocupacionConyugue"></b-form-input>
                            </div>
                            <div class="col-md-3 col-xs-6">
                                <label>Ingreso Mensual</label>
                                <b-form-input type="text" class="form-control"
                                    v-model="documentacion.ingresoMensualConyugue"></b-form-input>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card card-info">
                    <div class="card-header" v-if="usuario.tipoUsuario == 'PRESTAMO'">
                        <h3 class="card-title">Datos de cuenta para transferencia electrónica</h3>
                    </div>
                    <div class="card-header" v-else>
                        <h3 class="card-title">Datos bancarios del inversor</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <label>Institución de crédito</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.bancoCredito">
                                </b-form-input>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label>Cta. CLABE o Tarjeta Bancaria</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.ctaClabeTarjeta">
                                </b-form-input>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card card-info">
                    <div class="card-header">
                        <h3 class="card-title" v-if="usuario.tipoUsuario == 'PRESTAMO'">Referencias</h3>
                        <h3 class="card-title" v-else>Beneficiarios</h3>
                    </div>
                    <div class="card-body" v-if="usuario.tipoUsuario == 'INVERSION'">
                        <div class="row">
                            <div class="col-sm-5 col-xs-12">
                                <label>Nombre</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre1"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.referenciaNombre1 = v.toUpperCase()}">
                                </b-form-input>
                            </div>
                            <div class="col-sm-3 col-xs-12">
                                <label>Parentesco</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.parentesco1"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.parentesco1 = v.toUpperCase()}"></b-form-input>
                            </div>
                            <div class="col-sm-2 col-xs-8">
                                <label>Teléfono</label>
                                <input type="text" class="form-control" v-model="documentacion.referenciaTelefono1"
                                    maxlength="10" />
                            </div>
                            <div class="col-sm-2 col-xs-6">
                                <label>Porcentaje %</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre2"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.referenciaNombre2 = v.toUpperCase()}">
                                </b-form-input>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5 col-xs-12">
                                <label>Nombre</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre3"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.referenciaNombre3 = v.toUpperCase()}">
                                </b-form-input>
                            </div>
                            <div class="col-sm-3 col-xs-12">
                                <label>Parentesco</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.parentesco3"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.parentesco3 = v.toUpperCase()}"></b-form-input>
                            </div>
                            <div class="col-sm-2 col-xs-8">
                                <label>Teléfono</label>
                                <input type="text" class="form-control" v-model="documentacion.referenciaTelefono3"
                                    maxlength="10" />
                            </div>
                            <div class="col-sm-2 col-xs-6">
                                <label>Porcentaje %</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre4"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.referenciaNombre4 = v.toUpperCase()}">
                                </b-form-input>
                            </div>
                        </div>
                    </div>
                    <div class="card-body" v-else>
                        <div class="row">
                            <div class="col-sm-6 col-xs-12">
                                <label>Referencia familiar</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre1"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.referenciaNombre1 = v.toUpperCase()}">
                                </b-form-input>
                            </div>
                            <div class="col-sm-3 col-xs-12">
                                <label>Parentesco</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.parentesco1"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.parentesco1 = v.toUpperCase()}"></b-form-input>
                            </div>
                            <div class="col-sm-3 col-xs-8">
                                <label>Tel. referencia</label>
                                <input type="text" class="form-control" v-model="documentacion.referenciaTelefono1"
                                    name="Teléfono" maxlength="10" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 col-xs-6">
                                <label>Referencia familiar</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre2"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.referenciaNombre2 = v.toUpperCase()}">
                                </b-form-input>
                            </div>
                            <div class="col-sm-3 col-xs-12">
                                <label>Parentesco</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.parentesco2"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.parentesco2 = v.toUpperCase()}"></b-form-input>
                            </div>
                            <div class="col-sm-3 col-xs-8">
                                <label>Tel. referencia</label>
                                <input type="text" class="form-control" v-model="documentacion.referenciaTelefono2"
                                    name="Teléfono" maxlength="10" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 col-xs-12">
                                <label>Referencia amistad</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre3"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.referenciaNombre3 = v.toUpperCase()}">
                                </b-form-input>
                            </div>
                            <div class="col-sm-3 col-xs-12">
                                <label>Parentesco</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.parentesco3"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.parentesco3 = v.toUpperCase()}"></b-form-input>
                            </div>
                            <div class="col-sm-3 col-xs-8">
                                <label>Tel. referencia</label>
                                <input type="text" class="form-control" v-model="documentacion.referenciaTelefono3"
                                    name="Teléfono" maxlength="10" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 col-xs-12">
                                <label>Referencia amistad</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre4"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.referenciaNombre4 = v.toUpperCase()}">
                                </b-form-input>
                            </div>
                            <div class="col-sm-3 col-xs-12">
                                <label>Parentesco</label>
                                <b-form-input type="text" class="form-control" v-model="documentacion.parentesco4"
                                    name="Referencia" maxlength="100"
                                    @input="v => { documentacion.parentesco4 = v.toUpperCase()}"></b-form-input>
                            </div>
                            <div class="col-sm-3 col-xs-8">
                                <label>Tel. referencia</label>
                                <input type="text" class="form-control" v-model="documentacion.referenciaTelefono4"
                                    name="Teléfono" maxlength="10" />
                            </div>
                        </div>
                    </div>
                </div>

                <%--datos del prestamo - inversion--%>

                    <div class="card card-info">
                        <div class="card-header" v-if="usuario.tipoUsuario=='PRESTAMO'">
                            <h3 class="card-title">Datos del préstamo</h3>
                        </div>
                        <div class="card-header" v-else>
                            <h3 class="card-title">Datos de la inveersión</h3>
                        </div>
                        <div class="card-body" v-if="usuario.tipoUsuario=='PRESTAMO'">
                            <div class="row">
                                <div class="col-sm-4 col-xs-8">
                                    <label>Monto solicitado</label>
                                    <b-form-select class="form-control" v-model="documentacion.montoSolicitado"
                                        :options="optionsMontoSolicitado" @change="calculaPagos">
                                    </b-form-select>
                                </div>
                                <div class="col-sm-4 col-xs-8">
                                    <label>Interés ordinario</label>
                                    <input type="number" class="form-control" v-model="documentacion.interesOrdinario"
                                        name="Interés ordinario" readonly />
                                </div>
                                <div class="col-sm-4 col-xs-8">
                                    <label>Total a pagar</label>
                                    <input type="number" class="form-control" v-model="documentacion.totalPagar"
                                        name="Total a pagar" readonly />
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-sm-4 col-xs-8">
                                    <label>Número de pagos</label>
                                    <input type="number" class="form-control" v-model="numeroPagos" readonly />
                                </div>
                                <div class="col-sm-4 col-xs-8">
                                    <label>Frecuencia de pagos</label>
                                    <b-form-input type="text" class="form-control w-100"
                                        v-model="frecuenciaPagosCredito" disabled>
                                    </b-form-input>
                                </div>
                                <div class="col-sm-4 col-xs-8">
                                    <label>Valor de cada pago</label>
                                    <input type="number" class="form-control" v-model="documentacion.valorXpago"
                                        name="Valor de cada pago" readonly />
                                </div>
                            </div>
                        </div>

                        <div class="card-body" v-else>
                            <div class="row">
                                <div class="col-sm-4 col-xs-8">
                                    <label>Monto de la inversión</label>
                                    <input type="number" class="form-control" v-model="documentacion.montoSolicitado" />
                                </div>
                                <div class="col-sm-4 col-xs-8">
                                    <label>Fecha</label>
                                    <input type="date" class="form-control" v-model="documentacion.referenciaTelefono2"
                                        name="" />
                                </div>
                                <div class="col-sm-4 col-xs-8">
                                    <label>Plazo en meses</label>
                                    <b-form-input type="number" class="form-control" v-model="plazo"
                                        name="Plazo en meses" readonly>
                                    </b-form-input>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4 col-xs-8">
                                    <label>Rendimiento mensual</label>
                                    <input type="text" class="form-control" v-model="rendimiento" readonly />
                                </div>
                                <div class="col-sm-4 col-xs-8">
                                    <label>Rendimiento anual</label>
                                    <b-form-input type="text" class="form-control w-100" v-model="rendimientAnual"
                                        disabled>
                                    </b-form-input>
                                </div>
                                <div class="col-sm-4 col-xs-8">
                                    <label>Pago de rendimientos</label>
                                    <input type="text" class="form-control" v-model="pagoRendimientos"
                                        name="Valor de cada pago" readonly />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card card-info" v-if="usuario.tipoUsuario == 'PRESTAMO'">
                        <div class="card-header">
                            <h3 class="card-title">Documentación</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">

                                <div class="col-sm-4 col-xs-12">
                                    <label for="files1" class="custom-input btn btn-success col fileinput-button"><i
                                            class="fas fa-upload"></i>&nbsp; Cargar
                                        identificación</label>
                                    <input @change="handleImage1"
                                        class="custom-input btn btn-success col fileinput-button" type="file"
                                        accept="image/*,application/pdf" style="visibility:hidden;" id="files1">
                                    <img class="imgCargas" :src="identificacion" alt=""
                                        style="width:100%; max-width:150px;">
                                    <div class="container" id="ident">
                                        <iframe :src="PDFidentificacion" tyle="width:100%; max-width:150px;"
                                            frameborder="0"></iframe>
                                    </div>
                                </div>

                                <div class="col-sm-4 col-xs-12">
                                    <label for="files2" class="custom-input btn btn-success col fileinput-button"><i
                                            class="fas fa-upload"></i>&nbsp; Cargar
                                        comprobante de domicilio</label>
                                    <input @change="handleImage2"
                                        class="custom-input btn btn-success col fileinput-button" type="file"
                                        accept="image/*,application/pdf" style="visibility:hidden;" id="files2">
                                    <img class="imgCargas" :src="compDomicilio" alt=""
                                        style="width:100%; max-width:150px;">
                                    <div class="container">
                                        <iframe :src="PDFcompDomicilio" style="width:100%; max-width:150px;"
                                            frameborder="0"></iframe>
                                    </div>
                                </div>

                                <div class="col-sm-4 col-xs-12" v-if="usuario.tipoUsuario == 'PRESTAMO'">
                                    <label for="files3" class="custom-input btn btn-success col fileinput-button"><i
                                            class="fas fa-upload"></i>&nbsp; Cargar
                                        comprobante de ingresos</label>
                                    <input @change="handleImage3"
                                        class="custom-input btn btn-success col fileinput-button" type="file"
                                        accept="image/*,application/pdf" style="visibility:hidden;" id="files3">
                                    <img class="imgCargas" :src="compIngresos" alt=""
                                        style="width:100%; max-width:150px;">
                                    <div class="container">
                                        <iframe :src="PDFcompIngresos" style="width:100%; max-width:150px;"
                                            frameborder="0"></iframe>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="card card-info" v-if="usuario.tipoUsuario == 'INVERSION'">
                        <div class="card-header">
                            <h3 class="card-title">Datos bancarios de la empresa</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6 col-xs-8">
                                    <label>Titular de la cuenta</label>
                                    <input type="text" class="form-control"
                                        value="PRESTA STAR-Z , S.A.P.I. de C.V., SOFOM, E.N.R" readonly="readonly" />
                                </div>
                                <div class="col-sm-6 col-xs-8">
                                    <label>Fecha</label>
                                    <input type="text" class="form-control" value="117852487" readonly="readonly" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-xs-8">
                                    <label>Clabe Interbancaria</label>
                                    <input type="text" class="form-control" value="012-730-00117852487-2"
                                        readonly="readonly" />
                                </div>
                                <div class="col-sm-6 col-xs-8">
                                    <label>Banco</label>
                                    <input type="text" class="form-control" value="BBVA" readonly="readonly" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card card-info" v-if="usuario.tipoUsuario == 'INVERSION'">
                        <div class="card-header">
                            <h3 class="card-title">Firma Contrato</h3>
                        </div>
                        <div class="card-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <p>Su firma:</p>
                                        <div class="js-signature" data-width="300" data-height="200"
                                            data-border="1px solid black" data-line-color="#000000" data-auto-fit="true"
                                            ontouchmove="event.preventDefault();"></div>
                                        <p>
                                            <b-button variant="default" @click="clearCanvas()">
                                                <i class="fas fa-erase">
                                                </i> Limpiar
                                            </b-button>
                                            <b-button variant="default" @click="saveSignature()">
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
                                <template v-if="estaGuardando">
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
                        <div class="col" v-if="usuario.tipoUsuario == 'INVERSION'">
                            <b-button variant="warning" class="" @click="generarSolicitudInversionista()">
                                <i class="fas fa-download">
                                </i> Descargar contrato
                            </b-button>
                        </div>
                    </div>
            </template>
        </div>
    </div>
    <script src="js/libs/jq-signature/js/jquery-1.11.0.min.js"></script>
    <script src="js/Documentacion.js?v1.0.0"></script>
</asp:Content>