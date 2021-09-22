var vue2 = new Vue({
    el: '#vuePage',
    data: {
        clientes: [],
        cliente:[]
    },
    computed: {

    },
    mounted() {
        this.ObtieneClientes()
    },
    methods: {
        ObtieneClientes() {
            var datos = {
                "Usuario": 1,
                "SucursalID": 1
            }
            http.postLoader('doc/clientes/documentacion', datos).then(response => {
                if (response.data.data.codigoError == 0) {
                    this.clientes = response.data.data.data

                } else {
                    $.noticeError("ERROR " + response.data.data.mensajeBitacora)
                }
            })
                .catch(e => {
                    console.log(e);
                })
        },
        ObtieneDatosCliente(item) {
            this.$bvModal.show('modal-informacion-usuario');
            this.cliente = item
        }
    }
});