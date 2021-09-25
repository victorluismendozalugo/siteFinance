var vue2 = new Vue({
    el: '#vuePage',
    data: {
        notificacion: {
            sucursal: 1,
            remitente: localStorage.getItem('Usuario'),
            receptor: 'vi@finance',
            previa: '', //vista previa del texto
            texto: '', //texto completo
            imagen: ''
        }
    },
    computed: {

    },
    mounted() {
    },
    methods: {
        enviarNotificacion() {
            this.notificacion.previa = 'Notif. Retiro'
            this.notificacion.texto = "Notificación de retiro de cuenta de inversión, cliente : " + localStorage.getItem('Usuario')

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
        }
    }
});