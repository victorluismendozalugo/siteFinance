var vue2 = new Vue({
    el: '#vuePage',
    data: {
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        concepto: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            conceptoID: 0,
            conceptoDesc: '',
            conceptoCosto: 0,
            conceptoEstatus: 'A'
        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        fields: [
            {
                key: 'conceptoID',
                sortable: true,
            },
            {
                key: 'conceptoDesc',
                label: "Nombre concepto",
                sortable: true,
                filterByFormatted: true
            },
            {
                key: 'conceptoCosto',
                label: "Costo concepto",
                sortable: true,
                filterByFormatted: true
            }
        ],
        filter: null,
        filterOn: [],
        conceptos: [],
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
            return this.conceptos.length
        }
    },
    mounted() {
        this.ObtieneConceptos()
    },
    methods: {
        ObtieneConceptos() {
            this.toggleBusy()
            var datos = {
                "conceptoID": 0,
                "sucursalID": this.concepto.sucursalID
            }

            http.postLoader('catalogo/conceptos', datos).then(response => {
                this.conceptos = response.data.data.data;
                this.toggleBusy()

            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        limpiarCampos() {
            this.concepto.conceptoID = 0
            this.concepto.conceptoDesc = ''
            this.concepto.conceptoCosto = 0
            this.concepto.conceptoEstatus = 'A'
            this.ObtieneConceptos()
            this.filter = ''

        },
        editarRegistro(item) {

            this.concepto = item
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
        GuardarConceptos() {
            http.postLoader('catalogo/conceptos/guardar', this.concepto).then(response => {

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