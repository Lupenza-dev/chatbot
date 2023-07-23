<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Traits\MessageStep;
use App\Traits\SendWhatsappSms;
use App\Models\BotLog;
use Str;
use Log;

class CallbackController extends Controller
{
    use MessageStep , SendWhatsappSms;

    public function whatsappCallback(Request $request){
        // if($_SERVER['REQUEST_METHOD']=="GET"){
        //     echo $_GET['hub_challenge']; //respond back hub_callenge key
        //     http_response_code(200);
        // }else{
        //     $data = json_decode(file_get_contents('php://input'), true);
        //     error_log(json_encode($data)); //print inbound message     
        // }
            
        $response = json_decode(file_get_contents('php://input'), true);
        Log::debug($response);

        if(array_key_exists("messages", $response['entry'][0]['changes'][0]['value'])){
   
        $type         =$response['entry'][0]['changes'][0]['value']['messages'][0]['type'];

        if ($type == "text") {
             $phone_number =$response['entry'][0]['changes'][0]['value']['messages'][0]['from'];
            $message_id   =$response['entry'][0]['changes'][0]['value']['messages'][0]['id'];
            $type         =$response['entry'][0]['changes'][0]['value']['messages'][0]['type'];
            $body         =$response['entry'][0]['changes'][0]['value']['messages'][0]['text']['body'];
        }elseif ($type == "image") {
             $phone_number =$response['entry'][0]['changes'][0]['value']['messages'][0]['from'];
             $message_id   =$response['entry'][0]['changes'][0]['value']['messages'][0]['id'];
             $type         =$response['entry'][0]['changes'][0]['value']['messages'][0]['type'];
             $body         =$response['entry'][0]['changes'][0]['value']['messages'][0]['image']['sha256'];
        }elseif ($type == "interactive") {
            $phone_number =$response['entry'][0]['changes'][0]['value']['messages'][0]['from'];
            $message_id   =$response['entry'][0]['changes'][0]['value']['messages'][0]['id'];
            $type         =$response['entry'][0]['changes'][0]['value']['messages'][0]['type'];
            $body         =$response['entry'][0]['changes'][0]['value']['messages'][0]['interactive']['list_reply']['title'];
        }
         else {
            return http_response_code(200); 
        }

        ## check id

        $message_exist =BotLog::where('message_id',$message_id)->first();

        if ($message_exist) {
            return http_response_code(200);  
        }
        
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

        $response =$this->analyseThread($logs,$body,$message_id);
    }

        return http_response_code(200);
       
        
    }
}
