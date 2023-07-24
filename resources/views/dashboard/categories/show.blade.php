
@extends('index')

@section('title', $category->name )

@section('breadcrumb', $category->name )







@section('containt')




<table class="table">
<thead>
   <th>Image</th> 
  <th>Name</th>
  <th>store</th>
  <th>status</th>
  <th>created at</th>
</thead>
<tbody>
  @php
    $Products = $category->products()->with('store')->latest()->paginate(5);
  @endphp
  @forelse ($Products as $product )
  <tr>
    {{-- <td><img src="{{asset('storage/' . $product->image)}}" alt="" height="50px"></td> --}}
    <td><img src="{{$product->image}}" alt="" height="50px"></td>

    <td>{{$product->name}}</td>
    <td>{{$product->store->name}}</td>
    <td>{{$product->status}}</td>
    <td> {{$product->created_at}}</td>
 
    @empty
      <td colspan="5">not found product</td>
    {{-- @endforelse  --}}
    
    
   
  </tr>
  @endforelse 
</tbody>
</table>
{{$Products->links() }}
@endsection