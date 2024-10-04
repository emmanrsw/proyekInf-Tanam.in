<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tanaman extends Model
{
    use HasFactory;

    // Jika Anda memiliki kolom tertentu di tabel, Anda dapat menentukan fillable di sini.
    protected $fillable = [
        'name',
        'description',
        'price',
        'image_url',
    ];
}
