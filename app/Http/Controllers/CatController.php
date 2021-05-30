<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Redis;
use Illuminate\Http\Request;
use App\Models\Cats;
use App\Http\Controllers\RedisController;

class CatController extends Controller
{
    public function index(Request $request)
    {
        $consulta = $request->query('consulta');
        $listarRedis = new RedisController;       
        $resultado = $listarRedis->GravarCats($listarRedis->listarCats($consulta));
  
        return view('inicio')->with('cats', $resultado);
    }    
}
