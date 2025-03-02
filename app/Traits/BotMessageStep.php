<?php
namespace App\Traits;

use App\Models\BotLog;
use App\Models\ResponseThreadLink;
use App\Models\Thread;
use App\Models\UserLanguage;
use Illuminate\Support\Facades\Log;
use App\Traits\SendWhatsappSms;
use App\Traits\BotLogTrait;
use Str;

trait BotMessageStep
{
    use SendWhatsappSms,BotLogTrait;

    public function threadAnalyser($phone_number,$message_id,$type,$body,$reply_id){
        
        $exist_log =BotLog::where('phone_number',$phone_number)->where('status','OPEN')->latest()->first();

        if ($exist_log) {
            if ($type == "interactive") {
                # check if reply id is on response thread link
                $response_thread =ResponseThreadLink::where('thread_response_id',$reply_id)->first();
                if ($response_thread) {
                    $thread =Thread::with('responses')->where('id',$response_thread->thread_id)->first();
                    $header_text   =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                    $button_label  =$this->getLanguage($phone_number) == 1 ? "Tafadhali Chagua": "Please Select One";
                    $responses     =$thread->responses;
                

                   ###clear open log
                   $this->clearLogs($phone_number);

                  // $this->createUserLog($phone_number,$thread?->title_eng,$title_body);
                   Log::channel('sms')->debug("=======Block 2.1  new message type   $type =========");
                   $this->createBotLog($phone_number,$message_id,$body,$reply_id,$thread->step,$thread->id,$type);
                    $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                    Log::channel('sms')->debug("=======After sent Block 2.1 new message  $response =========");

                }
            } else {
                #
                return  http_response_code(200);
            }
            
        } else {
            # New Conversation
            ### New Conversation
                Log::channel('sms')->debug("=======Block 2  new message   $type =========");
                $thread        =Thread::with('responses')->where('step',1)->first();
                $header_text   =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                $button_label  =$this->getLanguage($phone_number) == 1 ? "Chagua Huduma": "Choose Service";
                $responses    =$thread->responses;
                 ###clear open log
                // $this->clearLogs($phone_number);

                 //$this->createUserLog($phone_number,'request',$title_body);
                 Log::channel('sms')->debug("=======Block 1.5  new message   $type =========");
                 Log::channel('sms')->debug("=======Block 1.5  new message   $header_text =========");
                $this->createBotLog($phone_number,$message_id,$body,$reply_id,$thread->step,$thread->id,$type);
                $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                Log::channel('sms')->debug("=======After sent Block 1.5 new message  $response =========");

                return $response;
        }
        
    } 

    public function getLanguage($phone_number){
        $language =UserLanguage::firstOrCreate([
            'phone_number'=>$phone_number
        ],
        [
            'phone_number'=>$phone_number,
            'language_type' =>1,
        ]
        );

        return $language->language_type;
    }

    public function changeLanguage($phone_number,$language){
        UserLanguage::updateOrCreate([
            'phone_number' =>$phone_number
        ],
        [
            'language_type' =>$language == "Kiswahili" ? 1 : 2 
        ]);
    }

    public function createBotLog($phone_number,$message_id,$body,$reply_id,$step,$thread_id,$type){
          BotLog::create([
            'phone_number' =>$phone_number,
            'message_id'   =>$message_id,
            'text'         =>$body,
            'reply_id'     =>$reply_id ?? null,
            'step'         =>$step,
            'thread_id'    =>$thread_id,
            'type'         =>$type,
            'uuid'         =>(string)Str::orderedUuid(),
             'status'       =>"OPEN"
           ]);

           return true;
    }
}
