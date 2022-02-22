var vue2 = new Vue({
    el: '#vuePage',
    data: {
        notificacion: {
            sucursal: 1,
            remitente: localStorage.getItem('Usuario'),
            receptor: 'admin@finance',
            previa: '', //vista previa del texto
            texto: '', //texto completo
            imagen: '',
            monto: 0
        },
    },
    computed: {

    },
    mounted() {
    },
    methods: {
        enviarNotificacion() {
            this.notificacion.previa = 'Notif. Retiro'
            this.notificacion.texto = "Notificación de retiro de cuenta de inversión, cliente : " + localStorage.getItem('NombreUsuario') + ", por el monto de: $" + String(this.notificacion.monto)

            http.postLoader('notify/enviar', this.notificacion).then(response => {

                if (response.data.data.codigoError == 0) {
                    $.noticeSuccess(response.data.data.mensajeBitacora)

                } else {
                    $.noticeError("ERROR " + response.data.data.mensajeBitacora)
                }
            })
                .catch(e => {
                    console.log(e);
                })
        },
        enviarNotificacionDeposito() {
            this.notificacion.previa = 'Notif. Depósito'
            this.notificacion.texto = "Notificación de depósito a cuenta de inversión, cliente : " + localStorage.getItem('NombreUsuario') + ", por el monto de: $" + String(this.notificacion.monto)

            if (this.notificacion.monto != 0) {
                this.notificacion.imagen = '\\images\\' + g_imagen
                if (this.notificacion.imagen == '\\images\\undefined') {
                    $.noticeAlert("Favor de seleccionar una imágen para cargar")
                } else {
                    enviarImagen();
                    http.postLoader('notify/enviar', this.notificacion).then(response => {

                        if (response.data.data.codigoError == 0) {
                            $.noticeSuccess(response.data.data.mensajeBitacora)
                            this.notificacion.previa = ''
                            this.notificacion.texto = ''
                            this.notificacion.imagen = ''
                            this.notificacion.monto = 0

                            $('#modalNotificacionDeposito').modal('hide')
                        } else {
                            $.noticeError("ERROR " + response.data.data.mensajeBitacora)
                        }
                    })
                        .catch(e => {
                            console.log(e);
                        })
                }
            }
        },
        notificacionRetiroModal() {

            $('#modalNotificacionRetiro').modal('show')

        },
        notificacionDepositoModal() {

            $('#modalNotificacionDeposito').modal('show')

        }
    }
});

var dat;
var g_imagen = "";

$('#btnFileUpload').fileupload({
    url: 'FileUps.ashx?upload=start',
    async: false,
    add: function (e, data) {
        console.log('add', data);
        dat = data;
        g_imagen = dat.files[0].name;
        $.noticeSuccess("Imagen seleccionada");
    },
    success: function (response, status) {
        $.noticeSuccess("Imagen cargada con éxito");

        //GuardaImagen();
        $('#imagen').attr('src', null);
        //readURL(null);
        dat = null;
        g_imagen = "";

    },
    error: function (error) {
        $.noticeError(error.responseText, "Error intentalo nuevamente");
        $('#imagen').attr('src', null);
        //readURL(null);
        dat = null;
        g_imagen = "";
    }
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#imagen').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]); // convert to base64 string
    }
}

var cargaImg = function (ruta) {
    if (ruta != null) {
        document.getElementById("imagen").src = ruta;
    }

}

$("#btnFileUpload").change(function () {
    readURL(this);
});

var cargarF = function () {

    dat.submit();
}

$("#btnCargar").click(function () {



});

var enviarImagen = function () {
    dat == 'undefined' ? $.noticeAlert("Favor de seleccionar una imágen para cargar") : null;
    vue2.notificacion.monto != 0 ? cargarF() : $.noticeAlert("Favor de ingresar el monto del depósito");
}