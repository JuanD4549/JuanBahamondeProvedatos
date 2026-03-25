<?php

use App\Http\Controllers\Api\EmpleadoController;
use App\Http\Controllers\Api\PersonaController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {

    Route::post('empleado/register', [EmpleadoController::class, 'register'])->name('api.empleado.register');
    Route::get('empleado/{id}', [EmpleadoController::class, 'show'])->name('api.empleado.show');
    Route::put('empleado/{id}', [EmpleadoController::class, 'edit'])->name('api.empleado.edit');
    Route::get('empleados', [EmpleadoController::class, 'all'])->name('api.empleado.all');
    Route::get('twentyEmpleados', [EmpleadoController::class, 'twentyRecords'])->name('api.empleado.twentyRecords');
    Route::post('empleados/search', [EmpleadoController::class, 'search'])->name('api.empleado.search');
    Route::get('provincias', [\App\Http\Controllers\Api\ProvinciaController::class, 'show'])->name('api.provincias.show');
});

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
