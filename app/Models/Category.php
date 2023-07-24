<?php

namespace App\Models;
use App\Rules\Filter;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use HasFactory , SoftDeletes;
    protected $fillable =['id','name','image','slug','description','parent_id','status','created_at'];


    public static function rules($id=0){
       return[ 
        'name'=>['required','string','min:3','max:255',"unique:categories,name,$id",
        /////////////////////////////////////////
    // function($attribute,$value,$fails){
    //     if(strtolower($value)=='laravel'){
    //         $fails("not aloowed");
    //     }
    // } anothe solution by filter class
  // / //////////////////////////////////////////
// new Filter(["laravel","php","css"])
///////////////////////////////////////
'filter:php,laravel',
],
        'parent_id'=>['nullable','int','exists:categories,id'],
        'image'=>['image','max:1048576','dimensions:min_width=100,min_height=100',],
        'status'=>['in:active,archived']
    ];
}

public function products(){
  return $this->hasMany(Product::class);
}
public function parent(){
  return $this->belongsTo(Category::class,'parent_id','id')
  ->withDefault([
    "name"=>'-'
  ]);
}

public function children(){
  return $this->hasMany(Category::class,'parent_id','id');
}





public function scopeFilter(Builder $builder , $filter)
{

// if($filter['name'] ?? false){
//   $builder->where('name','like',"%{$filter['name']}");
// }
// if($filter['status'] ?? false){
//   $builder->where('status','=',$filter['status']);
// }
//another solve with clean code 
$builder->when($filter['name'] ?? false, function($builder, $value){
  $builder->where('categories.name','like', "%{$value}%");

});
$builder->when($filter['status'] ?? false, function($builder, $value){
  $builder->where('categories.status','=', $value);

});


}}
