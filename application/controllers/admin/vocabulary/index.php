<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Index extends CI_Controller{
    private $uploadPath = './public/';
    function __construct(){
        parent::__construct();
        $this->load->model('Model');
        $this->load->library('myfunction');
    }
    function index(){
        $action = $this->input->get('action');
        if($action == 'list'){
            $this->loadTable();
        }
    }
    function loadTable(){
        $data['title'] = 'Từ vựng';
        $data['href'] = 'vocabulary';
        $data['header'] = array('Từ vựng','Tiếng Anh','Tiếng Việt');
        $this->load->view('admin/list',$data);
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
                $highestColumn = $sheet->getHighestColumn();
                for ($row = 1; $row <= $highestRow; $row++){
                    $rowData[] = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row,
                        NULL,
                        TRUE,
                        FALSE);
                }
                echo "<pre>";
                print_r($rowData);
                echo "</pre>";
                unlink($file);
            }
        }
    }
}