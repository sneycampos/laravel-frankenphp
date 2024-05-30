<?php

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});


Route::get('teste', function () {
    Log::info('teste de log');

    Cache::put('randonm_key', 'random_value', 60);

    if (true) {
        dump('xd');
        Log::info('1 é igual a 1');
    }

    return response()->json('teste');
});
