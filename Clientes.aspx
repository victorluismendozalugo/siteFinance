<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="WebSystems2021.Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="vuePage">
        <div class="container">
            <template>



            <section class="content">
                <div class="row">
                    <div class="col-md-3 col-xs-6">
                        <label>Tipo de cliente</label>
                        <b-form-select class="form-control" v-model="tipoCliente" :options="optionsFiltro"
                            @change="ObtieneClientesXTipo()">
                        </b-form-select>
                    </div>
                      <div class="col-md-3 col-xs-6">
                        <label>&nbsp; Registro de clientes</label>
                      <b-button variant="info" class="float-right" @click="ModalRegistroClientes()">
                       <i class="far fa-plus-square"></i> Nuevo cliente
                    </b-button>
                    </div>
                </div>
                <br />
                 <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Clientes</h3>
                        <div class="card-tools">
                            </div>
                        <div class="form-group row">

                            <div class="col-sm">
                                <div class="input-group">
                                    <b-form-input small v-model="filter" type="search" id="filterInput" type="search"
                                        class="form-control border-1 form-control" placeholder="Teclee para buscar..."
                                        @input="v => { this.filter = v.toUpperCase()}"></b-form-input>
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm float-right">
                                <b-form-select class="form-control" v-model="perPage" id="perPageSelect" size="sm"
                                    :options="pageOptions">
                                </b-form-select>
                            </div>
                        </div>
</div>
                              <div class="card-body p-0">
                        <b-table class="table table-striped table-responsive" 
                            id="tablaClientes"
                            hover width="100%" cellspacing="0" 
                            :items="clientes" :fields="fields" :filter="filter"
                            :filter-Included-Fields="filterOn" @filtered="onFiltered" @row-clicked="editarRegistro"
                            :per-page="perPage" :current-page="currentPage" :busy="isBusy">
                            <template v-slot:cell(nombreCompleto)="data">
                                 <a>{{data.item.nombreCompleto}}</a>
                                        <br />
                                        <small>Registro {{data.item.fechaRegistro}}</small>
                            </template>
                            <template v-slot:cell(estatusNombre)="data">
                                 <span class="badge badge-info" v-if="data.item.estatusNombre == 'PROSPECTO' ">{{data.item.estatusNombre}}</span>
                                 <span class="badge badge-success" v-else-if="data.item.estatusNombre == 'AUTORIZADO' ">{{data.item.estatusNombre}}</span>
                                 <span class="badge badge-danger" v-else-if="data.item.estatusNombre == 'DISPERSADO' ">{{data.item.estatusNombre}}</span>
                                 <span class="badge badge-warning" v-else>{{data.item.estatusNombre}}</span>
                            </template>
                            <template v-slot:cell(porcentajeDoc)="data">
                               <b-progress :value="data.item.porcentajeDoc" :max="100" class="mb-3"></b-progress>
                                        <small>
                                            {{data.item.porcentajeDoc}}% Cargado
                                        </small>
                            </template>
                            <template v-slot:cell(nombre)="data">
                                <span v-if="data.item.estatus == 'B' ">
                                   <a class="btn btn-info btn-sm" href="#" @click="MotivoBajaCliente(data.item)" >
                                            <i class="fas fa-user-times">
                                            </i>
                                    </a>
                                </span>    
                               
                               <span v-if="data.item.estatus == 'T' ">
                                     <a class="btn btn-warning btn-sm" href="#" @click="DispersarCliente(data.item)" v-if="data.item.estatus == 'T' ">
                                          <i class="fas fa-hand-holding-usd"></i>
                                      </a> 
