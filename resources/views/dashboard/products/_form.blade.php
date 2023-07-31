
@if ($errors->any())
<div class="alert alert-danger">
  <h4>Error</h4>
  @foreach ($errors->all() as $error )
    <ul>
      <li>{{$error}}</li>
    </ul>
  @endforeach
</div>
@endif
{{-- //////////////////////////////////////////////////////////////////////////// --}}
<div class=" form-group ">
   <x-form.input label="Product name"  name="name" type="text" :value="$product->name" />
  </div>
  <x-form.selection2 name="category_id" label="category" :options="(App\Models\Category::all())" :value2="$product->category_id" />
</div>
  <div class="form-group">
<x-form.textarea label="Description" name="description" :value="$product->description" />
  </div>
  <div class="  form-group">
    <x-form.input label="Image" name="image" type="file"  />
    @if ($product->image)
      <img src="{{asset('storage/' . $product->image)}}" alt="" height="50px">
    @endif
  </div>
  <div class=" form-group ">
    <x-form.input label="price"  name="price"  :value="$product->price" />
   </div>
   <div class=" form-group ">
    <x-form.input label="compare price"  name="compare_price"  :value="$product->compare_price" />
   </div>
   <div class=" form-group ">
    <x-form.input label="tag"  name="tag"  :value="$tags"  />
   </div>

  <div class="form-group">
  <x-form.radio name="status" :options="['active'=>'Active','draft'=>'Draft', 'archived'=>'Archived']"  label="status"  :checked="$product->status"/>
  </div>
  <div class="form-group">
      <button type="submit" class="btn btn-outline-primary">save</button>
  </div>
  @push('style')
  <link href="{{ asset('css/tagify.css') }}" rel="stylesheet" type="text/css" />

  @endpush
  @push('script')
  <script src="{{asset ('js/tagify.min.js') }}"></script>
  <script src="{{asset ('js/tagify.polyfills.min.js') }}"></script>
<script>
  var inputElm = document.querySelector('[name=tag]'),
    tagify = new Tagify (inputElm);
  </script>  
  @endpush
