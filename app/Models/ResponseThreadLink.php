<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResponseThreadLink extends Model
{
    use HasFactory;

    protected $fillable=['thread_response_id','thread_id','created_by','uuid'];

    public function response(){
        return $this->hasOne(ThreadResponse::class,'id','thread_response_id');
    }

    public function thread(){
        return $this->hasOne(Thread::class,'id','thread_id');
    }
}
