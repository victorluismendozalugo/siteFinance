var vue2 = new Vue({
    el: '#vuePage',
    data: {
        saldo: {
            movimiento: 0,
            usuario: localStorage.getItem('Usuario'),
            sucursal: 1,
            tablaDocumento: '',
        },
        saldos: [],
    },
    computed: {

    },
    mounted() {
        this.ConsultaSaldo()
    },
    methods: {
        ConsultaSaldo() {
            http.postLoader('saldos/consulta', this.saldo).then(response => {
                if (response.data.data.codigoError == 0) {

                    this.saldos = response.data.data.data[0];
                    var doc = this.saldos.tablaDocumento.replace('data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,', '')
                    var data = Uint8Array.from(atob(doc), c => c.charCodeAt(0))

                    var wb = XLSX.read(data, { type: 'array' });
                    var htmlstr = XLSX.write(wb, { sheet: "INFORMACION", type: 'binary', bookType: 'html' });
                    $('#wrapper')[0].innerHTML += htmlstr;


                } else {
                    $.noticeError("ERROR " + response.data.data.mensajeBitacora);
                }
            })
                .catch(e => {
                    console.log(e);
                });
        }
    },
});