<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Admin_controller extends VERTEX_Controller
{
    private $is_admin;

    function __construct()
    {
        parent::__construct();
        $this->load->model('Articles_Model');
        $this->load->model('Admin_Model');

        $this->is_admin = $this->session->userdata('is_admin');
        if ($this->is_admin !== 'admin' && (uri_string() !== 'admin/auth') && (uri_string() !== 'admin/login'))
            redirect(base_url('/admin/auth'), 'location', 303);
    }

    protected function view_header($title)
    {
        $top_menu = array(
            array('r_title' => 'Blog', 'href' => '/admin/blog', 'selected' => ''),
            array('r_title' => 'Categories', 'href' => '/admin/categories', 'selected' => '')
        );

        $page = uri_string();

        if ($page === 'admin/blog')
            $top_menu[0]['selected'] = 'font-weight: bold';
        if ($page === 'admin/categories')
            $top_menu[1]['selected'] = 'font-weight: bold';

        $log_off = '';
        if ($this->is_admin)
            $log_off = $this->parser->parse('admin/logoff', array(), TRUE);
        echo $this->parser->parse('admin/header', array('title' => $title, 'logoff' => $log_off, 'top_menu' => $top_menu), TRUE);
    }

    protected function view_page($page, $title, $description, $params = NULL)
    {
        $this->view_header($title, $description);
        echo $this->parser->parse($page, $params === NULL ? array() : $params, TRUE);
        $this->view_footer();
    }

    protected function view_footer()
    {
        echo $this->parser->parse('admin/footer', array(), TRUE);
    }

    public function auth()
    {
        $this->view_page('admin/auth', 'please do auth', '');
    }

    public function login()
    {
        $login = $this->input->post('login', TRUE);
        $password = $this->input->post('pass', TRUE);

        $user = $this->Admin_Model->check_login($login, md5($password));
        if ($user === FALSE)
        {
            redirect(base_url('/admin/auth'), 'location', 303);
        }
        else
        {
            $this->session->set_userdata('is_admin', 'admin');
            redirect(base_url('/admin'), 'location', 303);
        }
    }

    public function logoff()
    {
        $this->session->unset_userdata('is_admin');
        redirect('/admin/auth', 'redirect', 303);
    }

    public  function index()
    {
        redirect("/admin/blog", 'refresh');
    }

    public function blog()
    {
        $articles = $this->Articles_Model->get_all_articles();
        if (!is_array($articles))
            $articles = array();

        for ($i = 0; $i < count($articles); $i++)
            $articles[$i]['text'] = substr($articles[$i]['text'], 0, 255);

        $params = array(
            'articles' => $articles
        );

        $this->view_page('admin/articles', 'Articles', '', $params);
    }
}
