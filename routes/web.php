<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

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

Route::get('/dashboard', function () {
//    \Illuminate\Support\Facades\App::setlocale('ar');
    return inertia('Dashboard', [
        'canLogin' => true,
        'message' => 'Bye',
    ]);
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
