<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CatController;

Route::get('/', function () {
    return phpinfo();
});

Route::get('/cat', [CatController::class, 'index'])->middleware(['auth'])->name('inicio');

require __DIR__.'/auth.php';
