<?php
/**
 * Created by PhpStorm.
 * User: mark
 * Date: 2019/3/18
 * Time: 5:10
 */
spl_autoload_register(function($className){
    include strval($className);
});