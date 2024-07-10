<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Pincode;
use App\Models\Category;
use App\Models\Service;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;

class ProviderController extends Controller
{
    public function getProvider(Request $request,$id,$pincode)
    {
    
        try {
          
$pincodes=Pincode::where('pincode',$pincode)->first();
if (empty($pincodes)) {
    return response()->json(['message' => 'Pincode not found'], 404);
}
          
$users=User::
join('category_user as uc', 'users.id', '=', 'uc.user_id')
->join('pincode_user as pu', 'users.id', '=', 'pu.user_id')
 //->where('service_user as su', 'users.id', '=', 'su.user_id')
 //->where('services as s', 's.id', '=', 'su.service_id')
->where('users.role_id', '=', 3)
->where('uc.category_id', '=', $id)
->where('pu.pincode_id', '=', $pincodes->id)
->get();
 //dd($users);
            
            if (empty($users)) {
                return response()->json(['message' => 'Result not found'], 404);
            }

           
            return response([
                
                
                
                'body' => $users
            ], Response::HTTP_OK);


        } catch (\Throwable$th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }
    
     public function getServices(Request $request,$id,$category)
    {
        //dd($id);
        try {
          
// $pincodes=Pincode::where('pincode',$pincode)->first();
// if (empty($pincodes)) {
//     return response()->json(['message' => 'Pincode not found'], 404);
// }
          
//$services=User::with('services')->find($id);
$services = User::with(['services' => function ($query) use ($category) {
    $query->where('category_id', $category);
}])->find($id);

            //dd($srvc);
            if (empty($services)) {
                return response()->json(['message' => 'Result not found'], 404);
            }

           
            return response([
                
                
                
                'body' => $services
            ], Response::HTTP_OK);


        } catch (\Throwable$th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }

    public function searchProvider(Request $request)
    {
        //dd($request->all());
        try {
          
$pincodes=Pincode::where('pincode', 'like', '%' . $request->pincode . '%')->first();
//dd($pincodes->id);
$categories=Category::where('id', 'like', '%' . $request->cat_id . '%')->first();
//dd($categories->id);
if (empty($pincodes) || empty($categories)) {
    return response()->json(['message' => 'Please Check the inputs!'], 404);
}


          
$users=User::with('services')
->join('category_user as uc', 'users.id', '=', 'uc.user_id')
->join('pincode_user as pu', 'users.id', '=', 'pu.user_id')
->where('users.role_id', '=', 3)
->where('uc.category_id', '=', $categories->id)
->where('pu.pincode_id', '=', $pincodes->id)
->get();
//dd($users); 
            
            if (empty($users)) {
                return response()->json(['message' => 'Result not found'], 404);
            }

           
            return response([
                
                
                
                'body' => $users
            ], Response::HTTP_OK);


        } catch (\Throwable$th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }
    
    public function getProviderList(Request $request,$id)
    {
        //dd($id);
        try {
          

$category = Category::with('users')->find($id);

            //dd($category);
            if (empty($category)) {
                return response()->json(['message' => 'Result not found'], 404);
            }

           
            return response([
                
                
                
                'body' => $category
            ], Response::HTTP_OK);


        } catch (\Throwable$th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }
public function searchCustomer(Request $request)
    {
        //dd($id);
        try {
            $values = Validator::make($request->all(), 
            [
                'email' => 'nullable|string|max:255',
                
            ]);


            if($values->fails()){
                return response()->json([
                    'status' => false,
                    'message' =>'Validation error!',
                    'errors' => $values->errors()
                ], Response::HTTP_BAD_REQUEST);
            }

$user = User::where('user_email',$request->email)->Where('role_id',2)->first();

           // dd($user);
            if (empty($user)) {
                return response()->json(['message' => 'Result not found'], 404);
            }

           
            return response([
                
                
                
                'body' => $user
            ], Response::HTTP_OK);


        } catch (\Throwable$th) {
            return response([
                'message' => $th->getMessage(),
            ], Response::HTTP_NOT_FOUND);
        }
    }
}
