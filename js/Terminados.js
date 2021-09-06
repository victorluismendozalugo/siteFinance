var vue2 = new Vue({
    el: '#vuePage',
    data: {
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        terminado: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            terminadoID: 0,
            terminadoNombre: '',
            terminadoEstatus: 'A'
        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        fields: [
            {
                key: 'terminadoID',
                sortable: true,
            },
            {
                key: 'terminadoNombre',
                label: "Nombre terminado",
                sortable: true,
                filterByFormatted: true
            }
        ],
        filter: null,
        filterOn: [],
        terminados: [],
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
            return this.terminados.length
        }
    },
    mounted() {
        this.ObtieneTerminados()
    },
    methods: {
        ObtieneTerminados() {
            this.toggleBusy()
            var datos = {
                "terminadoID": 0,
                "sucursalID": this.terminado.sucursalID
            }

            http.postLoader('catalogo/terminados', datos).then(response => {
                var res = response.data.data.data;
                this.terminados = res;
                this.toggleBusy()

            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        limpiarCampos() {
            this.terminado.terminadoID = 0
            this.terminado.terminadoNombre = ''
            this.terminado.terminadoEstatus = 'A'
            this.ObtieneTerminados()
            this.filter = ''

        },
        editarRegistro(item) {

            this.terminado = item
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
        GuardarTerminados() {
            http.postLoader('catalogo/terminados/guardar', this.terminado).then(response => {

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