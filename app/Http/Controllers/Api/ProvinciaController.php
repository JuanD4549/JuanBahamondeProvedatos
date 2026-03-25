<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Provincia;
use Illuminate\Http\Request;

class ProvinciaController extends Controller
{
    public function show()
    {
        $provincias = Provincia::select('id', 'nombre_provincia')->get();
        return response()->json($provincias);
    }
}
