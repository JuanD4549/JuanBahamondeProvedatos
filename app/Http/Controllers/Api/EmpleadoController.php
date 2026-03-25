<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Empleado;
use App\Models\Persona;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class EmpleadoController extends Controller
{
    private function validateData(Request $request)
    {
        $validator = Validator::make($request->all(), [
            //Empleado
            'laboralProvinciaId' => 'required|exists:provincias,id',
            'fechaIngreso' => 'nullable|date',
            'cargo' => 'required|string|max:100',
            'departamento' => 'required|string|max:100',
            'observacionesLaboral' => 'nullable|string',
            'sueldo' => 'numeric|min:0',
            'jornadaParcial' => 'boolean',
            //Persona
            'nombres' => 'required|string',
            'apellidos' => 'required|string',
            'cedula' => 'required|string|unique:personas,cedula|max:10',
            'provinciaId' => 'required|exists:provincias,id',
            'fechaNacimiento' => 'nullable|date',
            'email' => 'required|email|unique:personas,email',
            'observaciones' => 'nullable|string',
            'fotografia' => 'nullable|string',
        ]);
        return $validator;
    }

    public function register(Request $request)
    {
        $validator = $this->validateData($request);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        // Transacción para asegurar consistencia
        DB::transaction(function () use ($request) {
            $folderPath = '/img/fotos_empleados/';
            if ($request->fotografia) {
                $img = $request->fotografia;

                $image_parts = explode(";base64,", $img);
                $image_type_aux = explode("image/", $image_parts[0]);
                $image_type = $image_type_aux[1];
                $image_base64 = base64_decode($image_parts[1]);
                $file = $folderPath . Str::slug($request->nombres) . '.' . $image_type;
                file_put_contents(public_path($file), $image_base64);
            }
            // Crear persona
            $persona = Persona::create([
                'nombres' => $request->nombres,
                'apellidos' => $request->apellidos,
                'cedula' => $request->cedula,
                'provincia_id' => $request->provinciaId,
                'fecha_nacimiento' => $request->fechaNacimiento,
                'email' => $request->email,
                'observaciones' => $request->observaciones,
                'fotografia' => $folderPath . Str::slug($request->nombres) . '.' . $image_type,
            ]);

            // Crear empleado asociado
            Empleado::create([
                'persona_id' => $persona->id, // relación uno a uno
                'fecha_ingreso' => $request->fechaIngreso,
                'cargo' => $request->cargo,
                'departamento' => $request->departamento,
                'provincia_id' => $request->laboralProvinciaId,
                'sueldo' => $request->sueldo,
                'jornada_parcial' => $request->jornadaParcial,
                'observaciones' => $request->observacionesLaboral,
            ]);
        });
        return response()->json(['message' => 'Empleado registrado correctamente'], 201);
    }

    public function show($id)
    {
        $empleado = Empleado::with('persona', 'provincia')->find($id);
        if (!$empleado) {
            return response()->json(['message' => 'Empleado no encontrado'], 404);
        }
        return response()->json($empleado);
    }
    public function edit(Request $request, $id)
    {
        // Buscar empleado
        $empleado = Empleado::findOrFail($id);
        $validator = Validator::make($request->all(), [
            //Empleado
            'laboralProvinciaId' => 'required|exists:provincias,id',
            'fechaIngreso' => 'nullable|date',
            'cargo' => 'required|string|max:100',
            'departamento' => 'required|string|max:100',
            'observacionesLaboral' => 'nullable|string',
            'sueldo' => 'required|numeric|min:0',
            'jornadaParcial' => 'required|boolean',
            //Persona
            'nombres' => 'required|string',
            'apellidos' => 'required|string',
            'cedula' => [
                'required',
                'string',
                'max:10',
                Rule::unique('personas', 'cedula')->ignore($empleado->persona_id)
            ],
            'provinciaId' => 'required|exists:provincias,id',
            'fechaNacimiento' => 'nullable|date',
            'email' => [
                'required',
                'email',
                Rule::unique('personas', 'email')->ignore($empleado->persona_id)
            ],
            'observaciones' => 'nullable|string',
            'fotografia' => 'nullable|string',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }


        DB::transaction(function () use ($request, $empleado) {
            $folderPath = '/img/fotos_empleados/';
            $file= $empleado->persona->fotografia;
            if ($request->fotografia && $request->fotografia !== $empleado->persona->fotografia) {
                $img = $request->fotografia;
                if (Storage::exists($empleado->persona->fotografia)) {
                    Storage::delete($empleado->persona->fotografia);
                }
                $image_parts = explode(";base64,", $img);
                $image_type_aux = explode("image/", $image_parts[0]);
                $image_type = $image_type_aux[1];
                $image_base64 = base64_decode($image_parts[1]);
                $file = $folderPath . Str::slug($request->nombres) . '.' . $image_type;
                file_put_contents(public_path($file), $image_base64);
            }
            // Actualizar persona asociada
            $empleado->persona->update([
                'nombres' => $request->nombres,
                'apellidos' => $request->apellidos,
                'cedula' => $request->cedula,
                'provincia_id' => $request->provinciaId,
                'fecha_nacimiento' => $request->fechaNacimiento,
                'email' => $request->email,
                'observaciones' => $request->observaciones,
                'fotografia' => $file,
            ]);

            // Actualizar empleado
            $empleado->update([
                'fecha_ingreso' => $request->fechaIngreso,
                'cargo' => $request->cargo,
                'departamento' => $request->departamento,
                'provincia_id' => $request->laboralProvinciaId,
                'sueldo' => $request->sueldo,
                'jornada_parcial' => $request->jornadaParcial,
                'observaciones' => $request->observacionesLaboral,
            ]);
        });

        return response()->json(['message' => 'Empleado actualizado correctamente'], 200);
    }

    public function all()
    {
        $empleados = Empleado::with('persona', 'provincia')->get();
        return response()->json($empleados);
    }
    public function twentyRecords()
    {
        $empleados = Empleado::with('persona', 'provincia')->take(20)->get();
        return response()->json($empleados);
    }
    public function search(Request $request)
    {
        //return response()->json(['query' => $request->all()]);
        $empleados = Empleado::with('persona', 'provincia')
            ->whereHas('persona', function ($q) use ($request) {
                $q->where(DB::raw("CONCAT(nombres, ' ', apellidos)"), 'like', "%{$request->nombres}%")
                    ->orWhere('cedula', $request->cedula);
            })
            ->get();
        return response()->json($empleados);
    }
}
