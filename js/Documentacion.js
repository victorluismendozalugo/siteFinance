


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
            tipoVivienda: 'casa',
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
            ctaClabeTarjeta: '',
            referenciaNombre3: '',
            referenciaTelefono3: '',
            referenciaNombre4: '',
            referenciaTelefono4: '',
            tipoVivienda: '',
            parentesco1: '',
            parentesco2: '',
            parentesco3: '',
            parentesco4: '',
            montoSolicitado: 0,
            interesOrdinario: 0,
            totalPagar: 0,
            valorXpago: 0,
        },
        numeroPagos: 10,
        frecuenciaPagosCredito: 'SEMANAL',
        optionsGenero: [
            { value: 'H', text: 'Hombre' },
            { value: 'M', text: 'Mujer' }
        ],
        optionsMontoSolicitado: [
            { value: 0, text: '0' },
            { value: 1000, text: '1000' },
            { value: 2000, text: '2000' },
            { value: 2500, text: '2500' },
            { value: 3000, text: '3000' },
            { value: 3500, text: '3500' },
            { value: 4000, text: '4000' },
        ],
        identificacion: '',
        compDomicilio: '',
        compIngresos: '',
        PDFidentificacion: '',
        PDFcompDomicilio: '',
        PDFcompIngresos: '',
        usuario: []

    },
    mounted() {
        this.TipoUsuario()
        this.sucursalusuario()
        this.ObtieneDocumentacion()
    },
    methods: {
        ObtieneDocumentacion() {
            http.postLoader('doc/consulta', this.documentacion).then(response => {
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
        TipoUsuario() {
            var datos = {
                "Usuario": localStorage.getItem('Usuario'),
                "Sucursal": 1
            }
            http.postLoader('usuarios/tipo', datos).then(response => {

                if (response.data.data.codigoError == 0) {
                    this.usuario = response.data.data.data[0]

                } else {
                    $.noticeError("ERROR " + response.data.data.mensajeBitacora)
                }
            })
                .catch(e => {
                    console.log(e);
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
        GeneraSolicitud() {

            console.log(this.documentacion)

            var doc = new jsPDF()
            var image = 'data:image/jpeg;base64,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'

            doc.addImage(image, 'JPEG', 50, 16, 60, 10)
            // rectangulos principales
            doc.rect(150, 15, 50, 6)
            doc.setFontSize(8)
            doc.text(150, 18, 'Fecha')
            doc.text(153, 25, String(this.documentacion.fechaRegistro))
            doc.rect(150, 21, 50, 6)
            doc.text(150, 30, 'Numero de solicitud')
            doc.text(153, 36, String(this.documentacion.iDSolicitud))
            doc.rect(150, 27, 50, 6)
            doc.rect(150, 33, 50, 6)

            //primer rectangulo grande
            doc.text(10, 30, '¿porque medio se entero?')
            doc.rect(10, 27, 140, 12)

            //rectangulo verificador
            doc.text(10, 41, 'Nombre del Verificador:')
            doc.rect(10, 39, 95, 6)
            //rectangulo ciudad y estado
            doc.text(105, 41, 'Ciudad y Estado:')
            doc.rect(105, 39, 95, 6)

            //primer rectangulo azul
            doc.setFillColor(0, 0, 255)
            doc.rect(10, 45, 190, 6, 'B')
            doc.setFontSize(13)
            doc.text(75, 50, 'DATOS DEL ACREDITADO')
            doc.rect(10, 51, 190, 6)
            //lineas
            doc.line(65, 51, 65, 57)
            doc.line(117, 51, 117, 57)
            doc.line(172, 51, 172, 57)
            //texto
            doc.setFontSize(8)
            doc.text(10, 54, 'Nombre(s):')
            doc.text(25, 54, this.documentacion.nombre)
            doc.text(65, 54, 'A. Paterno:')
            doc.text(80, 54, this.documentacion.apaterno)
            doc.text(118, 54, 'A. Materno:')
            doc.text(133, 54, this.documentacion.amaterno)
            doc.text(173, 54, 'Genero')
            doc.text(185, 54, String(this.documentacion.genero))

            doc.setFontSize(13)
            doc.rect(10, 57, 190, 6)
            //texto
            doc.setFontSize(8)
            doc.text(10, 59, 'F. de nacimiento:')
            doc.text(25, 62, this.documentacion.fechaNacimiento)
            doc.text(65, 59, 'Edad:')
            doc.text(66, 62, String(this.documentacion.edad))
            doc.text(84, 59, 'País nacimiento:')
            doc.text(88, 62, this.documentacion.paisNacimiento)
            doc.text(140, 59, 'Nacionalidad')
            doc.text(148, 62, this.documentacion.nacionalidad)

            doc.setFontSize(13)
            //lineas
            doc.line(65, 57, 65, 63)
            doc.line(83, 57, 83, 63)
            doc.line(140, 57, 140, 63)
            //lineas
            doc.rect(10, 63, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 66, 'CURP:')
            doc.text(25, 68, this.documentacion.curp)
            doc.text(84, 66, 'RFC:')
            doc.text(88, 68, this.documentacion.rfc)
            doc.text(140, 66, 'Nivel estudios')
            doc.text(148, 68, this.documentacion.nivelEstudios)
            doc.setFontSize(13)
            //lineas
            doc.line(83, 63, 83, 69)
            doc.line(140, 63, 140, 69)
            //lineas
            doc.rect(10, 69, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 71, 'Edo. Civil:')
            doc.text(25, 73, this.documentacion.edoCivil)
            doc.text(70, 71, 'Ocupación:')
            doc.text(88, 73, this.documentacion.ocupacion)
            doc.text(130, 71, 'Email')
            doc.text(135, 73, this.documentacion.correo)
            doc.setFontSize(13)
            //lineas
            doc.line(70, 69, 70, 75)
            doc.line(130, 69, 130, 75)
            //lineas
            doc.rect(10, 75, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 77, 'Domicilio(Calle, Numero exterior e interior):')
            doc.text(25, 80, this.documentacion.calleNumero)
            doc.text(101, 77, 'Colonia:')
            doc.text(106, 80, this.documentacion.colonia)
            doc.text(170, 77, 'CP')
            doc.text(175, 80, this.documentacion.codigoPostal)
            doc.setFontSize(13)
            //lineas
            doc.line(100, 75, 100, 81)
            doc.line(170, 75, 170, 81)
            //lineas
            doc.rect(10, 81, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 83, 'Municipio')
            doc.text(25, 85, this.documentacion.municipio)
            doc.text(50, 83, 'Estado:')
            doc.text(60, 85, this.documentacion.estado)
            doc.text(100, 83, 'País')
            doc.text(120, 85, this.documentacion.pais)
            doc.text(160, 83, 'Tiempo de vivir ahí:')
            doc.text(160, 86, String(this.documentacion.tiempoVivir))
            doc.setFontSize(13)
            //lineas
            doc.line(50, 81, 50, 87)
            doc.line(100, 81, 100, 87)
            doc.line(160, 81, 160, 87)
            //lineas
            doc.rect(10, 87, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 89, 'Tipo de vivienda')
            doc.text(15, 92, "")
            doc.text(40, 89, 'Tel. Casa:')
            doc.text(50, 92, String(this.documentacion.telefonoCasa))
            doc.text(90, 89, 'Celular')
            doc.text(100, 92, this.documentacion.celular)
            doc.text(140, 89, 'Entidad Federativa de Nacimiento:')
            doc.text(160, 92, this.documentacion.entidadFederativa)
            doc.setFontSize(13)
            //lineas
            doc.line(40, 87, 40, 93)
            doc.line(90, 87, 90, 93)
            doc.line(140, 87, 140, 93)
            //lineas
            doc.rect(10, 93, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 95, 'Nombre de la Empresa ala que trabaja ')
            doc.text(15, 98, this.documentacion.nombreEmpresa)
            doc.text(106, 95, 'Domicilio(Calle, Numero exterior e interior):')
            doc.text(106, 98, this.documentacion.calleNumeroEmpresa)
            doc.setFontSize(13)
            //lineas
            doc.line(105, 93, 105, 99)
            //lineas
            doc.rect(10, 99, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 102, 'Colonia')
            doc.text(20, 103, this.documentacion.coloniaEmpresa)
            doc.text(50, 101, 'Municipio:')
            doc.text(50, 104, this.documentacion.municipioEmpresa)
            doc.text(100, 102, 'Estado')
            doc.text(120, 103, this.documentacion.estadoEmpresa)
            doc.text(160, 101, 'CP')
            doc.text(160, 104, this.documentacion.codigoPostalEmpresa)
            doc.setFontSize(13)
            //lineas
            doc.line(50, 99, 50, 105)
            doc.line(100, 99, 100, 105)
            doc.line(160, 99, 160, 105)
            //lineas
            doc.rect(10, 105, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 107, 'Teléfono (ext)')
            doc.text(20, 110, this.documentacion.telefonoEmpresa)
            doc.text(50, 107, 'Antiguedad:')
            doc.text(50, 110, String(this.documentacion.antiguedad))
            doc.text(90, 107, 'Ingreso Mensual')
            doc.text(100, 110, this.documentacion.ingresoMensual)
            doc.text(130, 107, 'Frecuencua de pago')
            doc.text(140, 110, this.documentacion.frecuenciaPago)
            doc.setFontSize(13)
            //lineas
            doc.line(50, 105, 50, 111)
            doc.line(90, 105, 90, 111)
            doc.line(130, 105, 130, 111)
            //lineas

            //segundo rectangulo azul
            doc.setFillColor(0, 0, 255)
            doc.rect(10, 111, 190, 6, 'B')
            doc.setFontSize(13)
            doc.text(75, 116, 'DATOS DEL CONYUGUE')

            doc.rect(10, 117, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 119, 'Nombre(s)')
            doc.text(20, 122, this.documentacion.nombreConyugue)
            doc.text(85, 119, 'Ap. Paterno:')
            doc.text(90, 122, this.documentacion.apellidoPConyugue)
            doc.text(145, 119, 'Ap. Materno')
            doc.text(150, 122, this.documentacion.apellidoMConyugue)
            doc.setFontSize(13)
            //lineas
            doc.line(85, 117, 85, 123)
            doc.line(145, 117, 145, 123)
            //lineas

            doc.rect(10, 123, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 125, 'Tel. Casa')
            doc.text(20, 128, this.documentacion.telefonoConyugue)
            doc.text(50, 125, 'Celular:')
            doc.text(55, 128, this.documentacion.celularConyugue)
            doc.text(100, 125, 'Ocupación')
            doc.text(105, 128, this.documentacion.ocupacionConyugue)
            doc.text(145, 125, 'Ingreso Mensual')
            doc.text(150, 128, this.documentacion.ingresoMensualConyugue)
            doc.setFontSize(13)
            //lineas
            doc.line(50, 123, 50, 129)
            doc.line(100, 123, 100, 129)
            doc.line(145, 123, 145, 129)
            //lineas


            //tercer rectangulo azul
            doc.setFillColor(0, 0, 255)
            doc.rect(10, 129, 190, 6, 'B')
            doc.setFontSize(13)
            doc.text(20, 133, 'PORFAVOR PROPORCIONE DOS REFERENCIAS QUE NO VIVAN CON USTED ')
            doc.rect(10, 135, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 137, 'Nombre')
            doc.text(20, 140, this.documentacion.referenciaNombre1)
            doc.text(100, 137, 'Parentesco:')
            doc.text(110, 140, this.documentacion.parentesco1)
            doc.text(145, 137, 'Teléfono Cel o Local')
            doc.text(148, 140, this.documentacion.referenciaTelefono1)
            doc.setFontSize(13)
            //lineas
            doc.line(100, 135, 100, 159)
            doc.line(145, 135, 145, 159)
            //lineas
            doc.rect(10, 141, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 143, 'Nombre')
            doc.text(20, 146, this.documentacion.referenciaNombre2)
            doc.text(100, 143, 'Parentesco:')
            doc.text(110, 146, this.documentacion.parentesco2)
            doc.text(145, 143, 'Teléfono Cel o Local')
            doc.text(148, 146, this.documentacion.referenciaTelefono2)
            doc.setFontSize(13)
            doc.rect(10, 147, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 149, 'Nombre')
            doc.text(20, 152, this.documentacion.referenciaNombre3)
            doc.text(100, 149, 'Parentesco:')
            doc.text(110, 152, this.documentacion.parentesco3)
            doc.text(145, 149, 'Teléfono Cel o Local')
            doc.text(148, 152, this.documentacion.referenciaTelefono3)
            doc.setFontSize(13)
            doc.rect(10, 153, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 155, 'Nombre')
            doc.text(20, 158, this.documentacion.referenciaNombre4)
            doc.text(100, 155, 'Parentesco:')
            doc.text(110, 158, this.documentacion.parentesco4)
            doc.text(145, 155, 'Teléfono Cel o Local')
            doc.text(148, 158, this.documentacion.referenciaTelefono4)
            doc.setFontSize(13)


            //cuarto rectangulo azul
            doc.setFillColor(0, 0, 255)
            doc.rect(10, 159, 190, 6, 'B')
            doc.setFontSize(13)
            doc.text(20, 164, 'DATOS DE LA CUENTA DEL DEUDOR PARA TRANSFERENCIA ELECTRONICA')
            doc.rect(10, 165, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 167, 'Institucion de Credito: ')
            doc.text(20, 170, 'td.bancoCredito~')
            doc.text(10, 173, 'Numero de Cuenta CLABE o Tarjeta Bancaria:')
            doc.text(20, 176, 'td.ctaClabeTarjeta~')
            doc.setFontSize(13)
            doc.rect(10, 171, 190, 6)

            //quinto rectangulo azul
            doc.setFillColor(0, 0, 255)
            doc.rect(10, 177, 190, 6, 'B')
            doc.setFontSize(13)
            doc.text(60, 182, 'DESCRIPCION DEL CREDITO SOLICITADO')
            doc.rect(10, 183, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 185, 'Monto del crédito')
            doc.text(15, 188, String(this.documentacion.montoSolicitado))

            doc.text(75, 185, 'Interés ordinario')
            doc.text(80, 188, String(this.documentacion.interesOrdinario))

            doc.text(140, 185, 'Total a pagar')
            doc.text(145, 188, String(this.documentacion.totalPagar))

            doc.setFontSize(13)
            doc.rect(10, 189, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 191, 'Número de pagos')
            doc.text(15, 194, String(this.numeroPagos))
            doc.text(75, 191, 'Frecuencia de pago')
            doc.text(80, 194, this.frecuenciaPagosCredito)
            doc.text(140, 191, 'Valor de cada pago')
            doc.text(145, 194, String(this.documentacion.valorXpago))
            doc.setFontSize(13)
            //lineas
            doc.line(75, 183, 75, 195)
            doc.line(140, 183, 140, 195)
            //lineas


            //sexto rectangulo azul
            doc.setFillColor(0, 0, 255)
            doc.rect(10, 195, 190, 6, 'B')
            doc.setFontSize(13)
            doc.text(60, 200, 'DESCRIPCION DEL CREDITO AUTORIZADO')
            doc.rect(10, 201, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 203, 'Monto del crédito')
            doc.text(75, 203, 'Interés ordinario')
            doc.text(140, 203, 'Total a pagar')
            doc.setFontSize(13)
            doc.rect(10, 207, 190, 6)
            doc.setFontSize(8)
            doc.text(10, 209, 'Número de pagos')
            doc.text(75, 209, 'Frecuencia de pago')
            doc.text(140, 209, 'Valor de cada pago')
            doc.setFontSize(13)
            //lineas
            doc.line(75, 201, 75, 213)
            doc.line(140, 201, 140, 213)
            //lineas

            //firma
            doc.line(50, 265, 160, 265)
            doc.text(65, 270, 'NOMBRE Y FIRMA DEL SOLICITANTE')
            doc.save("Solicitud.pdf")

        },
        sucursalusuario() {
            var datos = {
                "Usuario": localStorage.getItem('Usuario')
            }
            http.postLoader('usuarios/sucursal', datos).then(response => {
                if (response.data.data.codigoError == 0) {
                    //console.log(response)
                    localStorage.setItem('SucursalID', response.data.data.data[0].sucursalID)
                    //$.noticeSuccess(response.data.data.data[0].sucursalID)
                } else {
                    console.log(response)
                    $.noticeError("ERROR " + response.data.data.mensajeBitacora)
                }
            })
                .catch(e => {
                    console.log(e);
                })
        },
        calculaPagos() {
            this.documentacion.valorXpago = (parseFloat(this.documentacion.montoSolicitado) * 0.5 + parseFloat(this.documentacion.montoSolicitado)) / this.numeroPagos
            this.documentacion.totalPagar = this.numeroPagos * this.documentacion.valorXpago
            this.documentacion.interesOrdinario = this.documentacion.totalPagar - this.documentacion.montoSolicitado
        }
    }
});