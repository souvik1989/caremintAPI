<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\DashboardController;
//use App\Http\Controllers\Auth\RegisterController;
//use App\Http\Controllers\Auth\LoginController;

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

Route::get('/cache-clear', function () {
    // Artisan::call('optimize:clear');
     Artisan::call('view:cache');
     Artisan::call('route:clear');
     Artisan::call('cache:clear');
    return 'Cache Cleared';
    
    
});
Route::get('/storage-link', function () {
	Artisan::call('storage:link');
    return 'Storage Linked';
});
 Route::get('/', [DashboardController::class,'index'])->name('dashboard');
// Route::get('product-detail', [DashboardController::class,'productDetail'])->name('productDetail');
// Route::get('all-product', [DashboardController::class,'allProduct'])->name('allProduct');
// Route::get('cart-view', [DashboardController::class,'cartView'])->name('cartView');

// Route::post('register', [RegisterController::class,'creates'])->name('register');
// Route::post('login', [LoginController::class,'login'])->name('login');
// Route::middleware('auth')->group(function () {
//     Route::get('my-profile', [DashboardController::class,'profile'])->name('myProfile');
//     Route::post('logout',  [LoginController::class,'logout'])->name('logout');
// });
// // Route::get('/', function () {
//     return view('welcome');
// });

// Auth::routes();

// Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::prefix('admin')->group(function () {

    Route::get('', [App\Http\Controllers\Admin\DashboardController::class,'dashboard'])->middleware('auth:admin')->name('adminHome');


    Route::namespace('Admin')->group(function () {
        Route::get('login', [App\Http\Controllers\Admin\LoginController::class,'showLoginForm'])->name('admin.login');
        Route::post('login', [App\Http\Controllers\Admin\LoginController::class,'login']);


        // Route::get('forget-password','LoginController@showForgetPasswordForm')->name('forget.password');
        // Route::post('forget-password', 'LoginController@submitForgetPasswordForm')->name('forget.password.submit');
        // Route::get('reset-password/{token}',  'LoginController@showResetPasswordForm')->name('reset.password');
        // Route::post('reset-password','LoginController@submitResetPasswordForm')->name('reset.password.submit');
    });


    Route::namespace('App\Http\Controllers\Admin')->middleware(['auth:admin'])->group(function () {

        Route::post('logout', [App\Http\Controllers\Admin\LoginController::class,'logout'])->name('admin.logout');

        Route::get('changePassword', [App\Http\Controllers\Admin\PasswordController::class,'showChangePassword'])->name('admin.showChangePassword');
        Route::post('changePassword', [App\Http\Controllers\Admin\PasswordController::class,'changePassword'])->name('admin.changeDefaultPassword');


        Route::get('admin-profile', [App\Http\Controllers\Admin\AdminUserController::class,'showAdminProfile'])->name('showAdminProfile');
        Route::post('admin-profile', [App\Http\Controllers\Admin\AdminUserController::class,'changeAdminProfile'])->name('changeAdminProfile');

        Route::resource('siteSetting', SiteSettingController::class);
        //Route::resource('product-category', ProductCategoryController::class);
        Route::put('user/status/{user}',[App\Http\Controllers\Admin\UserController::class,'status'])->name('user.status');
         
        Route::resource('user', UserController::class);

        Route::put('provider/status/{provider}',[App\Http\Controllers\Admin\ProviderController::class,'status'])->name('provider.status');
        Route::resource('provider', ProviderController::class);

        Route::resource('service', ServiceController::class);
        Route::resource('category', CategoryController::class);
        Route::resource('pincode', PincodeController::class);
        Route::resource('blog', BlogController::class);
 Route::resource('timeslot', TimeslotController::class);

        Route::resource('order', OrderController::class);
        Route::post('order/status',[App\Http\Controllers\Admin\OrderController::class,'status'])->name('order.status');
        //Route::delete('remove-product-image',[App\Http\Controllers\Admin\ProductController::class,'removeImage'])->name('product.removeImage');
       
        // Route::resource('siteSetting', 'App\Http\Controllers\Admin\SiteSettingController', [
        //     'names' => 'siteSetting',
        //     'except' => [
        //         'show',
        //         'create',
        //         'store'
        //     ]
        // ]);

        Route::get('menu', 'DashboardController@menu')->name('menu');




        Route::get('menu', 'DashboardController@menu')->name('menu');

        Route::get('contacts', 'DashboardController@contacts')->name('contacts');
        // Route::delete('contact/{id}', 'DashboardController@deleteContact')->name('deleteContact');
        // Route::delete('deleteContacts', 'DashboardController@deleteContacts')->name('deleteContacts');

        // Route::get('contact-detail/{contactDetail}', 'DashboardController@contactDetail')->name('contactDetail');




        Route::resource('homeBanner', 'HomeBannerController', [
            'names' => 'homeBanner',
            'except' => [
                'show',
            ]
        ]);
        Route::patch('banner-status/{homeBanner}', 'HomeBannerController@bannerStatus')->name('homeBanner.status');

        Route::resource('video-category', 'VideoCategoryController', [
            'names' => 'video-category',
            'except' => [
                'show',
            ]
        ]);
        Route::patch('video-category-status/{category}', 'VideoCategoryController@videoCategoryStatus')->name('video-category.status');
        Route::resource('channel-category', 'ChannelCategoryController', [
            'names' => 'channel-category',
            'except' => [
                'show',
            ]
        ]);
        Route::patch('channel-category-status/{category}', 'ChannelCategoryController@channelCategoryStatus')->name('channel-category.status');



        Route::resource('faq', 'FaqController', [
            'names' => 'faq',
            'except' => [
                'show',
            ]
        ]);
        Route::patch('faq-status/{faq}', 'FaqController@faqStatus')->name('faq.status');
        Route::put('update-faq-text', 'FaqController@textUpdate')->name('faqText.update');



        Route::resource('testimonial', 'TestimonialController', [
            'names' => 'testimonial',
            'except' => [
                'show',
            ]
        ]);
        Route::patch('testimonial-status/{testimonial}', 'TestimonialController@testimonialStatus')->name('testimonial.status');
        Route::put('update-testimonial-text', 'TestimonialController@textUpdate')->name('testimonialText.update');



        Route::resource('socialLink', 'SocialLinkController', [
            'names' => 'socialLink',
            'except' => [
                'show',
            ]
        ]);
        Route::patch('socialLink-status/{socialLink}', 'SocialLinkController@socialLinkStatus')->name('socialLink.status');


    });
});
