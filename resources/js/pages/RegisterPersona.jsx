import React from "react";
import Config from "../Config";

const RegisterPersona = ({ values, onChange, provincias }) => {
    const hoy = new Date().toISOString().split("T")[0];

    const fileInputRef = React.useRef(null);

    const handleButtonClick = () => {
        fileInputRef.current.click(); // abre el explorador de archivos
    };

    const handleFileChange = (event) => {
        let file = event.target.files;
        let reader = new FileReader();
        reader.readAsDataURL(file[0]);
        reader.onload = (e) => {
            console.log(e.target.result);
            onChange({ ...values, fotografia: e.target.result });
        }
    };

    return (
        <div className="container">
            <div className="row mb-3">
                <div className="col-md-6">
                    {/* Campo nombres */}
                    <div className="form-group">
                        <label htmlFor="nombres">Nombres</label>
                        <input
                            type="text"
                            className="form-control"
                            id="nombres"
                            value={values.nombres}
                            onChange={(e) => onChange({ ...values, nombres: e.target.value })}
                            required
                        />
                    </div>
                </div>
                <div className="col-md-6">
                    {/* Campo Apellidos */}
                    <div className="form-group">
                        <label htmlFor="apellidos">Apellidos</label>
                        <input
                            type="text"
                            className="form-control"
                            id="apellidos"
                            value={values.apellidos}
                            onChange={(e) => onChange({ ...values, apellidos: e.target.value })}
                            required
                        />
                    </div>
                </div>
            </div>
            <div className="row mb-3">
                <div className="col-md-6">
                    {/* Campo cédula */}
                    <div className="form-group">
                        <label htmlFor="cedula">Cédula</label>
                        <input
                            type="text"
                            className="form-control"
                            id="cedula"
                            value={values.cedula}
                            maxLength={10}
                            onChange={(e) => {
                                // Eliminar caracteres no numéricos
                                const onlyNums = e.target.value.replace(/\D/g, "");

                                onChange({ ...values, cedula: onlyNums })
                            }}
                            required
                        />
                    </div>
                </div>
                <div className="col-md-6">
                    {/* Campo provincia */}
                    <div className="form-group">
                        <label htmlFor="provincia">Provincia</label>
                        <select class="form-select" onChange={(e) => onChange({ ...values, provinciaId: e.target.value })}
                            value={values.provinciaId}>
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
                    {/* Campo fecha nacimiento */}
                    <div className="form-group">
                        <label htmlFor="fechaNacimiento">Fecha de Nacimiento</label>
                        <input type="date" class="form-control" id="fecha_nacimiento"
                            value={values.fechaNacimiento}
                            max={hoy}
                            onChange={(e) => onChange({ ...values, fechaNacimiento: e.target.value })}
                        ></input>
                    </div>
                </div>
                <div className="col-md-6">
                    {/* Campo email */}
                    <div className="form-group">
                        <label htmlFor="email">Email</label>
                        <input
                            type="email"
                            className="form-control"
                            id="email"
                            value={values.email}
                            onChange={(e) => onChange({ ...values, email: e.target.value })}
                            required
                        />
                    </div>
                </div>
            </div>
            <div className="row mb-3">
                <div className="col-md-6">
                    {/* Campo observaciones */}
                    <div className="form-group">
                        <label htmlFor="observaciones">Observaciones</label>
                        <textarea class="form-control" aria-label="With textarea"
                            placeholder="Comentario u observación referente a la ficha personal" onChange={(e) => onChange({ ...values, observaciones: e.target.value })}></textarea>

                    </div>
                </div>
                <div className="col-md-6">
                    {/* Campo fotografía */}
                    <div className="form-group">
                        <label htmlFor="fotografia">Fotografía</label>
                        <div class="d-flex align-items-center">
                            <img
                                src={values.fotografia || "/avatarDefault.png"} // tu imagen por defecto
                                alt="Foto de perfil"
                                style={{ width: "150px", height: "150px", borderRadius: "50%", objectFit: "cover" }}
                            />
                            <button type="button" class="btn btn-primary" onClick={handleButtonClick}>Cargar Imagen</button>
                            <input
                                type="file"
                                accept="image/*"
                                ref={fileInputRef}
                                style={{ display: "none" }}
                                onChange={handleFileChange}
                            />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default RegisterPersona;
const input = document.getElementById('cedula');

input.addEventListener('cedula', () => {
    // Elimina cualquier carácter no numérico y limita a 10 dígitos
    let valor = input.value.replace(/\D/g, '');
    if (valor.length > 10) {
        valor = valor.slice(0, 10);
    }
    input.value = valor;
});