

var vue2 = new Vue({
    el: '#vuePage',
    data: {
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        cliente: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            clienteID: 0,
            cliNombre: '',
            cliAPaterno: '',
            cliAMaterno: '',
            cliDomicilio: '',
            cliReferencia: '',
            cliCalle: '',
            cliNumero:0,
            cliCP: '',
            cliCiudad: 0,
            cliEstado: 0,
            cliTelefono: '',
            cliEmail: '',
            cliEstatus: 'A',
            cliFechaRegistro: '',
            cliResponsable: 1
        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        fields: [
            {
                key: 'clienteID',
                sortable: true,
            },
            {
                key: 'cliNombre',
                label: "Nombre cliente",
                sortable: true,
                filterByFormatted: true
            }
        ],
        clientes: [],
        ciudades: [],
        estados: [],
        filter: null,
        filterOn: [],
        isBusy: false,
    },
    computed: {
        sortOptions() {
            // Create an options list from our fields
            return this.fields
                .filter(f => f.sortable)
                .map(f => {
                    return { text: f.label, value: f.key }
                })
        },
        rows() {
            return this.clientes.length
        }
    },
    mounted() {
        //this.ObtieneClientes()
    },
    methods: {
        ObtieneClientes() {
            this.toggleBusy()
            var datos = {
                "clienteID": 0,
                "sucursalID": this.cliente.sucursalID
            }

            http.postLoader('catalogo/clientes', datos).then(response => {
                this.clientes = response.data.data.data;
                this.toggleBusy()

            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        limpiarCampos() {
            this.cliente.clienteID = 0
            this.cliente.cliNombre = ''
            this.cliente.cliAPaterno = ''
            this.cliente.cliAMaterno = ''
            this.cliente.cliDomicilio = ''
            this.cliente.cliReferencia = ''
            this.cliente.cliCalle = ''
            this.cliente.cliNumero = 0
            this.cliente.cliCP = ''
            this.cliente.cliCiudad = 0
            this.cliente.cliEstado = 0
            this.cliente.cliTelefono = ''
            this.cliente.cliEmail = ''
            this.cliente.cliEstatus = 'A'
            this.cliente.cliFechaRegistro = ''
            this.cliente.cliResponsable = 1
            this.ObtieneClientes()

        },
        editarRegistro(item) {

            this.cliente = item
            this.$bvModal.show('modal-registro');
        },
        onFiltered(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length
            this.currentPage = 1
        },
        toggleBusy() {
            this.isBusy = !this.isBusy
        },
        GuardarCliente() {
            http.postLoader('catalogo/clientes/guardar', this.cliente).then(response => {

                if (response.data.data.codigoError == 0) {
                    $.noticeSuccess(response.data.data.mensajeBitacora)
                    this.hideModal()
                } else {
                    $.noticeError("ERROR " + response.data.data.mensajeBitacora)
                }

            })
                .catch(e => {
                    console.log(e);
                })
        },
        hideModal() {
            this.limpiarCampos()
            this.$bvModal.hide('modal-registro');
        },

    }
});