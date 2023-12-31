@props([
    'options' => [],
    'name',
    'value'=>'',
    'label'=>'',
    'selected'=>''
   
])



@if( $label)
<label  class="form-label">{{$label}}</label>
@endif
<select  name="{{$name}}" class="form-select form-control form-select-sm is-invalid:{{ $errors->has($name) }}">
    
    @foreach($options as $value => $text)
        <option value="{{ $value }}" @Selected($value == $selected)>{{ $text }}</option>
    @endforeach
</select>
@error($name)
<div class="invalid-feedback">
  {{$message}}
</div>
@enderror
