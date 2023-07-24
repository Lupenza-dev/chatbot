<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ThreadLink extends Model
{
    use HasFactory;

    protected $fillable=['thread_id','linked_thread_id','uuid','created_by'];

    public function response(){
        return $this->hasOne(Thread::class,'id','thread_id');
    }

    public function link_response(){
        return $this->hasOne(Thread::class,'id','linked_thread_id');
    }
}
