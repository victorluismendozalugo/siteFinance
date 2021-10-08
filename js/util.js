class Http {
    constructor() {
        let service = axios.create({
            //headers: {  Authorization: 'Bearer ' + token //the token is a variable which holds the token }
            //headers: { 'Access-Control-Allow-Origin': '*' },
            //headers: { 'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,OPTIONS' },
            //headers: { 'Access-Control-Allow-Headers': 'Origin, X-Requested-With, Content-Type, Accept' },
            //headers: { 'api-key': 123 }
        });

        //Add request interceptor
        service.interceptors.request.use((config) => {
            return config;
        }, (error) => {
            return Promise.reject(error);
        });

        //Add response interceptor
        service.interceptors.response.use((response) => {
            return response;
        }, (error) => {
            switch (error.response.status) {
                //401 unauthorized
                case 401:
                    document.location = '/Login.aspx';
                    break;
                //404 not found
                case 404:
                    document.location = '/Login.aspx';
                    break;
                default:
                    /* TODO */
                    console.log(error.response.data);
                    console.log(error.response.data.code);
                    console.log(error.response.data.error);
                    break;
            }
            return Promise.reject(error);
        });

        this.service = service;
    }

    cn = {
        con: {
            rt: null
        }
    }

    headers = {
        headers: {
            'api-key': 123,
            Authorization: 'Bearer ' + localStorage.getItem('accessToken')
        }
    }

    async get(url) {
        let response = await this.service.get(url);
        return response;
    }

    async getLoader(url) {
        window.showLoading({ name: 'line-scale' });
        let response = await this.service.get(url);
        window.hideLoading();
        return response
    }

    async post(url, data, options) {
        let response = await this.service.post(url, data, options)
        return response
    }

    async postLoader(path, data, options) {

        if (options == null) {
            if (path == 'seguridad/login') {
                this.headers.headers.Authorization = null;
            }
            options = this.headers
        }

        //var ruta = "http://kssystems-001-site8.dtempurl.com/api/" + path;
        var ruta = "http://localhost:8080/" + path;

        this.cn.con.rt = ruta.substring(0, 16)

        let response = await this.service.post(ruta, data, options)
        return response
    }


    /*
    async get(url, callback) {
        return await this.service.get(url).then (
            (response) => callback(response.status, response.data)
        );
    }
    */

    /*
    post(path, payload, callback) {
        return this.service.request({
            method: 'POST',
            url: path,
            responseType: 'json',
            data: payload
        }).then((response) => callback(response.status, response.data));
    }
    */
}
var http = new Http();