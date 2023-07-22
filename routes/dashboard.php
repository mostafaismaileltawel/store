<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Dashboard\CategoriesController;







Route::resource('/category', CategoriesController::class)->middleware(['auth']);
Route::get('/search',[ CategoriesController::class,'search'])->middleware(['auth']);
