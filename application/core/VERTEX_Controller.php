<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class VERTEX_Controller extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        //$this->load->model('Parent_Model');
    }

    protected function view_header($title, $description)
    {
        echo $this->parser->parse('site/header/header', array(), TRUE);
    }

    protected function view_footer()
    {
        echo $this->parser->parse('site/footer/footer', array(), TRUE);
    }

    protected function view_page($page, $title, $description, $params = NULL)
    {
        $this->view_header($title, $description);
        echo $this->parser->parse($page, $params === NULL ? array() : $params, TRUE);
        $this->view_footer();
    }

    public function page404()
    {
        echo $this->view_page('site/pages/404','404', array());
        exit;
    }
}

