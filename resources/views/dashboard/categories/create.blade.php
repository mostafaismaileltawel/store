
@extends('index')
@section('title','create')
@section('breadcrumb','create category')
@section('act','active')
    








@section('containt')
<form action="{{route("category.store")}}" method="POST" enctype="multipart/form-data">
@csrf
@include('dashboard.categories._form')
   
   
</form>
@endsection