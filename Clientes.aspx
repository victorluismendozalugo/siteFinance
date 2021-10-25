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
                          <b-form-select class="form-control" v-model="tipoCliente" :options="optionsFiltro" @change="ObtieneClientesXTipo()">
                        </b-form-select>
                    </div>
                    </div>
                <br />
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Clientes</h3>
                        <div class="card-tools">
                             
                       <%--     <b-button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                <i class="fas fa-minus"></i>
                            </b-button>
                            <b-button type="button" class="btn btn-tool" data-card-widget="reload" title="Recargar"
                                @click="ObtieneClientes()">
                                <i class="fas fa-sync-alt"></i>
                            </b-button>--%>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <table class="table table-striped table-responsive">
                            <thead>
                                <tr>
                                    <th style="width: 1%">#</th>
                                    <th style="width: 16%">Nombre</th>
                                    <th style="width: 8%">Tipo</th>
                                    <th style="width: 8%">Estatus</th>
                                    <th style="width: 16%">% Documentación</th>
                                    <th style="width: 20%">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="item in clientes">
                                    <td>
                                        {{item.usuarioID}}
                                    </td>
                                    <td>
                                        <a>{{item.nombreCompleto}}</a>
                                        <br />
                                        <small>Registro {{item.fechaRegistro}}</small>
                                    </td>
                                    <td class="project-state">
                                        <span class="badge badge-success"
                                            v-if="item.tipoUsuario == 2">Inversiones</span>
                                        <span class="badge badge-success" v-else>Préstamo</span>
                                    </td>
                                      <td class="project-state">
                                        <span class="badge badge-success"
                                            v-if="item.estatus == 'A' ">Activo</span>
                                        <span class="badge badge-warning" v-else>Inactivo</span>
                                    </td>
                                    <td>
                                        <b-progress :value="item.porcentajeDoc" :max="100" class="mb-3"></b-progress>
                                        <small>
                                            {{item.porcentajeDoc}}% Cargado
                                        </small>
                                    </td>
                                    <td class="project-actions text-right">
                                          <a class="btn btn-danger btn-sm" href="#" @click="BajaCliente(item)" v-if="item.estatus == 'A' ">
                                            <i class="fas fa-user-times">
                                            </i>
                                         </a>
                                          <a class="btn btn-info btn-sm" href="#" @click="MotivoBajaCliente(item)" v-else>
                                            <i class="fas fa-user-times">
                                            </i>
                                         </a>
                                        <a class="btn btn-primary btn-sm" href="#" @click="ObtieneDatosCliente(item)">
                                            <i class="far fa-eye">
                                            </i>
                                        </a>
                                        <a class="btn btn-info btn-sm" href="#" @click="CargarInformacion(item)">
                                            <i class="fas fa-upload">
                                            </i>
                                            Carga información
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                                   <template v-if="isBusy">
                                    <div class="text-center text-info my-2">
                                        <b-spinner class="align-middle"></b-spinner>
                                        <strong>Cargando clientes...</strong>
                                    </div>
                                </template>
                        </table>
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

                    <div class="col-6" >
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


        </template>
        </div>
    </div>
    <script src="js/libs/xlsx.full.min.js"></script>
    <script src="js/Clientes.js?5.5.0"></script>
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
