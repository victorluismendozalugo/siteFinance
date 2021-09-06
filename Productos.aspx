<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="WebSystems2021.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="vuePage">
        <div class="container">
            <template>
            <b-button v-b-modal.modal-registro variant="primary"><i class="far fa-plus-square"></i> &nbsp;Registrar
                nuevo
            </b-button>
            <b-modal id="modal-registro" size="lg" title="Large Modal" hide-header="true" @hide="onHideModal">
                <div class="form-group row">
                    <div class="col-xs">
                        <label>Clave prod/serv</label>
                        <input type="number" class="form-control" v-model="producto.productoID" name="Clave"
                            readonly="true" />
                    </div>
                    <div class="col-xs">
                        <label>Codigo prod/serv</label>
                       <b-form-input type="text" class="form-control" v-model="producto.productoCod" name="CB" maxlength="20"  @input="v => { producto.productoCod = v.toUpperCase()}" ></b-form-input>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md">
                        <label>Descripción corta</label>
                        <b-form-input type="text" class="form-control" v-model="producto.productoDescCorta" name="Descripcion"
                            maxlength="30" @input="v => { producto.productoDescCorta = v.toUpperCase()}" ></b-form-input>
                    </div>

                    <div class="col-md">
                        <label>Descripción larga</label>
                        <input type="text" class="form-control" v-model="producto.productoDescLarga" name="Descripcion"
                            maxlength="100" />
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm">
                        <label>Genero</label>
                        <b-form-select class="form-control" v-model="producto.prodGeneroID">
                            <option v-for="item in generos" :value="item.generoID">{{item.generoDescripcion}}</option>
                        </b-form-select>
                    </div>

                    <div class="col-sm">
                        <label>Color</label>
                        <b-form-select class="form-control" v-model="producto.prodColorID">
                            <option v-for="item in colores" :value="item.colorID">{{item.colorNombre}}</option>
                        </b-form-select>
                    </div>

                    <div class="col-sm">
                        <label>Estatus</label>
                        <b-form-select class="form-control" v-model="producto.prodEstatus" :options="optionsEstatus">
                        </b-form-select>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm">
                        <label>Talla</label>
                        <b-form-select class="form-control" v-model="producto.prodTallaID">
                            <option v-for="item in tallas" :value="item.tallaID">{{item.tallaNumero}}</option>
                        </b-form-select>
                    </div>

                    <div class="col-sm">
                        <label>Temporalidad</label>
                        <b-form-select class="form-control" v-model="producto.prodTemporadaID">
                            <option v-for="item in temporalidades" :value="item.temporalidadID">{{item.tempNombre}}
                            </option>
                        </b-form-select>
                    </div>

                    <div class="col-sm">
                        <label>Estilos</label>
                        <b-form-select class="form-control" v-model="producto.prodEstiloID">
                            <option v-for="item in estilos" :value="item.estiloID">{{item.estiloNombre}}</option>
                        </b-form-select>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm">
                        <label>Terminados</label>
                        <b-form-select class="form-control" v-model="producto.prodTerminadoID">
                            <option v-for="item in terminados" :value="item.terminadoID">{{item.terminadoNombre}}
                            </option>
                        </b-form-select>
                    </div>

                    
                    <div class="col-sm">
                        <label>Marca</label>
                        <b-form-select class="form-control" v-model="producto.prodMarcaID">
                            <option v-for="item in marcas" :value="item.marcaID">{{item.marcaNombre}}</option>
                        </b-form-select>
                    </div>

                    <div class="col-sm">
                        <label>Servicio</label>
                        <b-form-select class="form-control" v-model="producto.esServicio" :options="optionsEsServicio">
                        </b-form-select>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md">
                        <label>Precio renta</label>
                        <input type="|number" class="form-control" v-model="producto.prodPrecioRenta" name="Renta" />
                    </div>

                    <div class="col-md">
                        <label>Precio venta</label>
                        <input type="number" class="form-control" v-model="producto.prodPrecioVenta" name="Venta" />
                    </div>

                    <div class="col-md">
                        <label>Precio garantía</label>
                        <input type="number" class="form-control" v-model="producto.prodPrecioGarantia"
                            name="Garantía" />
                    </div>
                </div>


                <div class="form-group row">
                    <div class="col-md">
                        <label>Ocasión</label>
                        <input type="text" class="form-control" v-model="producto.prodOcasion" name="Ocasión"
                            maxlength="20" />
                    </div>

                    <div class="col-md">
                        <label>Formalidad</label>
                        <input type="text" class="form-control" v-model="producto.prodFormalidad" name="Formalidad"
                            maxlength="20" />
                    </div>
                </div>

                <div class="form-group row">
                    <style>
                        * {
                            font-family: Arial, Helvetica, sans-serif;
                        }

                        body {
                            background: #d8dddb;
                        }

                        .container {
                            display: flex;
                            justify-content: center;
                        }

                        .mt-10 {
                            margin-top: 10rem;
                        }

                        .bg-white {
                            background: #fff;
                        }

                        .card {
                            height: 5rem;
                            width: 10rem;
                            border-radius: 10px;
                            padding: 10px;
                            text-align: center;
                        }

                        img {
                            width: 10rem;
                        }
                    </style>
                    <div class="col-md">
                            <div class="card bg-white" style="width:60%;">
                                <img style="width:100%; max-width:250px;" :src="image1" alt="">
                                <b-button variant="info" class="float-left"><i class="fas fa-upload"></i>&nbsp; Cargar
                                    imágen
                                    <input @change="handleImage1" class="custom-input" type="file" accept="image/*"
                                        style="">
                                </b-button>
                            </div>
                    </div>
                                    <div class="col-md">
                            <div class="card bg-white" style="width:60%;">
                                <img style="width:100%; max-width:250px;" :src="image2" alt="">
                                <b-button variant="info" class="float-left"><i class="fas fa-upload"></i>&nbsp; Cargar
                                    imágen
                                    <input @change="handleImage2" class="custom-input" type="file" accept="image/*"
                                        style="">
                                </b-button>
                            </div>
                    </div>
                                 <div class="col-md">
                            <div class="card bg-white" style="width:60%;">
                                <img style="width:100%; max-width:250px;" :src="image3" alt="">
                                <b-button variant="info" class="float-left"><i class="fas fa-upload"></i>&nbsp; Cargar
                                    imágen
                                    <input @change="handleImage3" class="custom-input" type="file" accept="image/*"
                                        style="">
                                </b-button>
                            </div>
                
                    </div>
              <div class="col-md">
                            <div class="card bg-white" style="width:60%;">
                                <img style="width:100%; max-width:250px;" :src="image4" alt="">
                                <b-button variant="info" class="float-left"><i class="fas fa-upload"></i>&nbsp; Cargar
                                    imágen
                                    <input @change="handleImage4" class="custom-input" type="file" accept="image/*"
                                        style="">
                                </b-button>
                            </div>
                        </div>
              
                </div>


                <template #modal-footer>
                    <b-button variant="warning" class="float-left" @click="hideModal">
                        <i class="far fa-times-circle"></i>&nbsp; Cerrar
                    </b-button>

             <div v-show="guardando" class="text-center text-warning my-2" role="status">
                     <b-spinner class="align-middle"></b-spinner>
                  <strong>Guardando...</strong>
                  
                </div>

                    <b-button variant="primary" class="float-right" @click="GuardarProductos">
                        <i class="fas fa-save"></i> Guardar
                    </b-button>
                </template>
            </b-modal>

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
                            <h4 class="card-title">Listado de productos</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <b-table class="table table-hover table-striped" hover :items="this.productos"
                                    :fields="fields" :filter="filter" :filterIncludedFields="filterOn"
                                    @filtered="onFiltered" @row-clicked="editarRegistro" :per-page="perPage"
                                    :current-page="currentPage" :busy="isBusy" small>
                                    <template v-slot:table-busy>
                                        <div class="text-center text-warning my-2">
                                            <b-spinner class="align-middle"></b-spinner>
                                            <strong>Cargando productos...</strong>
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
        </template>
        </div>
    </div>
    <script src="js/Productos.js"></script>
</asp:Content>
