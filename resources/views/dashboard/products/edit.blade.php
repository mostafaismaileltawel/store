

@extends('index')
@section('title','edit')
@section('breadcrumb','edit product')

@section('containt')
<form action="{{route('product.update',$product->id)}} " method="POST" enctype="multipart/form-data">
    @csrf
    @method('put')
    @include('dashboard.products._form')
    </form>
@endsection