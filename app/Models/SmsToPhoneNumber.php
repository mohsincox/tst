<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\User;

class SmsToPhoneNumber extends Model
{
    protected $table = 'sms_to_phone_numbers';

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by');
    }
}
