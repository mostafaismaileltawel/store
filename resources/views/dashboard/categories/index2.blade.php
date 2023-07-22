
@extends('index')

@section('title','category')

@section('breadcrumb',' category')

@section('act2','active')






@section('containt')


@if(session()->has('success'))
<div class="alert alert-success">
  {{session('success')}}
</div>
@endif
@if(session()->has('success2'))
<div class="alert alert-success">
  {{session('success2')}}
</div>
@endif
@if(session()->has('success3'))
<div class="alert alert-success">
  {{session('success3')}}
</div>
@endif

<table class="table">
<thead>
   <th>Image</th> 
  <th>ID</th>
  <th>Name</th>
  <th>Parent_id</th>
  <th>status</th>
  <th>created at</th>
  <th colspan="2"></th>
</thead>
<tbody>
  @forelse ($category_search as $category )
  <tr>
    {{-- @forelse ($categories as $category ) --}}
    <td><img src="{{asset('storage/' . $category->image)}}" alt="" height="50px"></td>
    <td>{{$category->id}}</td>
    <td>{{$category->name}}</td>
    <td>{{$category->parent_id}}</td>
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
      <td colspan="7">not found category</td>
    {{-- @endforelse  --}}
    
    
   
  </tr>
  @endforelse 
</tbody>
</table>
@endsection