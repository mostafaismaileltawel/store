
@extends('index')

@section('title','category')

@section('breadcrumb',' category')

@section('act2','active')

@section('containt')
<a href="{{route('category.create')}}" class="btn btn-outline-primary mb-5 mr-2">create</a>
{{-- <a href="{{route('categories.trash')}}" class="btn btn-outline-dark mb-5">trash</a> --}}


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
  <th>parent</th>
  <th>products #</th>
  <th>status</th>
  <th>created at</th>
  <th colspan="2"></th>
</thead>
<tbody>
  @forelse ($categories as $category )
  <tr>
    {{-- @forelse ($categories as $category ) --}}
    {{-- <td><img src="{{asset('storage/' . $category->image)}}" alt="" height="50px"></td> --}}
    <td><img src="{{$category->image}}" alt="" height="50px"></td>

    <td>{{$category->id}}</td>
    <td><a href="{{ route('category.show',$category->id) }}" >{{$category->name}}</a></td>
    <td>{{$category->parent->name}}</td>
    <td>{{$category->products_number }}</td>
    <td>{{$category->status}}</td>
    <td> {{$category->created_at}}</td>
    <td>
      <a href="{{route('category.edit', $category->id)}}" class="btn btn-outline-primary">edit</a>
    </td>
    <td>
      <form action="{{route('category.destroy',$category->id)}}" method="POST">
      @csrf
      @method('delete')
      <button type="submit" class="btn btn-outline-danger">delete</button>
      </form>
    </td>
    @empty
      <td colspan="9">not found category</td>
  </tr>
  @endforelse 
</tbody>
</table>
{{$categories->withQueryString()->links()}}
@endsection