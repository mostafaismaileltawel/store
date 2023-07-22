
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
<div class="  mb-3">
   <x-form.input label="category name" name="name" type="text" :value="$category->name" />
  </div>
  <div class="  mb-3">
        {{-- <select @class(['form-select', 'form-control mb-3','is-invalid'=>$errors->has('parent_id')]) aria-label="Default select example" name="parent_id">
                <option value="" >primare ctaegories</option>
                 @foreach ($parents as $parent )
                 <option value="{{$parent->id}}" @selected(old('parent_id',$category->parent_id) == $parent->id)>{{$parent->name}}</option>
                 @endforeach
               </select>
                 @error('parent_id')
                 <div class="invalid-feedback">
                  {{$message}}
                    </div>
                 @enderror --}}
  <x-form.selection2 name="parent_id" :options="$parents" :value2="$category->parent_id" />
</div>
  <div class="mb-3">
<x-form.textarea label="Description" name="description" :value="$category->description" />
  </div>
  <div class="  mb-3">
    <x-form.input label="Image" name="image" type="file"  />
    @if ($category->image)
      <img src="{{asset('storage/' . $category->image)}}" alt="" height="50px">
    @endif
  </div>


  <div class="mb-3">
  <x-form.selection name="status" :options="['active'=>'active', 'archived'=>'archived']" :value2="$category->status"/>
  </div>
  <button type="submit" class="btn btn-outline-primary">{{$button ?? 'save'}}</button>
