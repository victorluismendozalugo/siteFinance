var vue2 = new Vue({
    el: '#vuePage',
    data: {
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        genero: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            generoID: 0,
            generoDescripcion: '',
            generostatus: 'A'
        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        fields: [
            {
                key: 'generoID',
                sortable: true,
            },
            {
                key: 'generoDescripcion',
                label: "Nombre genero",
                sortable: true,
                filterByFormatted: true
            }
        ],
        filter: null,
        filterOn: [],
        generos: [],
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
            return this.generos.length
        }
    },
    mounted() {
        this.ObtieneGeneros()
    },
    methods: {
        ObtieneGeneros() {
            this.toggleBusy()
            var datos = {
                "generoID": 0,
                "sucursalID": this.genero.sucursalID
            }

            http.postLoader('catalogo/generos', datos).then(response => {
                var res = response.data.data.data;
                this.generos = res;
                this.toggleBusy()

            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        limpiarCampos() {
            this.genero.generoID = 0
            this.genero.generoDescripcion = ''
            this.genero.generostatus = 'A'
            this.ObtieneGeneros()
            this.filter = ''

        },
        editarRegistro(item) {

            this.genero = item
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
        GuardarGeneros() {
            http.postLoader('catalogo/generos/guardar', this.genero).then(response => {

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