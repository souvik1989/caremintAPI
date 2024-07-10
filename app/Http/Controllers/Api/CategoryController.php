<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\User;
use Symfony\Component\HttpFoundation\Response;

class CategoryController extends Controller
{
    public function getCategory(Request $request)
    {
        try {
           


            $categories = Category::orderBy('id')->get();

          

           
            return response([
                
                
                
                'body' => $categories
            ], Response::HTTP_OK);


        } catch (\Throwable$th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }


    public function getProviderCategory(Request $request)
    {
        try {
        

          $user=User::with('categories')->where('id', auth()->user()->id)->get();
          //$categories=$user->categories;
//dd($user);
           
            return response([
                
                'body' => $user
            ], Response::HTTP_OK);


        } catch (\Throwable$th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }


}
