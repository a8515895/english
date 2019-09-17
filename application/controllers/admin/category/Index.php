<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Index extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('Model');
        $this->load->library('myfunction');
    }
    function index(){
        $action = $this->input->get('action');
        if($action == 'list'){
            $this->loadTable();
        }
    }
    function loadTable(){
        $data['title'] = 'Chủ đề';
        $data['href'] = 'category';
        $data['header'] = array('Chủ đề','Tiếng Anh','Tiếng Việt');
        $this->load->view('admin/list',$data);
    }
}
