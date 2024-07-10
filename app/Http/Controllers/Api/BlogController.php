<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Blog;
use App\Models\Testimonial;
use Symfony\Component\HttpFoundation\Response;

class BlogController extends Controller
{
    public function getBlogs(Request $request)
    {
        //dd('hi');
        try {
          
$blog=Blog::orderByDesc('created_at')->get();


if (count($blog)== 0) {
    return response()->json(['message' => 'No Blogs is there!'], 404);
}else{

           
            return response([
                
                'body' => $blog
            ], Response::HTTP_OK);

        }
        } catch (\Throwable$th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }


    public function getTestimonials(Request $request)
    {
        //dd('hi');
        try {
          
$testimonial=Testimonial::orderByDesc('created_at')->get();


if (count($testimonial)== 0) {
    return response()->json(['message' => 'No testimonials is there!'], 404);
}else{

           
            return response([
                
                'body' => $testimonial
            ], Response::HTTP_OK);

        }
        } catch (\Throwable$th) {
            return response([
                'message' => 'Record not found!',
            ], Response::HTTP_NOT_FOUND);
        }
    }
}
