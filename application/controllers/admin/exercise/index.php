<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Index extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('Model');
        $this->load->library('myfunction');
        $this->load->helper('form'); 
    }
    function index(){
        $data['href'] = 'exercise';
        $data['action'] = $this->input->get('action');
        $this->load->view('admin/admin',$data);
    }
    function indexAjax(){
        $action = $this->input->get('action');
        if($action == 'list'){
            $this->loadTable();
        }elseif($action == 'add'){
            $this->loadAdd();
        }
    }
    function loadTable(){
        $data['title'] = 'Bài tập';
        $data['href'] = 'exercise';
        $data['header'] = array('id'=>'Bài tập','name'=>'Tên bài tập','active'=>'Trạng thái','count'=>'Số câu','created_at'=>'Ngày tạo','update_at'=>'Ngày cập nhật','action'=>'Action');
        $this->load->view('admin/list',$data);
    }
    function loadAdd(){
        $data['title'] = 'Từ vựng';
        $this->load->view('admin/exercise/add',$data);
    }
    function add(){
        if(empty($this->input->post('e_name')) || empty($this->input->post('v_name')) || empty($this->input->post('spell'))){
            echo json_encode(array("err"=>1,"msg"=> "Điền đầy đủ thông tin"));
            return;
        }
        $arr['e_name'] =strtolower(trim($this->input->post('e_name')));
        $arr['v_name'] =strtolower(trim($this->input->post('v_name')));
        $arr['spell'] = strtolower(trim($this->input->post('spell')));
        $arr['category'] = $this->input->post('category');
        $arr['type'] = $this->input->post('type');
        if($this->Model->isEmptyVocabulary($arr['e_name'],$arr['type'])){
            $this->Model->insert("vocabulary",$arr);
            echo json_encode(array("err"=>0,"msg"=> "Thêm từ vựng thành công"));
        }else{
            echo json_encode(array("err"=>1,"msg"=> "Từ này đã tồn tại"));
        }
        
        
    }
}