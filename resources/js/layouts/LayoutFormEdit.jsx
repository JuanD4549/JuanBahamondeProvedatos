import React, { useEffect } from "react";
import Header from "../components/Header";
import RegisterPersona from "../pages/RegisterPersona";
import RegisterEmpleado from "../pages/RegisterEmpleado";
import Config from "../Config";
import { Link, useParams } from "react-router-dom";
const LayoutFormEdit = () => {
    const [activeTab, setActiveTab] = React.useState("personales");
    const { id } = useParams();
    const [provincias, setProvincias] = React.useState([]);
    // Estado centralizado
    const [formPersona, setFormPersona] = React.useState({
        nombres: "",
        apellidos: "",
        cedula: "",
        provinciaId: "",
        fechaNacimiento: "",
        email: "",
        observaciones: "",
        fotografia: null,
    });

    const [formEmpleado, setFormEmpleado] = React.useState({
        fechaIngreso: "",
        cargo: "",
        departamento: "",
        laboralProvinciaId: "",
        sueldo: "",
        jornadaParcial: false,
        observacionesLaboral: "",
    });
    useEffect(() => {
        const getEmpleado = async () => {
            Config.getEmpleadoById(id).then((response) => {

                if (response.status === 200) {
                    setFormPersona({
                        nombres: response.data.persona.nombres,
                        apellidos: response.data.persona.apellidos,
                        cedula: response.data.persona.cedula,
                        provinciaId: response.data.persona.provincia_id,
                        fechaNacimiento: response.data.persona.fecha_nacimiento,
                        email: response.data.persona.email,
                        observaciones: response.data.persona.observaciones,
                        fotografia: response.data.persona.fotografia,
                    });
                    setFormEmpleado({
                        fechaIngreso: response.data.fecha_ingreso,
                        cargo: response.data.cargo,
                        departamento: response.data.departamento,
                        laboralProvinciaId: response.data.provincia_id,
                        sueldo: response.data.sueldo,
                        jornadaParcial: response.data.jornada_parcial,
                        observaciones: response.data.observaciones,
                    });
                }
            });
        };
        getProvinciasAll();
        getEmpleado();
    }, []);

    const getProvinciasAll = async () => {
        Config.getProvinciasAll().then((response) => {
            if (response.status === 200) {
                setProvincias(response.data);
            }
        });
    }

    const handleSubmit = (e) => {
        e.preventDefault();
        const payload = {
            //Empleado
            'laboralProvinciaId': formEmpleado.laboralProvinciaId,
            'fechaIngreso': formEmpleado.fechaIngreso,
            'cargo': formEmpleado.cargo,
            'departamento': formEmpleado.departamento,
            'observacionesLaboral': formEmpleado.observacionesLaboral,
            'sueldo': formEmpleado.sueldo,
            'jornadaParcial': formEmpleado.jornadaParcial,
            //Persona
            'nombres': formPersona.nombres,
            'apellidos': formPersona.apellidos,
            'cedula': formPersona.cedula,
            'provinciaId': formPersona.provinciaId,
            'fechaNacimiento': formPersona.fechaNacimiento,
            'email': formPersona.email,
            'observaciones': formPersona.observaciones,
            'fotografia': formPersona.fotografia,
        };
        Config.putUpdateEmpleado(id, payload).then(response => {
            alert("Información enviada correctamente");
        }).catch(error => {
            alert("Error al enviar la información");
        });
        
    };
    return (
        <>
            <Header />
            <div className="container mt-4">
                {/* Tabs */}
                <ul className="nav nav-tabs mb-3">
                    <li className="nav-item">
                        <button
                            className={`nav-link ${activeTab === "personales" ? "active" : ""}`}
                            onClick={() => setActiveTab("personales")}
                        >
                            Datos Personales
                        </button>
                    </li>
                    <li className="nav-item">
                        <button
                            className={`nav-link ${activeTab === "laborales" ? "active" : ""}`}
                            onClick={() => setActiveTab("laborales")}
                        >
                            Datos Laborales
                        </button>
                    </li>
                </ul>
                <form onSubmit={handleSubmit}>
                    {activeTab === "personales" && <RegisterPersona values={formPersona}
                        onChange={setFormPersona} provincias={provincias}/>}
                    {activeTab === "laborales" && <RegisterEmpleado values={formEmpleado}
                        onChange={setFormEmpleado} provincias={provincias} />}
                    <div className="container mt-4 d-flex justify-content-center gap-2">
                        <button type="submit" className="btn btn-primary mt-3">Actualizar</button>
                        <Link to={`/`} className="btn btn-secondary mt-3" >
                            Salir
                        </Link>
                    </div>


                </form>

            </div>
        </>
    )
}
export default LayoutFormEdit;