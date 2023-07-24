
@extends('index')

@section('title','category')

@section('breadcrumb',' product')

@section('act2','active')

@section('containt')
<a href="{{route('product.create')}}" class="btn btn-outline-primary mb-5 mr-2">create</a>
{{-- <a href="{{route('products.trash')}}" class="btn btn-outline-dark mb-5">trash</a> --}}


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
  <th>category</th>
  <th>store</th>
  <th>status</th>
  <th>created at</th>
  <th colspan="2"></th>
</thead>
<tbody>
  @forelse ($products as $product )
  <tr>
    {{-- @forelse ($products as $product ) --}}
    {{-- <td><img src="{{asset('storage/' . $product->image)}}" alt="" height="50px"></td> --}}
    <td><img src="{{$product->image}}" alt="" height="50px"></td>

    <td>{{$product->id}}</td>
    <td>{{$product->name}}</td>
    <td>{{$product->category->name}}</td>
    <td>{{$product->store->name}}</td>

    <td>{{$product->status}}</td>
    <td> {{$product->created_at}}</td>
    <td>
      <a href="{{route('product.edit', $product->id)}}" class="btn btn-outline-primary">edit</a>
    </td>
    <td>
      <form action="{{route('product.destroy',$product->id)}}" method="POST">
      @csrf
      @method('delete')
      <button type="submit" class="btn btn-outline-danger">delete</button>
      </form>
    </td>
    @empty
      <td colspan="9">not found product</td>
  </tr>
  @endforelse 
</tbody>
</table>
{{$products->withQueryString()->links()}}
@endsection