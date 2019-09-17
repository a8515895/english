<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Verify extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('Model');
        $this->load->library('myfunction');
        if($this->session->userdata("username")){
            redirect('/', 'refresh');
        }  
    }
    function index(){    
        $this->load->view('load_verify');
    }
    function login(){
        $user_name = $this->input->post("username");
        $password = $this->input->post("password");
        if($user = $this->Model->query("student",["where"=>["username"=>$user_name,"password=>$password"],"first_row"=>true])){
            $this->session->set_userdata("username",$user->username);
            $this->session->set_userdata("id",$user->id);
            $this->session->set_userdata("email",$user->email);
            $this->session->set_userdata("avatar",$user->avatar);
            echo json_encode(array("err"=>0,"msg"=>"Tên đăng nhập hoặc mật khẩu không khớp","redirect"=>"/"));
            return;
        }
        echo json_encode(array("err"=>1,"msg"=>"Tên đăng nhập hoặc mật khẩu không khớp"));
    }
}
