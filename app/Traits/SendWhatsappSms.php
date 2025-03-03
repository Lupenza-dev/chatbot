<?php
namespace App\Traits;
use Http;
use Log;
use App\Models\BotUserAnswer;


trait SendWhatsappSms
{
    public function interactiveSms($phone_number, $header_text, $button_label, $responses) {
        $rows = [];
        foreach ($responses as $key) {
            $rows[] = [
                'id' => $key->id,
                'title' => stringClean($this->getLanguage($phone_number) == 1 ? $key->name_sw: $key->name_eng),
            ];
        }

        $data = [
            "messaging_product" =>"whatsapp",
            "recipient_type" => "individual", 
            "to" => $phone_number,
            "type" => "interactive",
            "interactive" => [
                "type" => "list",
                "body" => [
                    "text" => $header_text,
                ],
                "action" => [
                    "button" => $button_label,
                    "sections" => [
                        [
                            "title" => $button_label,
                            "rows" => $rows,
                        ],
                    ],
                ],
            ],
        ];

        //$json_data = json_encode($data);
        //return $json_data;
       // Log::debug($data);
       $this->createBotThread($phone_number,$header_text);
       $response =$this->sendSms($data);

       // return $response;

        //return $json_data;
    }

    public function textSms($phone_number, $message) {
        $data = [
            'messaging_product' => 'whatsapp',
            'recipient_type'    => 'individual',
            'to'      => $phone_number,
            'type'    => 'text',
            'text'    => [
                'preview_url' =>false,
                'body'        =>$message
            ]
        ];

        Log::debug($data);

      //  $json_data = json_encode($data);

       // return $json_data;

       // Log::debug($data);
        $this->createBotThread($phone_number,$message);
        $response =$this->sendSms($data);

       // return $response;
    }

    public function sendSms($data){
        Log::debug('----------------------- send api request-------------------');

        $response = Http::withHeaders([
            'Content-Type' => 'application/json',
            'Authorization' => 'Bearer EAAR75ZBS0trABOw0mIEzmQ2z2p2u0ECT0hCJGB0NGLdp1B2acnQBae9WEyGWqBCU1ZAAXZCPm7ZC3NbYBDDaqYVmpWoGHnXxm0HfZCygBwprlTZCer41xkUeG5qYjMAR0yGeFsKlbE1aI1Wc2VtPBEX50poD98zoSfZBRiiPyL4e4bUtRgTQct3Q86MTyKJNyzbHMl5Y2oClu0YZCsda55NuIOHGE58ZD',
        ])
       // ->post('https://graph.facebook.com/v17.0/115034001648802/messages',$data);
        ->post('https://graph.facebook.com/v22.0/115034001648802/messages',$data);
        Log::debug('-----------------------response-------------------');
        Log::debug($response);

        
        // Retrieve the response
        $responseData = $response->json();
        Log::debug($responseData);
        return response()->json(['status' => 'ok'], 200);
      //  return  http_response_code(200);
       // return $responseData;
    }


    public function createBotThread($phone_number,$thread){
        $check =BotUserAnswer::where('phone_number',$phone_number)->where('thread',$thread)->where('is_active',1)->first();
        if (!$check) {
            BotUserAnswer::create([
                'phone_number' =>$phone_number,
                'thread'       =>$thread
               ]);
        }
      
    }
}
