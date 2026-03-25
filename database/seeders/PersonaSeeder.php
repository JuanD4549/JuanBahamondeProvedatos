<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PersonaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('personas')->insert([
        [
            'nombres' => 'Juan Diego',
            'apellidos' => 'Bahamonde',
            'cedula' => '1726766452',
            'provincia_id' => 1,
            'fecha_nacimiento' => '1999-06-23',
            'email' => 'juandiego402@gmail.com',
            'observaciones' => null,
            'fotografia' => null,
        ]
    ]);
    }
}
