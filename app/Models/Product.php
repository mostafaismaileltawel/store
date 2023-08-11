<?php

namespace App\Models;

use App\Models\Scopes\StoreScope;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'slug', 'image', 'description', 'price',
        'compare_price', 'category_id', 'store_id', 'status'
    ];
protected $hidden = ['created_at','updated_at','deleted_at','image'];
protected $appends =['image_url'];
    public function category()
    {
        return $this->belongsTo(category::class);
    }

    public function store()
    {
        return $this->belongsTo(store::class);
    }

    public function tags()
    {
        return $this->belongsToMany(
            Tag::class,
            'product_tag',
            'product_id',
            'tag_id',
            'id',
            'id'
        );
    }
    //local scope
    public function scopeActive(Builder $builder)
    {
        $builder->where('status', '=', 'active');
    }

    // public static function booted(){

    //          static::addGlobalScope('store',function(Builder $builder){

    //      $user = Auth::user();
    //     if($user->store_id){
    //     $builder->where('store_id','=',$user->store_id);
    //      }

    //      } );



    // }
    //// حل اخر عن طريق انشاء كلاس لل اسكوب داخل ال موديل
    public static function booted()
    {

        static::addGlobalScope('store', new StoreScope);
        static::creating(function(Product $product){
            $product->slug = Str::slug($product->name);
        });
    }


    //accessors

    public function getImageUrlAttribute()
    {
        if (!$this->image) {
            return "https://store.welloflifecenter.com/wp-content/uploads/2016/05/default_product-300x300.png";
        }
        if (Str::startsWith($this->image, ['https://', 'http://'])) {
            return $this->image;
        }
        return asset('storeg/' . $this->image);
    }

    public function getSalePercentAttribute()
    {
        if (!$this->compare_price) {
            return 0;
        }
        return number_format(100 - (100 * $this->price / $this->compare_price), 1);
    }
    public function scopeFilter(Builder $builder, $filter)
    {
        $options = array_merge([
            'category_id' => null,
            'store_id' => null,
            'tag_id' => null,
            'status' => 'active'
        ], $filter);

        $builder->when($options['store_id'], function (Builder $builder, $value) {
            $builder->where('store_id', $value);
        });
        $builder->when($options['category_id'], function (Builder $builder, $value) {
            $builder->where('category_id', $value);
        });
        $builder->when($options['status'], function (Builder $builder, $value) {
            $builder->where('status', $value);
        });
        $builder->when($options['tag_id'], function (Builder $builder, $value) {
            $builder->whereExistes(function ($query) use ($value) {
                $query->select(1)
                    ->from('product_tag')
                    ->whereRaw('product_id = products.id')
                    ->where('tag_id', $value);
            });
        });
    }
}
