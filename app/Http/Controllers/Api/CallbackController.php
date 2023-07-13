<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Traits\MessageStep;
use App\Models\BotLog;
use Str;

class CallbackController extends Controller
{
    use MessageStep;

    public function whatsappCallback(Request $request){
        $response =$request->all();
       // $response =json_encode($response,true);
        //return $response['entry'][0]['changes'][0]['value']['messages'][0];

        $phone_number =$response['entry'][0]['changes'][0]['value']['messages'][0]['from'];
        $message_id   =$response['entry'][0]['changes'][0]['value']['messages'][0]['id'];
        $type         =$response['entry'][0]['changes'][0]['value']['messages'][0]['type'];
        $body         =$response['entry'][0]['changes'][0]['value']['messages'][0]['text']['body'];
        //return $body;
        
        $logs =BotLog::where('phone_number',$phone_number)->where('status','OPEN')->first();

        if (!$logs) {
            $logs =BotLog::create([
                'phone_number' =>$phone_number,
                'message_id'   =>$message_id,
                'text'         =>$body,
                'step'         =>0,
                'thread_id'    =>1,
                'type'         =>$type,
                'uuid'         =>(string)Str::orderedUuid(),
            ]);
        }

        return $this->analyseThread($logs,$body,$message_id);

        //$logs;
        // if ($logs) {
        //     return $this->analyseThread($logs,$body,$message_id);
        // } else {
        //     $log =BotLog::create([
        //         'phone_number' =>$phone_number,
        //         'message_id'   =>$message_id,
        //         'text'         =>$body,
        //         'step'         =>0,
        //         'thread_id'    =>1,
        //         'type'         =>$type,
        //         'uuid'         =>(string)Str::orderedUuid(),
        //     ]);

        //     return $this->firstThread($log);

        // }
        
    }
}
