@extends('templates.cat')

@section('titulo', 'Consulta de gatos')

@section('json-cats')
{{ $cats ?? ''}}

{{-- @forelse ($cats as $cat)
   <li>{{ $cat->name }}</li>
@empty
   <p>Nem um resultado encontrato</p>
@endforelse

@if(isset($usersType))
    @foreach( $usersType as $type )
        <input type="checkbox" class='default-checkbox'> <span>{{ $type->type }}</span> &nbsp; 
    @endforeach
@endif --}}


{{-- @foreach(json_decode($cats, true) as $value)
    <div>
        <p>id: {!! $value['id'] !!} </p>
        <p>Nome: {!! $value['name'] !!} </p>
        <p>Temperamento: {!! $value['temperament'] !!} </p>
        <p>Origem: {!! $value['origin'] !!} </p>
    </div>    
 
@endforeach --}}

@endsection
