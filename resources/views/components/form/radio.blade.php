@props([
    'options'=>'','type'=>'radio' ,'name','value'=>'','label','checked'


])

<label class="form-check-label"  for="exampleRadios1">
 {{$label}}
</label>
@foreach ($options as $value=>$text )
<div class=" form-check">
<input {{ $attributes->class(["form-check-input",'is-invalid'=>$errors->has($name)]) }}  type="{{ $type }}" name="{{ $name }}" value="{{ $value }}" 
 @checked($value == $checked)  id="exampleRadios1"> 
@error($name)
<div class="invalid-feedback">
  {{$message}}
</div>
@enderror
<label class="form-check-label"  for="exampleRadios1">
 {{$text}}
</label>
</div>
@endforeach
