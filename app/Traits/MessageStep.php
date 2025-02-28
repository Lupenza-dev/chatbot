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
                            
        
                            $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                            return $response; 
                        } else {
                             ###clear open log
                        $this->clearLogs($phone_number);

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

                        $response =$this->textSms($phone_number,$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng);
                        return $response; 
                        }
                        
                    } else {
                        ### not exist means end
                         ###clear open log
                         $this->clearLogs($phone_number);

                         $response =$this->textSms($phone_number,"Thanks For Contact us We will revert back to you soon"); 
                         //$response_2 =$this->companyAddress($phone_number);
                         return $response;
                    }
                    

                 
            }
            else if($reply_id) {
                ## Reply ID Ipo On LIST MESSAGE  
               // goto a;
               $response_thread =ResponseThreadLink::where('thread_response_id',$reply_id)->first();
               //return $response_thread;
               if ($response_thread) {
                   $thread =Thread::with('responses')->where('id',$response_thread->thread_id)->first();
                Log::debug("---- inatakiwa ipite hapa type ipo reply id--- $reply_id");

                   if ($thread->thread_type == "LIST MESSAGE") {
                       $header_text  =$thread->label;
                       $button_label ="Please Select One";
                       $responses    =$thread->responses;
                   
   
                      ###clear open log
                      $this->clearLogs($phone_number);
   
                       $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                       return $response; 
   
                   }
                    else {
                         ###clear open log
                       $this->clearLogs($phone_number);
   
                       $response =$this->textSms($phone_number,$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng);
                       return $response;
                   }
                   
                  
               } else {
                   # code...
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
        
                    $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
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
                 $this->clearLogs($phone_number);
    
                $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                return $response;


            }
            ##### block deal with language

            $response_thread =ResponseThreadLink::where('thread_response_id',$replied_text_id)->first();
            //return $response_thread;
            if ($response_thread) {
                $thread =Thread::with('responses')->where('id',$response_thread->thread_id)->first();

                if ($thread->thread_type == "LIST MESSAGE") {
                    $header_text  =$thread->label;
                    $header_text  =$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng;
                    $button_label  =$this->getLanguage($phone_number) == 1 ? "Tafadhali Chagua": "Please Select One";
                    $responses    =$thread->responses;
                

                   ###clear open log
                   $this->clearLogs($phone_number);

                    $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                    return $response; 

                } else {
                      ###clear open log
                    $this->clearLogs($phone_number);

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

                    $response =$this->textSms($phone_number,$this->getLanguage($phone_number) == 1 ? $thread->title_sw: $thread->title_eng);
                    return $response;
                }
                
               
            } else {
                # code...
            }
            
        }
         else {
            ### if other type increase we have to add here
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
}   
