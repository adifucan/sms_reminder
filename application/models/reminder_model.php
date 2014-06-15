<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Reminder_Model extends Parent_Model
{
    function __construct()
    {
        parent::__construct();
    }
    
    private function GetRemindType($int)
    {
        if ($int == 1) return 'week';
        else if ($int == 2) return 'month';
        else if ($int == 3) return 'year';
            
    }
    
    private function createSingleRemind($user_id, $phone_number, $send_datetime, $message)
    {
        // select  as r;
        //TODO date < datetime think
        $sql = 'insert into reminds (user_id, phone_number, send_datetime, status, message) 
                VALUES(?, ?, STR_TO_DATE(?, "%Y/%e/%c %H:%i"), "unsent", ?)';
        $this->run($sql, array($user_id, $phone_number, $send_datetime, $message));
    }
    
    private function createRepeatableRemind($user_id, $phone_number, $send_datetime, $message, $repeat)
    {
        $sql = 'insert into repeats (user_id, phone_number, daytime, day_week, day_month, day_year, remind_type, message, last_sent)
                VALUES(
                    ?, 
                    ?, 
                    TIME(STR_TO_DATE(?, "%Y/%e/%c %H:%i")),
                    DayOfWeek(STR_TO_DATE(?, "%Y/%e/%c %H:%i")),
                    DayOfMonth(STR_TO_DATE(?, "%Y/%e/%c %H:%i")),
                    DayOfYear(STR_TO_DATE(?, "%Y/%e/%c %H:%i")),
                    ?,
                    ?,
                    NULL)';
                    
        $this->run($sql, array($user_id, $phone_number, $send_datetime,$send_datetime,$send_datetime,$send_datetime, $this->GetRemindType($repeat), $message));
        
    }
    
    public function createRemind($user_id, $phone_number, $send_datetime, $message, $repeat)
    {
        $this->createSingleRemind($user_id, $phone_number, $send_datetime, $message);
        if ($repeat != 0)
            $this->createRepeatableRemind($user_id, $phone_number, $send_datetime, $message, $repeat);          
    }
}