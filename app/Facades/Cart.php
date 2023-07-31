<?php

namespace App\Facades;

use App\Repositories\Cart\CartRepositories;
use Illuminate\Support\Facades\Facade;

class Cart extends Facade 
{

    public static function getFacadeAccessor(){


        return CartRepositories::class;
    }
}