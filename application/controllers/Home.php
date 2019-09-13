<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Home extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('Model');
        $this->load->library('myfunction');
        if(!$this->session->userdata("username")){
            redirect('/verify', 'refresh');
        }        
    }
    function index(){   
        $data['avatar'] =  $this->session->userdata("avatar");
        $this->load->view('load_home',$data);
    }
    function exercise(){
        $data['excercises'] = $this->Model->getAllTable('exercise','','',"created_at desc");
        $data['avatar'] =  $this->session->userdata("avatar");
        $this->load->view('load_exercise',$data);
    }
    function exercise_detail(){
        $data['avatar'] =  $this->session->userdata("avatar");
        $id = $this->uri->segment(2);
        $data['excercises'] = $this->Model->getAllTable('exercise_detail','','',"created_at ASC",["id"=>$id]);
        $data['name'] = $this->Model->getTable('exercise',['id'=>$id])->name;
        $arrVol = [];
        $arrPharse = [];
        $arr = [];
        foreach($data['excercises'] as $it){
            if($it['class'] == 'vocabulary'){
                $arrVol[] = $it['vocabulary_id'];
            }else{
                $arrPharse[] = $it['vocabulary_id'];
            }
        }
        if(!empty($arrVol)){
            $arr=array_merge($arr,$this->Model->query("vocabulary",["where_in"=>["id"=> $arrVol],"select"=>"id,e_name,v_name,type"]));
        }
        if(!empty($arrPharse)){
            $arr=array_merge($arr,$this->Model->query("pharse",["where_in"=>["id"=> $arrPharse],"select"=>"id,e_name,v_name"]));
        }
        $data['test'] = $this->randomExcercise($arr);
        $data['exercise'] = $id;
        $this->load->view('load_exercise_detail',$data);
    }
    function lession(){
        $data['lessions'] = $this->Model->getAllTable('lession','','',"created_at desc");
        $data['avatar'] =  $this->session->userdata("avatar");
        $this->load->view('load_lession',$data);
    }
    function lession_detail(){
        $data['avatar'] =  $this->session->userdata("avatar");
        $id = $this->uri->segment(2);
        $data['lessions'] = $this->Model->getAllTable('lession_detail','','',"created_at ASC",["id"=>$id]);
        $data['name'] = $this->Model->getTable('lession',['id'=>$id])->name;
        $arrVol = [];
        $arrPharse = [];
        $arr = [];
        foreach($data['lessions'] as $it){
            if($it['class'] == 'vocabulary'){
                $arrVol[] = $it['vocabulary_id'];
            }else{
                $arrPharse[] = $it['vocabulary_id'];
            }
        }
        if(!empty($arrVol)){
            $arr=array_merge($arr,$this->Model->query("vocabulary",["where_in"=>["id"=> $arrVol],"select"=>"id,e_name,v_name,type"]));
        }
        if(!empty($arrPharse)){
            $arr=array_merge($arr,$this->Model->query("pharse",["where_in"=>["id"=> $arrPharse],"select"=>"id,e_name,v_name"]));
        }
        $data['test'] = $this->randomExcercise($arr);
        $data['lession'] = $id;
        $this->load->view('load_lession_detail',$data);
    }
    function randomExcercise($arr){
        $max = count($arr);
        $tmp_arr = [];
        $new_arr = [];
        while(count($tmp_arr)<$max){
            $numbers = rand(0, ($max-1));
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
        return $new_arr;
    }
    function saveLog(){
        $logs = $this->input->post('logs');
        $data = $this->input->post('data');
        $exercise = $this->input->post('exercise');        
        $id = $this->Model->insert("result_log",["exercise"=>$exercise,"student"=>$this->session->userdata("id"),"point"=>$data['point'],"true"=>$data['true'],"false"=>$data['false']]);
        foreach($logs as $key=>$log){
            $this->Model->insert("result_log_detail",
            [
                "id"=>$id,
                "vocabulary"=>$key,
                "class"=>$log['class'],
                "result"=>($log['result'] == "true") ? 1 : 0,
            ]);
        }
    }
    function not_found(){
        echo "404 NOT FOUND";
    }
}