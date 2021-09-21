var opcionesMenu = "";
var listNotificaciones = "";
var app = new Vue({
    el: '#app',
    data: {
        show: false,
        menus: [],
        notificaciones: [],
        totalNotificaciones: 0,
        notificacion: {
            Sucursal: 1,
            Receptor: localStorage.getItem('Usuario'),
            Estatus: ''
        }
    },
    mounted() {
        this.ObtieneMenu()
        this.UsuarioLogueado()
        this.validaSesion()
    },
    methods: {

        ObtieneMenu() {
            var datos = {
                "Usuario": localStorage.getItem('Usuario')
            }
            http.postLoader('usuarios/menu', datos).then(response => {

                this.menus = response.data.data.data;
                this.validaPermisosUsuario(this.menus)
                $('#menu').html('');

                $.each(this.menus, function (key, value) {

                    opcionesMenu += "<li class='nav-item'>"
                    opcionesMenu += "<a href='" + value["menu"] + ".aspx' class='nav-link'>"
                    opcionesMenu += "<i class='" + value["clase"] + "'></i>"
                    opcionesMenu += "<p>"
                    opcionesMenu += "&nbsp;" + value["nombreMenu"]
                    opcionesMenu += "</p>"
                    opcionesMenu += "</a>"
                    opcionesMenu += "</li>"






                    //if (value["modulo"] == "Catalogo") {


                    //    cat += " <a class='dropdown-item' href='" + value["menu"] + ".aspx'>" + value["nombreMenu"] + " </a> "
                    //    $('#navbarDropdown').removeClass('disabled')
                    //}

                    //if (value["modulo"] == "Movimiento") {
                    //    mov += " <a class='dropdown-item' href='" + value["menu"] + ".aspx'>" + value["nombreMenu"] + " </a> "
                    //    $('#navbarDropdown2').removeClass('disabled')
                    //}

                });
                $('#menu').html(opcionesMenu);
                this.ObtieneNotificacionesUsuario()


            })
                .catch(e => {
                    console.log(e);
                })
        },
        UsuarioLogueado() {

            $('#sUsuario').text(localStorage.getItem('Usuario'))
            $('#UsuarioSistema').text(localStorage.getItem('Usuario'))
            $('#PaginaActual').text(g_config.page.currentPage.replace('/', ' '))



        },
        validaSesion() {
            if (localStorage.getItem('Usuario') == null || localStorage.getItem('Usuario') == "") {
                $(location).attr('href', 'Login.aspx');
            }
        },
        validaPermisosUsuario(menu) {
            //if (g_config.page.currentPage.replace('/', '') != 'Default') {
            //    var count = 0;
            //    for (var i = 0; i < menu.length; i++) {
            //        if (menu[i].menu == g_config.page.currentPage.replace('/', '')) {
            //            count++;
            //        }
            //    }
            //    if (count == 0) {
            //        $(location).attr('href', 'Login.aspx');
            //    }
            //}
        },
        ObtieneNotificacionesUsuario() {
            http.postLoader('notify/consultar', this.notificacion).then(response => {
                this.notificaciones = response.data.data.data
                this.totalNotificaciones = this.notificaciones.length
            })
                .catch(e => {
                    console.log(e);
                })
        },
        obtienedataNotificacion(item) {
            this.$bvModal.show('modal-notificaciones');
            console.log(item)
        }
    }
})
