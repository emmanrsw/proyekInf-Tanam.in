<?php

namespace App\Http\Controllers;

use App\Models\karyawanModel;
use Illuminate\Http\Request;
// use App\Models\Detail_penjualan;
// use Illuminate\Http\JsonResponse;
// use Illuminate\Support\Facades\Auth;
// use App\Http\Middleware\Authenticate;

class karyawanController extends Controller
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

        return view('homeKywn', [
            'plants' => $filteredPlants,
            'searchQuery' => $searchQuery,
        ]);
    }
        public function hashPasswords()
        {
            karyawanModel::hashAllPasswords();
            return "Passwords have been hashed successfully.";
        }
    }
