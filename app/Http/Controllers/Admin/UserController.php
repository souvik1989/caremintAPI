<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Carbon;
class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['users'] = User::where('role_id',2)->orderByDesc('created_at')->get();
        //dd( $data['users']);
        return view('admin.users.list', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
            return view('admin.users.edit', $data);
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
    public function update(Request $request, $id)
    {
        $user=User::find($id);
        //dd($user);
        $values = $request->validate([
            "user_login" => 'nullable|string|max:255',
             'user_email' => 'required|email|unique:users,user_email,'. $user->id,
             'user_phonenumber' => 'nullable|string|max:15',
             'user_address' =>'nullable|string|max:255',
            'user_pincode' => 'nullable|string|max:15',
           
           
        ]);
       
        $user->fill($request->all());
        $user->save();
        $mytime = Carbon\Carbon::now();
        $data = [
            'email' => $request->user_email,
            'password' => $request->user_pass,
            'date'=>$mytime->toDateTimeString(),

        ];
        // Mail::to($request->user_email)->send(new RegistraionConfirmationMail($data));
        // Mail::to( auth()->user()->email)->send(new NewRegistraionMail($data));
        return redirect()->route('user.index')->with("success", "Record Updated successfully!");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        
            $user=User::find($id);
            $user->delete();
            return redirect()->route('user.index')->with("success","Record Deleted successfully!");
       
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
            return redirect()->back()->with('success',"Featured status updated successfully");
        }
        catch(\Throwable $th)
        {
            abort(404);
        }

    }
}
