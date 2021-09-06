var vue = new Vue({
    el: '#vuePage',
    data: {
        SucursalID: 0
    },
    mounted() {
        this.sucursalusuario()
    },
    methods: {
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
    }
});