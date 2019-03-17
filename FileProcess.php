<?php
/**
 * Created by PhpStorm.
 * User: mark
 * Date: 2019/3/18
 * Time: 3:57
 */
namespace  \FileProcess;
class FileProcess
{
    protected  $obj = null;

    function __construct()
    {
        // 返回单例
        return $this->instantiation();
    }

//    单例化对象
    public function instantiation(){
        if(is_null($this->obj)){
            $this->obj = new self();
        }
        elseif(! is_null($this->obj) && $this->obj instanceof self){
            return $this->obj;
        }
    }
//    创建文件
    public function createTmpFile($file_path){
        fopen($file_path,'w') or die("can't create file ");
    }

    public function readFile(){

    }
}