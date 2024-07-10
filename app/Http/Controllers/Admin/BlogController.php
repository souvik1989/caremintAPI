<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Blog;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\File;

class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['blogs'] = Blog::orderBy('created_at', 'DESC')->get();
        //$data['homeTitle11'] = HomeTitle::select('title11')->first();

        return view('admin.blogs.list', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.blogs.create');
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
            "title" => 'required|string|max:150',
            "img"=>'nullable|file|max:5000',
            "des"=>'nullable|string|max:5000',
            "read_title" => 'nullable|string|max:150',
            "author" => 'nullable|string|max:150',
        ]);

        if (isset($values['img'])) {
            $values['img'] = Storage::putFile('public/blog', new File($request->img));
        }

        $blog = new Blog();
        $blog->fill($values);
        $blog->save();

        
        return redirect()->route('blog.index')->with("success", "Record Stored successfully!");
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
    public function edit(Blog $blog)
    {
        $data['blog'] = $blog;
        return view('admin.testimonialSection.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Blog $blog)
    {
        $changed = false;
        $values = $request->validate([
            "title" => 'required|string|max:150',
            "img"=>'nullable|file|max:5000',
            "des"=>'nullable|string|max:5000',
            "read_title" => 'nullable|string|max:150',
            "author" => 'nullable|string|max:150',
        ]);


        if ($request->img) {
            if (!empty($blog->img)) {
                Storage::delete($blog->img);
            }

            $values['img'] = Storage::putFile('public/blog', new File($request->img));
        }

        $blog->fill($request->except('img'));
        if (isset($values['img'])) {
            $blog->img = $values['img'];
        }

        if ($blog->isDirty()) {
            $blog->save();
            $changed = true;
        }


        if (! $changed) {
            
            return redirect()->route('blog.index')->with("warning", "No Changes Found!");
        }

        //$notify[] = ['success', __('admin_messages.record.update')];
        return redirect()->route('blog.index')->with("success", "Record Updated successfully!");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Blog $blog)
    {
        if (isset($blog)) {
            if (!empty($blog->img)) {
                Storage::delete($blog->img);
            }

            $blog->delete();
        }

       // $notify[] = ['success', __('admin_messages.record.delete')];
        return redirect()->route('blog.index')->with("success", "Record Deleted successfully!");
    }
}
