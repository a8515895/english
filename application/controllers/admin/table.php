<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Table extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Model');
        $this->load->library('myfunction');
    }

    function index(){
        $it['href'] = $this->input->get('href');
        switch ($it['href']){
            case 'category' :
                $data=$this->Model->getAllCategoryTable();
                break;
            case 'vocabulary' :
                $data=$this->Model->getAllVocalbularyTable();
                break;
        }
        if(empty($data)){
            $table = [];
        }else{
            foreach ($data as $val){
                $table[] = array_values($val);
            }
        }

        $it['table'] = array(
            "draw" => 1,
            "recordsTotal" => 2,
            "recordsFiltered" => 2,
            'data' => $table,
        );
        echo json_encode($it['table']);
    }
}