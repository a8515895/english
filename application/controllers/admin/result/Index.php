<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Index extends CI_Controller{
    private $uploadPath = './public/';
    function __construct(){
        parent::__construct();
        $this->load->model('Model');
        $this->load->library('myfunction');
        $this->load->helper('form'); 
    }
    function index(){
        $data['href'] = 'result';
        $data['action'] = $this->input->get('action');
        $data['id'] = $this->input->get('id');
        $this->load->view('admin/admin',$data);
    }
    function indexAjax(){
        $action = $this->input->get('action');
        if($action == 'list'){
            $this->loadTable();
        }elseif($action == 'edit'){
            $this->loadEdit();
        }
    }
    function loadTable(){
        $data['title'] = 'Kết quả';
        $data['href'] = 'result';
        $data['header'] = array('id'=>'Kết quả','exercise'=>'Bài tập','point'=>'Số điểm','true'=>'Số câu đúng','false'=>'Số câu sai','action'=>'Detail');
        $this->load->view('admin/list',$data);
    }
    function loadEdit(){    
        $data['title'] = 'Kết quả';    
        $data['href'] = 'result';
        $this->load->view('result/edit',$data);
    }
}