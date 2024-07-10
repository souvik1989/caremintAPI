<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Pincode;
use App\Models\Category;
use App\Models\Service;
use Carbon;
use App\Mail\RegistraionConfirmationMail;
use App\Mail\NewRegistraionMail;
use Illuminate\Support\Facades\Mail;

class ProviderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['users'] = User::where('role_id',3)->orderByDesc('created_at')->get();
        return view('admin.providers.list', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['pincodes'] = Pincode::orderByDesc('created_at')->get(); 
        $data['categories'] = Category::orderByDesc('created_at')->get();  
        $data['services'] = Service::orderByDesc('created_at')->get();  
        return view('admin.providers.create',$data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $values = $request->validate([
            "user_login" => 'required|string|max:255',
             'user_email' => 'required|string|email|unique:users,user_email',
             'user_phonenumber' => 'nullable|string|max:15',
             'user_address' =>'nullable|string|max:255',
            'user_pincode' => 'nullable|string|max:15',
             'user_pass' => 'required|string|min:6',
            'con_pass' => 'required|same:user_pass',
            'pincode_id'=>'nullable',
            'category_id'=>'nullable',
            'service_id'=>'nullable'
           
        ]);
        $user = new User();
        $user->fill($request->all());
        $user->display_name= $request->user_login;
        $user->role_id= 3;
        $user->save();
        $user->pincodes()->sync($request->pincode_id);
        $user->categories()->sync($request->category_id);
        $user->services()->sync($request->service_id);
        $mytime = Carbon\Carbon::now();
        $data = [
            'email' => $request->user_email,
            'password' => $request->user_pass,
            'date'=>$mytime->toDateTimeString(),

        ];
        Mail::to($request->user_email)->send(new RegistraionConfirmationMail($data));
        Mail::to( auth()->user()->email)->send(new NewRegistraionMail($data));
        return redirect()->route('provider.index')->with("success", "Record Saved successfully and email has been sent to Admin and Provider!");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        try
        {
             $data['user'] = User::find($id);  
             $data['pincodes'] = Pincode::orderByDesc('created_at')->get(); 
             $data['categories'] = Category::orderByDesc('created_at')->get(); 
             $data['services'] = Service::orderByDesc('created_at')->get();   
            return view('admin.providers.edit', $data);
        }
        catch(\Throwable $th)
        {
            abort(404);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $user=User::find($id);
        //dd($user);
        $values = $request->validate([
            "user_login" => 'nullable|string|max:255',
             'user_email' => 'required|email|unique:users,user_email,'. $user->id,
             'user_phonenumber' => 'nullable|string|max:15',
             'user_address' =>'nullable|string|max:255',
            'user_pincode' => 'nullable|string|max:15',
            'user_pass' => 'nullable|string|min:6',
            'con_pass' => 'nullable|same:user_pass',
           
        ]);
       
        $user->fill($request->all());
        $user->save();
        $user->pincodes()->sync($request->pincode_id);
        $user->categories()->sync($request->category_id);
        $user->services()->sync($request->service_id);
        $mytime = Carbon\Carbon::now();
        $data = [
            'email' => $request->user_email,
            'password' => $request->user_pass,
            'date'=>$mytime->toDateTimeString(),

        ];
        // Mail::to($request->user_email)->send(new RegistraionConfirmationMail($data));
        // Mail::to( auth()->user()->email)->send(new NewRegistraionMail($data));
        return redirect()->route('provider.index')->with("success", "Record Updated successfully!");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $user=User::find($id);
            $user->delete();
            return redirect()->route('provider.index')->with("success","Record Deleted successfully!");
       } catch (\Throwable $th) {
            abort(404);
       }
    }

    public function status($id)
    {
        try
        {
            $product = User::findOrFail($id);
            if ($product->user_status == '1')
            {
                $product->user_status = '0';
            }
            else
            {
                $product->user_status = '1';
            }
            $product->save();
            return redirect()->back()->with('success', __("Featured status updated successfully"));
        }
        catch(\Throwable $th)
        {
            abort(404);
        }

    }
}
