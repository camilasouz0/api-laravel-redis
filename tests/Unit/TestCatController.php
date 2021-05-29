<?php

namespace Tests\Unit;

use Tests\TestCase;

class TestCatContoller extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_cat_controller()
    {

        $response = $this->get('/cat', [
            'consulta' => 'Persian',
        ]);

        $response->assertStatus(200);
    }
}