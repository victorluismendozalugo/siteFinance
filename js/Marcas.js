var vue2 = new Vue({
    el: '#vuePage',
    data: {
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        marca: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            marcaID: 0,
            marcaNombre: '',
            marcastatus: 'A'
        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        fields: [
            {
                key: 'marcaID',
                sortable: true,
            },
            {
                key: 'marcaNombre',
                label: "Nombre marca",
                sortable: true,
                filterByFormatted: true
            }
        ],
        filter: null,
        filterOn: [],
        marcas: [],
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
            return this.marcas.length
        }
    },
    mounted() {
        this.ObtieneMarcas()
    },
    methods: {
        ObtieneMarcas() {
            this.toggleBusy()
            var datos = {
                "marcaID": 0,
                "sucursalID": this.marca.sucursalID
            }

            http.postLoader('catalogo/marcas', datos).then(response => {
                var res = response.data.data.data;
                this.marcas = res;
                this.toggleBusy()

            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        limpiarCampos() {
            this.marca.marcaID = 0
            this.marca.marcaNombre = ''
            this.marca.marcastatus = 'A'
            this.ObtieneMarcas()
            this.filter = ''

        },
        editarRegistro(item) {

            this.marca = item
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
        GuardarMarcas() {
            http.postLoader('catalogo/marcas/guardar', this.marca).then(response => {

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