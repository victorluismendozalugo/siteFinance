var vue2 = new Vue({
    el: '#vuePage',
    data: {
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        talla: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            tallaID: 0,
            tallaNumero: '',
            tallastatus: 'A'
        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        fields: [
            {
                key: 'tallaID',
                sortable: true,
            },
            {
                key: 'tallaNumero',
                label: "Nombre talla",
                sortable: true,
                filterByFormatted: true
            }
        ],
        filter: null,
        filterOn: [],
        tallas: [],
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
            return this.tallas.length
        }
    },
    mounted() {
        this.ObtieneTallas()
        this.ObtieneGeneros()
    },
    methods: {
        ObtieneTallas() {
            this.toggleBusy()
            var datos = {
                "tallaID": 0,
                "sucursalID": this.talla.sucursalID
            }

            http.postLoader('catalogo/tallas', datos).then(response => {
                    this.tallas = response.data.data.data;
                this.toggleBusy()

            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        ObtieneGeneros() {
            var datos = {
                "generoID": 0,
                "sucursalID": this.talla.sucursalID
            }
            http.postLoader('catalogo/generos', datos).then(response => {
                this.generos = response.data.data.data

            })
                .catch(e => {
                    console.log(e);
                })
        },
        limpiarCampos() {
            this.talla.tallaID = 0
            this.talla.tallaNombre = ''
            this.talla.tallastatus = 'A'
            this.ObtieneTallas()
            this.filter = ''

        },
        editarRegistro(item) {

            this.talla = item
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
        GuardarTallas() {
            http.postLoader('catalogo/tallas/guardar', this.talla).then(response => {

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