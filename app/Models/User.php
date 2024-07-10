<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    
    protected $fillable = [
        'user_firstname',
        'user_email',
        'user_phonenumber',
        'user_pincode',
        'user_address',
        'user_pass',
        'user_login',
        
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
       
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function setUserPassAttribute($value)
    {
        $this->attributes['user_pass'] = bcrypt($value);
    }

    public function categories(){
        return $this->belongsToMany(Category::class , 'category_user')->withPivot('created_at');
    }

    public function services(){
        return $this->belongsToMany(Service::class , 'service_user')->withPivot('created_at');
    }

    public function pincodes(){
        return $this->belongsToMany(Pincode::class , 'pincode_user')->withPivot('created_at');
    }

     public function carts(){
        return $this->hasMany(Cart::class);
    }

    public function order(){
        return $this->hasMany(Order::class,'user_id');
    }
    public function porder(){
        return $this->hasMany(Order::class,'provider_id');
    }

    public function role()
    {
        return $this->belongsTo(Role::class, 'role_id');
    }
    public function provider(){
        return $this->belongsTo(User::class,'provider_id');
    }
}
