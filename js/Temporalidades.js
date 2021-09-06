var vue2 = new Vue({
    el: '#vuePage',
    data: {
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        temporalidad: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            temporalidadID: 0,
            tempNombre: '',
            tempEstatus: 'A'
        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        fields: [
            {
                key: 'temporalidadID',
                sortable: true,
            },
            {
                key: 'tempNombre',
                label: "Nombre temporalidad",
                sortable: true,
                filterByFormatted: true
            }
        ],
        filter: null,
        filterOn: [],
        temporalidades: [],
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
            return this.temporalidades.length
        }
    },
    mounted() {
        this.ObtieneTemporalidades()
    },
    methods: {
        ObtieneTemporalidades() {
            this.toggleBusy()
            var datos = {
                "temporalidadID": 0,
                "sucursalID": this.temporalidad.sucursalID
            }

            http.postLoader('catalogo/temporalidades', datos).then(response => {
                var res = response.data.data.data;
                this.temporalidades = res;
                this.toggleBusy()

            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        limpiarCampos() {
            this.temporalidad.temporalidadID = 0
            this.temporalidad.tempNombre = ''
            this.temporalidad.tempEstatus = 'A'
            this.ObtieneTemporalidades()
            this.filter = ''

        },
        editarRegistro(item) {

            this.temporalidad = item
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
        GuardarTemporalidades() {
            http.postLoader('catalogo/temporalidades/guardar', this.temporalidad).then(response => {

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