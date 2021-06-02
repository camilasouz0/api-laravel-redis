<?php
namespace Tests\Feature;
use Illuminate\Http\Request;

use Symfony\Component\HttpFoundation\Response;
use Tests\TestCase;

use App\Models\User;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class CatControllerTest extends TestCase
{
    
    public function test_index()
    {
        $consulta = $this->get('/cat?consulta=per')->assertRedirect('/login');

        $consulta->assertStatus(302);
    }

    // public function test_redirect($response)
    // {

    //     $listarRedis = new RedisControllerTest; 
    //     $response = $listarRedis->GravarCats($listarRedis->listarCats($consulta));

    //     $this->assertRedirect('inicio'); 

    // }

}