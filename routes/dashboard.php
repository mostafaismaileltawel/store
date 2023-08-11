<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Dashboard\CategoriesController;
use App\Http\Controllers\Dashboard\ProductController;
use App\Http\Controllers\Dashboard\ProfileController;
use App\Http\Middleware\CheckUserType;

Route::group(['middleware'=>['auth:admin'],'prefix'=>'admin'],function(){
    Route::get('dashboard',function(){
        return view('index');
    });

Route::get('profile',[ProfileController::class, 'edit'])->name('profile.edit');
// Route::patch('profile',[ProfileController::class, 'update'])->name('profile.update');
Route::patch('profile',[ProfileController::class, 'saveUpdate'])->name('profile.saveUpdate');


    Route::get('/categories/trash',[CategoriesController::class, 'trash'])
    ->name('categories.trash');
    Route::put('categories/{category}/restore',[CategoriesController::class, 'restore'])
    ->name('categories.restore');
    Route::delete('categories/{category}/force-delete',[CategoriesController::class, 'forcedelete'] )->name('categories.force-delete');
    // ('categories/{category]/force-delete',[CategoriesController::class, 'forcedelete'])
        // ->name('categories.force-delete');
    Route::resource('/category', CategoriesController::class);
    Route::resource('/product', ProductController::class);
// Route::get('/search',[ CategoriesController::class,'search']);

});
