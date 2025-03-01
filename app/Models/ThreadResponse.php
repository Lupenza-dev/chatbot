<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ThreadResponse extends Model
{
    use HasFactory;

    protected $fillable =['name_eng','name_sw','thread_id','uuid','created_by','order_no'];

    public function response_link(){
        return $this->hasOne(ResponseThreadLink::class,'thread_response_id','id');
    }

    public function thread(){
        return $this->hasOne(Thread::class,'id','thread_id');
    }

}
