<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\ProductResource;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductsController extends Controller
{
    public function __construct()
    {
$this->middleware('auth:sanctum')->except('index','show');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
       $product= Product::filter($request->query())
       ->with('category:id,name','store:id,name','tags:id,name')
       ->paginate();
       return  ProductResource::collection($product);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
$request->validate([
    'name'=>['required','string','max:255'],
    'description'=>['nullable','string','max:255'],
    'category_id'=>['required','exists:categories,id'],
    'status'=>['in:active, archive'],
    'price'=>['required','numeric','min:0'],
    'compare_price'=>['nullable','numeric','gt:price'],

    ]);
    $user = $request->user();
    if(!$user->tokenCan('product.create'))
    {
        abort(403,'don`t have abilities to create');
    }    if(!$user->tokenCan('product.update'))
    {
        abort(403,'don`t have abilities to update');
    }
     $product = Product::create($request->all());
     return $product;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)


    {

            //     return $product
            // ->load('category:id,name','store:id,name','tags:id,name');
            // anthe way to show one product use productresource
            return new ProductResource($product);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $request->validate([
    'name'=>['sometimes','required','string','max:255'],
    'description'=>['nullable','string','max:255'],
    'category_id'=>['sometimes','required','exists:categories,id'],
    'status'=>['in:active, archive'],
    'price'=>['sometimes','required','numeric','min:0'],
    'compare_price'=>['nullable','numeric','gt:price'],

    ]);
    $user = $request->user();
    if(!$user->tokenCan('product.update'))
    {
        abort(403,'don`t have abilities to update');
    }
     $product->update($request->all());
     return $product;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy( $id)
    {
        $user = Auth::guard('sanctum')->user();
        if(!$user->tokenCan('product.delete'))
        {
            abort(403,'don`t have abilities to delete');
        }

        Product::destroy($id);
        return [
            'message'=>'product deleted'];
    }
}
