<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Order extends Model
{
    use HasFactory;
    protected $fillable  = ['user_id','store_id', 'payment_method', 'status', 'payment_status'];

    public function store()
    {
        return $this->belongsTo(Store::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class)->withDefault([
            'name' => 'Guest Customer'
        ]);
    }
    public function products()
    {
        return $this->belongsToMany(
            Product::class,
            'order_items',
            'order_id',
            'product_id',
            'id',
            'id'
        )
        ->using(OrderItem::class)
        ->withPivot([
            'product_name', 'price', 'quantity', 'options',
        ]);
    }

    public function addresses()
    {
        return $this->hasMany(OrderAddress::class);
    }

    public function billingAddress()
    {
        return $this->hasOne(OrderAddress::class,'order_id','id')
        ->where('type','=','billing');
    }
    public function shippingAddress()
    {
        return $this->hasOne(OrderAddress::class,'order_id','id')
        ->where('type','=','shipping');
    }

    public static function booted()
    {

        static::creating(function (Order $order) {
            $order->number = Order::getNextMaxNumber();
        });
    }
    public static function getNextMaxNumber()
    {
        $year = Carbon::now()->year;
        $number = Order::whereYear('created_at', $year)->max('number');
        if ($number) {
            return $number + 1;
        }
        return $year .'0001';
    }
}
