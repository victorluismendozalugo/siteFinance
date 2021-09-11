var vue2 = new Vue({
    el: '#vuePage',
    data: {
        usuarios: {
            Usuario: '',
            Password: ''
        },
        sucursalID: 0,
        registro: {
            iDUsuario: 0,
            nombre: '',
            primerApellido: '',
            segundoApellido: '',
            celular: '',
            usuario: '',
            validaUsuario: '',
            contrasena: '',
            validaContrasena: '',
            fechaTermino: '20501231',
            quienAutoriza: 1,
            correo: '',
            sucursalID: 1,
            requiereToken: 1,
            rolID: 0
        },
        optiosRolUsuario: [
            { value: 2, text: 'Invertir' },
            { value: 3, text: 'Solicitar un préstamo' }
        ],
        solicitud: {
            usuario: '',
            sucursalID: 1
        },
        reg: /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,24}))$/
    },
    mounted() {
        localStorage.clear()
        //this.limpiarCampos()
    },
    computed: {
        //isEmailValid() {
        //    return this.registro.usuario != this.registro.validaUsuario && this.registro.usuario != '' && this.registro.validaUsuario != '' ? false : true;
        //},
    },
    methods: {
        ValidaCredenciales: function (e) {
            if (this.usuarios.Usuario != '' && this.usuarios.Password != '') {
                e.preventDefault()
                this.ValidaUsuario()
            } else {
                $.noticeError("ERROR ", "Favor de verificar sus datos")
            }
        },
        ValidaUsuario: function (e) {

            var datos = {
                "Usuario": this.usuarios.Usuario,
                "Password": this.usuarios.Password
            }
            http.postLoader('seguridad/login', datos).then(response => {

                if (response.data.data.codigoError == 0) {
                    console.log(response.data.data)
                    localStorage.setItem('accessToken', response.data.data.data.accessToken)
                    localStorage.setItem('refreshToken', response.data.data.data.refreshToken)
                    localStorage.setItem('Usuario', this.usuarios.Usuario)
                    this.sesion()

                } else {
                    $.noticeError("ERROR " + response.data.message)
                    this.limpiarCampos()
                }
            })
                .catch(e => {
                    this.limpiarCampos()
                    $.noticeError("ERROR DE RED, COMPRUEBE SU CONEXION A INTERNET")
                })
        },
        sesion() {
            axios.get('Sesion.aspx?type=0&login=' + this.usuarios.Usuario + '', {
            }).then(response => {
                if (response.data.msg == 'OK') {
                    $(location).attr('href', 'Default.aspx');
                } else {
                    $(location).attr('href', 'Login.aspx');
                }
            }).catch(e => {
                $(location).attr('href', 'Login.aspx');
            })

        },
        limpiarCampos() {
            this.usuarios.Usuario = ''
            this.usuarios.Password = ''
        },
        validaInicio(item) {
            if (item.charCode == 13 || item.code == "Enter") {
                if (this.usuarios.Usuario != '' && this.usuarios.Password != '') {
                    this.ValidaUsuario()
                } else {
                    $.noticeError("ERROR ", "Favor de verificar sus datos")
                }
            }
        },
        ValidaDatosRegistro() {
            if (this.registro.validaUsuario != ''
                && this.registro.usuario != ''
                && this.registro.contrasena != ''
                && this.registro.validaContrasena != ''
                && this.registro.celular != ''
                && this.registro.nombre != ''
                && this.registro.primerApellido != ''
                && this.registro.rolID != 0) {
                if (document.getElementsByClassName('is-invalid').length == 0) {
                    this.registroUsuario()
                } else {
                    $.noticeAlert("Favor de ingresar un correo electrónico válid0")
                }

            } else {
                $.noticeAlert("Favor de completar todos los campos")
            }
        },
        registroUsuario() {
            http.postLoader('activation/guardar', this.registro).then(response => {

                if (response.data.data.codigoError == 0) {

                    $.noticeSuccess("Favor de verificar su correo electrónico para activar su cuenta")
                    this.limpiarCamposRegistro()
                    $('#registrationModal').modal('hide')

                } else {
                    $.noticeError("ERROR " + response.data.message)
                }
            })
                .catch(e => {
                    this.limpiarCampos()
                    $.noticeError("ERROR DE RED, COMPRUEBE SU CONEXION A INTERNET")
                })
        },
        limpiarCamposRegistro() {

            this.registro.iDUsuario = 0
            this.registro.nombre = ''
            this.registro.primerApellido = ''
            this.registro.segundoApellido = ''
            this.registro.celular = ''
            this.registro.usuario = ''
            this.registro.validaUsuario = ''
            this.registro.contrasena = ''
            this.registro.validaContrasena = ''
            this.registro.fechaTermino = '20501231'
            this.registro.quienAutoriza = 1
            this.registro.correo = ''
            this.registro.sucursalID = 1
            this.registro.requiereToken = 1
            this.registro.rolID = 0

        },
        ValidaDatosSolicitudCorreo() {

            if (this.solicitud.usuario == '') {
                $.noticeAlert("Favor de ingresar un correo")
            } else {
                http.postLoader('activation/email', this.solicitud).then(response => {

                    if (response.data.data.codigoError == 0) {
                        $.noticeSuccess("Favor de verificar su correo electrónico para activar su cuenta")
                        $('#solicitudCorreoModal').modal('hide')

                    } else {
                        $.noticeError("ERROR " + response.data.message)
                    }
                })
                    .catch(e => {
                        this.limpiarCampos()
                        $.noticeError("ERROR DE RED, COMPRUEBE SU CONEXION A INTERNET")
                    })
            }
        },
        isEmailValidUser() {
            return (this.registro.usuario == "") ? "" : (this.reg.test(this.registro.usuario)) ? 'is-valid' : 'is-invalid';
        },
        isEmailValidUser2() {
            return (this.registro.validaUsuario == "") ? "" : (this.reg.test(this.registro.validaUsuario)) ? 'is-valid' : 'is-invalid';
        },
        validaEmails() {
            if (this.registro.validaUsuario != this.registro.usuario) {
                $.noticeAlert("Los correos electrónicos no coinciden, favor de verificarlos")
                this.registro.validaUsuario = ''
                this.registro.usuario = ''
            }
        },
        validaContras() {
            if (this.registro.contrasena != this.registro.validaContrasena) {
                $.noticeAlert("Las contraseñas no coinciden, favor de verificarlas")
                this.registro.contrasena = ''
                this.registro.validaContrasena = ''
            }
        },
        validaTelefono() {
            if (this.registro.celular.length < 10) {
                $.noticeAlert("Favor de verificar su teléfono de contacto")
                this.registro.celular = ''
            }
        }
    }
});