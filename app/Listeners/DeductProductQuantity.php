<?php

namespace App\Listeners;

use App\Facades\Cart;
use App\Models\Product;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\DB;
use Throwable;

class DeductProductQuantity
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($event)
    {
        $order = $event->order;
        //another solution by bass $order from checkout controller in handel function 
        try{
        foreach ($order->products as $product) {
            $product->decrement('quantity', $product->pivot->quantity);
        }

    }catch(Throwable $e)
    {
    }
        //////////////////////////////////////////////////
        // $order = Cart::get();
        // foreach($order as $item)
        // {
        //     Product::where('id','=',$item->product_id)
        //     ->update([
        //         'quantity'=>DB::raw('quantity - ' . $item->quantity )
        //     ]);
        // }
    }
}
