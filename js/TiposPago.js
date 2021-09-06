var vue2 = new Vue({
    el: '#vuePage',
    data: {
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        pago: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            pagoID: 0,
            pagoNombre: '',
            pagoEstatus: 'A'
        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        fields: [
            {
                key: 'pagoID',
                sortable: true,
            },
            {
                key: 'pagoNombre',
                label: "Nombre tipo pago",
                sortable: true,
                filterByFormatted: true
            }
        ],
        filter: null,
        filterOn: [],
        pagos: [],
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
            return this.pagos.length
        }
    },
    mounted() {
        this.ObtieneTiposPago()
    },
    methods: {
        ObtieneTiposPago() {
            this.toggleBusy()
            var datos = {
                "pagoID": 0,
                "sucursalID": this.pago.sucursalID
            }

            http.postLoader('catalogo/pagos', datos).then(response => {
                var res = response.data.data.data;
                this.pagos = res;
                this.toggleBusy()

            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        limpiarCampos() {
            this.pago.pagoID = 0
            this.pago.pagoNombre = ''
            this.pago.pagoEstatus = 'A'
            this.ObtieneTiposPago()
            this.filter = ''

        },
        editarRegistro(item) {

            this.pago = item
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
        GuardarTiposPago() {
            http.postLoader('catalogo/pagos/guardar', this.pago).then(response => {

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