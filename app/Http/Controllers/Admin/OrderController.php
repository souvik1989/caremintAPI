<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\File;
class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['orders'] = Order::orderByDesc('created_at')->get();
        return view('admin.orders.list', $data);
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
    public function edit( Order $order)
    {
        try
        {
             $data['order'] = $order;
            
            
            return view('admin.orders.edit', $data);
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
    public function update(Request $request,Order $order)
    {
        $changed = false;
        $values = $request->validate([
            "order_status" => 'nullable',
            "image"=>'nullable|file|max:5000',
            "description"=>'nullable|string|max:5000',
        ]);


        if ($request->image) {
            if (!empty($order->image)) {
                Storage::delete($order->image);
            }

            $values['image'] = Storage::putFile('public/order', new File($request->image));
        }

        $order->description=$values['description'];
        $order->order_status=$values['order_status'];
        if (isset($values['image'])) {
            $order->image = $values['image'];
        }

        if ($order->isDirty()) {
            $order->save();
            $changed = true;
        }


        if (! $changed) {
            
            return redirect()->route('order.index')->with("warning", "No Changes Found!");
        }

        //$notify[] = ['success', __('admin_messages.record.update')];
        return redirect()->route('order.index')->with("success", "Record Updated successfully!");
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
    public function status(Request $request)
    {
        //dd($request->all());
        //dd($request->all());
        try {
            $order = Order::find($request->id);
            $order->order_status = $request->order_status;
            $order->save();
            
            
            return response()->json([
                'status' => Response::HTTP_OK,
                'message' => 'Payment status is changed ',
            ], Response::HTTP_OK);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => Response::HTTP_NOT_FOUND,
                'message' => $th->getMessage(),
            ], Response::HTTP_NOT_FOUND);
        }

    }
}
