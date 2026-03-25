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
        Schema::create('provincias', function (Blueprint $table) {
            $table->id();
            $table->string('nombre_provincia');
            $table->string('capital_provincia');
            $table->text('descripcion_provincia');
            $table->decimal('poblacion_provincia', 12, 2)->nullable();
            $table->decimal('superficie_provincia', 12, 2)->nullable();
            $table->decimal('latitud_provincia', 10, 6)->nullable();
            $table->decimal('longitud_provincia', 10, 6)->nullable();
            $table->unsignedBigInteger('id_region');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('provincias');
    }
};
