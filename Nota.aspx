<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nota.aspx.cs" Inherits="WebSystems2021.Nota" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="vuePage">
  <div class="container" style="border-radius:20px;">


    <div class="col-12">
      <div class="form-group row">
        <div class="col-sm-2">
          <label>Nota N°</label>
          <b-form-input type="number" class="form-control" v-model="nota.notaID" name="Nota" readonly="true">
          </b-form-input>
        </div>
        <div class="col-sm-3">
          <label>Fecha</label>
          <b-form-input type="date" class="form-control" v-model="nota.fechaMovimiento" readonly="readonly">
          </b-form-input>
        </div>
        <div class="col-sm-4">
          <label for="">Cliente</label>
          <b-select v-model="nota.clienteID" class="form-control-lg" style="border-radius:20px;">
            <option v-for="item in clientes" :value="item.clienteID" style="border-radius:20px;" class="dropdown-item">
              {{item.cliNombre}} {{item.cliAPaterno}}</option>
          </b-select>
       
        </div>
            <div class="col-sm-2">
          <label for="">Nuevo cliente</label>
                <br />
             <b-button v-b-modal.modal-registro-clientes class="btn btn-primary btn-sm" v-on:click="">
         <i class="now-ui-icons ui-1_simple-add"></i>
         <i class="now-ui-icons users_single-02"></i>
        </b-button>
                </div>
      </div>
    </div>
    <br />
    <div class="col-12">
      <div class="form-group row">
        <div class="col-sm-3">
          <label>F. Evento</label>
          <input type="date" class="form-control" v-model="nota.fechaEvento" :min="fechaMinima"
            v-on:change="calculaFechas" ref="FechaEv" />
        </div>
        <div class="col-sm-3">
          <label>F. Recolección</label>
          <input type="date" class="form-control" v-model="nota.fechaEntrega" />
        </div>
        <div class="col-sm-3">
          <label>F. Devolución</label>
          <input type="date" class="form-control" v-model="nota.fechaDevolucion" />
        </div>
      </div>
    </div>
    <br />
    <div class="col-12">
      <div class="form-group row">
        <div class="col-sm-6">
          <label>Buscar productos</label>
          <div class="input-group">
            <b-form-input type="text" class="form-control" placeholder="Escribe para buscar"
              v-model="this.textoBusqueda" @input="v => { this.textoBusqueda = v.toUpperCase()}"
              v-on:keypress="realizaBusqueda"></b-form-input>
            <div class="input-group-append" v-on:click="obtieneProductos">
              <span class="input-group-text"><i class="now-ui-icons ui-1_zoom-bold" ></i></span>
            </div>
          </div>
        </div>

          <div class="col-sm-4">
          <label>Verifica disponibilidad</label>
          <div class="input-group">
            <b-form-input type="text" class="form-control" placeholder="Escribe el modelo del producto y presiona enter"
              v-model="this.textoBusqDisponibilidad" @input="v => { this.textoBusqDisponibilidad = v.toUpperCase()}"
              v-on:keypress="verificaDosponibilidad"></b-form-input>
            <div class="input-group-append" v-on:click="verificaDisponibilidad">
              <span class="input-group-text"><i class="now-ui-icons ui-1_zoom-bold" ></i></span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <hr />
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-body">
            <div class="table-responsive">
              <b-table class="table table-bordered" width="100%" cellspacing="0" hover :items="nota.notaDetalle"
                :fields="fieldsproductosRentar" :busy="isBusy" small>
                <template v-slot:cell(acciones)="data">
                  <b-button size="sm" class="btn btn-danger btn-round" title="borrar" data-toggle="tooltip"
                    data-container="body" data-animation="true" v-if="nota.notaDetalle.length > 1"
                    v-on:click="BorrarProductoTabla(data.index)">
                    <i class="now-ui-icons ui-1_simple-remove"></i>
                  </b-button>
                </template>
              </b-table>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group row">
      <div class="col-6">
        <div class="card">
          <div class="card-body">
            <div class="form-group row">
              <div class="col-6">
                <label for="">Tipo de pago</label>
                <b-select v-model="tipoAbonoSelect" class="form-control-lg" style="border-radius:20px;">
                  <option v-for="item in pagos" :value="item.pagoID" style="border-radius:20px;" class="dropdown-item"
                    v-bind:value="{ id: item.pagoID, text: item.pagoNombre }">
                    {{item.pagoNombre}}</option>
                </b-select>
              </div>
              <div class="col-6">
                <label for="">Monto a abonar</label>
                <b-form-input type="number" v-model="montoAbono" class="form-control"
                  placeholder="Presiona enter para agregar" v-on:keypress="agregarAbono"></b-form-input>
              </div>
            </div>
            <hr />
            <div class="table-responsive">
              <b-table class="table table-bordered" width="100%" cellspacing="0" hover :items="nota.notaPagos"
                :fields="fieldsPagosRentas" :busy="isBusy" small>
                <template v-slot:cell(abonoAcciones)="data">
                  <b-button size="sm" class="btn btn-danger btn-round" title="borrar" data-toggle="tooltip"
                    data-container="body" data-animation="true" <%--v-if="productosRentar.length > 1" --%>
                    v-on:click="BorrarAbonoTablaAbonos(data.index)">
                    <i class="now-ui-icons ui-1_simple-remove"></i>
                  </b-button>
                </template>
              </b-table>
            </div>
          </div>
        </div>
      </div>
        <div class="col-6">
            <div class="card">
            <div class="card-body">
                <div class="form-group row">
                <div class="col-6">
                    <div class="form-group row">
                    <label class="col-sm-12 col-md-6 col-xl-6 col-form-label">Subtotal</label>
                    </div>
                    <div class="form-group row">
                    <label class="col-sm-12 col-md-6 col-xl-6 col-form-label">Descuento %</label>
                    </div>
                    <div class="form-group row">
                    <label class="col-sm-12 col-md-6 col-xl-6 col-form-label">Abonos</label>
                    </div>
                    <div class="form-group row">
                    <label class="col-sm-12 col-md-6 col-xl-6 col-form-label">Restante</label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group row">
                    <div class="col-sm-12">
                        <b-form-input type="number" class="form-control" readonly="readonly" v-model="nota.subTotal">
                        </b-form-input>
                    </div>
                    </div>
                    <div class="form-group row">
                    <div class="col-sm-12">
                        <b-select v-model="nota.descuentoID" class="form-control-lg" style="border-radius:20px;" v-on:change="asignaDescuento">
                        <option v-for="item in descuentos" :value="item.descuentoID" style="border-radius:20px;"
                            class="dropdown-item">
                            {{item.descuentoID}}</option>
                        </b-select>
                    </div>
                    </div>
                    <div class="form-group row">
                    <div class="col-sm-12">
                        <b-form-input type="number" class="form-control" readonly="readonly" v-model="nota.abonos">
                        </b-form-input>
                    </div>
                    </div>
                    <div class="form-group row">
                    <div class="col-sm-12">
                        <b-form-input type="number" class="form-control" readonly="readonly" v-model="nota.saldoRestante">
                        </b-form-input>
                    </div>
                    </div>
                </div>
                </div>
                <div class="form-group row">
                <div class="col-4">
                    <b-button variant="primary" v-on:click="consultaNotas">
                    <i class="now-ui-icons design_bullet-list-67"></i>
                    Consultar notas
                    </b-button>
                </div>
                <div class="col-5">
                    <b-button variant="primary" v-on:click="guardarNota">
                    <i class="now-ui-icons ui-1_send"></i>
                    Guardar cambios
                    </b-button>
                </div>
                </div>
            </div>
            </div>
        </div>
       </div>


      

    <b-modal id="modal-productos" size="lg" title="Large Modal" hide-header="true" hide-footer="true">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              <div class="table-responsive">
                <b-table class="table table-hover table-striped" hover :items="this.productos"
                  :fields="fieldsTablaProductos" :filter="filterTablaProductos"
                  :filterIncludedFields="filterOnTablaProductos" @filtered="onFilteredTablaProductos"
                  @row-clicked="seleccionarRegistro" :per-page="perPage" :current-page="currentPage" :busy="isBusy"
                  small>
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
    </b-modal>

         <b-modal id="modal-registro-clientes" size="lg" title="Large Modal" hide-header="true" v-on:hide="eventoCerrarModal">
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
                    <b-button variant="warning" class="float-left" @click="hideModaClientes">
                        <i class="far fa-times-circle"></i>&nbsp; Cerrar
                    </b-button>
                    <b-button variant="primary" class="float-right" @click="GuardarCliente">
                        <i class="fas fa-save"></i> Guardar
                    </b-button>
                </template>
            </b-modal>

      <%--modal consulta notas--%>
       <b-modal id="modal-consulta-notas" size="lg" title="Large Modal" hide-header="true" hide-footer="true">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              <div class="table-responsive">
                <b-table class="table table-hover table-striped" hover :items="this.notas"
                  :fields="fieldsListadoNotas" 
                    :filter="filterTablaListadoNotas"
                    @filtered="onFilteredTablaListadoNotas"
                  @row-clicked="ObtieneNota" :per-page="perPage" :current-page="currentPage" :busy="isBusy"
                  small>
                  <template v-slot:table-busy>
                    <div class="text-center text-warning my-2">
                      <b-spinner class="align-middle"></b-spinner>
                      <strong>Cargando notas...</strong>
                    </div>
                  </template>
                </b-table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </b-modal>
       <%--modal consulta notas--%>

     <%--modal cantidad de servicios a cobrar--%>
     <b-modal id="modal-cantidad-servicios" size="md" title="Large Modal" hide-header="true" hide-footer="true"
            data-backdrop="static" data-keyboard="false">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group row">
                                <div class="col-sm">
                                    <label>Ingrese la cantidad a cobrar</label>
                                    <input type="number" class="form-control" v-model="cantidadServicios" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <b-button variant="warning" class="float-left" @click="hideModalServicios">
                    <i class="far fa-times-circle"></i>&nbsp; Cerrar
                </b-button>
                <b-button variant="primary" class="float-right" @click="IngresaCantidadServiciosExtra">
                    <i class="fas fa-check"></i> Aceptar
                </b-button>
        </b-modal>
      <%--modal cantidad de servicios a cobrar--%>


  </div>
</div>
<script src="js/libs/moment.min.js"></script>
<script src="js/Notas.js"></script>
</asp:Content>