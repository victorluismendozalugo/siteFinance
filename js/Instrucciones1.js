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
        g_ruta_imagen: '\\images\\'
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
        }, enviarNotificacionDeposito() {
            this.notificacion.previa = 'Notif. Depósito'
            this.notificacion.texto = "Notificación de depósito a cuenta de inversión, cliente : " + localStorage.getItem('NombreUsuario') + ", por el monto de: $" + String(this.notificacion.monto)

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
        notificacionRetiroModal() {

            $('#modalNotificacionRetiro').modal('show')

        },
        notificacionDepositoModal() {

            $('#modalNotificacionDeposito').modal('show')

        }
    }
});



$('#btnFileUpload').fileupload({
    url: 'File.ashx?upload=start',
    async: false,
    add: function (e, data) {
        console.log('add', data);
        dat = data;
        //data.submit();
        g_imagen = dat.files[0].name;
    },
    success: function (response, status) {
        $.noticeSuccess("Imagen cargada con éxito");

        GuardaImagen();


    },
    error: function (error) {
        $.noticeError(error.responseText, "Error intentalo nuevamente");
        $('#imagen').attr('src', null);
        readURL(null);
        dat = null;
        g_imagen = "";
    }
});
