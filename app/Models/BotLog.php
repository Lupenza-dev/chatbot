<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BotLog extends Model
{
    use HasFactory;

    protected $fillable=['phone_number','message_id','text','step','status','type','uuid','thread_id','reply_id'];

    public function thread(){
        return $this->hasOne(Thread::class,'id','thread_id');
    }
}
