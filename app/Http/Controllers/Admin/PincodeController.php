<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Pincode;

class PincodeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['pincodes'] = Pincode::orderByDesc('created_at')->get();
        return view('admin.pincodes.list', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
         return view('admin.pincodes.create');
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
            "pincode"=>'required|integer',
             
        ]);
        //dd($values);
        

        $pincode = new Pincode();
        $pincode->pincode=$request->pincode;
        $pincode->save();


        $notify[] = ['success', __('admin_messages.record.add')];
        return redirect()->route('pincode.index')->with("success", "Record Updated successfully!");
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
    public function edit(Pincode $pincode)
    {
         $data['pincode'] = $pincode;
        return view('admin.pincodes.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Pincode $pincode)
    {
         $changed = false;
        $values = $request->validate([
            "pincode"=>'required|integer',
        ]);


        $pincode->pincode=$request->pincode;
        if ($pincode->isDirty()) {
            $pincode->save();
            $changed = true;
        }


        if (! $changed) {
            $notify[] = ['warning', __('admin_messages.nochange')];
            return redirect()->route('pincode.index')->with("warning", "No Changes Found!");
        }

        $notify[] = ['success', __('admin_messages.record.update')];
        return redirect()->route('pincode.index')->with("success", "Record Updated successfully!");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
