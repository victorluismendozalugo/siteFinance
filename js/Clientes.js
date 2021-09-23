var fil;
var vue2 = new Vue({
    el: '#vuePage',
    data: {
        clientes: [],
        cliente: [],
    },
    computed: {

    },
    mounted() {
        this.ObtieneClientes()
    },
    methods: {
        ObtieneClientes() {
            var datos = {
                "Usuario": 1,
                "SucursalID": 1
            }
            http.postLoader('doc/clientes/documentacion', datos).then(response => {
                if (response.data.data.codigoError == 0) {
                    this.clientes = response.data.data.data

                } else {
                    $.noticeError("ERROR " + response.data.data.mensajeBitacora)
                }
            })
                .catch(e => {
                    console.log(e);
                })
        },
        ObtieneDatosCliente(item) {
            this.$bvModal.show('modal-informacion-usuario');
            this.cliente = item
        },
        CargarInformacion(item) {
            this.$bvModal.show('modal-cargar-informacion-usuario');
            this.cliente = item
        },
        fileChange(e) {
            //console.log(e.srcElement.files[0])

            var reader = new FileReader();
            //reader.readAsDataURL(e.srcElement.files[0])
            reader.readAsArrayBuffer(e.srcElement.files[0])

            reader.onload = function (){
                var data = new Uint8Array(reader.result);
                console.log(reader.result)
                var wb = XLSX.read(data, { type: 'array' });
                var htmlstr = XLSX.write(wb, { sheet: "Hoja1", type: 'binary', bookType: 'html' });
                $('#wrapper')[0].innerHTML += htmlstr;
            }

            //reader.onload = function () {
            //    console.log(reader.result);

            //    this.excel = reader.result;

            //};

            //reader.onerror = function (error) {
            //    console.log('Error: ', error);
            //};


            //if (this._spread) {
            //    const fileDom = e.target || e.srcElement;
            //    const excelIO = new Excel.IO();
            //    console.log(excelIO)
            //    const spread = this._spread;
            //    const store = this.$store;

            //    excelIO.open(fileDom.files[0], (_data_) => {
            //        const newSalesData = extractSheetData(data);
            //        console.log(newSalesData)
            //    });
            //}
        }
    }
});