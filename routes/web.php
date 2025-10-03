<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('phpinfo', function () {
    $string = "my string";

    echo $string;

    phpinfo();
});
