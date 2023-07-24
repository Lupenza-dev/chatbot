<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ThreadType;
use App\Models\Thread;
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
        $threads =Thread::get();
        return view('threads.list',compact('threads'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $thread_types =ThreadType::get();
        return view('threads.add',compact('thread_types'));
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
            'label_sw'     =>'required',
            'thread_type'  =>'required'
        ]);

        $message =Thread::create($valid_data +[
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
        $thread       =Thread::where('uuid',$uuid)->first();
        $thread_types =ThreadType::get();
        return view('threads.edit',compact('thread','thread_types'));
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
            'label_sw'     =>'required',
            'thread_type' =>'required',
            'thread_uuid' =>'required',
        ]);

        $message =Thread::where('uuid',$valid_data['thread_uuid'])->first();
        $message->title_eng     =$valid_data['title_eng'];
        $message->title_sw      =$valid_data['title_sw'];
        $message->step          =$valid_data['step'];
        $message->flag          =$valid_data['flag'];
        $message->label         =$valid_data['label'];
        $message->label_sw      =$valid_data['label_sw'];
        $message->thread_type   =$valid_data['thread_type'];
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
        $thread =Thread::where('uuid',$uuid)->first();
        $thread->responses()->delete();
        $thread->delete();

        return response()->json([
            'success' =>true,
            'message' =>'Action done successfully'
        ],200);
    }
}
