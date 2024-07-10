<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pincode extends Model
{
    use HasFactory;

    protected $fillable = [
        
        'pincode',
    ];

    public function users(){
        return $this->belongsToMany(User::class , 'pincode_user')->withPivot('created_at');
    }

    public function order(){
        return $this->hasOne(Order::class,'pincode_id');
    }
}
