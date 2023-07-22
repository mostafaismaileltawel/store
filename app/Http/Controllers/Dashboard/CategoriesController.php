<?php

namespace App\Http\Controllers\Dashboard;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $request=request();
    //     $query = Category::query();
    //     if($name = $request->query('name')){
    //         $query->where('name','like', "%{$name}%");
    //     }
    //     if($status= $request->query('status')){
    //         $query->where('status','=',$status);
    //     }
    //  $categories = $query->paginate(1);
    //anothe solution by scopefilter function in model category
    $categories = Category::LeftJoin('categories as parents','parents.id','=','categories.parent_id')
    ->select([
        'categories.*',
        'parents.name as parent_name'
    ])
    ->filter($request->query())->OrderBy('categories.name')->paginate();
     return view('dashboard.categories.index',compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $parents=Category::all();
        $category=new Category;

        return view('dashboard.categories.create',compact('category','parents'));
    
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)

    {       
         $request->validate(Category::rules());


         $request->merge(['slug' => Str::slug($request->post('name'))]);
         $data = $request->except('image'); 
         $data['image']=$this->uploadImage($request);
                 
         $category=Category::create($data);
         return Redirect::route('category.index')->with('success','sccessed to create category');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        $category=Category::find($id);
        if(!$category){
             
            return Redirect::route('category.index')->with('info','not found category');
        }
        $parents= Category::where('id',"<>" ,$id)
        ->where(function($query) use ($id){
            $query->whereNull('parent_id')
            ->orWhere('parent_id', '<>' , $id);
        })->get();
        
        return view('dashboard.categories.edit',compact('category','parents'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        
        $request->validate(Category::rules($id));

        $category=Category::findOrFail($id);
        $old_image=$category->image;
        $data = $request->except('image');
        $new_image=$this->uploadImage($request);
if($new_image){
    $data['image'] = $new_image;
}
        $category->update($data);

        if ($old_image && $new_image) {
            Storage::disk('public')->delete($old_image);    
         }

            return Redirect::route('category.index')->with('success','categoey update');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

         $category = Category::findOrFail($id);
        $category->delete();

    //       if($category->image){
    // Storage::disk('public')->delete($category->image);
    // }
        return Redirect::route('category.index')->with('success','categoey deleted');

    }
            
    
    public function search(Request $request){
      $category_search=  Category::where('name','like', '%'.$request->input('search').'%' )
      ->orWhere('status','=', $request->input('search'))->get();
      return view('dashboard.categories.index2',compact('category_search'));
    }
    
    
    public function uploadImage(Request $request){
        if(!$request->hasfile('image')){
            return;
         } 
         
         $file = $request->file('image');
            $path= $file->store('upload','public') ;
            return $path;
         }
    
public function trash(){
    $categories = Category::onlyTrashed()->paginate();
    return view('dashboard.categories.trash',compact('categories'));
}
public function restore(Request $request , $id){
    $category =  Category::onlyTrashed()->findOrFail($id);
    $category->restore();
    return redirect()->route('categories.trash')->with('success','category restore agian');
    
}
   public function forcedelete (Request $request , $id){
    $category = Category::onlyTrashed()->findOrFail($id);
    $category->forceDelete();
    if($category->image){
        Storage::disk('public')->delete($category->image);
        }
        return redirect()->route('categories.trash')->with('info','category deleted forever');



   }




}
