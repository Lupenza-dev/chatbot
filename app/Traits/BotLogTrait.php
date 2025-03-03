<?php
namespace App\Traits;
use App\Models\BotLog;


trait BotLogTrait
{
    public function clearLogss($phone_number){
        $logs =BotLog::where('phone_number',$phone_number)->where('status','OPEN')->get();
        foreach ($logs as $key ) {
            $key->update(['status' =>'CLOSED']);
        }
    }

}
