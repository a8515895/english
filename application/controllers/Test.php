<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Test extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('Model');
        $this->load->library('myfunction');
    }
    function index(){
        echo "test2333";
    }
}