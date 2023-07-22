 @props([
    'options' => [],
    'name',
    'value2'=>""
   
])
     {{-- @dd($options)  --}}

<select  name="{{$name}}" {{ $attributes->class(["form-select form-control form-select-sm",
'is-invalid'=>$errors->has($name)]) }}>
    <option value="">primary category</option>

    @foreach($options as $parent)
    
    <option value="{{ $parent->id }}" @Selected(old($name,$value2) == $parent->id)>{{ $parent->name }}</option>
    @endforeach
</select>
@error($name)
<div class="invalid-feedback">
  {{$message}}
</div>
@enderror 
