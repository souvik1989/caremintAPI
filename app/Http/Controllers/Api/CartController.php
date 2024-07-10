<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Cart;
use App\Models\User;
use App\Models\Service;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Carbon;

class CartController extends Controller
{
//     public function addToCart(Request $request,$id)
//     {
//         //dd('hi');
//         try {
//             $data = [];
//             $values = Validator::make($request->all(), 
//             [
//                 'address' => 'nullable|string|max:255',
//                 'state' => 'nullable|string|max:255',
//                 'city' => 'nullable|string|max:255',
//                  'zip'=> 'nullable|integer|max:255',
//                 'provider_id'=> 'required',
//                 'payment_mode'=>'nullable|string|max:255',
//                 'time'=> 'nullable|date_format:H:i',
//                 'due_date'=>'nullable|date'
                
//             ]);

//             if($values->fails()){
//                 return response()->json([
//                     'status' => false,
//                     'message' =>'Validation error!',
//                     'errors' => $values->errors()
//                 ], Response::HTTP_BAD_REQUEST);
//             }
// $service=Service::find($id);


// if (empty($service)) {
//     return response()->json(['message' => 'No Service!'], 404);
// }else{


//     $cart = new Cart();
    
//             $cart->fill($request->all());
          
//             $cart->service_id = $service->id;
//             $cart->user_id = auth()->user()->id;
            
//             $cart->save();
//             //dd('hi');
//             array_push($data, [
//                 'cart' => $cart,
//                 'service'=>$service,
//                 'user'=>auth()->user(),

//             ]);
           
//             return response([
                
//                 'body' => $data,
                

//             ], Response::HTTP_OK);

//         }
//         } catch (\Throwable$th) {
//             return response([
//                 'message' => 'Record not found!',
//             ], Response::HTTP_NOT_FOUND);
//         }
//     }

 public function addToCart(Request $request,$id)
    {
       // dd($request->all());
        try {
            $data = [];
            $values = Validator::make($request->all(), 
            [
                'address' => 'nullable|string|max:255',
                //'state' => 'nullable|string|max:255',
                //'city' => 'nullable|string|max:255',
                 'pincode'=> 'nullable|string|max:255',
                'provider_id'=> 'required',
                'description'=>'nullable|string|max:255',
                'order_price'=>'nullable',
                //'order_time'=> 'nullable|date_format:H:i',
                'delivery_date'=>'nullable',
                'name' => 'nullable|string|max:255',
                'mobile_number' => 'nullable|string|max:255',
                 'vehicle_brand'=>'nullable|string|max:255',
                  'vehicle_model'=>'nullable|string|max:255',
                   'vehicle_no'=>'nullable|string|max:255',
                   
                 'timeslot_id'=>'nullable',
                
            ]);

            if($values->fails()){
                return response()->json([
                    'status' => false,
                    'message' =>'Validation error!',
                    'errors' => $values->errors()
                ], Response::HTTP_BAD_REQUEST);
            }
$service=Service::find($id);
$pincodeExists = false;
$provider=User::find($request->provider_id);

if($provider ==null  || $provider->role_id !== "3"){
    
     return response()->json(['message' => 'Provider not available!'], 404);
}
foreach ($provider->pincodes as $pincodeData) {
    if ($pincodeData['pincode'] === $request->pincode) {
        $pincodeExists = true;
        break;
    }
}
if (!$pincodeExists) {
    return response()->json(['message' => 'Service not available!'], 404);
}

if (empty($service)) {
    return response()->json(['message' => 'Give Proper Inputs'], 404);
}else{


    $order = new Order();
    // dd($request->all());
     $date = Carbon::createFromFormat('m/d/Y', $request->delivery_date)->format('Y-m-d');
            
           $order->fill($request->all()); 
          $order->timeslot()
            ->associate($request->timeslot_id);
            $order->user_id = auth()->user()->id;
            $order->order_date = now()->toDateString();
            $order->order_time = now()->format('H:i:s');
             $order->order_price = $service->price;
            $order->delivery_date =$date;
           //dd($request->all());
           
            $order->save();
          
            array_push($data, [
                'Order' => $order,
                'service'=>$service,
                'user'=>auth()->user(),

            ]);
           
            return response([
                
                'body' => $data,
                

            ], Response::HTTP_OK);

        }
        } catch (\Throwable$th) {
            return response([
                'message' =>  $th->getMessage(),
            ], Response::HTTP_NOT_FOUND);
        }
    }


    public function listCart(Request $request,$id)
    {
        //dd('hi');
        try {
          
$cart=Cart::where('user_id',auth()->user()->id)->where('item_status','pending')->get();


if (count($cart)== 0) {
    return response()->json(['message' => 'Cart is empty!'], 404);
}else{

           
            return response([
                
                'body' => $cart
            ], Response::HTTP_OK);

        }
        } catch (\Throwable$th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }

}
