var vue2 = new Vue({
    el: '#vuePage',
    data: {
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        estilo: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            estiloID: 0,
            estiloNombre: '',
            estilostatus: 'A'
        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        fields: [
            {
                key: 'estiloID',
                sortable: true,
            },
            {
                key: 'estiloNombre',
                label: "Nombre estilo",
                sortable: true,
                filterByFormatted: true
            }
        ],
        filter: null,
        filterOn: [],
        estilos: [],
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
            return this.estilos.length
        }
    },
    mounted() {
        this.ObtieneEstilos()
    },
    methods: {
        ObtieneEstilos() {
            this.toggleBusy()
            var datos = {
                "estiloID": 0,
                "sucursalID": this.estilo.sucursalID
            }

            http.postLoader('catalogo/estilos', datos).then(response => {
                var res = response.data.data.data;
                this.estilos = res;
                this.toggleBusy()

            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        limpiarCampos() {
            this.estilo.estiloID = 0
            this.estilo.estiloNombre = ''
            this.estilo.estilostatus = 'A'
            this.ObtieneEstilos()
            this.filter = ''

        },
        editarRegistro(item) {

            this.estilo = item
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
        GuardarEstilos() {
            http.postLoader('catalogo/estilos/guardar', this.estilo).then(response => {

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