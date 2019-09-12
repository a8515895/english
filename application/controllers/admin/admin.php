<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Admin extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Model');
        $this->load->library('myfunction');
        if(!$this->session->userdata("username")){
            redirect('/verify', 'refresh');
        }    
    }

    function index(){
        $data['action'] = 'list';
        $this->load->view('admin/admin',$data);
    }
}