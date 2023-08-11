<?php

namespace App\Notifications;

use App\Models\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class OrderCreatedNotification extends Notification
{
    use Queueable;
    protected $order;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Order $order)
    {
        $this->order=$order;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail','database','broadcast'];

        // $chanals =['database'];
        // if($notifiable->notification_prefrence['order_created']['sms'])
        // {
        //     $chanals[]='vonage';
        // }
        // if($notifiable->notification_prefrence['order_created']['mail'])
        // {
        //     $chanals[]='mail';
        // }
        // if($notifiable->notification_prefrence['order_created']['brodcast'])
        // {
        //     $chanals[]='brodcast';
        // }
        // return $chanals ;
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $addr = $this->order->billingAddress;
        return (new MailMessage)
                     ->subject("New order #{$this->order->number}")
                     //->from('mostafa@stor.ps','store')
                    ->greeting("Hi {$notifiable->name}")
                     ->line("a new order #{$this->order->number} created by {$addr->name} from {$addr->countryname}")
                    ->action('view order', url('/category'))
                    ->line('Thank you for using our application!');
    }
    public function toDatabase($notifiable)
    {        $addr = $this->order->billingAddress;

        return [
            'body'=>"a new order {$this->order->number}<br/>created by-{$addr->name}<br />from-{$addr->countryname}",
            'url'=>url('/category'),
            'icon'=>'fas fa-file',
            'order_id'=>$this->order->id

        ];
    }
    public function toBroadcast($notifiable)
    {
        $addr = $this->order->billingAddress;

        return new BroadcastMessage( [
            'body'=>"a new order {$this->order->number}<br/>created by-{$addr->name}<br />from-{$addr->countryname}",
            'url'=>url('/category'),
            'icon'=>'fas fa-file',
            'order_id'=>$this->order->id

        ]);
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
