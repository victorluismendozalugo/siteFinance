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
                                        <a class="btn btn-info btn-sm" href="#" @click="ObtieneDatosCliente(item)">
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
                 <p>{{cliente}}</p>
            </b-modal>
        </template>
        </div>
    </div>

    <script src="js/Clientes.js"></script>
</asp:Content>
