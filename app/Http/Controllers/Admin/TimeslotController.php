<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Timeslot;

class TimeslotController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['timeslots'] = Timeslot::orderByDesc('created_at')->get();
        return view('admin.timeslots.list', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
         return view('admin.timeslots.create');
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
            "slot"=>'required|string|max:255',
             
        ]);
        //dd($values);
        

        $slot = new Timeslot();
        $slot->slots=$request->slot;
        $slot->save();


        $notify[] = ['success', __('admin_messages.record.add')];
        return redirect()->route('timeslot.index')->with("success", "Record Updated successfully!");
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
    public function edit(Timeslot $timeslot)
    {
         $data['slot'] = $timeslot;
        return view('admin.timeslots.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Timeslot $timeslot)
    {
         $changed = false;
        $values = $request->validate([
            "slot"=>'required|string|max:255',
        ]);


        $timeslot->slots=$request->slot;
        if ($timeslot->isDirty()) {
            $timeslot->save();
            $changed = true;
        }


        if (! $changed) {
            $notify[] = ['warning', __('admin_messages.nochange')];
            return redirect()->route('timeslot.index')->with("warning", "No Changes Found!");
        }

        $notify[] = ['success', __('admin_messages.record.update')];
        return redirect()->route('timeslot.index')->with("success", "Record Updated successfully!");
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
