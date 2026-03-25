import axios from "axios";

const base_api_url = 'http://localhost:8000/api/v1';

///Route
export default {
    //Post
    postRegisterEmpleado: (data) => axios.post(`${base_api_url}/empleado/register`, data),
    //Put
    putUpdateEmpleado: (id, data) => axios.put(`${base_api_url}/empleado/${id}`, data),
    //Get
    getEmpledoAll: () => axios.get(`${base_api_url}/empleados`),
    getTwentyEmpledo: () => axios.get(`${base_api_url}/twentyEmpleados`),
    getEmpleadoById: (id) => axios.get(`${base_api_url}/empleado/${id}`),
    getSearch: (data) => axios.post(`${base_api_url}/empleados/search`,data),
    getProvinciasAll: () => axios.get(`${base_api_url}/provincias`),
}