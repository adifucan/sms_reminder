<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Front_controller extends VERTEX_Controller
{
    function __construct()
    {
        parent::__construct();
        //$this->load->model('Articles_Model');
    }

    public function index()
    {
        $this->view_page('site/index', 'My Blog Title', 'My Blog Description');
    }
}
