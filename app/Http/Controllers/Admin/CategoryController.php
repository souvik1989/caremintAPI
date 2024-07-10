<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Facades\Storage;
use Image;
use Illuminate\Http\File;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['categories'] = Category::orderByDesc('created_at')->get();
        return view('admin.categories.list', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.categories.create');
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
            "category_name" => 'required|string|max:100',
            "img" => 'nullable|image|max:5000',

        ]);

        // if (isset($values['img'])) {
        //     $values['img'] = Storage::putFile('public/category', new File($request->img));
        // }
        if ($request->hasFile('img')) {
        $imagePath = $request->file('img')->store('public/category');

        // Concatenate the APP_URL to the image path
        $imageUrl = config('app.url') . Storage::url($imagePath);
        $values['img'] = $imageUrl;
    }


        $category = new Category();
        $category->fill($values);
        $category->save();

        
        return redirect()->route('category.index')->with("success", "Record Saved successfully !");
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
             $data['category'] = Category::find($id);  
            return view('admin.categories.edit', $data);
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
        $category = Category::find($id);
        $changed = false;
        $values = $request->validate([
            "category_name" => 'required|string|max:100',
            "img" => 'nullable|image|max:5000',
        ]);

        // if (isset($values['img'])) {
        //     $values['img'] = Storage::putFile('public/category', new File($request->img));
        // }
        // if ($request->img) {
        //     if (!empty($category->img)) {
        //         Storage::delete($category->img);
        //     }

        //     $values['img'] = Storage::putFile('public/category', new File($request->img));
        // }
 if ($request->hasFile('img')) {
        // Delete the previous image if it exists
        if (!empty($category->img)) {
            Storage::delete($category->img);
        }

        // Store the new image and concatenate APP_URL to the image path
        $imagePath = $request->file('img')->store('public/category');
        $imageUrl = config('app.url') . Storage::url($imagePath);
        $values['img'] = $imageUrl;
    }
        $category->fill($values);
        if ($category->isDirty()) {
            $category->save();
            $changed = true;
        }
        if (!$changed) {
          
            return redirect()->route('category.index')->with("warning", "No changes found !");
        }



        
        return redirect()->route('category.index')->with("success", "Record Saved successfully !");
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
