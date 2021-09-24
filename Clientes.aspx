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
            <b-modal id="modal-informacion-usuario" title="Información del cliente" size="lg" ok-only>
                {{cliente}}
                <br />
                    <p>Cliente: {{cliente.nombreCompleto}}</p> 
                     <p>Correo: {{cliente.usuario}}</p> 
                     <p>Fecha Registro: {{cliente.fechaRegistro}}</p> 
                  <div class="row">
                        <div class="col-4">
                     <img v-bind:src="cliente.identificacion" class="img-fluid img-thumbnail zoom" style="height: auto;"/>
                            </div>
                         <div class="col-4">
                     <img v-bind:src="cliente.compDomicilio" class="img-fluid img-thumbnail zoom" style="height: auto;"/>
                            </div>
                         <div class="col-4">
                     <img v-bind:src="cliente.compIngresos" class="img-fluid img-thumbnail zoom" style="height: auto;"/>
                            </div>
                      </div>
            </b-modal>
              <b-modal id="modal-cargar-informacion-usuario" title="Cargar información" size="lg" hide-footer>
                 <p>{{cliente.nombreCompleto}}</p>
                     <div>  
                  <b>Seleccione un archivo de excel para importar:</b>  
                  <div>  
                    <input type="file" class="fileSelect" @change="fileChange($event)"/>  
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
    <script src="js/Clientes.js"></script>
    <style>
        .zoom {
            transition: transform.3s;
            position: relative;
            z-index: 2;
        }

            .zoom:hover {
                transform: scale(2.5); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
            }
    </style>
</asp:Content>
