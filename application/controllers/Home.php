<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Home extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('Model');
        $this->load->library('myfunction');
    }
    function index(){        
        $this->load->view('load_home');
    }
    function not_found(){
        echo "404 NOT FOUND";
    }
}