<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="WebSystems2021.Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="vuePage">
    <div class="container">
        <template>
            <section class="content">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Clientes</h3>
                        <div class="card-tools">
                            <b-button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                <i class="fas fa-minus"></i>
                            </b-button>
                            <b-button type="button" class="btn btn-tool" data-card-widget="reload" title="Recargar"
                                @click="ObtieneClientes()">
                                <i class="fas fa-sync-alt"></i>
                            </b-button>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <table class="table table-striped table-responsive">
                            <thead>
                                <tr>
                                    <th style="width: 1%">#</th>
                                    <th style="width: 20%">Nombre</th>
                                    <th style="width: 8%">Tipo</th>
                                    <th style="width: 20%">% Documentación</th>
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
                                    <td>
                                        <b-progress :value="item.porcentajeDoc" :max="100" class="mb-3"></b-progress>
                                        <small>
                                            {{item.porcentajeDoc}}% Cargado
                                        </small>
                                    </td>
                                    <td class="project-actions text-right">
                                        <a class="btn btn-primary btn-sm" href="#" @click="ObtieneDatosCliente(item)">
                                            <i class="far fa-eye">
                                            </i>
                                            Ver
                                        </a>
                                        <a class="btn btn-info btn-sm" href="#" @click="CargarInformacion(item)">
                                            <i class="fas fa-upload">
                                            </i>
                                            Cargar información
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
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
                    <div class="col-4" id="ingresos">
                        <embed v-bind:src="cliente.compIngresos" class="img-fluid img-thumbnail zoom"
                            style="height: auto;" />
                    </div>
                </div>
                <br />
                <div class="row">

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
                <br />
                <div class="row">
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
                     <div class="modal-footer">
                   <b-button variant="info" class="float-right" @click="GeneraSolicitud()">
                        <i class="fas fa-download"></i> Descargar solicitud
                    </b-button>
                    </div>
            </b-modal>
            <b-modal id="modal-cargar-informacion-usuario" title="Cargar información" size="lg" hide-footer>
                <p>{{cliente.nombreCompleto}}</p>
                <div>
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
        </template>
    </div>
</div>
<script src="js/libs/xlsx.full.min.js"></script>
<script src="js/Clientes.js?2.0.2"></script>
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
