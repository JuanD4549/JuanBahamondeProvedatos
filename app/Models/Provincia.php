<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Provincia extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function empleados()
    {
        return $this->hasMany(Empleado::class);
    }

    public function personas()
    {
        return $this->hasMany(Persona::class);
    }
}
