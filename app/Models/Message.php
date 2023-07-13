<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory;

    protected $fillable =['title_eng','title_sw','step','flag','label','message_type','back_status','created_by','uuid'];

    public function responses(){
        return $this->hasMany(MessageResponse::class);
    }
}
