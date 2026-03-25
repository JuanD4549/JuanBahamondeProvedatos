<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empleado extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function provincia()
    {
        return $this->belongsTo(Provincia::class);
    }
    public function persona()
    {
        return $this->belongsTo(Persona::class);
    }
}
