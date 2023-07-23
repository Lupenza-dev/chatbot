<?php
namespace App\Traits;
use App\Models\Message;
use App\Traits\SendWhatsappSms;
use App\Models\MessageResponse;
use App\Models\ThreadLink;
use App\Models\BotLog;
use Str;

trait MessageStep
{
    use SendWhatsappSms;

    public function firstThread($log){
        $step =$log->step;

        if ($step == 0) {
            $message =Message::with('responses')->where('step',0)->first();
            $phone_number =$log->phone_number;
            $header_text  =$message->title_eng;
            $button_label ="Our Services";
            $responses    =$message->responses;
             ###clear open log
             $logs =BotLog::where('phone_number',$phone_number)->get();
             foreach ($logs as $key ) {
                 $key->update(['status' =>'CLOSED']);
             }

            $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
            return $response;
        }
    }

    public function analyseThread($log,$body,$message_id){
        $step         =$log->step;
        $phone_number =$log->phone_number;
        $available_responses =MessageResponse::where('name_eng',$body)->first();
        if ($available_responses) {
            ## find next step
            $next_step =Message::with('responses')->where('title_eng',$body)->first();
            if ($next_step) {
                ### message type

                if ($next_step->message_type == "LIST MESSAGE") {
                    $phone_number =$log->phone_number;
                    $header_text  =$next_step->label;
                    $button_label ="Select one option";
                    $responses    =$next_step->responses;
                   

                    ###clear open log
                    $logs =BotLog::where('phone_number',$phone_number)->get();
                    foreach ($logs as $key ) {
                        $key->update(['status' =>'CLOSED']);
                    }

                    ### creatte new log
                    $log =BotLog::create([
                        'phone_number' =>$phone_number,
                        'message_id'   =>$message_id,
                        'text'         =>$body,
                        'step'         =>$next_step->step,
                        'thread_id'    =>$next_step->id,
                        'type'         =>$next_step->message_type,
                        'uuid'         =>(string)Str::orderedUuid(),
                    ]);

                    $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
                    return $response;

                } else {
                    ## get last step to know next
                    a:$last_step_id =$log->thread_id;
                     
                    ## next step get from thread link

                    $next_step =ThreadLink::where('message_id',$last_step_id)->first();
                    if ($next_step) {
                          ### next step
                          $next_message =Message::where('id',$next_step->linked_message_id)->first();

                           ###clear open log
                            $logs =BotLog::where('phone_number',$phone_number)->get();
                            foreach ($logs as $key ) {
                                $key->update(['status' =>'CLOSED']);
                            }

                            

                            ### creatte new log
                            $log =BotLog::create([
                                'phone_number' =>$phone_number,
                                'message_id'   =>$message_id,
                                'text'         =>$body,
                                'step'         =>$next_message->step,
                                'thread_id'    =>$next_message->id,
                                'type'         =>$next_message->message_type,
                                'uuid'         =>(string)Str::orderedUuid(),
                            ]);


                        $response =$this->textSms($log->phone_number, $next_message->title_eng);
                        return $response;
                    } else {
                        ### get last step by fetching body from thread/message 
                        $last_step =Message::where('title_eng',$body)->first();
                        
                        ###if last_step not exit means you at end

                        if (!$last_step) {
                              ###clear open log
                              $logs =BotLog::where('phone_number',$phone_number)->get();
                              foreach ($logs as $key ) {
                                  $key->update(['status' =>'CLOSED']);
                              }
  
                          $response =$this->textSms($log->phone_number,"Thanks For Contact us We will revert back to you soon"); 
                          $response_2 =$this->companyAddress($log->phone_number);
                          return $response;
                        }

                        ## return to thread link to get current step

                        $current_step =ThreadLink::where('message_id',$last_step->id)->first();

                        ### next step
                        $next_message =Message::where('id',$current_step->linked_message_id)->first();

                         ###clear open log
                            $logs =BotLog::where('phone_number',$phone_number)->get();
                            foreach ($logs as $key ) {
                                $key->update(['status' =>'CLOSED']);
                            }

                            ### creatte new log
                            $log =BotLog::create([
                                'phone_number' =>$phone_number,
                                'message_id'   =>$message_id,
                                'text'         =>$body,
                                'step'         =>$next_message->step,
                                'thread_id'    =>$next_message->id,
                                'type'         =>$next_message->message_type,
                                'uuid'         =>(string)Str::orderedUuid(),
                            ]);

                        $response =$this->textSms($log->phone_number, $next_message->title_eng);

                        return $response;
                    }
                    
                }
                
            } else {
                #### Lupenza you have to think if message not available
            }
            
        }elseif ($step == 0 && !$available_responses) {
            $message =Message::with('responses')->where('step',0)->first();
            $phone_number =$log->phone_number;
            $header_text  =$message->title_eng;
            $button_label ="Our Services";
            $responses    =$message->responses;
             ###clear open log
             $logs =BotLog::where('phone_number',$phone_number)->get();
             foreach ($logs as $key ) {
                 $key->update(['status' =>'CLOSED']);
             }

            $response =$this->interactiveSms($phone_number,$header_text,$button_label,$responses);
            return $response;
        }
        else {

            goto a;
            #### Lupenza you have to think if response not available Done
        }
       
        
    }
}   
