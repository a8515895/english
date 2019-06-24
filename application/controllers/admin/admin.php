<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Admin extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Model');
        $this->load->library('myfunction');
    }

    function index(){
        $data['title'] = 'Chủ đề';
        $this->load->view('admin/admin',$data);
    }
}