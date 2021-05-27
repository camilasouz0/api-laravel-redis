<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([           
            'name'              => 'Camila',
            'email'             => 'camila@hotmail.com',
            'password'          => env('PASSWORD_HASH') ? bcrypt('camila123') : 'camila123'//para criptografar a senha
        ]);
    }
}
