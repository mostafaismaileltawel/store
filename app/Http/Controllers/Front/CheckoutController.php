<?php

namespace App\Http\Controllers\Front;

use App\Events\OrderCreated;
use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderItem;
use App\Repositories\Cart\CartRepositories;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Symfony\Component\Intl\Countries;
use Throwable;

class CheckoutController extends Controller
{
    public function create(CartRepositories $cart)
    {
        if($cart->get()->count() ==0)
        {
            return redirect()->route('home');
        }
        return view('front.checkout', [
            'cart' => $cart,
            'countries' => Countries::getNames()
        ]);
    }


    public function store(Request $request, CartRepositories $cart)
    {
        $request->validate([
            'addr.billing.first_name'=>['required','string','max:255'],
            'addr.billing.last_name'=>['required','string','max:255'],
            'addr.billing.phone_number'=>['required','string','max:15'],
            'addr.billing.country'=>['required','string','max:2'],
            'addr.billing.street_address'=>['required','string','max:255'],
            'addr.shipping.first_name'=>['required','string','max:255'],
            'addr.shipping.last_name'=>['required','string','max:255'],
            'addr.shipping.phone_number'=>['required','string','max:15'],
            'addr.shipping.country'=>['required','string','max:2'],
            'addr.shipping.street_address'=>['required','string','max:255'],

        ]);
        $items = $cart->get()->groupBy('product.store_id');

        DB::beginTransaction();

        try {
            foreach ($items as $store_id => $cart_items) {
                $order = Order::create([
                    'store_id' => $store_id,
                    'user_id' => Auth::id(),
                    'payment_method' => 'cod'

                ]);

                foreach ($cart_items as $item) {
                    OrderItem::create([
                        'order_id' => $order->id,
                        'product_id' => $item->product_id,
                        'product_name' => $item->product->name,
                        'price' => $item->product->price,
                        'quantity' => $item->quantity
                    ]);
                }
                foreach ($request->post('addr') as $type => $address) {
                    $address['type'] = $type;
                    $order->addresses()->create($address);
                }
            }
            DB::commit();
            // event('created.order',$order);
            //another solution to event by crate event class 
            event(new OrderCreated($order));
        } catch (Throwable $e) {
            DB::rollBack();
            throw $e;
        }
        return redirect()->route('home');
    }
}
