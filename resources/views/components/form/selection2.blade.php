 @props([
    'options' => [],
    'name',
    'value2'=>"",
    'label'
   
])
     {{-- @dd($options)  --}}
          <label  class="form-label">{{$label}}</label>

<select  name="{{$name}}" {{ $attributes->class(["form-select form-control form-select-sm",
'is-invalid'=>$errors->has($name)]) }}>

    <option value="">primary category</option>

    @foreach($options as $category)
    <option value="{{ $category->id }}" @Selected(old($name,$value2) == $category->id)>{{ $category->name }}</option>
    @endforeach
</select>
@error($name)
<div class="invalid-feedback">
  {{$message}}
</div>
@enderror 
