<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;

    
    protected $fillable = [
        'name',
        'price',
        'img',
        'description'
    ];


    public function users(){
        return $this->belongsToMany(User::class , 'service_user')->withPivot('created_at');
    }


    public function order(){
        return $this->hasOne(Order::class,'order_id');
    }
    
    public function carts(){
        return $this->belongsToMany(Cart::class , 'cart_service')->withPivot('created_at');
    }
}
