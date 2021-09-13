<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebSystems2021.Login" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FinanceApp v1.1.0 | Login</title>
    <link href="Vue/bootstrap-vue/2.12.0/bootstrap-vue.css?1.1.0" rel="stylesheet" />

    <script src="Vue/vue2.6.11.min/vue2.6.11.min.js?1.1.0"></script>
    <script src="Vue/bootstrap-vue/2.12.0/bootstrap-vue-icons.min.js?1.1.0"></script>
    <script src="Vue/bootstrap-vue/2.12.0/bootstrap-vue.js?1.1.0"></script>

    <script src="Vue/bootstrap-vue/2.12.0/bootstrap-vue-icons.min.js?1.1.0"></script>

    <link href="css/blockUI.css?1.1.0" rel="stylesheet" />
    <link href="css/toastr.min.css?1.1.0" rel="stylesheet" />
    <script src="Scripts/axios.min.js?1.1.0"></script>

    <script src="js/util.js?1.1.0"></script>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link href="Theme/plugins/fontawesome-free/css/all.min.css" rel="stylesheet" />
    <!-- icheck bootstrap -->
    <link href="Theme/plugins/icheck-bootstrap/icheck-bootstrap.min.css" rel="stylesheet" />
    <!-- Theme style -->
    <link href="Theme/dist/css/adminlte.min.css" rel="stylesheet" />
</head>
<body class="hold-transition login-page">
    <div id="vuePage">
        <template>
    <div class="login-box">
        <div class="login-logo">
            <%--<a href="#"><b>Finance</b>APP</a>--%>

        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
            <%--    <p class="login-box-msg">Ingrese sus datos para iniciar sesión</p>--%>
<img src="images/LogoLogin.jpg" />
                <form>
                    <div class="input-group mb-3">
                         <input type="text" class="form-control" placeholder="Usuario" v-model="usuarios.Usuario"
                        name="usuario" value="" required="required">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-user"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="Password" placeholder="Contraseña" class="form-control" v-model="usuarios.Password"
                        name="password" value="" v-on:keypress="validaInicio" required="required" />
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="icheck-primary">
                                <input type="checkbox" id="remember">
                                <label for="remember">
                                    Recordar datos
                                </label>
                            </div>
                        </div>

                        <div class="col-4">
                               <b-button type="submit" class="btn btn-primary btn-block" @click="ValidaCredenciales">Iniciar
                    </b-button>
                        </div>
                    </div>
                </form>


                <p class="mb-1">
                    <%--<a class="nav-link text-center" href="#">Olvidé mi usuario</a>--%>
                </p>
                <p class="mb-0">
                     <a class="nav-link text-center" data-toggle="modal" data-target="#registrationModal" href="#" role="button">
                       Solicite su usuario
                    </a>
                </p>
            </div>

        </div>
    </div>

             <!-- Modal Registration -->
    <div class="modal fade" id="registrationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Solicitud de registro</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                 <div class="card-body">
                      <div class="form-group">
                    <label>¿Que desea hacer?</label>
                        <b-form-select class="form-control" v-model="registro.rolID" :options="optiosRolUsuario">
                        </b-form-select>
                  </div>
                  <div class="form-group">
                    <label for="inputName">Nombre(s)</label>
                   <b-form-input type="text" class="form-control" v-model="registro.nombre" placeholder="Ingrese su(s) nombre(s)" @input="v => { registro.nombre = v.toUpperCase()}"></b-form-input>
                  </div>
                  <div class="form-group">
                    <div class="row">
                  <div class="col-6">
                      <label>Apellido parterno</label>
                    <b-form-input type="text" class="form-control" v-model="registro.primerApellido"  placeholder="Apellido parterno" @input="v => { registro.primerApellido = v.toUpperCase()}"></b-form-input>
                  </div>
                  <div class="col-6">
                    <label>Apellido materno</label>
                     <b-form-input type="text" class="form-control"  v-model="registro.segundoApellido" placeholder="Apellido materno" @input="v => { registro.segundoApellido = v.toUpperCase()}"></b-form-input>
                  </div>
                </div>
                  </div>
                  <div class="form-group">
                    <label>Celular</label>
                     <b-form-input type="text" class="form-control"  v-model="registro.celular" placeholder="Ingrese su celular (10 digitos)" maxlength="10" @blur="validaTelefono"></b-form-input
                  </div>
                   <div class="form-group" >
                    <label>Correo</label>
                        <b-form-input type="email" class="form-control" placeholder="Ingrese su correo electrónico" v-model="registro.usuario" :class="[isEmailValidUser()]" required placeholder="Ingrese su correo electrónico" @input="v => { registro.usuario = v.toUpperCase()}"></b-form-input> 
            
                    <label>Validación correo</label>
                        <b-form-input type="email" class="form-control" placeholder="Ingrese nuevamente su correo electrónico" v-model="registro.validaUsuario" :class="[isEmailValidUser2()]" required placeholder="Ingrese su correo electrónico" @input="v => { registro.validaUsuario = v.toUpperCase()}" @blur="validaEmails"></b-form-input> 
                       </div>
                  <div class="form-group">
                        <div class="row">
                          <div class="col-6">
                              <label>Contraseña</label>
                            <input type="password" class="form-control" v-model="registro.contrasena"  placeholder="Ingrese una contraseña">
                          </div>
                      <div class="col-6">
                        <label>Validación Contraseña</label>
                        <input type="password" class="form-control"  v-model="registro.validaContrasena" placeholder="Ingrese nuevamente su contraseña"  @blur="validaContras">
                      </div>
                    </div>
                  </div>

                </div>

   <p class="mb-0">
                     <a class="nav-link text-center" data-toggle="modal" data-target="#solicitudCorreoModal" href="#" role="button">
                       No he recibido el correo
                    </a>
                </p>
                </div>
                <div class="modal-footer">
                     <b-button type="button" variant="secondary" data-dismiss="modal">Cancelar</b-button>
                     <b-button type="button" variant="primary" @click="ValidaDatosRegistro">Registrar
                    </b-button>
                </div>
            </div>
        </div>
    </div>
 <!-- Modal Registration -->

            <%--Modal solicitud correo--%>

             <div class="modal fade" id="solicitudCorreoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="">Solicitud de correo para activación de cuenta</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="card-body">
                            <div class="form-group">
                            <label>Ingrese su correo electrónico</label>
                                <b-form-input type="text" class="form-control" v-model="solicitud.usuario" placeholder="Ingrese su correo electrónico" @input="v => { solicitud.usuario = v.toUpperCase()}"></b-form-input>
                            </div>
                            </div>
                        </div>
                         <div class="modal-footer">
                     <b-button type="button" variant="secondary" data-dismiss="modal">Cancelar</b-button>
                     <b-button type="button" variant="primary" @click="ValidaDatosSolicitudCorreo">Solicitar
                    </b-button>
                </div>
                    </div>
                </div>
             </div>

            <%--Modal solicitud correo--%>

            </template>

    </div>



    <!-- jQuery -->
    <script src="Theme/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="Theme/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="Theme/dist/js/adminlte.min.js"></script>
    <script src="js/libs/jquery.blockUI.js?1.1.0"></script>
    <script src="js/libs/toastr.min.js?1.1.0"></script>
    <script src="js/libs/jquery.blockUI.messages.js?1.1.0"></script>
    <script src="js/Login.js?1.1.10"></script>
</body>
</html>
