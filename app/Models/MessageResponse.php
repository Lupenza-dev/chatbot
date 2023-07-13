<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MessageResponse extends Model
{
    use HasFactory;

    protected $fillable =['name_eng','name_sw','message_id','uuid','created_by','order_no'];
}
