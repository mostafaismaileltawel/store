<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Dashboard\CategoriesController;
use App\Http\Controllers\Dashboard\ProductController;

Route::group(['middleware'=>['auth']],function(){



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
