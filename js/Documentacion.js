


var vue2 = new Vue({
    el: '#vuePage',
    data: {
        documentacion: {
            usuario: localStorage.getItem('Usuario'),
            sucursalID: 1,
            iDSolicitud: 0,
            identificacion: '',
            compDomicilio: '',
            compIngresos: '',
            referenciaNombre1: '',
            referenciaTelefono1: '',
            referenciaNombre2: '',
            referenciaTelefono2: '',
            correo: '',
            nombre: '',
            apaterno: '',
            amaterno: '',
            dondeSeEntero: '',
            genero: '',
            fechaNacimiento: '',
            fechaRegistro: '',
            edad: 0,
            paisNacimiento: '',
            nacionalidad: '',
            curp: '',
            rfc: '',
            nivelEstudios: '',
            edoCivil: '',
            ocupacion: '',
            calleNumero: '',
            colonia: '',
            codigoPostal: '',
            municipio: '',
            estado: '',
            pais: '',
            tipoVivienda: '',
            tiempoVivir: 0,
            telefonoCasa: '',
            celular: '',
            entidadFederativa: '',
            nombreEmpresa: '',
            calleNumeroEmpresa: '',
            coloniaEmpresa: '',
            codigoPostalEmpresa: '',
            municipioEmpresa: '',
            estadoEmpresa: '',
            telefonoEmpresa: '',
            antiguedad: 0,
            ingresoMensual: '',
            frecuenciaPago: '',
            nombreConyugue: '',
            apellidoPConyugue: '',
            apellidoMConyugue: '',
            telefonoConyugue: '',
            celularConyugue: '',
            ocupacionConyugue: '',
            ingresoMensualConyugue: '',
            bancoCredito: '',
            ctaClabeTarjeta: ''
        },
        optionsGenero: [
            { value: 'H', text: 'Hombre' },
            { value: 'M', text: 'Mujer' }
        ],
        identificacion: '',
        compDomicilio: '',
        compIngresos: '',
        PDFidentificacion: '',
        PDFcompDomicilio: '',
        PDFcompIngresos: '',

    },
    mounted() {
        this.ObtieneDocumentacion()
    },
    methods: {
        ObtieneDocumentacion() {
            http.postLoader('doc/consulta', this.documentacion).then(response => {
                console.log(response)
                if (response.data.data.data.length != 0) {
                    this.documentacion = response.data.data.data[0];

                    if (this.documentacion.identificacion.split(';')[0] == "data:application/pdf") {
                        this.PDFidentificacion = this.documentacion.identificacion
                    } else {
                        this.identificacion = this.documentacion.identificacion
                    }

                    if (this.documentacion.compDomicilio.split(';')[0] == "data:application/pdf") {
                        this.PDFcompDomicilio = this.documentacion.compDomicilio
                    } else {
                        this.compDomicilio = this.documentacion.compDomicilio
                    }

                    if (this.documentacion.compIngresos.split(';')[0] == "data:application/pdf") {
                        this.PDFcompIngresos = this.documentacion.compIngresos
                    } else {
                        this.compIngresos = this.documentacion.compIngresos
                    }

                    console.log(this.documentacion)

                }
            })
                .catch(e => {
                    console.log(e);
                })
        },
        GuardarDocumentacion() {
            this.documentacion.usuario = localStorage.getItem('Usuario')
            http.postLoader('doc/guardar', this.documentacion).then(response => {

                if (response.data.data.codigoError == 0) {
                    $.noticeSuccess(response.data.data.mensajeBitacora)

                } else {
                    $.noticeError("ERROR " + response.data.data.mensajeBitacora)
                }
            })
                .catch(e => {
                    console.log(e);
                    this.toggleCargando()
                })
        },
        //manejo de imagenes
        handleImage1(e) {
            const selectedImage1 = e.target.files[0]; // get first file
            this.identificacion = ""
            this.PDFidentificacion = ""
            this.createBase64Image1(selectedImage1)
        },
        handleImage2(e) {
            const selectedImage2 = e.target.files[0]; // get first file
            this.compDomicilio = ""
            this.PDFcompDomicilio = ""
            this.createBase64Image2(selectedImage2)
        },
        handleImage3(e) {
            const selectedImage3 = e.target.files[0]; // get first file
            this.compIngresos = ""
            this.PDFcompIngresos = ""
            this.createBase64Image3(selectedImage3)
        },
        createBase64Image1(fileObject) {
            const reader = new FileReader();
            reader.onload = (e) => {

                if (fileObject.type == 'application/pdf') {
                    this.PDFidentificacion = e.target.result;
                    this.uploadImage(4);
                } else {
                    this.identificacion = e.target.result;
                    this.uploadImage(1);
                }

            };
            if (fileObject != '') {
                reader.readAsDataURL(fileObject);
            }
        },
        createBase64Image2(fileObject) {
            const reader = new FileReader();
            reader.onload = (e) => {
                if (fileObject.type == 'application/pdf') {
                    this.PDFcompDomicilio = e.target.result;
                    this.uploadImage(5);
                } else {
                    this.compDomicilio = e.target.result;
                    this.uploadImage(2);
                }
            };
            if (fileObject != '') {
                reader.readAsDataURL(fileObject);
            }
        },
        createBase64Image3(fileObject) {
            const reader = new FileReader();
            reader.onload = (e) => {
                if (fileObject.type == 'application/pdf') {
                    this.PDFcompIngresos = e.target.result;
                    this.uploadImage(6);
                } else {
                    this.compIngresos = e.target.result;
                    this.uploadImage(3);
                }
            };
            if (fileObject != '') {
                reader.readAsDataURL(fileObject);
            }
        },
        uploadImage(obj) {
            if (obj == 1) {
                const { image1 } = this.identificacion;
                this.documentacion.identificacion = this.identificacion
            }
            if (obj == 2) {
                const { image2 } = this.compDomicilio;
                this.documentacion.compDomicilio = this.compDomicilio
            }
            if (obj == 3) {
                const { image3 } = this.compIngresos;
                this.documentacion.compIngresos = this.compIngresos
            }
            if (obj == 4) {
                const { image4 } = this.PDFidentificacion;
                this.documentacion.identificacion = this.PDFidentificacion
            }
            if (obj == 5) {
                const { image5 } = this.PDFcompDomicilio;
                this.documentacion.compDomicilio = this.PDFcompDomicilio
            }
            if (obj == 6) {
                const { image6 } = this.PDFcompIngresos;
                this.documentacion.compIngresos = this.PDFcompIngresos
            }
        },
        Imprimir() {
            this.$bvModal.show('modal-reporte');
        },
    }
});