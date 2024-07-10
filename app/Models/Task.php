<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;
    
     protected $fillable = [
        
        
        'name',
        
       'provider_id',
       'washer_id',
       'customer_id',
       'task_date',
       'description',
    'order_id',
      'image',
      'image1','image2',
      'image3','image4','image5',
      'status',
       'vehicle_brand',
                  'vehicle_model',
                   'vehicle_no',
    ];
    
        public function user(){
        return $this->belongsTo(User::class,'customer_id');
    }

    public function provider(){
        return $this->belongsTo(User::class,'provider_id');
    }
    
    public function washer(){
        return $this->belongsTo(User::class,'washer_id');
    }

}
