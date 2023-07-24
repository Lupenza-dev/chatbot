<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Thread extends Model
{
    use HasFactory;

    protected $fillable =['title_eng','title_sw','step','flag','label','thread_type','back_status','created_by','uuid','label_sw'];

    public function responses(){
        return $this->hasMany(ThreadResponse::class);
    }
}
