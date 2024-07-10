<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Testimonial;
// use App\Models\HomeTitle;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\File;


class TestimonialController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['testimonials'] = Testimonial::orderBy('created_at', 'DESC')->paginate(15);
        //$data['homeTitle11'] = HomeTitle::select('title11')->first();

        return view('admin.testimonialSection.list', $data);
    }




        /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.testimonialSection.create');
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
            "name" => 'required|string|max:150',
            "img"=>'nullable|file|max:5000',
            "des"=>'required|string|max:5000',
             'video' => 'file|mimes:mp4|max:50000',
        ]);

        // if (isset($values['img'])) {
        //     $values['img'] = Storage::putFile('public/testimonial', new File($request->img));
        // }
        if ($request->hasFile('video'))
        {
           
            $vdoPath = $request->file('video')->store('public/vdo_testimonial');
            $values['video']  = config('app.url'). Storage::url($vdoPath);
        }
        
        
         if ($request->hasFile('img')) {
        $imagePath = $request->file('img')->store('public/testimonial');

        // Concatenate the APP_URL to the image path
        $imageUrl = config('app.url') . Storage::url($imagePath);
        $values['img'] = $imageUrl;
    }


        $testimonial = new Testimonial();
        $testimonial->fill($values);
        $testimonial->save();

        
        return redirect()->route('testimonial.index')->with("success", "Record Stored successfully!");
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Testimonial $testimonial)
    {
        $data['testimonial'] = $testimonial;
        return view('admin.testimonialSection.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Testimonial $testimonial)
    {
        $changed = false;
        $values = $request->validate([
            "name" => 'required|string|max:150',
            "img"=>'nullable|file|max:5000',
            "des"=>'required|string|max:5000',
             'video' => 'file|mimes:mp4|max:20000',
        ]);

if ($request->hasFile('img')) {
        // Delete the previous image if it exists
        if (!empty($testimonial->img)) {
            Storage::delete($testimonial->img);
        }

        // Store the new image and concatenate APP_URL to the image path
        $imagePath = $request->file('img')->store('public/testimonial');
        $imageUrl = config('app.url') . Storage::url($imagePath);
        $values['img'] = $imageUrl;
    }
    
    if ($request->hasFile('video')) {
        // Delete the previous image if it exists
        if (!empty($testimonial->video)) {
            Storage::delete($testimonial->video);
        }

        // Store the new image and concatenate APP_URL to the image path
        $vdoPath = $request->file('img')->store('public/vdo_testimonial');
        $vdoUrl = config('app.url') . Storage::url($vdoPath);
        $values['video'] = $vdoUrl;
    }

    $testimonial->fill($values);

        // if ($request->img) {
        //     if (!empty($testimonial->img)) {
        //         Storage::delete($testimonial->img);
        //     }

        //     $values['img'] = Storage::putFile('public/testimonial', new File($request->img));
        // }

        // $testimonial->fill($request->except('img'));
        // if (isset($values['img'])) {
        //     $testimonial->img = $values['img'];
        // }

        if ($testimonial->isDirty()) {
            $testimonial->save();
            $changed = true;
        }


        if (! $changed) {
            
            return redirect()->route('testimonial.index')->with("warning", "No Changes Found!");
        }

        //$notify[] = ['success', __('admin_messages.record.update')];
        return redirect()->route('testimonial.index')->with("success", "Record Updated successfully!");
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Testimonial $testimonial)
    {
        if (isset($testimonial)) {
            if (!empty($testimonial->image)) {
                Storage::delete($testimonial->image);
            }

            $testimonial->delete();
        }

       // $notify[] = ['success', __('admin_messages.record.delete')];
        return redirect()->route('testimonial.index')->with("success", "Record Deleted successfully!");
    }



    public function testimonialStatus(Testimonial $testimonial)
    {
        if ($testimonial->status == 'active') {
            $testimonial->status = 'inactive';
        } else {
            $testimonial->status = 'active';
        }

        $testimonial->save();

        $notify[] = ['success', $testimonial->name. ' ' . (($testimonial->status == 'inactive') ? __('admin_messages.disabled') : __('admin_messages.enabled'))];
        return redirect()->route('testimonial.index')->withNotify($notify);
    }









    // public function textUpdate(Request $request)
    // {
    //     $homeTitle = HomeTitle::first();

    //     $changed = false;
    //     $values = $request->validate([
    //         "title11" => 'required|string|max:200',
    //     ]);

    //     $homeTitle->fill($values);

    //     if ($homeTitle->isDirty()) {
    //         $homeTitle->save();
    //         $changed = true;
    //     }

    //     if (! $changed) {
    //         $notify[] = ['warning', __('admin_messages.nochange')];
    //         return redirect()->route('testimonial.index')->withNotify($notify);
    //     }

    //     $notify[] = ['success', __('admin_messages.record.update')];
    //     return redirect()->route('testimonial.index')->withNotify($notify);
    // }
}
