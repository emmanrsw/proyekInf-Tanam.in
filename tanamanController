<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\tanaman;

class tanamanController extends Controller
{
    public function index(Request $request)
    {
        // Data tanaman dalam bentuk array asosiatif
        $plants = [
            [
                'name' => 'Anthurium Andraeanum',
                'description' => 'Tanaman Anthurium andraeanum memiliki daun besar, mengkilap bentuk hati dan bunga mencolok, terdiri atas warna warni dan spadix',
                'price' => '50000',
                'image_url' => 'https://i.pinimg.com/564x/71/7d/f3/717df3b830d0c9cc6ccd2a408b4b4075.jpg'
            ],
            // Tambahkan tanaman lainnya di sini...
        ];

        // Mendapatkan nilai pencarian dari query string
        $searchQuery = $request->input('search', '');

        // Filter tanaman berdasarkan pencarian
        $filteredPlants = [];
        foreach ($plants as $plant) {
            if (empty($searchQuery) || stripos($plant['name'], $searchQuery) !== false) {
                $filteredPlants[] = $plant;
            }
        }

        return view('tanaman', [
            'plants' => $filteredPlants,
            'searchQuery' => $searchQuery,
        ]);
    }
}
