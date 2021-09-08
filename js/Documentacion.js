var vue2 = new Vue({
    el: '#vuePage',
    data: {
        documentacion: {
            usuario: localStorage.getItem('Usuario'),
            sucursalID: 1,
            identificacion: '',
            compDomicilio: '',
            compIngresos: '',
            referenciaNombre1: '',
            referenciaTelefono1: '',
            referenciaNombre2: '',
            referenciaTelefono2: ''
        },
        identificacion: '',
        compDomicilio: '',
        compIngresos: '',

    },
    mounted() {
        this.ObtieneDocumentacion()
    },
    methods: {
        ObtieneDocumentacion() {
            http.postLoader('doc/consulta', this.documentacion).then(response => {
                this.documentacion = response.data.data.data[0];
                this.identificacion = this.documentacion.identificacion
                this.compDomicilio = this.documentacion.compDomicilio
                this.compIngresos = this.documentacion.compIngresos
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
            this.createBase64Image1(selectedImage1)
        },
        handleImage2(e) {
            const selectedImage2 = e.target.files[0]; // get first file
            this.createBase64Image2(selectedImage2)
        },
        handleImage3(e) {
            const selectedImage3 = e.target.files[0]; // get first file
            this.createBase64Image3(selectedImage3)
        },
        createBase64Image1(fileObject) {
            const reader = new FileReader();
            reader.onload = (e) => {
                this.identificacion = e.target.result;
                this.uploadImage(1);
            };
            if (fileObject != '') {
                reader.readAsDataURL(fileObject);
            }
        },
        createBase64Image2(fileObject) {
            const reader = new FileReader();
            reader.onload = (e) => {
                this.compDomicilio = e.target.result;
                this.uploadImage(2);
            };
            if (fileObject != '') {
                reader.readAsDataURL(fileObject);
            }
        },
        createBase64Image3(fileObject) {
            const reader = new FileReader();
            reader.onload = (e) => {
                this.compIngresos = e.target.result;
                this.uploadImage(3);
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
        },
    }
});