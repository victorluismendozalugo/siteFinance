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
                                 <span class="badge badge-warning" v-else>{{data.item.estatusNombre}}</span>
                            </template>
                            <template v-slot:cell(porcentajeDoc)="data">
                               <b-progress :value="data.item.porcentajeDoc" :max="100" class="mb-3"></b-progress>
                                        <small>
                                            {{data.item.porcentajeDoc}}% Cargado
                                        </small>
                            </template>
                            <template v-slot:cell(nombre)="data">
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
                                        </a>
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

        </template>
        </div>
    </div>
    <script src="js/libs/xlsx.full.min.js"></script>
    <script src="js/Clientes.js?6.5.0"></script>
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
