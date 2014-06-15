<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Reminder_controller extends VERTEX_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Reminder_Model');
    }

    public function index()
    {
        $this->view_page('site/index', 'My Blog Title', 'My Blog Description');
    }
    
    public function create()
    {
        $userId = $this->session->userdata('user_id');
        $phone = $this->input->post('phonenumberInput', TRUE);
        $dateTime = $this->input->post('datetimepicker', TRUE);
        $message = $this->input->post('textInput', TRUE);
        $repeat = $this->input->post('repeatInput', TRUE);
        
        $this->Reminder_Model->createRemind($userId, $phone, $dateTime, $message, $repeat);
    }
}
