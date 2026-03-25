import React from "react";
import Config from "../Config";
import Header from "../components/Header";
import { useNavigate } from "react-router-dom";

const PageHome = () => {
    const [empleados, setEmpleados] = React.useState([]);
    const [formSearch, setFormSearch] = React.useState({
        nombres: "",
        cedula: "",
    });
    React.useEffect(() => {
        getEmpledoAll();
    }, [])

    const getEmpledoAll = async () => {
        const response = await Config.getTwentyEmpledo();
        setEmpleados(response.data);
        //console.log("Empleados:", response.data);
    }
    const navigate = useNavigate();

    const handleRowClick = (id) => {
        // Redirige a la página de edición con el id del empleado
        navigate(`/editar/${id}`);
    };

    const search = async () => {
        const response = await Config.getSearch(formSearch);
        setEmpleados(response.data);
    }

    return (
        <div className="container">
            <div className="row">
                <Header />
                <div className="row mb-3 align-items-center">
                    <div className="col-md-4">
                        {/* Campo Nombre */}
                        <div className="form-group">
                            <label htmlFor="nombre">Nombre</label>
                            <input
                                type="text"
                                className="form-control"
                                id="departamento"
                                value={formSearch.nombres}
                                onChange={(e) => setFormSearch({ ...formSearch, nombres: e.target.value })}
                                required
                            />
                        </div>
                    </div>
                    <div className="col-md-4">
                        {/* Campo Cédula */}
                        <div className="form-group">
                            <label htmlFor="cedula">Cédula</label>
                            <input
                                type="text"
                                className="form-control"
                                id="departamento"
                                value={formSearch.cedula}
                                onChange={(e) => setFormSearch({ ...formSearch, cedula: e.target.value })}
                                required
                            />
                        </div>
                    </div>
                    <div className="col-md-3">
                        {/* Campo Cédula */}
                        <button className="btn btn-primary" onClick={search}>
                            Buscar
                        </button>
                    </div>

                </div>
                <div className="container mt-4">
                    <div className="table-responsive">
                        <table className="table table-hover">
                            <thead>
                                <tr>
                                    <th>Nombres</th>
                                    <th>Cédula</th>
                                </tr>
                            </thead>
                            <tbody>
                                {
                                    !empleados ? "...cargando" : empleados.map(
                                        (empleado) => (
                                            <tr key={empleado.id} onClick={() => handleRowClick(empleado.id)}>
                                                <td>{empleado.persona.nombres}</td>
                                                <td>{empleado.persona.cedula}</td>
                                            </tr>
                                        )
                                    )
                                }
                            </tbody>
                        </table>

                        <span>Unicamente se despliegan 20 registros</span>

                    </div>
                </div>
                <div className="container mt-4 d-flex justify-content-center gap-2">
                    <button className="btn btn-primary" onClick={() => navigate('/registro')}>
                        Crear
                    </button>
                    <button className="btn btn-secondary" onClick={() => navigate('/empleados')}>
                        Reporte
                    </button>
                </div>
            </div>
        </div>
    )
}
export default PageHome;