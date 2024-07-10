<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Carbon;
use App\Mail\RegistraionConfirmationMail;
use App\Mail\NewRegistraionMail;
use Illuminate\Support\Facades\Mail;

class AuthenticationController extends Controller
{
    public function userRegister(Request $request)
    {
        $convertedDate=null;
        if(!empty($request->dob)){$inputDate = $request->dob; // Replace with your input date
$carbonDate = Carbon::createFromFormat('d/m/Y', $inputDate);
$convertedDate = $carbonDate->format('Y-m-d');}
//dd($convertedDate);
        try {
           $values = Validator::make($request->all(), 
            [
                'user_firstname' => 'nullable|string|max:255',
                'user_email' => 'required|string|email|unique:users,user_email',
                'user_pass' => 'required|string|min:6',
                // 'password_confirm'=> 'required|same:user_pass',
                'user_phonenumber'=> 'nullable|string|max:15',
                'user_address'=>'nullable|string|max:255',
                'user_pincode'=> 'nullable|string|max:15',
                'dob'=>'nullable',
                
            ]);


            if($values->fails()){
                return response()->json([
                    'status' => false,
                    'message' =>'Validation error!',
                    'errors' => $values->errors()
                ], Response::HTTP_BAD_REQUEST);
            }


          
            

            //---- start for referral code ----//
           
            //------ end for referral code ------//


            //--------------------------------------- start for User -----------------------------//
           
            $user = new User();
             $user->dob=$convertedDate;
            $user->fill($request->all());
            $user->role_id = 2;
    
            
            

            // if(!empty($request->notification_token))
            // {
            //     $user->notification_token = $request->notification_token;
            // }
            
            
            $user->save();
            //------------------------------------------ end for User ---------------------------------//

            //------------------------------- start for AddressLine -----------------------------------//
           
            //---------------------------------- end for AddressLine -----------------------------//

            $token=$user->createToken('myToken')->plainTextToken;
           

            return response()->json([
                'message' => 'User Registered Successfully!',
                'user' => $user,
                'token' => $token,
            
               

            ], Response::HTTP_OK);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'reg_message' => $th->getMessage()
            ], Response::HTTP_BAD_REQUEST);
        }
    }

    
    
    
    
    
    
    
    
    public function userSignin(Request $request)
    {
        
        $attr = $request->validate([
            'email' => 'required|string',
            'password' => 'required|string|min:6',
        ]);


        $user=User::where('user_email', $attr['email']) ->first();
      //dd($user);
         if (!empty($user) AND ($user->role_id == 4)) {
            return response()->json([
                    'status' => false,
                    'message' =>'Unauthorized',
                ], Response::HTTP_UNAUTHORIZED); //401
        }
        if (!empty($user) AND ($user->user_status != 1)) {
            return response()->json([
                    'status' => false,
                    'message' =>'Unauthorized',
                ], Response::HTTP_UNAUTHORIZED); //401
        }

 
        if (!$user||!Hash::check($attr['password'],$user->user_pass)) {
            //return $this->errors('Credentials not match', 401);
            return response()->json([
                    'status' => false,
                    'message' => 'Please enter correct password!',
                ], Response::HTTP_UNAUTHORIZED); //401

        }
        //dd($user);
        if(!empty($request->notification_token))
        {
            $user->notification_token = $request->notification_token;
            $user->save();
        }
        
        
        $token=$user->createToken('API Token')->plainTextToken;
        
      
        return response([
            'message'=>'Success!',
            'user'=>$user,
            'token'=>$token,
          //should be otp not dummy when production
          
          ],Response::HTTP_OK);
    }


    // public function userSignout()
    // {
    //     auth()->user()->tokens()->delete();
    //     return response([
    //         'message'=>'Logged Out!'
    //     ],Response::HTTP_OK);
    // }
    
    public function userSignout()
{
    try {
        auth()->user()->tokens()->delete();
        return response([
            'message' => 'Logged Out!'
        ], Response::HTTP_OK);
    } catch (\Exception $e) {
        return response([
            'message' => 'Logout failed',
            'error' => $e->getMessage(), // Include the error message for debugging
        ], Response::HTTP_INTERNAL_SERVER_ERROR);
    }
}
     public function remove()
{
    try {
        
        $user = User::find( auth()->user()->id);
        $user->delete();
        auth()->user()->tokens()->delete();
        return response([
            'message' => 'Account is removed!'
        ], Response::HTTP_OK);
    } catch (\Exception $e) {
        return response([
            'message' => 'Failed',
            'error' => $e->getMessage(), // Include the error message for debugging
        ], Response::HTTP_INTERNAL_SERVER_ERROR);
    }
}
    public function washerReg(Request $request)
{
    //dd($request->all());
    try {
           $values = Validator::make($request->all(), 
            [
                'user_firstname' => 'nullable|string|max:255',
                'user_email' => 'required|string|email|unique:users,user_email',
                'user_pass' => 'required|string|min:6',
                // 'password_confirm'=> 'required|same:user_pass',
                'user_phonenumber'=> 'nullable|string|max:15',
                'user_address'=>'nullable|string|max:255',
                'user_pincode'=> 'nullable|string|max:15',
              'category_id'=>'nullable',
            'service_id'=>'nullable',
              "user_login" => 'nullable|string|max:255',
                
            ]);


            if($values->fails()){
                return response()->json([
                    'status' => false,
                    'message' =>'Validation error!',
                    'errors' => $values->errors()
                ], Response::HTTP_BAD_REQUEST);
            }


          
            

            //---- start for referral code ----//
           
            //------ end for referral code ------//


            //--------------------------------------- start for User -----------------------------//
           
            $user = new User();
            $user->display_name= $request->user_login;
            $user->provider_id= auth()->user()->id;
            $user->fill($request->all());
            $user->role_id = 4;
    
            
       
       
            
            $user->save();
            $user->categories()->sync($request->category_id);
            $user->services()->sync($request->service_id);
             $mytime = Carbon\Carbon::now();
        $data = [
            'email' => $request->user_email,
            'password' => $request->user_pass,
            'date'=>$mytime->toDateTimeString(),

        ];
        //Mail::to($request->user_email)->send(new RegistraionConfirmationMail($data));
        //Mail::to(auth()->user()->email)->send(new NewRegistraionMail($data));

            $token=$user->createToken('myToken')->plainTextToken;
           

            return response()->json([
                'message' => 'User Registered Successfully!',
                'user' => $user->load('categories', 'services'),
                'token' => $token,
            
               

            ], Response::HTTP_OK);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'reg_message' => $th->getMessage()
            ], Response::HTTP_BAD_REQUEST);
        }
} 


