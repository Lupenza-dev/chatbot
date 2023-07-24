<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ThreadController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\ResponseController;
use App\Http\Controllers\ThreadLinkController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Auth::routes();

// Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('/',[HomeController::class,'index'])->name('/');
Route::post('authentication',[LoginController::class,'authentication'])->name('authentication');
Route::get('logout',[LoginController::class,'logout'])->name('logout');


Route::group(['middleware'=>'auth'],function(){
      // Route::get('dashboard',[DashBoardController::class,'index'])->name('dashboard');
       Route::get('dashboard',[ThreadController::class,'index'])->name('dashboard');
       Route::post('update/threads',[ThreadController::class,'update'])->name('update.threads');
       Route::post('update/responses',[ResponseController::class,'update'])->name('update.responses');
       Route::post('delete/responses',[ResponseController::class,'destroy'])->name('delete.response');
       Route::post('delete/thread',[ThreadController::class,'destroy'])->name('delete.thread');
       Route::post('delete/thread/link',[ThreadLinkController::class,'destroy'])->name('delete.thread.link');
       Route::post('delete/response/link',[ThreadLinkController::class,'destroyResponseLink'])->name('delete.response.link');
       Route::get('response/links',[ThreadLinkController::class,'responseLink'])->name('response.links');
       Route::post('store/response/links',[ThreadLinkController::class,'responseLinkStore'])->name('response.links.store');

       Route::resources([
        'threads'            =>ThreadController::class,
        'responses'          =>ResponseController::class,
        'links'              =>ThreadLinkController::class,
    ]);
    
});

