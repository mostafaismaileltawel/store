<?php

namespace App\Listeners;

use App\Events\OrderCreated;
use App\Models\User;
use App\Notifications\OrderCreatedNotification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Notification;


class SendOrderCreatedNotification
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
    public function handle(OrderCreated $event)
    {
        $order = $event->order;
        $user = User::where('store_id', $order->store_id)->first();//this for singel user
        $user->notify(new OrderCreatedNotification($order));

        // $users = User::where('store_id', $order->store_id)->get();//this for mullti  user
        // dd($users);
        //  Notification::send($users , new OrderCreatedNotification($order));

    }
}
