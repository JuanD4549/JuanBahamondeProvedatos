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
        Schema::create('empleados', function (Blueprint $table) {
            $table->id();
            // Relación uno a uno con persona
            $table->unsignedBigInteger('persona_id')->unique();
            $table->foreign('persona_id')->references('id')->on('personas')->onDelete('cascade');

            $table->date('fecha_ingreso')->nullable();
            $table->string('cargo', 100);
            $table->string('departamento', 100);
            $table->unsignedBigInteger('provincia_id'); // Relación con provincias
            $table->decimal('sueldo', 10, 2)->default(0);
            $table->boolean('jornada_parcial')->default(false);
            $table->text('observaciones')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('empleados');
    }
};
