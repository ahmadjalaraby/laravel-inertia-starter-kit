<?php

use App\Http\Controllers\Web\ProfileController;
use App\Http\Controllers\Web\TagController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::post('/locale', function (\Illuminate\Http\Request $request) {
    $request->validate([
        'locale' => 'required',
    ]);

    $locale = $request->get('locale');
    session(['locale' => $locale]);
    return back();
})->name('change.language');


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/', function () {
        return redirect()->route('dashboard');
    });
    Route::get('/dashboard', function () {
        return inertia('Dashboard');
    })->name('dashboard');

    Route::resource('tags', TagController::class)->only(['index']);

    Route::get('/notifications', function () {
        return inertia('Dashboard');
    })->name('notifications');
});


Route::fallback(function () {
    return inertia('Error/404');
});


require __DIR__ . '/auth.php';
