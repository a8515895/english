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
        $limit = $this->input->get('length');
        $start = $this->input->get('start');
        switch ($it['href']){
            case 'category' :
                $data=$this->Model->getAllTable($it['href'],$limit,$start);
                $total = $this->Model->getTotal('category');
                break;
            case 'exercise' :
                $data=$this->Model->getAllTable($it['href'],$limit,$start);
                break;
            case 'vocabulary' :
                $orderBy = "id DESC";
                $condition = '';
                if($this->input->get('order')[0]['column'] == 1) $orderBy = "e_name ".$this->input->get('order')[0]['dir'];              
                elseif($this->input->get('order')[0]['column'] == 0) $orderBy = "id ".$this->input->get('order')[0]['dir'];
                if(!empty($this->input->get('search')['value'])){
                    $condition = "`e_name` like '%".$this->input->get('search')['value']."%'";                    
                }
                $data=$this->Model->getAllTable($it['href'],$limit,$start,$orderBy,$condition);
                $total = $this->Model->getTotal($it['href']);
                break;
            case 'pharse' :
                $orderBy = "id DESC";
                $condition = '';
                if($this->input->get('order')[0]['column'] == 1) $orderBy = "e_name ".$this->input->get('order')[0]['dir'];              
                elseif($this->input->get('order')[0]['column'] == 0) $orderBy = "id ".$this->input->get('order')[0]['dir'];
                if(!empty($this->input->get('search')['value'])){
                    $condition = "`e_name` like '%".$this->input->get('search')['value']."%'";                    
                }
                $data=$this->Model->getAllTable($it['href'],$limit,$start,$orderBy,$condition);
                $total = $this->Model->getTotal($it['href']);
                break;

        }
        if(empty($data)){
            $table = [];
        }else{
            switch ($it['href']){
                case 'category' :
                    foreach ($data as $val){
                        $table[] = $val; 
                    }
                    break;
                case 'pharse' :
                    foreach ($data as $val){
                        $val['action'] ="<a href='".base_url()."edit/".$val['id']."'>Edit</a>";
                        $table[] = $val;                         
                    }
                    break;
                case 'vocabulary' :
                    $categorys = $this->Model->getAllTable("category");
                    $category = [];
                    foreach($categorys as $cate){
                        $category[$cate['id']] = $cate['e_name'];
                    }
                    
                    foreach ($data as $val){
                        $val['category'] = $category[$val['category']];
                        $val['action'] ="<a href='".base_url()."edit/".$val['id']."'>Edit</a>";
                        $table[] = $val;        
                    }
                    break;
            }

        }
        $it['table'] = array(
            "draw" => false,
            "recordsTotal" => $total,
            "recordsFiltered" =>$total,
            'data' => $table,
        );
        echo json_encode($it['table']);
    }
}