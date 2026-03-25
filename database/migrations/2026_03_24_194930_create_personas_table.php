<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('personas', function (Blueprint $table) {
            $table->id();
            $table->string('nombres', 100);
            $table->string('apellidos', 100);
            $table->string('cedula', 10)->unique();   // Cédula con validación de unicidad
            $table->unsignedBigInteger('provincia_id'); // Relación con tabla provincias
            $table->date('fecha_nacimiento')->nullable();
            $table->string('email', 150)->unique();
            $table->text('observaciones')->nullable();
            $table->string('fotografia')->nullable();
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('personas');
    }
};
