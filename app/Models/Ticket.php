<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\User;

class Ticket extends Model
{
    protected $table = 'tickets';

    public function assigned()
    {
    	return $this->belongsTo(User::class, 'assigned_id');
    }

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }

    public function agentClosedBy()
    {
        return $this->belongsTo(User::class, 'agent_closed_by');
    }

    public function panelFeedBackBy()
    {
        return $this->belongsTo(User::class, 'panel_feed_back_by');
    }

    public function ticketType()
    {
    	return $this->belongsTo(TicketType::class, 'ticket_type_id');
    }

    public function ticketStatus()
    {
    	return $this->belongsTo(TicketStatus::class, 'ticket_status_id');
    }

    public function district()
    {
    	return $this->belongsTo(District::class, 'district_id');
    }

    public function policeStation()
    {
    	return $this->belongsTo(PoliceStation::class, 'police_station_id');
    }

    public function ticketDetails()
    {
        return $this->hasMany('App\Models\TicketDetail', 'ticket_id');
    }
}
