<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use Symfony\Component\HttpFoundation\Response;

class CustomerController extends Controller
{
    public function customerOrder(Request $request)
    {
        //dd('hi');
        try {
          
$order=Order::where('user_id',auth()->user()->id)->get();//dd($order);

if (count($order)== 0) {
    return response()->json(['message' => 'No Orders yet!'], 404);
}else{

           
            return response([
                
                'body' => $order
            ], Response::HTTP_OK);

        }
        } catch (\Throwable$th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }
}
