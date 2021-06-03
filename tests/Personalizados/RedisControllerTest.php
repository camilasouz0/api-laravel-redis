<?php
namespace Tests\Personalizados;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redis;
use App\Models\Cats;
use Tests\TestCase;

class RedisControllerTest extends TestCase
{

    // public function test_listarCats(){
    //     $data = "persian";
    //     $this->get('/cat?consulta='.$data);
    //     $keys = Redis::KEYS(ucfirst($data).'*');
    //     $this->assertTrue($keys);
    // }

    public function test_getApi(){
        // $getConsulta = new CatControllerTest;
        $param = 'Persian';
        $opts = [
            "http" => [
                "method" => "GET",
                "header" => "x-api-key: 56e7d77a-f976-458e-b6cd-41b55f008dfb"
            ]
        ];
        
        $context = stream_context_create($opts);
        $response = file_get_contents('https://api.thecatapi.com/v1/breeds/search?q='.$param, false, $context);

        $data = json_decode($response, true);

        if($data[0] == 'persian'){
            $this->assertArrayHasKey('name', $data[0]);
        }else{
            $this->assertFalse($data[0] == 'persian', 'Gato não encontrato');
        }
    }

    // public function test_getDB(){
    //     $gato = "freud";
    //     $cats = new Cats;
    //     $cats->name = $gato;
    //     $cats->save();
    //     $resultado = DB::table('cats')->where(function ($query) use ($gato) {
    //         $query->where('name', 'like', $gato.'%');
    //     })->get();

    //     $this->assertCount(6, $resultado, "testArray doesn't contains 3 elements");
    // }
}