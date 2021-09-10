<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Documentacion.aspx.cs" Inherits="WebSystems2021.Documentacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="vuePage">
        <div class="container">
            <template>
                <div class="form-group row">
                    <div class="col-6">
                        <label>Referencia 1</label>
                        <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre1" name="Referencia"
                            maxlength="100" @input="v => { documentacion.referenciaNombre1 = v.toUpperCase()}" ></b-form-input>
                    </div>

                     <div class="col-2">
                        <label>Teléfono referencia 1</label>
                        <input type="text" class="form-control" v-model="documentacion.referenciaTelefono1" name="Teléfono"
                            maxlength="10" />
                    </div>
                </div>

                   <div class="form-group row">
                    <div class="col-6">
                        <label>Referencia 2</label>
                        <b-form-input type="text" class="form-control" v-model="documentacion.referenciaNombre2" name="Referencia"
                            maxlength="100" @input="v => { documentacion.referenciaNombre2 = v.toUpperCase()}" ></b-form-input>
                    </div>

                    <div class="col-2">
                        <label>Teléfono referencia 1</label>
                        <input type="text" class="form-control" v-model="documentacion.referenciaTelefono2" name="Teléfono"
                            maxlength="10" />
                    </div>
                </div>

            <div class="row">
                <div class="col-4">
                    <label for="files1" class="custom-input btn btn-success col fileinput-button"><i
                            class="fas fa-upload"></i>&nbsp; Cargar
                        identificación</label>
                    <input @change="handleImage1" class="custom-input btn btn-success col fileinput-button" type="file"
                        accept="image/*" style="visibility:hidden;" id="files1">
                     <img class="imgCargas" :src="identificacion" alt="" style="width:100%; max-width:150px;">
                </div>

                <div class="col-4">
                    <label for="files2" class="custom-input btn btn-success col fileinput-button"><i
                            class="fas fa-upload"></i>&nbsp; Cargar
                        comprobante de domicilio</label>
                    <input @change="handleImage2" class="custom-input btn btn-success col fileinput-button" type="file"
                        accept="image/*" style="visibility:hidden;" id="files2">
                      <img class="imgCargas" :src="compDomicilio" alt="" style="width:100%; max-width:150px;">
                </div>

                <div class="col-4">
                    <label for="files3" class="custom-input btn btn-success col fileinput-button"><i
                            class="fas fa-upload"></i>&nbsp; Cargar
                        comprobante de ingresos</label>
                    <input @change="handleImage3" class="custom-input btn btn-success col fileinput-button" type="file"
                        accept="image/*" style="visibility:hidden;" id="files3">
                    <img class="imgCargas" :src="compIngresos" alt="" style="width:100%; max-width:150px;">
                </div>

            </div>

              <div class="form-group row">
                    <div class="col">
                     <b-button variant="primary" class="float-right" @click="GuardarDocumentacion()">
                        <i class="fas fa-save"></i> Guardar
                    </b-button>
                    </div>
              </div>
                                    <%--<pre>{{this.documentacion}}</pre>--%>

        </template>
        </div>
    </div>
    <script src="js/Documentacion.js"></script>
</asp:Content>
