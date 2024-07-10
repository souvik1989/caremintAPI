<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Service;
use Illuminate\Support\Facades\Storage;
use Image;
use Illuminate\Http\File;

class ServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['services'] = Service::orderByDesc('created_at')->get();
        return view('admin.services.list', $data);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.services.create');
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
            "name" => 'required|string|max:100',
            "img" => 'nullable|image|max:5000',
            "description"=>"nullable|string|max:1000",
            "price"=>'nullable|string|max:5000',
        ]);

        if (isset($values['img'])) {
            $values['img'] = Storage::putFile('public/service', new File($request->img));
        }

        $service = new Service();
        $service->fill($values);
        $service->save();

        
        return redirect()->route('service.index')->with("success", "Record Saved successfully !");
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
             $data['service'] = Service::find($id);  
            return view('admin.services.edit', $data);
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
        $service = Service::find($id);
        $changed = false;
        $values = $request->validate([
            "name" => 'required|string|max:100',
            "img" => 'nullable|image|max:5000',
            "description"=>"nullable|string|max:1000",
            "price"=>'nullable|string|max:5000',
        ]);

        if (isset($values['img'])) {
            $values['img'] = Storage::putFile('public/service', new File($request->img));
        }
        if ($request->img) {
            if (!empty($service->img)) {
                Storage::delete($service->img);
            }

            $values['img'] = Storage::putFile('public/service', new File($request->img));
        }

        $service->fill($values);
        if ($service->isDirty()) {
            $service->save();
            $changed = true;
        }
        if (!$changed) {
          
            return redirect()->route('service.index')->with("warning", "No changes found !");
        }



        
        return redirect()->route('service.index')->with("success", "Record Saved successfully !");
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
