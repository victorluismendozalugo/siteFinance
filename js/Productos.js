var vue2 = new Vue({
    el: '#vuePage',
    data: {
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        producto: {
            productoSucID: parseInt(localStorage.getItem("SucursalID")),
            productoID: 0,
            productoCod: '',
            productoDescCorta: '',
            productoDescLarga: '',
            prodColorID: 0,
            prodGeneroID: 0,
            prodTallaID: 0,
            prodTemporadaID: 0,
            prodEstiloID: 0,
            prodTerminadoID: 0,
            prodMarcaID: 0,
            prodEstatus: 'A',
            prodOcasion: '',
            prodFormalidad: '',
            prodUsuarioResponsable: 1,
            prodImagen1: '',
            prodImagen2: '',
            prodImagen3: '',
            prodImagen4: '',
            prodPrecioRenta: 0,
            prodPrecioVenta: 0,
            prodPrecioGarantia: 0,
            esServicio:'N'

        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        optionsEsServicio: [
            { value: 'S', text: 'SERVICIO' },
            { value: 'N', text: 'PRODUCTO' }
        ],
        fields: [
            {
                key: 'productoCod',
                sortable: true,
                label: 'Código'
            },
            {
                key: 'productoID',
                sortable: true,
            },
            {
                key: 'productoDescCorta',
                label: "Nombre producto",
                sortable: true,
                filterByFormatted: true
            },
            {
                key: 'productoDescLarga',
                label: "Descripcion",
                sortable: true,
                filterByFormatted: true
            },
            {
                key: 'colorNombre',
                label: "Color",
            }
        ],
        filter: null,
        filterOn: [],
        tallas: [],
        productos: [],
        colores: [],
        generos: [],
        tallas: [],
        temporalidades: [],
        estilos: [],
        terminados: [],
        marcas: [],
        isBusy: false,
        guardando: false,
        image1: '',
        image2: '',
        image3: '',
        image4: '',
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
            return this.productos.length
        }
    },
    mounted() {
        this.ObtieneProductos()
        this.ObtieneGeneros()
        this.ObtieneColores()
        this.ObtieneTallas()
        this.ObtieneTemporalidades()
        this.ObtieneEstilos()
        this.ObtieneTerminados()
        this.ObtieneMarcas()
    },
    methods: {
        ObtieneProductos() {
            this.toggleBusy()
            var datos = {
                "productoID": 0,
                "productoSucID": this.producto.productoSucID
            }

            http.postLoader('catalogo/productos', datos).then(response => {
                this.productos = response.data.data.data;
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
                "sucursalID": this.producto.productoSucID
            }
            http.postLoader('catalogo/generos', datos).then(response => {
                this.generos = response.data.data.data

            })
                .catch(e => {
                    console.log(e);
                })
        },
        ObtieneColores() {
            var datos = {
                "colorID": 0,
                "sucursalID": this.producto.productoSucID
            }
            http.postLoader('catalogo/colores', datos).then(response => {
                this.colores = response.data.data.data

            })
                .catch(e => {
                    console.log(e);
                })
        },
        ObtieneTallas() {
            var datos = {
                "tallaID": 0,
                "sucursalID": this.producto.productoSucID
            }

            http.postLoader('catalogo/tallas', datos).then(response => {
                this.tallas = response.data.data.data;
            })
                .catch(e => {
                    console.log(e);
                })
        },
        ObtieneTemporalidades() {
            var datos = {
                "temporalidadID": 0,
                "sucursalID": this.producto.productoSucID
            }

            http.postLoader('catalogo/temporalidades', datos).then(response => {
                this.temporalidades = response.data.data.data;
            })
                .catch(e => {
                    console.log(e);
                })
        },
        ObtieneEstilos() {
            var datos = {
                "estiloID": 0,
                "sucursalID": this.producto.productoSucID
            }

            http.postLoader('catalogo/estilos', datos).then(response => {
                this.estilos = response.data.data.data;

            })
                .catch(e => {
                    console.log(e);
                })
        },
        ObtieneTerminados() {
            var datos = {
                "terminadoID": 0,
                "sucursalID": this.producto.productoSucID
            }

            http.postLoader('catalogo/terminados', datos).then(response => {
                this.terminados = response.data.data.data;

            })
                .catch(e => {
                    console.log(e);
                })
        },
        ObtieneMarcas() {
            var datos = {
                "marcaID": 0,
                "sucursalID": this.producto.productoSucID
            }

            http.postLoader('catalogo/marcas', datos).then(response => {
                this.marcas = response.data.data.data;

            })
                .catch(e => {
                    console.log(e);
                })
        },
        //manejo de imagenes
        handleImage1(e) {
            const selectedImage1 = e.target.files[0]; // get first file
            this.createBase64Image1(selectedImage1)
            console.log(this.image1)
        },
        handleImage2(e) {
            const selectedImage2 = e.target.files[0]; // get first file
            this.createBase64Image2(selectedImage2)
            console.log(this.image2)
        },
        handleImage3(e) {
            const selectedImage3 = e.target.files[0]; // get first file
            this.createBase64Image3(selectedImage3)
            console.log(this.image3)
        },
        handleImage4(e) {
            const selectedImage4 = e.target.files[0]; // get first file
            this.createBase64Image4(selectedImage4)
            console.log(this.image4)
        },
        createBase64Image1(fileObject) {
            const reader = new FileReader();
            reader.onload = (e) => {
                this.image1 = e.target.result;
                this.uploadImage(1);
            };
            if (fileObject != '') {
                reader.readAsDataURL(fileObject);
            }
        },
        createBase64Image2(fileObject) {
            const reader = new FileReader();
            reader.onload = (e) => {
                this.image2 = e.target.result;
                this.uploadImage(2);
            };
            if (fileObject != '') {
                reader.readAsDataURL(fileObject);
            }
        },
        createBase64Image3(fileObject) {
            const reader = new FileReader();
            reader.onload = (e) => {
                this.image3 = e.target.result;
                this.uploadImage(3);
            };
            if (fileObject != '') {
                reader.readAsDataURL(fileObject);
            }
        },
        createBase64Image4(fileObject) {
            const reader = new FileReader();
            reader.onload = (e) => {
                this.image4 = e.target.result;
                this.uploadImage(4);
            };
            if (fileObject != '') {
                reader.readAsDataURL(fileObject);
            }
        },
        uploadImage(obj) {

            if (obj == 1) {
                const { image1 } = this.image1;
                this.producto.prodImagen1 = this.image1
            }
            if (obj == 2) {
                const { image2 } = this.image2;
                this.producto.prodImagen2 = this.image2
            }
            if (obj == 3) {
                const { image3 } = this.image3;
                this.producto.prodImagen3 = this.image3
            }
            if (obj == 4) {
                const { image4 } = this.image4;
                this.producto.prodImagen4 = this.image4
            }

            //axios.post('http://127.0.0.1:8081/upload', { image })
            //    .then((response) => {
            //        this.remoteUrl = response.data.url;
            //    })
            //    .catch((err) => {
            //        return new Error(err.message);
            //    })
        },
        //manejo de imagenes
        limpiarCampos() {

            this.ObtieneProductos()
            this.filter = ''
            this.producto.productoID = 0
            this.producto.productoCod = ''
            this.producto.productoDescCorta = ''
            this.producto.productoDescLarga = ''
            this.producto.prodColorID = 0
            this.producto.prodGeneroID = 0
            this.producto.prodTallaID = 0
            this.producto.prodTemporadaID = 0
            this.producto.prodEstiloID = 0
            this.producto.prodTerminadoID = 0
            this.producto.prodMarcaID = 0
            this.producto.prodEstatus = 'A'
            this.producto.prodOcasion = ''
            this.producto.prodFormalidad = ''
            this.producto.prodUsuarioResponsable = 1
            this.producto.prodImagen1 = ''
            this.producto.prodImagen2 = ''
            this.producto.prodImagen3 = ''
            this.producto.prodImagen4 = ''
            this.producto.prodPrecioRenta = 0
            this.producto.prodPrecioVenta = 0
            this.producto.prodPrecioGarantia = 0
            this.image1 = ''
            this.image2 = ''
            this.image3 = ''
            this.image4 = ''
            this.image = ''
            this.producto.prodImagen1 = ''
            this.producto.prodImagen2 = ''
            this.producto.prodImagen3 = ''
            this.producto.prodImagen4 = ''
        },
        editarRegistro(item) {

            this.producto = item
            this.image1 = this.producto.prodImagen1
            this.image2 = this.producto.prodImagen2
            this.image3 = this.producto.prodImagen3
            this.image4 = this.producto.prodImagen4
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
        toggleCargando() {
            this.guardando = !this.guardando
        },
        GuardarProductos() {
            this.toggleCargando()
            http.postLoader('catalogo/productos/guardar', this.producto).then(response => {

                if (response.data.data.codigoError == 0) {
                    $.noticeSuccess(response.data.data.mensajeBitacora)
                    this.hideModal()
                    this.toggleCargando()
                } else {
                    $.noticeError("ERROR " + response.data.data.mensajeBitacora)
                    this.toggleCargando()
                }

            })
                .catch(e => {
                    console.log(e);
                    this.toggleCargando()
                })
        },
        hideModal() {
            this.limpiarCampos()
            this.$bvModal.hide('modal-registro');
        },
        onHideModal() {
            this.limpiarCampos()
        }
    }
});