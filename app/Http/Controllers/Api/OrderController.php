<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Timeslot;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\File;
use Symfony\Component\HttpFoundation\Response;
use \finfo;

class OrderController extends Controller
{
    public function getOrders(Request $request)
    {
        //dd('hi');
        try {
          
$order=Order::where('provider_id',auth()->user()->id)->orderBy('created_at', 'DESC')->get();


if (count($order)== 0) {
    return response()->json(['message' => 'No Orders!'], 404);
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

public function getUserOrders(Request $request)
    {
        //dd('hi');
        try {
          
$order=Order::where('user_id',auth()->user()->id)->orderBy('created_at', 'DESC')->get();


if (count($order)== 0) {
    return response()->json(['message' => 'No Orders!'], 404);
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

    public function getPendingOrders(Request $request)
    {
        //dd('hi');
        try {
          
$order=Order::where('provider_id',auth()->user()->id)->where('order_status','accepted')->get();


if (count($order)== 0) {
    return response()->json(['message' => 'No Pending Orders!'], 404);
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

    public function getCompletedOrders(Request $request)
    {
        //dd('hi');
        try {
          
$order=Order::where('provider_id',auth()->user()->id)->where('order_status','completed')->get();


if (count($order)== 0) {
    return response()->json(['message' => 'No Completed Orders!'], 404);
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



    public function getNullOrders(Request $request)
    {
        //dd('hi');
        try {
          
$order=Order::where('provider_id',auth()->user()->id)->where('order_status',null)->get();


if (count($order)== 0) {
    return response()->json(['message' => 'No Orders!'], 404);
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

    public function orderStatus(Request $request,$id)
    {
        //dd($request->all());
        try {
          
$order=Order::find($id);
//dd($order);
$order->order_status='completed';
$order->description=$request->description;


if ($request->hasFile('image')) {
    $images = $request->image;
    //$extensions = $images->getClientOriginalExtension();
    $filenames = $images->getClientOriginalName();
    //$names = $images->getClientOriginalName();
    //dd($names);
    $storage_folder = 'public/orderStatus/';
    $images->storeAs($storage_folder, $filenames,'public');
    $order->image = $filenames;
}
$order->save();


           
            return response([
                'message' => 'Order status changed successfully!',
                'body' => $order
            ], Response::HTTP_OK);

        
        } catch (\Throwable$th) {
            return response([
                'message' => $th->getMessage(),
            ], Response::HTTP_NOT_FOUND);
        }
    }
    
    
    
    public function getCancelledOrders(Request $request)
    {
        //dd('hi');
        try {
          
$order=Order::where('provider_id',auth()->user()->id)->where('order_status','cancelled')->get();


if (count($order)== 0) {
    return response()->json(['message' => 'No Cancelled Orders!'], 404);
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




    public function orderAccept(Request $request,$id)
    {
        //dd('hi');
        try {
          
$order=Order::find($id);


if (empty($order)) {
    return response()->json(['message' => 'No Such Orders!'], 404);
}else{

           if($order->order_status==null){
            $order->order_status='accepted';
            $order->save();
           }else{
            return response()->json(['message' => 'The order is already accepted/rejected!'], 404);
           }
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


    public function orderStatusCancel(Request $request,$id)
    {
        //dd('hi');
        try {
          
$order=Order::find($id);
//dd($order);
$order->order_status='cancelled';
$order->save();


           
            return response([
                'message' => 'Order status changed successfully!',
                'body' => $order
            ], Response::HTTP_OK);

        
        } catch (\Throwable$th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }
public function timeslot(Request $request)
    {
        //dd('hi');
        try {
          
$timeslot=Timeslot::orderBy('created_at', 'ASC')->get();


if (count($timeslot)== 0) {
    return response()->json(['message' => 'No Timeslots!'], 404);
}else{

           
            return response([
                
                'body' => $timeslot
            ], Response::HTTP_OK);

        }
        } catch (\Throwable$th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }
    
    public function postReview(Request $request)
    {
       // dd($request->all());
        try {
          

$orders=Order::where('user_id',auth()->user()->id)->get();
$orderExists = $orders->contains('id', $request->order_id);

if (!$orderExists) {
    return response()->json(['message' => 'No such order!'], 404);
}else{
    $new_order=Order::find($request->order_id);
}
if($new_order->order_status=='completed'){
    if($new_order->review == null){
$new_order->review=$request->review;
$new_order->rating=$request->rating;
$new_order->save();
           
            return response([
                 'message' => 'Review is posted successfully!',
                'body' => $new_order
            ], Response::HTTP_OK);
}else{
    return response([
                 'message' => 'Already Reviewed!',
                
            ], Response::HTTP_OK);
}
}else{
      return response([
                 'message' => 'Order is in progress!',
               
            ], Response::HTTP_OK);
}
        } catch (\Throwable $th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }
 public function getReview(Request $request)
    {
       // dd($request->all());
        try {
         $reviews = Order::select('orders.review', 'orders.rating', 'users.user_login','users.photo')
                ->join('users', 'orders.user_id', '=', 'users.id')
                ->whereNotNull('orders.review') // Only get orders with a review
                ->whereNotNull('orders.rating') // Only get orders with a rating
                ->where('orders.order_status', 'completed')
                ->get();
                //dd($reviews);
                 return response([
                 'message' => 'Review is posted successfully!',
                'body' => $reviews
            ], Response::HTTP_OK);
        } catch (\Throwable $th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }


}
