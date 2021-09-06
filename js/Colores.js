var vue2 = new Vue({
    el: '#vuePage',
    data: {
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        color: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            colorID: 0,
            colorNombre: '',
            colorEstatus: 'A'
        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        fields: [
            {
                key: 'colorID',
                sortable: true,
            },
            {
                key: 'colorNombre',
                label: "Nombre Color",
                sortable: true,
                filterByFormatted: true
            }
        ],
        filter: null,
        filterOn: [],
        colores: [],
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
            return this.colores.length
        }
    },
    mounted() {
        this.obtieneColores()
    },
    methods: {
        obtieneColores() {
            this.toggleBusy()
            var datos = {
                "colorID": 0,
                "sucursalID": this.color.sucursalID
            }

            http.postLoader('catalogo/colores', datos).then(response => {
                var res = response.data.data.data;
                this.colores = res;
                this.toggleBusy()

            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        limpiarCampos() {
            this.color.colorID = 0
            this.color.colorNombre = ''
            this.color.colorEstatus = 'A'
            this.obtieneColores()
            this.filter = ''

        },
        editarRegistro(item) {

            this.color = item
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
        guardarColores() {
            http.postLoader('catalogo/colores/guardar', this.color).then(response => {

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