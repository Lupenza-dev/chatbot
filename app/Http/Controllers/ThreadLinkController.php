<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Message;
use App\Models\ThreadLink;
use App\Models\MessageType;
use Str;
use Auth;


class ThreadLinkController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $messages      =Message::where('message_type','TEXT')->get();
        $message_types =MessageType::get();
        $links         =ThreadLink::with('response','link_response')->latest()->get();
        return view('threads.thread_link',compact('messages','message_types','links'));
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
            'message_id'            =>'required',
            'linked_message_id'     =>'required',
            'message_type'          =>'required',
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
    public function destroy(string $id)
    {
        //
    }
}