<%--                                        <a class="btn btn-danger btn-sm" href="#" @click="BajaCliente(data.item)">
                                            <i class="fas fa-user-times">
                                            </i>
                                        </a>--%>
                               </span>
                                <span v-if="data.item.estatus == 'D' ">
                                       <a class="btn btn-default btn-sm" href="#"  @click="Abonos(data.item)">
                                        <i class="fas fa-money-check-alt"></i>
                                        </a>
                        
                                        <a class="btn btn-default btn-sm" href="#"  @click="MostrarCreditoAutorizado(data.item)">
                                            <i class="fas fa-file-invoice-dollar">
                                            </i>
                                        </a>
                                     <a class="btn btn-warning btn-sm" href="#" @click="DispersarClienteModal(data.item)">
                                          <i class="fas fa-hand-holding-usd"></i>
                                        </a>
                                </span>
                                  <span v-if="data.item.estatus == 'A' ">
                                       <a class="btn btn-success btn-sm" href="#" @click="Autorizar(data.item)">
                                            <i class="fas fa-check">
                                            </i>
                                        </a>
                                </span>
                                  <a class="btn btn-primary btn-sm" href="#" @click="ObtieneDatosCliente(data.item)">
                                            <i class="far fa-eye">
                                            </i>
                                        </a>
                                        <a class="btn btn-info btn-sm" href="#" @click="CargarInformacion(data.item)">
                                            <i class="fas fa-upload">
                                            </i>
                                      </a>
                                  <a class="btn btn-info btn-sm" href="#" @click="CargarSolicitud(data.item)">
                                           <i class="fas fa-file-upload"></i>
                                      </a>
                               

<%--                                 <a class="btn btn-warning btn-sm" href="#" @click="DispersarCliente(data.item)" v-if="data.item.estatus == 'T' ">
                                          <i class="fas fa-hand-holding-usd"></i>
                                        </a> 
                                        <a class="btn btn-warning btn-sm" href="#" @click="DispersarClienteModal(data.item)" v-els</a>
                                <a class="btn btn-success btn-sm" href="#" @click="Autorizar(data.item)"
                                            v-if="data.item.estatus == 'A' ">
                                            <i class="fas fa-check">
                                            </i>
                                        </a>
                                        <a class="btn btn-default btn-sm" href="#"
                                            @click="MostrarCreditoAutorizado(data.item)" v-if="data.item.estatus == 'T' ">
                                            <i class="fas fa-file-invoice-dollar">
                                            </i>
                                        </a>
                                        <a class="btn btn-danger btn-sm" href="#" @click="BajaCliente(data.item)"
                                            v-if="data.item.estatus == 'A' ">
                                            <i class="fas fa-user-times">
                                            </i>
                                        </a>
                                        <a class="btn btn-info btn-sm" href="#" @click="MotivoBajaCliente(data.item)" v-else>
                                            <i class="fas fa-user-times">
                                            </i>
                                        </a>
                                        <a class="btn btn-primary btn-sm" href="#" @click="ObtieneDatosCliente(data.item)">
                                            <i class="far fa-eye">
                                            </i>
                                        </a>
                                        <a class="btn btn-info btn-sm" href="#" @click="CargarInformacion(data.item)">
                                            <i class="fas fa-upload">
                                            </i>
                                        </a>--%>
                            </template>
                            <template v-slot:table-busy>
                                <div class="text-center text-info my-2">
                                    <b-spinner class="align-middle"></b-spinner>
                                    <strong>Cargando clientes...</strong>
                                </div>
                            </template>
                        </b-table>

                                  </div>

                        <div class="form-group row">
            <div class="col-sm-4">
                Total de registros: {{ rows }}

            </div>
            <div class="col-sm-4">
                Página actual: {{ currentPage }}   
            </div>
            <div class="col-sm-4">
                   <b-pagination
                        v-model="currentPage"
                        :total-rows="rows"
                        :per-page="perPage"
                        aria-controls="my-table"
                    ></b-pagination>
            </div>
        </div>


