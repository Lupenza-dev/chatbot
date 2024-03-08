<?php
namespace App\Traits;
use Http;
use Log;

trait SendWhatsappSms
{
    public function interactiveSms($phone_number, $header_text, $button_label, $responses) {
        $rows = [];
        foreach ($responses as $key) {
            $rows[] = [
                'id' => $key->id,
                'title' => stringClean($key->name_eng),
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
        $response =$this->sendSms($data);

       // return $response;
    }

    public function sendSms($data){
        Log::debug('----------------------- send api request-------------------');

        $response = Http::withHeaders([
            'Content-Type' => 'application/json',
            'Authorization' => 'Bearer EABTteIj9T7sBO6T05uIxwkUfXCxi7wDnux1Xu07kRCqeumqGi7IRVWcjFfnJyxd6JB0omxWEzGchhvoTZBzqspfDMpagiTXSkzzpGdhvVPhlYLqgZB6WLH5IZBJHrMwOuZAedL8hTVVbiObKmgNLhpR7OmnjHFaahQCP2VTsrWq24VJTTdbzyWyxw4Jr0DnEoCiiznsEbUnsacYncygZD',
        ])
       // ->post('https://graph.facebook.com/v17.0/115034001648802/messages',$data);
        ->post('https://graph.facebook.com/v17.0/115034001648802/messages',$data);
        Log::debug('-----------------------response-------------------');
        Log::debug($response);

        
        // Retrieve the response
        $responseData = $response->json();
        Log::debug($responseData);

        return  http_response_code(200);
       // return $responseData;
    }

    public function companyAddress($phone_number) {

        $data = [
            'messaging_product' => 'whatsapp',
            'recipient_type' => 'individual',
            'to' => $phone_number,
            "type" => "contacts",
            "contacts" => [
                [
                    "addresses" => [
                        [
                            "street" => "Salamander Tower , 6th Floor",
                            "city" => "Dar es salaam",
                            "country" => "Tanzania"
                        ]
                    ],
                    "emails" => [
                        [
                            "email" => "info@gsafrica.co.tz",
                            "type" => "WORK"
                        ],
                        [
                            "email" => "bookings@gsafrica.co.tz",
                            "type" => "WORK"
                        ]
                    ],
                    'name' => [
                        'formatted_name' => 'GsAfrica',
                        'first_name' => 'FIRST_NAME',
                        'last_name' => 'LAST_NAME',
                        'middle_name' => 'MIDDLE_NAME',
                        'suffix' => 'SUFFIX',
                        'prefix' => 'PREFIX',
                    ],
                    "org" => [
                        "company" => "GsAfrica",
                        "department" => "Africa Travel & logistic"
                    ],
                    "phones" => [
                        [
                            "phone" => "+255759104003"
                        ],
                        [
                            "phone" => "+255712813505",
                            "wa_id" => "PHONE_OR_WA_ID"
                        ]
                    ],
                    "urls" => [
                        [
                            "url" => "https://gsafrica.co.tz/"
                        ],
                        [
                            "url" => "https://gsexplore.co.tz/"
                        ]
                    ]
                ]
            ],
        ];

       // $json_data = json_encode($data);
        Log::debug($data);
        $response =$this->sendSms($data);

       // return $response;

        //return $json_data;
    }
}
