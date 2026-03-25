import React from "react";
import Header from "../components/Header";
import Config from "../Config";
import { useNavigate } from "react-router-dom";

const PageHome = () => {
    const [empleados, setEmpleados] = React.useState([]);
    const navigate = useNavigate();
    const [sortConfig, setSortConfig] = React.useState({ key: null, direction: "asc" });

    React.useEffect(() => {
        getEmpledoAll();
    }, [])

    const getEmpledoAll = async () => {
        const response = await Config.getEmpledoAll();
        setEmpleados(response.data);
    }

    const sortedEmpleados = React.useMemo(() => {
        let sortable = [...empleados];
        if (sortConfig.key) {
            sortable.sort((a, b) => {
                let aValue, bValue;
                switch (sortConfig.key) {
                    case "nombres":
                        aValue = `${a.persona.nombres} ${a.persona.apellidos}`;
                        bValue = `${b.persona.nombres} ${b.persona.apellidos}`;
                        break;
                    case "cedula":
                        aValue = a.persona.cedula;
                        bValue = b.persona.cedula;
                        break;
                    case "provincia":
                        aValue = a.provincia.nombre_provincia;
                        bValue = b.provincia.nombre_provincia;
                        break;
                    case "fecha_nacimiento":
                        aValue = a.persona.fecha_nacimiento;
                        bValue = b.persona.fecha_nacimiento;
                        break;
                    case "email":
                        aValue = a.persona.email;
                        bValue = b.persona.email;
                        break;
                    case "fecha_ingreso":
                        aValue = a.fecha_ingreso;
                        bValue = b.fecha_ingreso;
                        break;
                    case "cargo":
                        aValue = a.cargo;
                        bValue = b.cargo;
                        break;
                    case "departamento":
                        aValue = a.departamento;
                        bValue = b.departamento;
                        break;
                    case "sueldo":
                        aValue = a.sueldo;
                        bValue = b.sueldo;
                        break;
                    default:
                        aValue = a[sortConfig.key];
                        bValue = b[sortConfig.key];
                }
                if (aValue < bValue) return sortConfig.direction === "asc" ? -1 : 1;
                if (aValue > bValue) return sortConfig.direction === "asc" ? 1 : -1;
                return 0;
            });
        }
        return sortable;
    }, [empleados, sortConfig]);

    const requestSort = (key) => {
        let direction = "asc";
        if (sortConfig.key === key && sortConfig.direction === "asc") {
            direction = "desc";
        }
        setSortConfig({ key, direction });
    };
    const getSortIcon = (key) => {
        if (sortConfig.key !== key) return null;
        return sortConfig.direction === "asc" ? "▲" : "▼";
    };
    return (
        <div className="container ">
            <div className="row">
                <Header />
                <div class="container mt-4">
                    <div class="card text-bg-info shadow-sm">
                        <div class="card-body text-center  rounded">
                            <h4 class="card-title mb-0">Reporte Empleado</h4>
                        </div>
                    </div>
                </div>
                <div className="container mt-4">
                    <div className="table-responsive">
                        <table className="table ">
                            <thead className="table">
                                <tr>
                                    <th onClick={() => requestSort("nombres")}>
                                        Nombres {getSortIcon("nombres")}
                                    </th>
                                    <th onClick={() => requestSort("cedula")}>
                                        Cédula {getSortIcon("cedula")}
                                    </th>
                                    <th onClick={() => requestSort("provincia")}>
                                        Provincia {getSortIcon("provincia")}
                                    </th>
                                    <th onClick={() => requestSort("fecha_nacimiento")}>
                                        Fecha de Nacimiento {getSortIcon("fecha_nacimiento")}
                                    </th>
                                    <th onClick={() => requestSort("email")}>
                                        Email {getSortIcon("email")}
                                    </th>
                                    <th onClick={() => requestSort("fecha_ingreso")}>
                                        Fecha de Ingreso {getSortIcon("fecha_ingreso")}
                                    </th>
                                    <th onClick={() => requestSort("cargo")}>
                                        Cargo {getSortIcon("cargo")}
                                    </th>
                                    <th onClick={() => requestSort("departamento")}>
                                        Departamento {getSortIcon("departamento")}
                                    </th>
                                    <th onClick={() => requestSort("sueldo")}>
                                        Sueldo {getSortIcon("sueldo")}
                                    </th>
                                    <th>Jornada Parical</th>
                                </tr>
                            </thead>
                            <tbody>
                                {
                                    !sortedEmpleados ? "...cargando" : sortedEmpleados.map(
                                        (empleado) => {
                                            return (
                                                <tr key={empleado.id}>
                                                    <td>{empleado.persona.nombres} {empleado.persona.apellidos}</td>
                                                    <td>{empleado.persona.cedula}</td>
                                                    <td>{empleado.provincia.nombre_provincia}</td>
                                                    <td>{empleado.persona.fecha_nacimiento}</td>
                                                    <td>{empleado.persona.email}</td>
                                                    <td>{empleado.fecha_ingreso}</td>
                                                    <td>{empleado.cargo}</td>
                                                    <td>{empleado.departamento}</td>
                                                    <td>{empleado.sueldo}</td>
                                                    <td>
                                                        <input className="form-check-input" type="checkbox" id={empleado.id} disabled checked={empleado.jornada_parcial} />

                                                    </td>
                                                </tr>

                                            )
                                        }
                                    )
                                }

                            </tbody>
                        </table>

                    </div>
                    <div className="container mt-4 d-flex justify-content-center gap-2">
                        <button className="btn btn-primary" onClick={() => navigate('/registro')}>
                            Crear
                        </button>
                        <button className="btn btn-secondary" onClick={() => navigate('/')}>
                            Salir
                        </button>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default PageHome;