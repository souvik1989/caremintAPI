<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Task;
use App\Models\User;
use App\Models\Timeslot;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\File;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
use \finfo;
use Carbon\Carbon;

class TaskController extends Controller
{
    public function taskAssign(Request $request)
    {
       $convertedDate = null;
       $imageUrl='';
if (!empty($request->task_date)) {
    $inputDate = $request->task_date; // Replace with your input date
    $carbonDate = Carbon::createFromFormat('d/m/Y', $inputDate);
    $convertedDate = $carbonDate->format('Y-m-d');
}

        try {
           $values = Validator::make($request->all(), 
            [
                'name' => 'required|string|max:255',
                'description' => 'required|string',
                'task_date' => 'required',
                'image'=> 'nullable|image|max:5000',
                'vehicle_no'=>'nullable|string|max:255',
                'vehicle_model'=> 'nullable|string|max:255',
                'vehicle_brand'=>'nullable|string|max:255',
                'order_id'=>'nullable',
                'customer_id'=>'required',
                'washer_id'=>'required',
                
            ]);


            if($values->fails()){
                return response()->json([
                    'status' => false,
                    'message' =>'Validation error!',
                    'errors' => $values->errors()
                ], Response::HTTP_BAD_REQUEST);
            }

   if ($request->hasFile('image')) {
         $image = $request->file('image')->store('public/task');
         $imageUrl =url(Storage::url($image));
        }

        $task = new Task();
        $task->fill($request->except(['image']));
        $task->image=$imageUrl;
        $task->task_date=$convertedDate;
        $task->provider_id=auth()->user()->id;
        $task->save();


 return response()->json([
                'message' => 'Task Assigned Successfully!',
                'task' => $task,
               
            
               

            ], Response::HTTP_OK);

           
          
        }catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'reg_message' => $th->getMessage()
            ], Response::HTTP_BAD_REQUEST);
        }
   
}


