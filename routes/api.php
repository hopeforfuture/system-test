<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BooksController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\BorrowingController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/borrow-request', [BorrowingController::class, 'borrow_request']);
Route::post('/return-request', [BorrowingController::class, 'return_request']);
Route::get('/history', [BorrowingController::class, 'borrow_history']);

Route::prefix('book')->group(function() {
    Route::post('/create', [BooksController::class, 'create']);
    Route::post('/update', [BooksController::class, 'update']);
    Route::get('/list', [BooksController::class, 'all_books']);
    Route::post('/view', [BooksController::class, 'view']);
    Route::post('/delete', [BooksController::class, 'remove']);
});

Route::prefix('user')->group(function() {
    Route::post('/create', [UsersController::class, 'create']);
    Route::post('/update', [UsersController::class, 'update']);
    Route::get('/list', [UsersController::class, 'all_users']);
    Route::post('/view', [UsersController::class, 'view']);
    Route::post('/delete', [UsersController::class, 'remove']);
});
