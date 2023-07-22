
@extends('index')

@section('title','category')

@section('breadcrumb',' category')

@section('act2','active')

@section('containt')
<a href="{{route('category.index')}}" class="btn btn-outline-primary mb-5">back</a>

<x-form.alert type="success" />
<x-form.alert type="info" />
<form method="{{ URL::current() }}" method="GET" class="d-flex justify-content-between mb-3">

<x-form.input type="text" name="name"  label=""  placeholder="Name" class="mx-2" :value=" request('name')" />
<x-form.selection :options="['active'=>'active','archived'=>'archived']" name="status" :value2="request('status')"  class="mx-2"/>
<button class="btn btn-dark mx-2">Filter</button>
</form>
<table class="table">
<thead>
   <th>Image</th> 
  <th>ID</th>
  <th>Name</th>
  <th>status</th>
  <th>deleted at</th>
  <th colspan="2"></th>
</thead>
<tbody>
  @forelse ($categories as $category )
  <tr>
    {{-- @forelse ($categories as $category ) --}}
    <td><img src="{{asset('storage/' . $category->image)}}" alt="" height="50px"></td>
    <td>{{$category->id}}</td>
    <td>{{$category->name}}</td>
    <td>{{$category->status}}</td>
    <td> {{$category->deleted_at}}</td>
    <td>
      <form action="{{route('categories.restore',$category->id)}}" method="POST">
        @csrf
        @method('put')
        <button type="submit" class="btn btn-outline-info">restore</button>
        </form>    </td>
    <td>
      <form action="{{route('categories.force-delete',$category->id)}}" method="POST">
      @csrf
      @method('delete')
      <button type="submit" class="btn btn-outline-danger">delete</button>
      </form>
    </td>
    @empty
      <td colspan="7">not found category</td>
  </tr>
  @endforelse 
</tbody>
</table>
{{$categories->withQueryString()->links()}}
@endsection