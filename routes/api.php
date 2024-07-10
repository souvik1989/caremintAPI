<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::namespace('Api')->group(function(){
	
	Route::get('category', [App\Http\Controllers\Api\CategoryController::class,'getCategory']);
  Route::get("blogs",[App\Http\Controllers\Api\BlogController::class,'getBlogs']);
  Route::get("testimonials",[App\Http\Controllers\Api\BlogController::class,'getTestimonials']);
    Route::post("user-login",[App\Http\Controllers\Api\AuthenticationController::class,'userSignin']);
    Route::post("user-signup",[App\Http\Controllers\Api\AuthenticationController::class,'userRegister']);
     Route::get("timeslots",[App\Http\Controllers\Api\OrderController::class,'timeslot']);
    Route::post('forget-password', [App\Http\Controllers\Api\AuthenticationController::class, 'forgotPassword'])->name('forget.password.post');
    Route::post('reset-password', [App\Http\Controllers\Api\AuthenticationController::class, 'submitResetPasswordForm'])->name('reset.password.post');
    Route::get("review-list",[App\Http\Controllers\Api\OrderController::class,'getReview']);
     Route::post("search-provider",[App\Http\Controllers\Api\ProviderController::class,'searchProvider']);
      Route::get("get-providers/{category}/{pincode}",[App\Http\Controllers\Api\ProviderController::class,'getProvider']);
      
       Route::post("washer-login",[App\Http\Controllers\Api\AuthenticationController::class,'washerSignin']);
       
     
        
        
        
    Route::middleware(['auth:sanctum'])->group(function(){
		Route::post('user-logout',[App\Http\Controllers\Api\AuthenticationController::class,'userSignout']);
		Route::post('washer-signup',[App\Http\Controllers\Api\AuthenticationController::class,'washerReg']);
		
		 Route::get("get-provider-list/{id}",[App\Http\Controllers\Api\ProviderController::class,'getProviderList']);
   
     Route::get("get-provider-service/{id}/{category}",[App\Http\Controllers\Api\ProviderController::class,'getServices']);
   
    Route::get("customer-orders",[App\Http\Controllers\Api\CustomerController::class,'customerOrder']);
    Route::post("add-cart/{order}",[App\Http\Controllers\Api\CartController::class,'addToCart']);
        Route::get("get-user-orders",[App\Http\Controllers\Api\OrderController::class,'getUserOrders']);
     Route::post("search-customer",[App\Http\Controllers\Api\ProviderController::class,'searchCustomer']);
    Route::get("get-orders",[App\Http\Controllers\Api\OrderController::class,'getOrders']);
    Route::get("get-pending-orders",[App\Http\Controllers\Api\OrderController::class,'getPendingOrders']);
    Route::get("get-new-orders",[App\Http\Controllers\Api\OrderController::class,'getNullOrders']);
    Route::get("get-completed-orders",[App\Http\Controllers\Api\OrderController::class,'getCompletedOrders']);
    Route::get("get-cancelled-orders",[App\Http\Controllers\Api\OrderController::class,'getCancelledOrders']);
    Route::post("complete-order/{status}",[App\Http\Controllers\Api\OrderController::class,'orderStatus']);
    Route::get("cancel-order/{status}",[App\Http\Controllers\Api\OrderController::class,'orderStatusCancel']);
    Route::get("order-accept/{id}",[App\Http\Controllers\Api\OrderController::class,'orderAccept']);
    Route::get("get-provider-category",[App\Http\Controllers\Api\CategoryController::class,'getProviderCategory']);
    Route::post("review",[App\Http\Controllers\Api\OrderController::class,'postReview']);
    Route::post("remove-account",[App\Http\Controllers\Api\AuthenticationController::class,'remove']);
     Route::post("task-assign",[App\Http\Controllers\Api\TaskController::class,'taskAssign']);
      Route::get("washerman-list",[App\Http\Controllers\Api\TaskController::class,'getWasher']);
     Route::get("task-list",[App\Http\Controllers\Api\TaskController::class,'getWasherTask']);
       Route::get("pending-task-list",[App\Http\Controllers\Api\TaskController::class,'getWasherPendingTask']);
      Route::get("completed-task-list",[App\Http\Controllers\Api\TaskController::class,'getWasherCompleteTask']);
       Route::post("task-status/{task}",[App\Http\Controllers\Api\TaskController::class,'taskStatus']);
    });
    
   
});

