var vue2 = new Vue({
    el: '#vuePage',
    data: {
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        descuento: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            descuentoID: 0,
            descuentoPorcentaje: 0,
            descuentoEstatus: 'A'
        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        fields: [
            {
                key: 'descuentoID',
                sortable: true,
            },
            {
                key: 'descuentoPorcentaje',
                label: "Porcenjate %",
                sortable: true,
                filterByFormatted: true
            }
        ],
        filter: null,
        filterOn: [],
        descuentos: [],
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
            return this.descuentos.length
        }
    },
    mounted() {
        this.obtieneDescuentos()
    },
    methods: {
        obtieneDescuentos() {
            this.toggleBusy()
            var datos = {
                "descuentoID": 0,
                "sucursalID": this.descuento.sucursalID
            }

            http.postLoader('catalogo/descuentos', datos).then(response => {
                    this.descuentos = response.data.data.data;
                this.toggleBusy()

            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        limpiarCampos() {
            this.descuento.descuentoID = 0
            this.descuento.descuentoPorcentaje = 0
            this.descuento.descuentoEstatus = 'A'
            this.obtieneDescuentos()
            this.filter = ''

        },
        editarRegistro(item) {

            this.descuento = item
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
        guardarDescuentos() {
            http.postLoader('catalogo/descuentos/guardar', this.descuento).then(response => {

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