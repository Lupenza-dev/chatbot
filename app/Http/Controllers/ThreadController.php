<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MessageType;
use App\Models\Message;
use App\Models\MessageResponse;
use Auth;
use Str;

class ThreadController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $messages =Message::get();
        return view('threads.list',compact('messages'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $message_types =MessageType::get();
        return view('threads.add',compact('message_types'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $valid_data =$this->validate($request,[
            'title_eng'    =>'required',
            'title_sw'     =>'required',
            'step'         =>'required',
            'flag'         =>'required',
            'label'        =>'required',
            'message_type' =>'required'
        ]);

        $message =Message::create($valid_data +[
            'uuid' =>(string)Str::orderedUuid(),
            'created_by' =>Auth::user()->id,
            'back_status' =>$request->back_status ?? "No"
        ]);

        return response()->json([
            'success' =>true,
            'message' =>'Action done successfully'
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
    public function edit(string $uuid)
    {
        $message       =Message::where('uuid',$uuid)->first();
        $message_types =MessageType::get();
        return view('threads.edit',compact('message','message_types'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $valid_data =$this->validate($request,[
            'title_eng'    =>'required',
            'title_sw'     =>'required',
            'step'         =>'required',
            'flag'         =>'required',
            'label'        =>'required',
            'message_type' =>'required',
            'message_uuid' =>'required',
        ]);

        $message =Message::where('uuid',$valid_data['message_uuid'])->first();
        $message->title_eng     =$valid_data['title_eng'];
        $message->title_sw      =$valid_data['title_sw'];
        $message->step          =$valid_data['step'];
        $message->flag          =$valid_data['flag'];
        $message->label         =$valid_data['label'];
        $message->message_type  =$valid_data['message_type'];
        $message->back_status   =$request->back_status ?? "No";
        $message->save();

        return response()->json([
            'success' =>true,
            'message' =>'Action done successfully'
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        $uuid =$request->uuid;
        $thread =Message::where('uuid',$uuid)->first();
        $thread->responses()->delete();
        $thread->delete();

        return response()->json([
            'success' =>true,
            'message' =>'Action done successfully'
        ],200);
    }
}