public function getWasher(Request $request)
    {
        //dd('hi');
        try {
          
$washer=User::where('provider_id',auth()->user()->id)->orderBy('created_at', 'DESC')->get();


if (count($washer)== 0) {
    return response()->json(['message' => 'No Washerman Enlisted!'], 404);
}else{

           
            return response([
                
                'body' => $washer->load('provider'),
            ], Response::HTTP_OK);

        }
        } catch (\Throwable$th) {
            return response([
                'message' => $th->getMessage(),
            ], Response::HTTP_NOT_FOUND);
        }
    }
    
    public function getWasherTask(Request $request)
    {
        //dd('hi');
        try {
          
$task=Task::where('washer_id',auth()->user()->id)->orderBy('created_at', 'DESC')->get();


if (count($task)== 0) {
    return response()->json(['message' => 'No Task is Enlisted!'], 404);
}else{

           
            return response([
                
                'body' => $task,
            ], Response::HTTP_OK);

        }
        } catch (\Throwable$th) {
            return response([
                'message' => $th->getMessage(),
            ], Response::HTTP_NOT_FOUND);
        }
    }
    
     public function getWasherPendingTask(Request $request)
    {
        dd('hi');
        try {
          
$task=Task::where('washer_id',auth()->user()->id)->where('status','pending')->orderBy('created_at', 'DESC')->get();


if (count($task)== 0) {
    return response()->json(['message' => 'No Task is Enlisted!'], 404);
}else{

           
            return response([
                
                'body' => $task,
            ], Response::HTTP_OK);

        }
        } catch (\Throwable$th) {
            return response([
                'message' => $th->getMessage(),
            ], Response::HTTP_NOT_FOUND);
        }
    }
    
     public function getWasherCompleteTask(Request $request)
    {
        //dd('hi');
        try {
          
$task=Task::where('washer_id',auth()->user()->id)->where('status','done')->orderBy('created_at', 'DESC')->get();


if (count($task)== 0) {
    return response()->json(['message' => 'No Task is Enlisted!'], 404);
}else{

           
            return response([
                
                'body' => $task,
            ], Response::HTTP_OK);

        }
        } catch (\Throwable$th) {
            return response([
                'message' => $th->getMessage(),
            ], Response::HTTP_NOT_FOUND);
        }
    }
    
     public function taskStatus(Request $request,$id)
    {
        //dd('hi');
        try {
        $vdoUrl='';  $vdoUrl1='';  $vdoUrl2='';  $vdoUrl3='';  $vdoUrl4='' ;$vdoUrl5=''  ;  
$task=Task::where('id',$id)->where('washer_id',auth()->user()->id)->first();


if (!$task) {
    return response()->json(['message' => 'No Task is Enlisted!'], 404);
}else{
    
     $values = Validator::make($request->all(), 
            [
                'status' => 'required|string|max:255|in:pending,done,in_progress scheduled',
                'image'=> 'nullable|image|max:5000',
                'image1'=> 'nullable|image|max:5000',
                'image2'=> 'nullable|image|max:5000',
                'image3'=> 'nullable|image|max:5000',
                'image4'=> 'nullable|image|max:5000',
            ]);


            if($values->fails()){
                return response()->json([
                    'status' => false,
                    'message' =>'Validation error!',
                    'errors' => $values->errors()
                ], Response::HTTP_BAD_REQUEST);
            }
    $task->status=$request->status;
 if ($request->hasFile('image')) {
        // Delete the previous image if it exists
        if (!empty($task->image)) {
            Storage::delete($task->image);
        }

        // Store the new image and concatenate APP_URL to the image path
        $vdoPath = $request->file('image')->store('public/taskImage');
        $vdoUrl = 'public'.Storage::url($vdoPath);
        
    }
     if ($request->hasFile('image4')) {
        // Delete the previous image if it exists
        if (!empty($task->image4)) {
            Storage::delete($task->image4);
        }

        // Store the new image and concatenate APP_URL to the image path
        $vdoPath4 = $request->file('image4')->store('public/taskImage');
        $vdoUrl4 = 'public'.Storage::url($vdoPath4);
        
    }
     if ($request->hasFile('image1')) {
        // Delete the previous image if it exists
        if (!empty($task->image1)) {
            Storage::delete($task->image1);
        }

        // Store the new image and concatenate APP_URL to the image path
        $vdoPath1 = $request->file('image1')->store('public/taskImage');
        $vdoUrl1 = 'public'.Storage::url($vdoPath1);
        
    }
     if ($request->hasFile('image2')) {
        // Delete the previous image if it exists
        if (!empty($task->image2)) {
            Storage::delete($task->image2);
        }

        // Store the new image and concatenate APP_URL to the image path
        $vdoPath2 = $request->file('image2')->store('public/taskImage');
        $vdoUrl2 = 'public'.Storage::url($vdoPath2);
        
    }
     if ($request->hasFile('image3')) {
        // Delete the previous image if it exists
        if (!empty($task->image3)) {
            Storage::delete($task->image3);
        }

        // Store the new image and concatenate APP_URL to the image path
        $vdoPath3 = $request->file('image3')->store('public/taskImage');
        $vdoUrl3 = 'public'.Storage::url($vdoPath3);
        
    }
     if ($request->hasFile('image5')) {
        // Delete the previous image if it exists
        if (!empty($task->image5)) {
            Storage::delete($task->image5);
        }

        // Store the new image and concatenate APP_URL to the image path
        $vdoPath5 = $request->file('image5')->store('public/taskImage');
        $vdoUrl5 = 'public'.Storage::url($vdoPath5);
        
    }
    $task->image= $vdoUrl ;
     $task->image1= $vdoUrl1 ; $task->image2= $vdoUrl2 ;
      $task->image3= $vdoUrl3 ;
       $task->image4= $vdoUrl4 ;
       $task->image5= $vdoUrl5 ;
    $task->save();
           
            return response([
                'message' =>'Task status has been changed successfully!',
                'body' => $task,
            ], Response::HTTP_OK);

        }
        } catch (\Throwable$th) {
            return response([
                'message' => $th->getMessage(),
            ], Response::HTTP_NOT_FOUND);
        }
    }
}
