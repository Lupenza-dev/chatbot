<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Message;
use App\Models\MessageResponse;
use Auth;
use Str;

class ResponseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $uuid =$request->uuid;
        $message =Message::where('uuid',$uuid)->first();
        $responses =MessageResponse::where('message_id',$message->id)->get();
        return view('threads.responses',compact('responses','message'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
       $valid_data =$this->validate($request,[
        'name_eng'  =>'required',
        'name_sw'   =>'required',
        'order_no'  =>'required',
        'message_id' =>'required', 
       ]);

       $response =MessageResponse::create($valid_data + [
        'uuid' =>(string)Str::orderedUuid(),
        'created_by' =>Auth::user()->id
       ]);

       return response()->json([
        'success' =>true,
        'message' =>"Action done successfully"
       ],200);


    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $valid_data =$this->validate($request,[
            'name_eng'  =>'required',
            'name_sw'   =>'required',
            'order_no'  =>'required',
            'response_uuid' =>'required', 
           ]);

           $response =MessageResponse::where('uuid',$valid_data['response_uuid'])->first();
           $response->name_eng =$valid_data['name_eng'];
           $response->name_sw =$valid_data['name_sw'];
           $response->order_no =$valid_data['order_no'];
           $response->save();

           return response()->json([
            'success' =>true,
            'message' =>"Action done successfully"
           ],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        $uuid =$request->uuid;
        $thread =MessageResponse::where('uuid',$uuid)->delete();
        return response()->json([
            'success' =>true,
            'message' =>'Action done successfully'
        ],200);
    }
}
