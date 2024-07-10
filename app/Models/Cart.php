<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $fillable = [
        
        'address',
        'city',
        'state',
        'zip',
        'provider_id',
        'payment_mode',
        'time',
        'due_date',
        
        
    ];

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }

    public function services(){
        return $this->belongsToMany(Service::class , 'cart_service')->withPivot('created_at');
    }
}
