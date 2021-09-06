var vue2 = new Vue({
    el: '#vuePage',
    data: {
        nota: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            notaID: 0,
            clienteID: 0,
            fechaMovimiento: '',
            fechaEntrega: '',
            fechaEvento: '',
            fechaPrueba: '',
            fechaDevolucion: '',
            descuentoID: 0,
            tipoGancho: 0,
            subTotal: 0,
            abonos: 0,
            saldoRestante: 0,
            notaDetalle: [],
            notaPagos: []
        },
        producto: {
            productoID: 0,
            productoCod: '',
            productoDescCorta: '',
            productoDescLarga: '',
            prodColorID: 0,
            colorNombre: '',
            prodPrecioRenta: 0,
            prodPrecioVenta: 0,
            prodPrecioGarantia: 0,
            prodCantidad: 1
        },
        clientes: [],
        fechaMinima: '',
        conceptos: [],
        productos: [],
        fieldsPagosRentas: [
            { key: 'abonoAcciones', sortable: false },
            { key: 'pagoID', tdClass: 'd-none', thClass: 'd-none' },
            { key: 'pagoNombre', sortable: false, label: "Nombre" },
            { key: 'pagoFecha', sortable: false, label: "Fecha" },
            { key: 'pagoImporte', sortable: false, label: "Importe" },
        ],
        fieldsproductosRentar: [
            { key: 'acciones', sortable: false },
            { key: 'productoID', sortable: false },
            { key: 'productoDescCorta', sortable: false, label: "Descripción" },
            { key: 'colorNombre', sortable: false, label: "Color" },
            { key: 'prodCantidad', sortable: false, label: "Cantidad" },
            { key: 'prodPrecioRenta', sortable: false, label: "Precio" },
        ],
        textoBusqueda: '',
        textoBusqDisponibilidad: '',
        fieldsTablaProductos: [
            { key: 'productoCod', sortable: true, label: "Codigo" },
            { key: 'productoDescCorta', label: "Nombre producto", sortable: true, filterByFormatted: true },
            { key: 'productoDescLarga', label: "Descripcion", sortable: true, filterByFormatted: true },
            { key: 'prodPrecioRenta', sortable: true, },
            { key: 'colorNombre', label: "Color", }
        ],
        optionsEstatusNota: [
            { value: 'A', text: 'Apartado' },
            { value: 'E', text: 'Entregado' },
            { value: 'L', text: 'Lavanderia' },
            { value: 'S', text: 'Ajustes' },
            { value: 'D', text: 'Devuelto' }
        ],
        filterTablaProductos: null,
        filterOnTablaProductos: [],
        perPage: 10,
        pageOptions: [5, 10, 15, 30, 50, 100],
        currentPage: 1,
        isBusy: false,
        pagos: [],
        tipoAbonoSelect: 0,
        montoAbono: 0,
        descuentos: [],
        cliente: {
            sucursalID: parseInt(localStorage.getItem("SucursalID")),
            clienteID: 0,
            cliNombre: '',
            cliAPaterno: '',
            cliAMaterno: '',
            cliDomicilio: '',
            cliReferencia: '',
            cliCalle: '',
            cliNumero: 0,
            cliCP: '',
            cliCiudad: 0,
            cliEstado: 0,
            cliTelefono: '',
            cliEmail: '',
            cliEstatus: 'A',
            cliFechaRegistro: '',
            cliResponsable: 1
        },
        optionsEstatus: [
            { value: 'A', text: 'Activo' },
            { value: 'B', text: 'Inactivo' }
        ],
        ciudades: [],
        estados: [],
        notas: [],
        fieldsListadoNotas: [
            { key: 'notaID', sortable: true, label: "Clave" },
            { key: 'fechaMovimiento', sortable: false, label: "Fecha nota" },
            { key: 'fechaEntrega', sortable: false, label: "Fecha Entrega" },
            { key: 'fechaEvento', sortable: false, label: "Fecha Evento" },
            { key: 'fechaDevolucion', sortable: false, label: "Fecha Devolucion" },
        ],
        filterTablaListadoNotas: null,
        cantidadServicios: 1
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
        },
    },
    mounted() {
        this.ObtieneClientes()
        this.fechaHoy()
        this.ObtieneConceptos()
        this.ObtieneTiposPago()
        this.obtieneDescuentos()
    },
    methods: {
        ObtieneClientes() {
            var datos = {
                "clienteID": 0,
                "sucursalID": this.nota.sucursalID
            }
            http.postLoader('catalogo/clientes', datos).then(response => {
                this.clientes = response.data.data.data;
                console.log(this.clientes)
            })
                .catch(e => {
                    console.log(e);
                })
        },
        ObtieneConceptos() {
            var datos = {
                "conceptoID": 0,
                "sucursalID": this.nota.sucursalID
            }
            http.postLoader('catalogo/conceptos', datos).then(response => {
                this.conceptos = response.data.data.data;
            })
                .catch(e => {
                    console.log(e);
                })
        },
        fechaHoy() {
            this.nota.fechaMovimiento = moment().format('YYYY-MM-DD')
            if (moment(this.nota.fechaMovimiento).day() == 0) {
                this.fechaMinima = moment(moment(this.nota.fechaMovimiento).add(2, 'days')).format('YYYY-MM-DD')
            } else {
                this.fechaMinima = moment(moment(this.nota.fechaMovimiento).add(1, 'days')).format('YYYY-MM-DD')
            }

        },
        calculaFechas() {

            //nota importante: en esta parte hay que parametrizar si el negocio de rentas
            //abre los dias domingos, ya que en el caso actual estamos contemplando que el
            //negocio no trabaja los domingos...
            if (this.nota.fechaEvento != '') {

                //valida el dia que se entregará el artículo al cliente en base a la fecha del evento
                var fechaEntrega = moment(moment(this.nota.fechaEvento).subtract(1, 'days')).format('YYYY-MM-DD');
                var diaSemanaEntrega = moment(fechaEntrega).day()
                if (diaSemanaEntrega == 0) {
                    fechaEntrega = moment(fechaEntrega).subtract(1, 'days')
                }
                this.nota.fechaEntrega = moment(fechaEntrega).format('YYYY-MM-DD');

                //valida el dia que el cliente tiene que regresar el artículo en base a la fecha del evento
                var fechaDev = moment(moment(this.nota.fechaEvento).add(1, 'days')).format('YYYY-MM-DD');
                var diaSemanaDevolucion = moment(fechaDev).day()
                if (diaSemanaDevolucion == 0) {
                    fechaDev = moment(fechaDev).add(1, 'days')
                }
                this.nota.fechaDevolucion = moment(fechaDev).format('YYYY-MM-DD');
            }
        },
        realizaBusqueda(item) {
            if (item.charCode == 13 || item.code == "Enter") {
                if (this.textoBusqueda != "") {
                    this.$bvModal.show('modal-productos');
                    this.ObtieneProductos()
                    this.textoBusqueda = ""
                }
            }
        },
        ObtieneProductos() {
            this.toggleBusy()
            var datos = {
                "ProductoDescCorta": this.textoBusqueda,
                "productoSucID": this.nota.productoSucID
            }

            http.postLoader('catalogo/productosDescripcion', datos).then(response => {
                this.productos = response.data.data.data;
                this.toggleBusy()
            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        onFilteredTablaProductos(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length
            this.currentPage = 1
        },
        onFilteredTablaListadoNotas(filteredItems) {
            // Trigger pagination to update the number of buttons/pages due to filtering
            this.totalRows = filteredItems.length
            this.currentPage = 1
        },
        toggleBusy() {
            this.isBusy = !this.isBusy
        },
        //selecciona el registro clickado de la tabla de busqueda de productos y lo agrega a la tabla principal de productos
        seleccionarRegistro(item) {

            this.producto = item
            if (this.producto.esServicio == 'S') {
                this.$bvModal.show('modal-cantidad-servicios');
            } else {
                this.$bvModal.hide('modal-productos');
                this.producto.prodCantidad = 1
                this.nota.notaDetalle.push(this.producto)
                this.producto = null
                this.calculaTotales()
            }

            //this.$bvModal.hide('modal-productos');
            //this.producto.prodCantidad = 2
            //this.nota.notaDetalle.push(this.producto)
            //this.producto = null
            //this.calculaTotales()
        },
        //borra el producto seleccionado de la tabla de productos
        BorrarProductoTabla(index) {
            console.log(index)
            this.nota.notaDetalle.splice(index, 1);
            this.calculaTotales()
        },
        //borra el abono seleccionado de la tabla abonos
        BorrarAbonoTablaAbonos(index) {
            this.nota.notaPagos.splice(index, 1);
            this.calculaTotales()
        },
        ObtieneTiposPago() {
            var datos = {
                "pagoID": 0,
                "sucursalID": this.nota.sucursalID
            }

            http.postLoader('catalogo/pagos', datos).then(response => {
                this.pagos = response.data.data.data;

            })
                .catch(e => {
                    console.log(e);
                })
        },
        //agrega el abono seleccionado a la tabla abonos
        agregarAbono(item) {
            if (item.charCode == 13 || item.code == "Enter") {

                if (this.montoAbono != '' || this.montoAbono != 0) {
                    if (this.tipoAbonoSelect.id != undefined && this.tipoAbonoSelect.id != 0) {

                        var abono = {
                            "pagoID": this.tipoAbonoSelect.id,
                            "pagoNombre": this.tipoAbonoSelect.text,
                            "pagoFecha": moment().format('YYYY-MM-DD'),
                            "pagoImporte": this.montoAbono
                        }
                        this.nota.notaPagos.push(abono)

                        this.tipoAbonoSelect.text = ''
                        this.tipoAbonoSelect.id = 0
                        this.montoAbono = ''
                        this.calculaTotales()
                    }
                }
            }

        },
        obtieneDescuentos() {
            this.toggleBusy()
            var datos = {
                "descuentoID": 0,
                "sucursalID": this.nota.sucursalID
            }

            http.postLoader('catalogo/descuentos', datos).then(response => {
                this.descuentos = response.data.data.data;
                this.toggleBusy()

            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        guardarNota() {

            http.postLoader('movimientos/notas/guardar', this.nota).then(response => {

                if (response.data.data.codigoError == 0) {
                    $.noticeSuccess(response.data.data.mensajeBitacora)
                    this.inicializarCampos()
                } else {
                    $.noticeError("ERROR " + response.data.data.mensajeBitacora)
                }

            })
                .catch(e => {
                    console.log(e);
                })
        },
        //las siguientes funciones calculan los totales de las tablas Productos-Abonos y la parte de los totales al lado de la tabla abonos
        calculaAbonosTabla() {
            this.nota.abonos = this.nota.notaPagos.reduce(function (a, c) { return a + Number((c.pagoImporte * 1) || 0) }, 0)
        },
        calculaRestante() {
            if (this.nota.descuentoID != 0) {
                if (this.nota.subTotal != 0) {
                    this.nota.saldoRestante = (this.nota.subTotal - (this.nota.subTotal * parseInt(this.nota.descuentoID) / 100)) - this.nota.abonos
                }
            } else {
                if (this.nota.subTotal != 0) {
                    this.nota.saldoRestante = this.nota.subTotal - this.nota.abonos
                }
            }
        },
        calculatotalTabla() {
            this.nota.subTotal = this.nota.notaDetalle.reduce(function (a, c) { return a + Number((c.prodPrecioRenta * c.prodCantidad) || 0) }, 0)
            return this.nota.notaDetalle.reduce(function (a, c) { return a + Number((c.prodPrecioRenta * c.prodCantidad) || 0) }, 0)
        },
        calculaTotales() {
            this.calculatotalTabla()
            this.calculaAbonosTabla()
            this.calculaRestante()
        },
        asignaDescuento() {
            this.calculaTotales()
        },
        GuardarCliente() {
            http.postLoader('catalogo/clientes/guardar', this.cliente).then(response => {

                if (response.data.data.codigoError == 0) {
                    $.noticeSuccess(response.data.data.mensajeBitacora)
                    this.hideModaClientes()
                } else {
                    $.noticeError("ERROR " + response.data.data.mensajeBitacora)
                }

            })
                .catch(e => {
                    console.log(e);
                })
        },
        hideModaClientes() {
            this.ObtieneClientes()
            this.$bvModal.hide('modal-registro-clientes');
            this.limpiarCamposClientes()
        },
        limpiarCamposClientes() {
            this.cliente.clienteID = 0
            this.cliente.cliNombre = ''
            this.cliente.cliAPaterno = ''
            this.cliente.cliAMaterno = ''
            this.cliente.cliDomicilio = ''
            this.cliente.cliReferencia = ''
            this.cliente.cliCalle = ''
            this.cliente.cliNumero = 0
            this.cliente.cliCP = ''
            this.cliente.cliCiudad = 0
            this.cliente.cliEstado = 0
            this.cliente.cliTelefono = ''
            this.cliente.cliEmail = ''
            this.cliente.cliEstatus = 'A'
            this.cliente.cliFechaRegistro = ''
            this.cliente.cliResponsable = 1
            this.textoBusqDisponibilidad = ''
            this.ObtieneClientes()

        },
        eventoCerrarModal() {
            this.hideModaClientes()
        },
        ObtieneNota(item) {

            this.nota = item
            this.$bvModal.hide('modal-consulta-notas');
            this.obtieneDetalleNota()
            this.obtieneDetallePagosNota()
        },
        consultaNotas() {
            this.$bvModal.show('modal-consulta-notas');
            this.obtieneCabecerosNotas()
        },
        obtieneCabecerosNotas() {
            this.notas = []
            var datos = {
                "NotaID": 0,
                "SucursalID": this.nota.sucursalID
            }
            http.postLoader('movimientos/notas', datos).then(response => {
                this.notas = response.data.data.data;
            })
                .catch(e => {
                    console.log(e);
                })
        },
        obtieneDetalleNota() {
            var datos = {
                "NotaID": this.nota.notaID,
                "SucursalID": this.nota.sucursalID
            }
            http.postLoader('movimientos/notasdetalle', datos).then(response => {
                this.nota.notaDetalle = response.data.data.data;
            })
                .catch(e => {
                    console.log(e);
                })

        },
        obtieneDetallePagosNota() {
            var datos = {
                "NotaID": this.nota.notaID,
                "SucursalID": this.nota.sucursalID
            }
            http.postLoader('movimientos/notasdetallepago', datos).then(response => {
                this.nota.notaPagos = response.data.data.data;
            })
                .catch(e => {
                    console.log(e);
                })
        },
        inicializarCampos() {

            this.nota.notaID = 0
            this.nota.clienteID = 0
            this.nota.fechaMovimiento = ''
            this.nota.fechaEntrega = ''
            this.nota.fechaEvento = ''
            this.nota.fechaPrueba = ''
            this.nota.fechaDevolucion = ''
            this.nota.descuentoID = 0
            this.nota.tipoGancho = 0
            this.nota.subTotal = 0
            this.nota.abonos = 0
            this.nota.saldoRestante = 0
            this.nota.notaDetalle = []
            this.nota.notaPagos = []
            this.textoBusqDisponibilidad = ''
            this.ObtieneClientes()
            this.ObtieneTiposPago()
            this.obtieneDescuentos()

        },
        obtieneProductos() {

            this.$bvModal.show('modal-productos');
            this.ObtieneTodosLosProductos()
        },
        ObtieneTodosLosProductos() {
            this.toggleBusy()
            var datos = {
                "productoID": 0,
                "productoSucID": this.nota.sucursalID
            }

            http.postLoader('catalogo/productos', datos).then(response => {
                console.log(this.productos)
                this.productos = response.data.data.data;
                this.toggleBusy()
            })
                .catch(e => {
                    console.log(e);
                    this.toggleBusy()
                })
        },
        verificaDosponibilidad(item) {
            if (item.charCode == 13 || item.code == "Enter") {
                if (this.textoBusqDisponibilidad != "") {

                    if (this.nota.fechaEvento == '') {
                        $.noticeInfo("Alerta", "Favor de seleccionar la fecha del evento")
                        this.$refs.FechaEv.focus();
                        this.textoBusqDisponibilidad = ''
                    }

                }
            }
        },
        IngresaCantidadServiciosExtra() {
            this.AgregaCantidadServicios()
        },
        hideModalServicios() {
            this.AgregaCantidadServicios()

        },
        AgregaCantidadServicios() {
            this.$bvModal.hide('modal-cantidad-servicios');
            this.$bvModal.hide('modal-productos');
            this.producto.prodCantidad = this.cantidadServicios
            this.nota.notaDetalle.push(this.producto)
            this.producto = null
            this.calculaTotales()
        },
        verificaDisponibilidad() {

            if (this.textoBusqDisponibilidad != "") {

                if (this.nota.fechaEvento == '') {
                    $.noticeInfo("Alerta", "Favor de seleccionar la fecha del evento")
                    this.$refs.FechaEv.focus();
                    this.textoBusqDisponibilidad = ''
                } else {
                    var datos = {
                        "ProductoCod": this.textoBusqDisponibilidad,
                        "FechaEntrega": this.nota.fechaEntrega,
                        "FechaDevolucion": this.nota.fechaDevolucion,
                        "SucursalID": this.nota.sucursalID
                    }

                    http.postLoader('movimientos/producto/disponibilidad', datos).then(response => {
                        var res = response.data
                        if (res.value == true) {
                            $.noticeInfo("", res.data.mensajeBitacora)
                        } else {
                            $.noticeError("", res.data.mensajeBitacora)
                        }

                    })
                        .catch(e => {
                            console.log(e);
                        })
                }
            }
        }
    }
});