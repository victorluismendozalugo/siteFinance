<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="WebSystems2021.Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="vuePage">
    <div class="container">
        <template>
            <b-button v-b-modal.modal-registro variant="primary"><i class="far fa-plus-square"></i> &nbsp;Registrar
                nuevo</b-button>
            <b-modal id="modal-registro" size="lg" title="Large Modal" hide-header="true">
                <div class="form-group row">
                    <div class="col-xs">
                        <label>Clave cliente</label>
                        <input type="number" class="form-control" v-model="cliente.clienteID" name="Clave"
                            readonly="true" />
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm">
                        <label>Nombre</label>
                        <input type="text" class="form-control" v-model="cliente.cliNombre" name="Nombre"
                            maxlength="50" />
                    </div>
                    <div class="col-sm">
                        <label>A. Paterno</label>
                        <input type="text" class="form-control" v-model="cliente.cliAPaterno" name="A. Paterno"
                            maxlength="50" />
                    </div>
                    <div class="col-sm">
                        <label>A. Materno</label>
                        <input type="text" class="form-control" v-model="cliente.cliAMaterno" name="A. Materno"
                            maxlength="50" />
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm">
                        <label>Calle</label>
                        <input type="text" class="form-control" v-model="cliente.cliCalle" name="Calle"
                            maxlength="100" />
                    </div>
                    <div class="col-sm">
                        <label>Número</label>
                        <input type="number" class="form-control" v-model="cliente.cliNumero" name="numero"/>
                    </div>
                   <div class="col-sm">
                        <label>Cod. Postal</label>
                        <input type="text" class="form-control" v-model="cliente.cliCP" name="CP" maxlength="5" />
                    </div>
                </div>

                <div class="form-group row">
                        <div class="col-md">
                        <label>Referencia/Colonia/Sector</label>
                        <input type="text" class="form-control" v-model="cliente.cliReferencia" name="Referencia"
                            maxlength="200" />
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm">
                        <label>Estado</label>
                        <b-form-select class="form-control" v-model="cliente.cliEstado">
                            <option v-for="item in estados" :value="item.estadoID">{{item.estadoNombre}}</option>
                        </b-form-select>
                    </div>
                    <div class="col-sm">
                        <label>Ciudad</label>
                        <b-form-select class="form-control" v-model="cliente.cliCiudad">
                            <option v-for="item in ciudades" :value="item.ciudadID">{{item.ciudadNombre}}</option>
                        </b-form-select>
                    </div>
                    <div class="col-sm">
                        <label>Telefono</label>
                        <input type="text" class="form-control" v-model="cliente.cliTelefono" name="Telefono"
                            maxlength="10" />
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm">
                        <label>Email</label>
                        <input type="email" class="form-control" v-model="cliente.cliEmail" name="Email" maxlength="100"
                            required="required" />
                    </div>
                    <div class="col-sm">
                        <label>Estatus</label>
                        <b-form-select class="form-control" v-model="cliente.cliEstatus" :options="optionsEstatus">
                        </b-form-select>
                    </div>
                </div>
                <template #modal-footer>
                    <b-button variant="warning" class="float-left" @click="hideModal">
                        <i class="far fa-times-circle"></i>&nbsp; Cerrar
                    </b-button>
                    <b-button variant="primary" class="float-right" @click="GuardarCliente">
                        <i class="fas fa-save"></i> Guardar
                    </b-button>
                </template>
            </b-modal>
        </template>

        <div class="form-group row">
            <div class="col-sm">
                <b-form-input class="form-control" v-model="filter" type="search" id="filterInput"
                    placeholder="Escribe para buscar"></b-form-input>
            </div>

            <div class="col-sm float-right">
                <b-form-select class="form-control" v-model="perPage" id="perPageSelect" size="sm"
                    :options="pageOptions">
                </b-form-select>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Listado de clientes</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <b-table class="table table-hover table-striped" hover :items="this.clientes"
                                :fields="fields" :filter="filter" :filterIncludedFields="filterOn"
                                @filtered="onFiltered" @row-clicked="editarRegistro" :per-page="perPage"
                                :current-page="currentPage" :busy="isBusy" small>
                                <template v-slot:table-busy>
                                    <div class="text-center text-warning my-2">
                                        <b-spinner class="align-middle"></b-spinner>
                                        <strong>Cargando clientes...</strong>
                                    </div>
                                </template>
                            </b-table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-4">
                Total de registros: {{ rows }}
            </div>
            <div class="col-sm-4">
                Página actual: {{ currentPage }}
            </div>
            <div class="col-sm-4 pagination">
                <b-pagination class="pagination pagination-primary" v-model="currentPage" :total-rows="rows"
                    :per-page="perPage" aria-controls="my-table"></b-pagination>
            </div>
        </div>
    </div>
</div>
    <script src="js/Clientes.js"></script>
</asp:Content>