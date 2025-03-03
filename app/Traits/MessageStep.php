<?php
namespace App\Traits;
use App\Models\Thread;
use App\Traits\SendWhatsappSms;
use App\Traits\BotLogTrait;
use App\Models\ThreadLink;
use App\Models\BotLog;
use Str;
use App\Models\ResponseThreadLink;
use App\Models\UserLanguage;
use App\Models\BotUserLog;
use App\Models\ThreadResponse;
use Log;


trait MessageStep
{
    use SendWhatsappSms,BotLogTrait;

    public function __construct(){

    }

    public function analyseThread($log,$reply_id,$title_body){
        $step              =$log->step;
        $phone_number      =$log->phone_number;
        $replied_text      =$log->text;
        $replied_text_id   =$log->reply_id;
        $type              =$log->type;
        $thread_id         =$log->thread_id;
        $thread_id         =$log->thread_id;
        #### new analyser start ######
        ## step 1 check type of text if type=text means thread to thread and if type=list means reponse to thread

        if ($type  == "text" || $type == "TEXT" || $type == "LIST MESSAGE") {
            ### check thread if exist if not exist means its first screen not to be rendered
            Log::debug("----type ipo ndani--- $type");
            Log::channel('sms')->debug("=======Block 1 =========");
            $exist_thread =ThreadLink::where('thread_id',$thread_id)->first();
           // $response_thread =ResponseThreadLink::where('thread_response_id',$replied_text_id)->first();
            if ($exist_thread) {

                $thread =Thread::with('responses')->where('id',$exist_thread->linked_thread_id)->first();

                    if ($thread){

                        if ($thread->thread_type == "LIST MESSAGE") {
                            $header_text   =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                            $button_label  =$this->getLanguage($phone_number) == 1 ? "Tafadhali Chagua": "Please Select One";
                            $responses    =$thread->responses;
                        
        
                           ###clear open log
                           $this->clearLogs($phone_number);
                           $log->thread_id =$thread->id;
                           $log->save();
                           $this->createUserLog($phone_number,$thread?->title_eng,$title_body);

                            ### creatte new log

                            if (!$thread->close_thread) {
                                $log =BotLog::create([
                                    'phone_number' =>$phone_number,
                                    // 'message_id'   =>$message_id,
                                    'text'         =>$thread->label,
                                    'step'         =>$thread->step,
                                    'thread_id'    =>$thread->id,
                                    'type'         =>$thread->thread_type,
                                    'uuid'         =>(string)Str::orderedUuid(),
                                ]);
                            }
                            
                            Log::channel('sms')->debug("=======Block 1.1  LIST MESSAGE =========");
                            Log::channel('sms')->debug("=======Block 1.1  $header_text =========");
                            $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                            Log::channel('sms')->debug("=======After sent Block 1.1  $response =========");
                            return $response; 
                             abort(200);
                        } else {
                             ###clear open log
                        $this->clearLogs($phone_number);

                        $log->thread_id =$thread->id;
                        $log->save();
                        $this->createUserLog($phone_number,$thread?->title_eng,$title_body);

                        ### creatte new log
                        if (!$thread->close_thread) {
                            $log =BotLog::create([
                                'phone_number' =>$phone_number,
                                // 'message_id'   =>$message_id,
                                'text'         =>$thread->label,
                                'step'         =>$thread->step,
                                'thread_id'    =>$thread->id,
                                'type'         =>$thread->thread_type,
                                'uuid'         =>(string)Str::orderedUuid(),
                            ]);
                        }
                        $sent_text =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                        Log::channel('sms')->debug("=======Block 1.2 new message   $type =========");
                        Log::channel('sms')->debug("=======Block 1.2 new message   $sent_text =========");

                        $response =$this->textSms($phone_number,$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng);
                        Log::channel('sms')->debug("=======After sent Block 1.2 new message  $response =========");

                        return $response; 
                         abort(200);
                        }
                        
                    } else {
                        ### not exist means end
                         ###clear open log
                         $this->clearLogs($phone_number);

                         $response =$this->textSms($phone_number,"Thanks For Contact us We will revert back to you soon"); 
                         return $response;
                    }
                    

                 
            }
            else if($reply_id and $type != "interactive") {
                ## Reply ID Ipo On LIST MESSAGE  
               // goto a;
               $response_thread =ResponseThreadLink::where('thread_response_id',$reply_id)->first();
               //return $response_thread;
               if ($response_thread) {
                   $thread =Thread::with('responses')->where('id',$response_thread->thread_id)->first();
                Log::debug("---- inatakiwa ipite hapa type ipo reply id--- $reply_id");

                   if ($thread->thread_type == "LIST MESSAGE") {
                      // $header_text  =$thread->label;
                       $button_label ="Please Select One";
                       $responses    =$thread->responses;
                       $header_text   =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                       $button_label  =$this->getLanguage($phone_number) == 1 ? "Tafadhali Chagua": "Please Select One";
   
                      ###clear open log
                      $this->clearLogs($phone_number);
                      $log->thread_id =$thread->id;
                      $log->save();
                      $this->createUserLog($phone_number,$thread?->title_eng,$title_body);
                      Log::channel('sms')->debug("=======Block 1.3 reply id in LIST MESSAGE  HATUPITI new message   $type =========");
                      Log::channel('sms')->debug("=======Block 1.3  id in LIST MESSAGE HATUPITI   $header_text =========");
                      Log::channel('sms')->debug("=======Block 1.3  message ID   $log->message_id =========");
                      Log::channel('sms')->debug("=======Block 1.3  message Type   $type =========");
                       $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                       Log::channel('sms')->debug("=======After sent Block 1.3 new message  $response =========");
                       return $response; 
                        abort(200);
   
                   }
                //     else {
                //         $sent_text =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                //          ###clear open log
                //        $this->clearLogs($phone_number);
                //        $log->thread_id =$thread->id;
                //        $log->save();
                //        $this->createUserLog($phone_number,$thread?->title_eng,$title_body);
                //        Log::channel('sms')->debug("=======Block 1.4 reply id in Not LIST MESSAGE  HATUPITI new message   $type =========");
                //        Log::channel('sms')->debug("=======Block 1.4  id in NOT LIST MESSAGE HATUPITI   $sent_text =========");
                //        $response =$this->textSms($phone_number,$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng);
                //        Log::channel('sms')->debug("=======After sent Block 1.4 new message  $response =========");

                //        return $response;
                //    }
                   
                  
               } 
            }
            else {
                ### New Conversation
                Log::debug("======new conv======== $log->step");
                if ($log->step == 1) {
                    Log::debug("======new Ndani conv======== $log->step");
                    $thread        =Thread::with('responses')->where('step',1)->first();
                    $header_text   =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                    $button_label  =$this->getLanguage($phone_number) == 1 ? "Chagua Huduma": "Choose Service";
                    $responses    =$thread->responses;
                     ###clear open log
                     $this->clearLogs($phone_number);

                     $this->createUserLog($phone_number,'request',$title_body);
                     Log::channel('sms')->debug("=======Block 1.5  new message   $type =========");
                     Log::channel('sms')->debug("=======Block 1.5  new message   $header_text =========");
        
                    $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                    Log::channel('sms')->debug("=======After sent Block 1.5 new message  $response =========");

                    return $response;
                }
               
            }
            

        }elseif ($type == "interactive") {

            ##### block deal with language
            if (($reply_id) and (in_array($title_body,['Kiswahili','English']))) {
                # Means Kachange Lugha
                $this->changeLanguage($phone_number,$title_body);
                $thread        =Thread::with('responses')->where('step',1)->first();
                $header_text   =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                $button_label  =$this->getLanguage($phone_number) == 1 ? "Chagua Huduma": "Choose Service";
                $responses    =$thread->responses;
                 ###clear open log
                 $reply_thread =ThreadResponse::with('thread')->where('id',$reply_id)->first();
                 $log->thread_id =$reply_thread->thread_id;
                 $log->save();
                 $this->clearLogs($phone_number);
                 $this->createUserLog($phone_number,$reply_thread->thread?->title_sw,$title_body);
                 Log::channel('sms')->debug("=======Block 2  new message   $type =========");
                 Log::channel('sms')->debug("=======Block 2  new message   $header_text =========");
                $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                Log::channel('sms')->debug("=======After sent Block 2 new message  $response =========");
                return $response;


            }
            ##### block deal with language

            $response_thread =ResponseThreadLink::where('thread_response_id',$replied_text_id)->first();
            //return $response_thread;
            if ($response_thread) {
                $thread =Thread::with('responses')->where('id',$response_thread->thread_id)->first();

                if ($thread->thread_type == "LIST MESSAGE" and $type != "interactive") {
                    $header_text  =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                    $button_label  =$this->getLanguage($phone_number) == 1 ? "Tafadhali Chagua": "Please Select One";
                    $responses    =$thread->responses;
                

                   ###clear open log
                   $this->clearLogs($phone_number);

                   $log->thread_id =$response_thread->thread_id;
                   $log->save();
                   $this->createUserLog($phone_number,$thread?->title_eng,$title_body);
                   Log::channel('sms')->debug("=======Block 2.1  new message   $type =========");
                   Log::channel('sms')->debug("=======Block 2.1  new message   $header_text =========");
                   Log::channel('sms')->debug("=======Block 2.1  new message type   $type =========");

                    $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                    Log::channel('sms')->debug("=======After sent Block 2.1 new message  $response =========");

                    return $response; 
                     abort(200);

                } else {
                      ###clear open log
                    $this->clearLogs($phone_number);
                    $log->thread_id =$response_thread->thread_id;
                    $log->save();
                    $this->createUserLog($phone_number,$thread?->title_eng,$title_body);
                     ### creatte new log

                     if (!$thread->close_thread) {
                        $log =BotLog::create([
                            'phone_number' =>$phone_number,
                           // 'message_id'   =>$message_id,
                            'text'         =>$thread->label,
                            'step'         =>$thread->step,
                            'thread_id'    =>$thread->id,
                            'type'         =>$thread->thread_type,
                            'uuid'         =>(string)Str::orderedUuid(),
                        ]);
                     }
                     $sent_text =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                     Log::channel('sms')->debug("=======Block 2.2  new message   $type =========");
                     Log::channel('sms')->debug("=======Block 2.2  new message   $sent_text =========");

                    $response =$this->textSms($phone_number,$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng);
                    Log::channel('sms')->debug("=======After sent Block 2.2 new message  $response =========");

                    return $response;
                }
                
               
            } else {
                # code...
            }
            
        }
         else {
            ### if other type increase we have to add here
        }
        Log::channel('sms')->debug("=======OUT OF BLOCKS=========");

        return  http_response_code(200);
        
       
    }

    public function getLanguage2($phone_number){
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

    public function changeLanguage2($phone_number,$language){
        UserLanguage::updateOrCreate([
            'phone_number' =>$phone_number
        ],
        [
            'language_type' =>$language == "Kiswahili" ? 1 : 2 
        ]);
    }

    public function createUserLog2($phone_number,$thread,$body){
        $data =[
            'thread' =>$thread,
            'answer' =>$body
        ];
        Log::debug("======saved====== user logs");
        Log::debug($data);
        $check_log =BotUserLog::where('phone_number',$phone_number)->where('is_active',true)->latest()->first();
        if ($check_log) {
            // Update
            $existing_log = json_decode($check_log->log, true);
            // Ensure it's an array before merging
            if (!is_array($existing_log)) {
                $existing_log = [];
            }

            // Append the new data
            $existing_log[] = $data;

            // Update the log
            $check_log->update([
                'log' => json_encode($existing_log)
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
}   