</div>

            </section>
            <b-modal id="modal-informacion-usuario" title="Información del cliente" size="lg" hide-footer>
                <div class="row">
                    <div class="col-6">
                        <label>Cliente</label>
                        <b-form-input type="text" class="form-control" v-model=cliente.nombreCompleto disabled>
                        </b-form-input>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label>Correo</label>
                        <b-form-input type="text" class="form-control" v-model=cliente.usuario disabled>
                        </b-form-input>
                    </div>
                    <div class="col-6">
                        <label>Fecha Registro</label>
                        <b-form-input type="text" class="form-control" v-model=cliente.fechaRegistro disabled>
                        </b-form-input>
                    </div>
                </div>
                <br />
                <h4><b>Documentación cargada</b></h4>
                <div class="row">
                    <div class="col-4" id="identificacion">
                        <embed v-bind:src="cliente.identificacion" class="img-fluid img-thumbnail zoom"
                            style="height: auto;" />
                    </div>
                    <div class="col-4" id="domicilio">
                        <embed v-bind:src="cliente.compDomicilio" class="img-fluid img-thumbnail zoom"
                            style="height: auto;" />
                    </div>
                    <div class="col-4" id="ingresos" v-if="this.cliente.tipoUsuario == 3 ">
                        <embed v-bind:src="cliente.compIngresos" class="img-fluid img-thumbnail zoom"
                            style="height: auto;" />
                    </div>
                </div>
                <br />
                <div class="row" v-if="this.cliente.tipoUsuario == 3 ">

                    <div class="col-6">
                        <label>Referencia 1</label>
                        <b-form-input type="text" class="form-control" v-model=cliente.referenciaNombre1 disabled>
                        </b-form-input>
                    </div>
                    <div class="col-6">
                        <label>Teléfono</label>
                        <b-form-input type="text" class="form-control" v-model=cliente.referenciaTelefono1 disabled>
                        </b-form-input>
                    </div>
                </div>
                <div class="row" v-else>

                    <div class="col-4">
                        <label>Beneficiario</label>
                        <b-form-input type="text" class="form-control" v-model=cliente.referenciaNombre1 disabled>
                        </b-form-input>
                    </div>
                    <div class="col-4">
                        <label>Parentesco</label>
                        <b-form-input type="text" class="form-control" v-model=cliente.parentesco1 disabled>
                        </b-form-input>
                    </div>
                    <div class="col-4">
                        <label>Fecha de nacimiento</label>
                        <b-form-input type="text" class="form-control" v-model=cliente.referenciaTelefono1 disabled>
                        </b-form-input>
                    </div>
                </div>
                <br />
                <div class="row" v-if="this.cliente.tipoUsuario == 3 ">
                    <div class="col-6">
                        <label>Referencia 2</label>
                        <b-form-input type="text" class="form-control" v-model=cliente.referenciaNombre2 disabled>
                        </b-form-input>
                    </div>
                    <div class="col-6">
                        <label>Teléfono</label>
                        <b-form-input type="text" class="form-control" v-model=cliente.referenciaTelefono2 disabled>
                        </b-form-input>
                    </div>
                </div>
                <div class="row" v-else>
                    <div class="col-6">
                        <label>Nombre de quién recomendó?</label>
                        <b-form-input type="text" class="form-control" v-model=cliente.referenciaNombre2 disabled>
                        </b-form-input>
                    </div>
                </div>
                <div class="modal-footer">
                    <b-button variant="info" class="float-right" @click="LlenarSolicitud()">
                        <i class="fas fa-pen-square"></i> Llenar solicitud
                    </b-button>
                    <b-button variant="info" class="float-right" @click="GeneraSolicitud()">
                        <i class="fas fa-download"></i> Descargar solicitud
                    </b-button>
                </div>
            </b-modal>

            <b-modal id="modal-cargar-informacion-usuario" title="Cargar información" size="lg" hide-footer>
                <p>{{cliente.nombreCompleto}}</p>
                <b>Seleccione un archivo de excel para importar:</b>
                <div>
                    <input type="file" class="fileSelect" @change="fileChange($event)" />
                </div>
                <br />
                <b-table id="wrapper" class="table table-striped table-responsive" responsive="sm">
                </b-table>
                <div class="modal-footer">
                    <b-button type="button" variant="primary" @click="GuardarSaldo">Guardar
                    </b-button>
                </div>
            </b-modal>

            <b-modal id="modal-baja-cliente" title="Baja de clientes" size="lg" hide-footer>
                <p>Cliente: {{cliente.nombreCompleto}}</p>
                <b>Proporcione el motivo para la baja del cliente</b>
                <div>
                    <b-form-input type="text" class="form-control" v-model="motivoBaja">
                    </b-form-input>
                </div>
                <br />
                <div class="modal-footer">
                    <b-button type="button" variant="warning" @click="DardeBaja()">Dar de baja
                    </b-button>
                </div>
            </b-modal>

            <b-modal id="modal-motivo-baja-cliente" title="Baja de clientes" size="lg" hide-footer>
                <p>Cliente: {{cliente.nombreCompleto}}</p>
                <p>Fecha de baja: {{clienteBaja.fecha}}</p>
                <div>
                    <label>Motivo de baja</label>
                    <b-form-input type="text" class="form-control" v-model="clienteBaja.motivoBaja" disabled>
                    </b-form-input>
                </div>
                <br />
                <div class="modal-footer">
                    <b-button type="button" variant="warning" @click="DardeAlta()">Reactivar cliente
                    </b-button>
                </div>
            </b-modal>

            <b-modal id="modal-autorizar-credito" title="Autorizar crédito" size="lg" hide-footer>
                <p>Cliente: {{cliente.nombreCompleto}}</p>
                <p>Monto solicitado: $ {{cliente.montoSolicitado}}</p>
                <br />
                <div class="modal-footer">
                    <b-button type="button" variant="info" @click="AceptarAutorizar()">Autorizar
                    </b-button>
                </div>
            </b-modal>

            <b-modal id="modal-credito-autorizado" title="Préstamo autorizado" size="lg" hide-footer>
                <p>Cliente: {{cliente.nombreCompleto}}</p>
                <p>Monto autorizado: $ {{creditoCte.montoAutorizado}}</p>
                <p>Fecha de autorización: {{creditoCte.fecha}}</p>
                <p>Responsable autorización: {{creditoCte.responsable}}</p>
            </b-modal>

                
            <b-modal id="modal-dispersar" title="Dispersar" size="lg" hide-footer>
                <p>Cliente: {{cliente.nombreCompleto}}</p>
                <p>Monto solicitado: $ {{cliente.montoSolicitado}}</p>
                <br />
                 <div class="col-md-3 col-xs-6">
                          <label>Fecha depósito</label>
                            <b-form-input type="date" class="form-control" v-model="fechaDeposito"></b-form-input>
                  </div>

                <div class="modal-footer">
                    <b-button type="button" variant="info" @click="AceptarDispersarClientes()">Dispersar
                    </b-button>
                </div>
            </b-modal>

            <b-modal id="modal-dispersar-consulta" title="Dispersar" size="lg" hide-footer>
                <p>Cliente: {{cliente.nombreCompleto}}</p>
                <p>Monto solicitado: $ {{cliente.montoSolicitado}}</p>
                <br />

            </b-modal>

            <b-modal id="modal-operacion-supervizada" title="Operación supervizada" size="md" hide-footer>
                 <label>Es necesaria la aprobación de un supervisor para autorizar esta operación</label>
                   <div class="col-md-12 col-xs-6">
                          <label>Administrador</label>
                            <b-form-input type="text" class="form-control" v-model="operacion.Autorizador" disabled>
                            </b-form-input>
                  </div>
                   <div class="col-md-12 col-xs-6">
                          <label>Contraseña</label>
                            <b-form-input type="password" class="form-control" v-model="operacion.Password"></b-form-input>
                  </div>
                 <div class="modal-footer">
                    <b-button type="button" variant="info" @click="AutorizarOPSupervizada()">Autorizar
                    </b-button>
                </div>
            </b-modal>

            <b-modal id="modal-llenar-solicitud" title="Operación supervizada" size="xl" hide-footer data-backdrop="static" data-keyboard="false">
                          <template>

             <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title" v-if="usuario.tipoUsuario == 'PRESTAMO'">Datos del acreditado</h3>
                    <h3 class="card-title" v-else>Datos del cliente</h3>
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
            </b-modal>

                <%--REGISTRO DE CLIENTES--%>

          <b-modal id="modal-registro-clientes" title="Registro de clientes" size="lg" hide-footer>
        
                                        <div class="modal-body">
                            <div class="card-body">
                                <div class="form-group">
                                    <label>¿Que desea hacer?</label>
                                    <b-form-select class="form-control" v-model="registro.rolID"
                                        :options="optiosRolUsuario">
                                    </b-form-select>
                                </div>
                                <div class="form-group">
                                    <label for="inputName">Nombre(s)</label>
                                    <b-form-input type="text" class="form-control" v-model="registro.nombre"
                                        placeholder="Ingrese su(s) nombre(s)"
                                        @input="v => { registro.nombre = v.toUpperCase()}"></b-form-input>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-6">
                                            <label>Apellido parterno</label>
                                            <b-form-input type="text" class="form-control"
                                                v-model="registro.primerApellido" placeholder="Apellido parterno"
                                                @input="v => { registro.primerApellido = v.toUpperCase()}">
                                            </b-form-input>
                                        </div>
                                        <div class="col-6">
                                            <label>Apellido materno</label>
                                            <b-form-input type="text" class="form-control"
                                                v-model="registro.segundoApellido" placeholder="Apellido materno"
                                                @input="v => { registro.segundoApellido = v.toUpperCase()}">
                                            </b-form-input>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Celular</label>
                                    <b-form-input type="text" class="form-control" v-model="registro.celular"
                                        placeholder="Ingrese su celular (10 digitos)" maxlength="10"
                                        @blur="validaTelefono"></b-form-input>
                                       <div class="form-group">
  
                                            <label>CURP</label>
                                    <b-form-input type="text" class="form-control" v-model="registro.curp"
                                        placeholder="Ingrese su CURP" maxlength="18"
                                        @input="v => { registro.curp = v.toUpperCase()}"
                                        @blur="validaCurp"></b-form-input>
                                           </div>

                                </div>
                                <%--<p class="mb-0">
                                    <a class="nav-link text-center" data-toggle="modal"
                                        data-target="#solicitudCorreoModal" href="#" role="button">
                                        No he recibido el correo
                                    </a>
                                </p>--%>
                            </div>
                        </div>

                <div class="modal-footer">
                    <b-button type="button" variant="info" @click="GuardarCliente()">Guardar
                    </b-button>
                </div>
            </b-modal>

                 <b-modal id="modal-cargar-solicitud" title="Cargar solicitud" size="lg" hide-footer @hide="doSometing">
                <p>{{cliente.nombreCompleto}}</p>
                <b>Seleccione el PDF de la solicitud para cargarlo:</b>
                <div class="col-sm-4 col-xs-12">
                       <input @change="handleSolicitud" class="custom-input btn btn-success col fileinput-button" type="file"
                                accept="application/pdf" id="files8">
                        </div>
                     <br />
                  <iframe :src="PDFSolicitudFirmada" frameborder="0" style="width:100%;"
                    onload="this.height=$(window).height()-200;"></iframe>

                <div class="modal-footer">
                    <b-button type="button" variant="primary" @click="GuardarSolicitud">Guardar
                    </b-button>
                </div>
            </b-modal>

           <b-modal id="modal-abonos-clientes" title="Abonos" size="lg" hide-footer>
                <p>{{cliente.nombreCompleto}}</p>
                <b>Información de abonos del clientes</b>
               
               
            </b-modal>


        </template>
        </div>
    </div>
    <script src="js/libs/xlsx.full.min.js"></script>
    <script src="js/Clientes.js?9.5.0"></script>
    <style>
        .zoom {
            transition: transform.3s;
            position: relative;
            z-index: 2;
        }
            .zoom:hover {
                transform: scale(2.5);
                /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
            }
    </style>
</asp:Content>
