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
        $data['title'] = 'Bài tập';
        $data['categorys'] = $this->Model->getAllTable('category');
        $this->load->view('admin/exercise/add',$data);
    }
    function loadTableVocabularyInExcercise(){
        $condition = [];
        $data['vocabulary'] = [];
        $arr=[];
        $class = [];
        if(!empty($this->input->post('filter'))){
            $filter = $this->input->post('filter');
            if(!empty($filter['vocabulary'])){
                $condition[] = "e_name like '%".$filter['vocabulary']."%'";
            }
            if(!empty($filter['class'])){
                if($filter['class'] == 'vocabulary') $class['pharse'] = true;
                else $class['vocabulary'] = true;
            }
        }
        if(empty($class['vocabulary'])){
            $conditionVocabulary = [];
            if(!empty($filter['category'])) $conditionVocabulary = ['category'=>$filter['category']];
            if(!empty($filter['type'])) $conditionVocabulary = ['type'=>$filter['type']];
            foreach($this->Model->query('vocabulary',["select"=>"id,e_name,v_name,spell,category,type","whereArray"=>[$condition,$conditionVocabulary]]) as $vocabulary){
                $new_arr['id'] = $vocabulary['id'];
                $new_arr['class'] = 'vocabulary';
                $new_arr['e_name'] = $vocabulary['e_name'];
                $new_arr['v_name'] = $vocabulary['v_name'];
                $new_arr['type'] = $vocabulary['type'];
                $arr[]=$new_arr;
                $new_arr = [];
            }
        }
        if(empty($class['pharse'])){
            foreach($this->Model->query('pharse',["select"=>"id,e_name,v_name","whereArray"=>$condition]) as $pharse){
                $new_arr['id'] = $pharse['id'];
                $new_arr['class'] = 'pharse';           
                $new_arr['e_name'] = $pharse['e_name'];
                $new_arr['v_name'] = $pharse['v_name'];
                $arr[]=$new_arr;
                $new_arr = [];
            }
        }
        $data['vocabulary'] = $arr;
        $this->load->view('admin/exercise/table-vocabulary',$data);
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