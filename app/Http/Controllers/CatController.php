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
        
        if(!Redis::get($consulta)){
        
        $CatSQL = new RedisController;
        $resultado = $CatSQL->GravarCats($consulta);
        
        }else{
            $resultado = Redis::get($consulta);
        }
        return view('inicio')->with('cats', $resultado);
        
       // return $resultado;
    }
    
}
