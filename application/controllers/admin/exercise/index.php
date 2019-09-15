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
        $data['action'] = empty($this->input->get('action'))? "list" : $this->input->get('action');
        $data['id'] = $this->input->get('id');
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
        $data['header'] = array('id'=>'Bài tập','name'=>'Tên bài tập','active'=>'Trạng thái','count'=>'Số câu','created_at'=>'Ngày tạo','updated_at'=>'Ngày cập nhật','action'=>'Action');
        $this->load->view('admin/list',$data);
    }
    function loadAdd(){
        $data['title'] = 'Bài tập';
        $data['categorys'] = $this->Model->getAllTable('category');
        $this->load->view('admin/exercise/add',$data);
    }
    function loadVocabulary($filter = []){
        $condition = [];        
        $arr=[];
        $class = [];
        if(!empty($filter)){
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
        return $arr;
    }
    function loadTableVocabularyInExcercise(){
        $data['vocabulary'] = [];
        $data['vocabulary'] = $this->loadVocabulary($this->input->post('filter'));   
        $this->load->view('admin/exercise/table-vocabulary',$data);
    }
    function randomExcercise(){
        $arr = $this->loadVocabulary();
        $max = $this->input->get('count');
        $tmp_arr = [];
        $new_arr = [];
        if($max > count($arr)) $max = count($arr);
        while(count($tmp_arr)<$max){
            $numbers = rand(0, (count($arr)-1));
            if(empty($tmp_arr)){
                $tmp_arr[] = $numbers;
            }else{
                $check = true;
                foreach($tmp_arr as $it){
                    if($numbers == $it) $check = false;
                }
                if($check) $tmp_arr[] = $numbers;
            }
        }
        foreach($tmp_arr as $it){
            $new_arr[] = $arr[$it];
        }        
        echo json_encode($new_arr);
    }
    function delete(){
        $id = $this->uri->segment(4);
        $this->Model->delete('exercise',['id'=>$id]);
    }
    function add(){
        $data = $this->input->post('data');
        $name = $this->input->post('name');
        $id = $this->Model->insert('exercise',['name'=>$name,'count'=>count($data),"student"=>$this->session->userdata("id")]);
        foreach($data as $it){
            $this->Model->insert('exercise_detail',['class'=>$it['class'],'vocabulary_id'=>$it['id'],'id'=>$id]);
        }
        echo json_encode(array("err"=>0,"msg"=>"Thêm thành công"));
    }
}