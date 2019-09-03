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
        $action = $this->input->get('action');
        if($action == 'list'){
            $this->loadTable();
        }elseif($action == 'add'){
            $this->loadAdd();
        }
    }
    function loadTable(){
        $data['title'] = 'Cụm từ';
        $data['href'] = 'pharse';
        $data['header'] = array('Cụm từ','Tiếng Anh','Tiếng Việt');
        $this->load->view('admin/list',$data);
    }
    function loadAdd(){
        $data['title'] = 'Từ vựng';
        $data['categorys'] = $this->Model->getAllCategoryTable();
        $this->load->view('admin/pharse/add',$data);
    }
    function postExcel(){        
        if(isset($_FILES['fileExcel'])){
            $allowedFileType = array('application/vnd.ms-excel','text/xls','text/xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            if(in_array($_FILES["fileExcel"]["type"],$allowedFileType)) {
                $targetPath = $this->uploadPath . $_FILES['fileExcel']['name'];
                move_uploaded_file($_FILES['fileExcel']['tmp_name'], $targetPath);
                $file = $targetPath;
                $this->load->library('excel');
                $objPHPExcel = PHPExcel_IOFactory::load($file);
                $sheet = $objPHPExcel->getSheet(0);
                $highestRow = $sheet->getHighestRow();
                $totalCol = PHPExcel_Cell::columnIndexFromString('E');
                $arr = [];
                $count = 0;
                for ($row = 2; $row <= $highestRow; $row++){
                    for($col = 0;$col < $totalCol; $col++){
                        $i = '';
                        $val = strtolower(trim($sheet->getCellByColumnAndRow($col,$row)->getValue()));
                        switch($col){
                            case 0: $i = 'e_name';                             
                            break;
                            case 1: $i = 'spell';                             
                            break;
                            case 2: $i = 'type';                             
                            break;
                            case 3: $i = 'v_name';                             
                            break;
                            case 4: $i = 'category';                             
                            break;
                        }
                        $arr[$i] = $val;
                        if(empty($i)) continue;                 
                    };   
                    if($this->Model->isEmptyVocabulary($arr['e_name'],$arr['type'])){                        
                        $this->Model->insert("vocabulary",$arr);
                        $count++;
                    }       
                    $arr = [];
                }
                unlink($file);
                echo json_encode(array("err"=>0,"msg"=>"Bạn vừa thêm $count từ vào bảng"));               
            }else{
                echo json_encode(array("err"=>1,"msg"=>"Không phải file excel"));
            }            
        }else{
            echo json_encode(array("err"=>1,"msg"=>"File không tồn tại"));
        }        
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