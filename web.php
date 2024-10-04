<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\karyawanController;
use App\Http\Controllers\tanamanController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/login', [AuthController::class, 'login'])->name('login.login');
Route::post('/login', [AuthController::class, 'loginProcess'])->name('loginProcess');

Route::get('/forgot-password', [AuthController::class, 'showForgotPasswordForm'])->name('forgot-password');
Route::post('/forgot-password', [AuthController::class, 'submitForgotPasswordForm'])->name('forgot-password.submit');

Route::get('/register', [AuthController::class, 'register'])->name('register');
Route::post('/register', [AuthController::class, 'registerProcess']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');


Route::get('/home', [tanamanController::class, 'index'])->name('home');
Route::get('/homeKywn', [karyawanController::class, 'index'])->name('homeKywn');