//  public function washerSignin(Request $request)
//     {
        
//         $attr = $request->validate([
//             'email' => 'required|string',
//             'password' => 'required|string|min:6',
//         ]);


//         $user=User::where('user_email', $attr['email']) ->first();
//       //dd($user);
      
//         if (!empty($user) AND ($user->role_id != 4)) {
//             return response()->json([
//                     'status' => false,
//                     'message' =>'Unauthorized',
//                 ], Response::HTTP_UNAUTHORIZED); //401
//         }
//         if (!empty($user) AND ($user->user_status != 1)) {
//             return response()->json([
//                     'status' => false,
//                     'message' =>'Unauthorized',
//                 ], Response::HTTP_UNAUTHORIZED); //401
//         }

 
//         if (!$user||!Hash::check($attr['password'],$user->user_pass)) {
//             //return $this->errors('Credentials not match', 401);
//             return response()->json([
//                     'status' => false,
//                     'message' => 'success',
//                 ], Response::HTTP_UNAUTHORIZED); //401

//         }
//         if(!empty($request->notification_token))
//         {
//             $user->notification_token = $request->notification_token;
//             $user->save();
//         }
        
        
//         $token=$user->createToken('API Token')->plainTextToken;
        
      
//         return response([
//             'message'=>'Success!',
//             'user'=>$user->load('categories', 'services'),
//             'token'=>$token,
//           //should be otp not dummy when production
          
//           ],Response::HTTP_OK);
//     }
}
