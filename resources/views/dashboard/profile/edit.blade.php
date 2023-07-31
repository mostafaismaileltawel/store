@extends('index')
@section('title','edit')
@section('breadcrumb','edit profile')
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
@section('containt')
<x-form.alert type="success"/>
<form action="{{ route('profile.saveUpdate') }}"   method="POST"   enctype="multipart/form-data">
    @csrf
    @method('patch')
    <div class="form row">
        <div class="col-md-6">
        <x-form.input name='first_name' label='first name'  :value="$user->profile->first_name" />
        </div>
        <div class="col-md-6">
            <x-form.input name='last_name' label='last name' :value="$user->profile->last_name"/>
        </div>
    </div>
    <div class="form row">
        <div class="col-md-6">
            {{-- <x-form.input name='birthday' type='date' label='birthday':value="$user->profile->birthday"/> --}}
                <x-form.input name='birthday' type='date' label='birthday' :value="$user->profile->birthday"/>

        </div>
        <div class="col-md-6">
            <x-form.radio name='gender' label="gender" :options="['male'=>'Male','female'=>'Female']" :checked="$user->profile->gender"/>
        </div>

    </div>
    <div class="form row">
        <div class="col-md-4">
            <x-form.input type="" name="street_address"  label="street address" :value="$user->profile->street_address" />
        </div>
        <div class="col-md-4">
            <x-form.input  name="city"  label="city" :value="$user->profile->city" />
        </div>
        
        <div class="col-md-4">
            <x-form.input  name="state"  label="state" :value="$user->profile->state" />
        </div>
    </div>
    <div class="form row">
        <div class="col-md-4">
            <x-form.input  name="postal_code" :value="$user->profile->postal_code" label="postal code" />
        </div>
        <div class="col-md-4">
<x-form.profile_selection name="country" :options="$countries" label="country" :selected="$user->profile->country"/>
        </div>
        <div class="col-md-4">
            <x-form.profile_selection name="locale" :options="$locales" label="locale" :selected="$user->profile->locale"/>

        </div>

    </div>

    <button type="submit" class="btn btn-outline-primary">save</button>
</form>
@endsection