import React from "react";
import ReactDOM from 'react-dom/client';
import 'bootstrap/dist/css/bootstrap.min.css';
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import LayoutHome from "./layouts/LayoutHome";
import PageHome from "./pages/PageHome";
import EmpleadoAll from "./pages/EmpleadoAll";
import LayoutForm from "./layouts/LayoutForm";
import LayoutFormEdit from "./layouts/LayoutFormEdit";

const App = () => {
    return (
        <Router>
            <Routes>
                <Route path="/" element={<LayoutHome />} />
                {/* <Route index element={<PageHome />} /> */}
                <Route path='/registro' element={<LayoutForm />} />
                <Route path='/empleados' element={<EmpleadoAll />} />
                <Route path='/editar/:id' element={<LayoutFormEdit />} />

            </Routes>
        </Router>
    )
}
export default App;

if (document.getElementById('app')) {
    const root = ReactDOM.createRoot(document.getElementById('app'));
    root.render(<App />);
}   
