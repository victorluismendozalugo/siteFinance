﻿<%@ Page MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="Descuentos.aspx.cs" Inherits="WebSystems2021.Descuentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="vuePage">
  <div class="container">
    <template>
      <b-button v-b-modal.modal-registro variant="primary"><i class="far fa-plus-square"></i> &nbsp;Registrar nuevo</b-button>
      <b-modal id="modal-registro" size="lg" title="Large Modal" hide-header="true">
        <div class="form-group row">
          <div class="col-xs">
            <label>Clave descuento</label>
           <b-form-input type="number" class="form-control" v-model="descuento.descuentoID" name="Clave" readonly="true" ></b-form-input>
          </div>
          <div class="col-sm">
            <label>Porcentaje %</label>
             <b-form-input type="number" class="form-control" v-model="descuento.descuentoPorcentaje" name="Porcentaje" ></b-form-input>
          </div>
          <div class="col-sm">
            <label>Estatus</label>
            <b-form-select class="form-control" v-model="descuento.descuentoEstatus" :options="optionsEstatus"></b-form-select>
          </div>
        </div>
        <template #modal-footer>
          <b-button variant="warning" class="float-left" @click="hideModal">
          <i class="far fa-times-circle"></i>&nbsp;  Cerrar
          </b-button>
          <b-button variant="primary" class="float-right" @click="guardarDescuentos">
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
        <b-form-select class="form-control" v-model="perPage" id="perPageSelect" size="sm" :options="pageOptions">
        </b-form-select>
      </div>
    </div>

    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h4 class="card-title">Listado de descuentos</h4>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <b-table class="table table-hover table-striped" hover :items="this.descuentos" :fields="fields"
                :filter="filter" :filterIncludedFields="filterOn" @filtered="onFiltered" @row-clicked="editarRegistro"
                :per-page="perPage" :current-page="currentPage" :busy="isBusy" small>
                <template v-slot:table-busy>
                  <div class="text-center text-warning my-2">
                    <b-spinner class="align-middle"></b-spinner>
                    <strong>Cargando descuentos...</strong>
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
        <b-pagination class="pagination pagination-primary" v-model="currentPage" :total-rows="rows" :per-page="perPage"
          aria-controls="my-table"></b-pagination>
      </div>
    </div>
  </div>
</div>
<script src="js/Descuentos.js"></script>
</asp:Content>
