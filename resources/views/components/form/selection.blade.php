@props([
    'options' => [],
    'name',
    'value2'=>""
   
])

<select  name="{{$name}}" {{ $attributes->class(["form-select form-control form-select-sm",
'is-invalid'=>$errors->has($name)]) }}>
    <option value="">All</option>

    @foreach($options as $value => $text)
        <option value="{{ $value }}" @Selected(old($name,$value2) == $value)>{{ $text }}</option>
    @endforeach
</select>
@error($name)
<div class="invalid-feedback">
  {{$message}}
</div>
@enderror
