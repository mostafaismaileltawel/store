

@extends('index')
@section('title','edit')
@section('breadcrumb','edit category')

@section('containt')
<form action="{{route('category.update',$category->id)}} " method="POST" enctype="multipart/form-data">
    @csrf
    @method('put')
    @include('dashboard.categories._form',['button'=>'update'] ?? 'save')
    </form>
@endsection