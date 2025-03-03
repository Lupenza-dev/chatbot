<?php
namespace App\Traits;

use App\Models\BotLog;
use App\Models\BotUserLog;
use App\Models\ResponseThreadLink;
use App\Models\Thread;
use App\Models\ThreadLink;
use App\Models\UserLanguage;
use Illuminate\Support\Facades\Log;
use App\Traits\SendWhatsappSms;
use Illuminate\Support\Facades\Cache;
use Str;

trait BotMessageStep
{
    use SendWhatsappSms;

    public function threadAnalyser($phone_number,$message_id,$type,$body,$reply_id){
        // Cache::put('message_id',$message_id, true, now()->addMinutes(5));
        Cache::put("whatsapp_message_{$message_id}", true, now()->addMinutes(3));
        // check message exist
        $message_exist =BotLog::where('message_id',$message_id)->first();
        if ($message_exist) {
            return response()->json(['status' => 'ok'], 200);
        }
        $exist_log =BotLog::with('thread')->where('phone_number',$phone_number)->where('status','OPEN')->latest()->first();

        if ($exist_log) {
            if ($type == "interactive") {
                # check if reply id is on response thread link
                $response_thread =ResponseThreadLink::where('thread_response_id',$reply_id)->first();
                if ($response_thread) {
                    $thread =Thread::with('responses')->where('id',$response_thread->thread_id)->first();
                    $header_text   =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                    $button_label  =$this->getLanguage($phone_number) == 1 ? "Tafadhali Chagua": "Please Select One";
                    $responses     =$thread->responses;
                

                    if ($thread->flag == "WCF_CONTROL_NUMBER") {
                        ### Logic to Generate Control number
                        $header_text =str_replace(["{#control_number}","{#amount}"],[998323432332,"100,000"],$header_text);
                    }
                   ###clear open log
                   $this->clearLogs($phone_number);

                   $this->createUserLog($phone_number,$exist_log->thread?->label,$body,$thread->close_thread);

                  // $this->createUserLog($phone_number,$thread?->title_eng,$title_body);
                   Log::channel('sms')->debug("=======Block 2.1  new message type   $type =========");
                   $this->createBotLog($phone_number,$message_id,$body,$reply_id,$thread->step,$thread->id,$type,$thread->close_thread);

                    if ($thread->thread_type == "LIST MESSAGE") {
                        $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                        Log::channel('sms')->debug("=======After sent Block 2.1 LIST MESSAGE  $response =========");
                    } else {
                        $response =$this->textSms($phone_number,$header_text);
                        Log::channel('sms')->debug("=======After sent Block 2.2 new message  $response =========");
                    }
                    
                   
                    return $response;
                }
                elseif (($reply_id) and (in_array($body,['Kiswahili','English']))) {
                    ### Language Block
                    $this->changeLanguage($phone_number,$body);
                    $thread        =Thread::with('responses')->where('step',1)->first();
                    $header_text   =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                    $button_label  =$this->getLanguage($phone_number) == 1 ? "Chagua Huduma": "Choose Service";
                    $responses    =$thread->responses;
                     ###clear open log
                     $this->clearLogs($phone_number);
                     $this->createUserLog($phone_number,$exist_log->thread?->label,$body,$thread->close_thread);
                     //$this->createUserLog($phone_number,'request',$title_body);
                     Log::channel('sms')->debug("=======Block Change language Block  new message   $type =========");
                     Log::channel('sms')->debug("=======Block Change language Block  new message   $header_text =========");
                    $this->createBotLog($phone_number,$message_id,$body,$reply_id,$thread->step,$thread->id,$type,$thread->close_thread);
                    $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                    Log::channel('sms')->debug("=======After sent Block Change language Block new message  $response =========");
    
                    return $response;
                }
                else{
                    ### Means thread ends
                     ###clear open log
                   $message =$this->getLanguage($phone_number) == 1 ? "Asante kwa kuwasiliana nasi": "Thanks For Contact us";
                   $this->clearLogs($phone_number);
                   ### i will come here to close bot user logs
                   $this->closeUserLog($phone_number);
                   $response =$this->textSms($phone_number,$message); 
                   return $response;

                }
            }elseif ($type == "text") {
                # check on thread links means thread to thread links
                $thread_links =ThreadLink::with('response')->where('thread_id',$exist_log->thread_id)->first();

                if ($thread_links) {
                    $thread =Thread::where('id',$thread_links->linked_thread_id)->first();
                    $header_text   =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                    $button_label  =$this->getLanguage($phone_number) == 1 ? "Tafadhali Chagua": "Please Select One";
                    $responses     =$thread->responses;

                    ### check thread flag

                    if ($thread_links->response?->flag == "WCF_NUMBER") {
                        ### Logic to check WCF Number Will Fall Here
                        if ((int)$body != 123456) {
                            $warning ="Enter Valid WCF NUMBER";
                            $response =$this->textSms($phone_number,$warning);
                            return $response;
                        }
                       
                    }

                    if ($thread->flag == "WCF_USER") {
                        ### Logic to Fetch User
                        $header_text =str_replace("{#name}","Luhangano Lupenza",$header_text);
                    }


                    ### End check thread flag
                   ###clear open log
                   $this->clearLogs($phone_number);

                   $this->createUserLog($phone_number,$exist_log->thread?->label,$body,$thread->close_thread);


                  // $this->createUserLog($phone_number,$thread?->title_eng,$title_body);
                   Log::channel('sms')->debug("=======Block 3.1  new message type   $type =========");
                   $this->createBotLog($phone_number,$message_id,$body,$reply_id,$thread->step,$thread->id,$type,$thread->close_thread);

                    if ($thread->thread_type == "LIST MESSAGE") {
                        $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                        Log::channel('sms')->debug("=======After sent Block 3.2 LIST MESSAGE  $response =========");
                    } else {
                        $response =$this->textSms($phone_number,$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng);
                        Log::channel('sms')->debug("=======After sent Block 3.2 new message  $response =========");
                    }
                    
                   
                    return $response;

                } else {
                    # code...
                }
                
            }
            else {
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
                 $this->createUserLog($phone_number,'thread_initiated',$body,$thread->close_thread);

                 Log::channel('sms')->debug("=======Block 1.5  new message   $type =========");
                 Log::channel('sms')->debug("=======Block 1.5  new message   $header_text =========");
                $this->createBotLog($phone_number,$message_id,$body,$reply_id,$thread->step,$thread->id,$type,$thread->close_thread);
                $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                Log::channel('sms')->debug("=======After sent Block 1.5 new message  $response =========");

                return $response;
        }

        return response()->json(['status' => 'ok'], 200);
        
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

    public function createBotLog($phone_number,$message_id,$body,$reply_id,$step,$thread_id,$type,$thread_status){
            BotLog::create([
                'phone_number' =>$phone_number,
                'message_id'   =>$message_id,
                'text'         =>$body,
                'reply_id'     =>$reply_id ?? null,
                'step'         =>$step,
                'thread_id'    =>$thread_id,
                'type'         =>$type,
                'uuid'         =>(string)Str::orderedUuid(),
                 'status'       =>$thread_status ? "CLOSED" : "OPEN",
               ]);
    
               return true;
          
    }

    public function createUserLog($phone_number,$label,$body,$status){
        $data =[
            $label =>$body,
        ];
  
        $check_log =BotUserLog::where('phone_number',$phone_number)->where('is_active',true)->latest()->first();
        if ($check_log) {
            $exit_log = json_decode($check_log->log, true) ?? [];
            $updated_data = array_merge($exit_log, $data);
            $check_log->update([
                'log'       => json_encode($updated_data),
                'is_active' => $status ?  false : true 
            ]);
        } else {
            # create new user Log
            BotUserLog::create([
                'phone_number' =>$phone_number,
                'log'          =>json_encode($data)
            ]);
        }

        return true;
        
    }

    public function closeUserLog($phone_number){
        $log =BotUserLog::where('phone_number',$phone_number)->where('is_active',true)->latest()->first();
        if ($log) {
            $log->is_active =false;
            $log->save();
        }
        return true;
  
    }

    public function clearLogs($phone_number){
        $logs =BotLog::where('phone_number',$phone_number)->where('status','OPEN')->get();
        foreach ($logs as $key ) {
            $key->update(['status' =>'CLOSED']);
        }
    }
}
