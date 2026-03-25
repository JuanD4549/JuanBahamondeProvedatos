import React from "react";

const RegisterEmpleado = ({ values, onChange, provincias }) => {
    const hoy = new Date().toISOString().split("T")[0];

    return (
        <div className="container">
            <div className="row mb-3">
                <div className="col-md-6">
                    {/* Campo fecha de ingreso */}
                    <div className="form-group">
                        <label htmlFor="fechaIngreso">Fecha de Ingreso</label>
                        <input type="date" class="form-control" id="fecha_ingreso"
                            max={hoy}
                            onChange={(e) => onChange({ ...values, fechaIngreso: e.target.value })}
                        ></input>
                    </div>
                </div>
                <div className="col-md-6">
                    {/* Campo Cargo */}
                    <div className="form-group">
                        <label htmlFor="cargo">Cargo</label>
                        <input
                            type="text"
                            className="form-control"
                            id="cargo"
                            value={values.cargo}
                            onChange={(e) => onChange({ ...values, cargo: e.target.value })}
                            required
                        />
                    </div>
                </div>
            </div>
            <div className="row mb-3">
                <div className="col-md-6">
                    {/* Campo departamento */}
                    <div className="form-group">
                        <label htmlFor="departamento">Departamento</label>
                        <input
                            type="text"
                            className="form-control"
                            id="departamento"
                            value={values.departamento}
                            onChange={(e) => onChange({ ...values, departamento: e.target.value })}
                            required
                        />
                    </div>
                </div>
                <div className="col-md-6">
                    {/* Campo provincia */}
                    <div className="form-group">
                        <label htmlFor="provincia">Provincia</label>
                        <select class="form-select" onChange={(e) => onChange({ ...values, laboralProvinciaId: e.target.value })}
                            value={values.laboralProvinciaId}>
                            <option selected>Escoja una provincia...</option>
                            {provincias.map((provincia) => (
                                <option key={provincia.id} value={provincia.id}>{provincia.nombre_provincia}</option>
                            ))}
                        </select>
                    </div>
                </div>
            </div>
            <div className="row mb-3">
                <div className="col-md-6">
                    {/* Campo sueldo */}
                    <div className="form-group">
                        <label htmlFor="sueldo">Sueldo</label>
                        <div class="input-group">
                            <input
                                type="number"
                                className="form-control"
                                id="sueldo"
                                step="0.01"
                                value={values.sueldo}
                                onChange={(e) => onChange({ ...values, sueldo: e.target.value })}
                                required
                            />
                            <span class="input-group-text">USD</span>
                        </div>
                    </div>
                </div>
                <div className="col-md-6">
                    {/* Campo jornada parcial */}
                    <div className="form-group">
                        <div className="row">
                            <label htmlFor="jornadaPacial">Jornada Parcial</label>
                            <div className="container">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="jornada_parcial" id="jornada_si"
                                        value="1"
                                        checked={values.jornadaParcial === "1"}
                                        onChange={(e) => onChange({ ...values, jornadaParcial: e.target.value })} />
                                    <label class="form-check-label" for="jornada_si">Sí</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="jornada_parcial" id="jornada_no"
                                        value="0"
                                        checked={values.jornadaParcial === "0"}
                                        onChange={(e) => onChange({ ...values, jornadaParcial: e.target.value })} />
                                    <label class="form-check-label" for="jornada_no">No</label>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <div className="mb-3">
                {/* Campo observaciones */}
                <div className="form-group">
                    <label htmlFor="observaciones">Observaciones</label>
                    <textarea class="form-control" aria-label="With textarea"
                        placeholder="Comentario u observación referente a la ficha personal"
                        onChange={(e) => onChange({ ...values, observacionesLaboral: e.target.value })}></textarea>
                </div>
            </div>
        </div>
    )
}
export default RegisterEmpleado;