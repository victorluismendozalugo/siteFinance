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
        }
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
        notificacionRetiroModal() {

            $('#modalNotificacionRetiro').modal('show')

        }
    }
});