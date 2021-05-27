<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
use App\Models\Cats;

class RedisController extends Controller
{

    public function GravarCats($array){
        $opts = [
            "http" => [
                "method" => "GET",
                "header" => "x-api-key: 56e7d77a-f976-458e-b6cd-41b55f008dfb"
            ]
        ];
        
        $context = stream_context_create($opts);
        $resultado = file_get_contents('https://api.thecatapi.com/v1/breeds/search?q='.$array, false, $context);
        
        foreach(json_decode($resultado) as $gato){ 
            $cats = new Cats;
            $cats->name = $gato->name;
            // $cats->temperament = $gato->temperament;
            // $cats->origin = $gato->origin;
            
            Redis::set($gato->name, serialize($gato));
            Redis::expire($gato->name, 60 * 60);

            if(Redis::get($resultado)){
                $CatExiste = Cats::where('name')->exists();
                $cats->save();                  
            }       
         }
        return $resultado;
    }
  
}
