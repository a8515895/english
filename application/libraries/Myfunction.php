<?php
class Myfunction{    
    protected $CI;
    private $_key = "huynhanhkhoa_28/09/1995@sega-group.com";
    public function __construct(){
            $this->CI =& get_instance();
    }
    function test(){
        return "123";
    }
    function hash($text,$key="",$type="aes-256"){
        if(empty($key)) $key = $this->_key;
        $this->CI->load->library('encryption');
        $this->CI->encryption->initialize(
            array(
                    'cipher' => $type,
                    'mode' => 'CBC',
                    'key' => $key
            )
        );
        return $this->CI->encryption->encrypt($text);
    }
    function decryption($ciphertext,$key="",$type="aes-256"){  
        if(empty($key)) $key = $this->_key;
        $this->CI->load->library('encryption');
        $this->CI->encryption->initialize(
            array(
                    'cipher' => $type,
                    'mode' => 'CBC',
                    'key' => $key
            )
        );      
        return $this->CI->encryption->decrypt($ciphertext);
    }
    function xoaDau($str){
        if(!$str) return false;
        $str = trim($str);
        $unicode = array(
            'a' => 'á|à|ả|ã|ạ|ă|ắ|ằ|ặ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ|A|Á|À|Ả|Ã|Ạ|Ă|Ắ|Ằ|Ẳ|Ẵ|Ặ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
            'd' => 'đ|Đ',
            'e' => 'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ|E|É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
            'i' => 'í|ì|ỉ|ĩ|ị|I|Í|Ì|Ỉ|Ĩ|Ị',
            'o' => 'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ|O|Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
            'u' => 'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự|U|Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
            'y' => 'ý|ỳ|ỷ|ỹ|ỵ|Y|Ý|Ỳ|Ỷ|Ỹ|Ỵ',        
        );
        foreach ($unicode as $nonUnicode => $uni)
            $str = preg_replace("/($uni)/i",$nonUnicode,$str);
        $str = strtolower(str_replace(' ','-',$str));           // Replaces all spaces with hyphens.
        $str = preg_replace('/[^A-Za-z0-9\-]/', '', $str);      // Removes special chars.
        $str = preg_replace('/-+/', '-', $str);               // Replaces multiple hyphens with single one.	
        return $str;
    }
    function limitChar($str,$limit=30){
        return mb_substr($str,0,$limit)."...";
    }
    function drawTable($data){
        foreach ($data as $val){
            $table[] = array_values($val);
        }
        $item['table'] = array(
            "draw" => 1,
            "recordsTotal" => 2,
            "recordsFiltered" => 2,
            'data' => $table,
        );
        return $item;
    }
}