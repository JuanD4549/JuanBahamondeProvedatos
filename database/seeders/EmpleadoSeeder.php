<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EmpleadoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('empleados')->insert([
            [
                'persona_id' => 1,
                'fecha_ingreso' => '2026-03-24',
                'cargo' => 'FullStack',
                'departamento' => 'Desarrollo',
                'provincia_id' => 1,
                'sueldo' => '750',
                'jornada_parcial' => true,
                'observaciones' => null,
            ]
        ]);
       
    }
}
