<?php

namespace App\Http\Controllers;

use App\Http\Controllers\CatController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
use App\Models\Cats;

class RedisController extends Controller
{

    public function listarCats($gato){
        $opts = [
            "http" => [
                "method" => "GET",
                "header" => "x-api-key: 56e7d77a-f976-458e-b6cd-41b55f008dfb"
            ]
        ];
        
        $context = stream_context_create($opts);
        $resultado = file_get_contents('https://api.thecatapi.com/v1/breeds/search?q='.$gato, false, $context);

        return $resultado;
    }
    public function GravarCats($resultado){
        

        foreach(json_decode($resultado) as $gato){ 
            
            if(Cats::find($gato->name)){
               
            }
            elseif(Redis::exists($gato->name)){
                Redis::set($gato->name, serialize($gato));
                Redis::expire($gato->name, 2);
            }else{
                $cats = new Cats;
                $cats->name = $gato->name;
                $cats->metric = ($gato->weight)->metric;
                $cats->temperament = $gato->temperament;
                $cats->origin = $gato->origin;         
                $cats->save();
            }     
        }
        return $resultado;
    }
  
}
