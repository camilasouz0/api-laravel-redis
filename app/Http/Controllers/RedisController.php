<?php

namespace App\Http\Controllers;

use App\Http\Controllers\CatController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\DB;
use App\Models\Cats;

class RedisController extends Controller
{

    public function listarCats($gato){

            $keys = Redis::KEYS(ucfirst($gato).'*');
            
            $resultado = Array();

            foreach($keys as $key){
                $resultado[$key] = json_decode(Redis::get($key));
            }

        if(empty($resultado)){

            $resultado = DB::table('cats')->where(function ($query) use ($gato) {
                $query->where('name', 'like', $gato.'%');
            })->get();
            //Verifica se tem no banco
            if($resultado->count() !== 0){
                echo "estou vindo do banco";
                return json_encode($resultado); 
            }else{
            //PEGA DA API
            $opts = [
                "http" => [
                    "method" => "GET",
                    "header" => "x-api-key: 56e7d77a-f976-458e-b6cd-41b55f008dfb"
                ]
            ];
            
            $context = stream_context_create($opts);
            $resultado = file_get_contents('https://api.thecatapi.com/v1/breeds/search?q='.$gato, false, $context);
            echo "estou vindo da api";

                foreach(json_decode($resultado) as $gato){
                Redis::set($gato->name, json_encode($gato));
                Redis::expire($gato->name, 60);
                }
                return $resultado;  
            }
        }   
        return json_encode($resultado);  
    }

    public function GravarCats($resultado){
   
        foreach(json_decode($resultado) as $gato){
            $name = $gato->name; 

            $sql = DB::table('cats')->where(function ($query) use ($name) {
                $query->where('name', 'like', $name);
            })->get();

            if($sql->count() == 0){
                $cats = new Cats;
                $cats->name = $gato->name;
                // $cats->metric = ($gato->weight)->metric;
                print_r($cats->temperament);
                // $cats->temperament = $gato->temperament;
                // $cats->origin = $gato->origin;         
                $cats->save();

            }           
        }
        return $resultado;
    }

    public function useApi(){}
  
}
