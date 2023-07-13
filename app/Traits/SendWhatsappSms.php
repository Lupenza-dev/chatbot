<?php
namespace App\Traits;

trait SendWhatsappSms
{
    public function interactiveSms($phone_number, $header_text, $button_label, $responses) {
        $rows = [];
        foreach ($responses as $key) {
            $rows[] = [
                'id' => $key->id,
                'title' => $key->name_eng,
            ];
        }

        $json_data = [
            'messaging_product' => 'whatsapp',
            'recipient_type' => 'individual',
            'to' => $phone_number,
            'type' => 'interactive',
            'interactive' => [
                'type' => 'list',
                'body' => [
                    'text' => $header_text,
                ],
                'action' => [
                    'button' => $button_label,
                    'sections' => [
                        [
                            'title' => $button_label,
                            'rows' => $rows,
                        ],
                        // Add additional sections if needed
                    ],
                ],
            ],
        ];

        $json_data = json_encode($json_data);

        return $json_data;
    }

    public function textSms($phone_number, $message) {
        $data = [
            "messaging_product" => "whatsapp",
            "recipient_type"    => "individual",
            "to"      => $phone_number,
            "type"    => "text",
            "text"    => [
                "preview_url" =>false,
                "body"        =>$message
            ]
        ];

        $json_data = json_encode($data);

        return $json_data;
    }
}
