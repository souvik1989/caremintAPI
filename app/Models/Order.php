<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
class Order extends Model
{
    use HasFactory;
    protected $fillable = [
        
        'address',
        'name',
        'pincode',
       'provider_id',
       //'delivery_date',
       'description',
       'name',
       'mobile_number',
       'order_price',
       'vehicle_brand',
                  'vehicle_model',
                   'vehicle_no',
    ];

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }

    public function provider(){
        return $this->belongsTo(User::class,'provider_id');
    }

    public function pincode(){
        return $this->belongsTo(Pincode::class);
    }
    public function service(){
        return $this->belongsTo(Service::class,'service_id');
    }
    
     public function timeslot(){
        return $this->belongsTo(Timeslot::class,'timeslot_id');
    }
      public function getImageAttribute($values)
    {
        if (Str::contains(Request()->route()->getPrefix(), 'api') AND !empty($values)) {
        
            return asset('storage/orderStatus/'.$values);
        }

        return $values;
    }    
}
