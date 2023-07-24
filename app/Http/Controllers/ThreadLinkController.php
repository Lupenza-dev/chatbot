<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Thread;
use App\Models\ThreadLink;
use App\Models\ThreadType;
use App\Models\ThreadResponse;
use App\Models\ResponseThreadLink;
use Str;
use Auth;


class ThreadLinkController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $threads        =Thread::latest()->get();
        $links         =ThreadLink::with('response','link_response')->latest()->get();
        return view('threads.thread_link',compact('threads','links'));
    }

    public function responseLink(){
        $links =ResponseThreadLink::with('response','thread')->get();
        $responses =ThreadResponse::with('response_link')->whereDoesnthave('response_link')->get();
        $threads   =Thread::get();
        return view('threads.response_links',compact('links','responses','threads'));
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
            'thread_id'            =>'required',
            'linked_thread_id'     =>'required',
        ]);

        $message =ThreadLink::create($valid_data +[
            'uuid' =>(string)Str::orderedUuid(),
            'created_by' =>Auth::user()->id,
        ]);

        return response()->json([
            'success' =>true,
            'message' =>'Action done successfully'
        ],200);
    }


    public function responseLinkStore(Request $request)
    {
        $valid_data =$this->validate($request,[
            'thread_response_id'   =>'required',
            'thread_id'     =>'required',
        ]);

        $message =ResponseThreadLink::create($valid_data +[
            'uuid' =>(string)Str::orderedUuid(),
            'created_by' =>Auth::user()->id,
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
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        $uuid =$request->uuid;
        $thread =ThreadLink::where('uuid',$uuid)->first();
       // $thread->responses()->delete();
        $thread->delete();

        return response()->json([
            'success' =>true,
            'message' =>'Action done successfully'
        ],200);
    }

    public function destroyResponseLink(Request $request)
    {
        $uuid =$request->uuid;
        $thread =ResponseThreadLink::where('uuid',$uuid)->first();
       // $thread->responses()->delete();
        $thread->delete();

        return response()->json([
            'success' =>true,
            'message' =>'Action done successfully'
        ],200);
    }
}
