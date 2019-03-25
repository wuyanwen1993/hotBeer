<?php
/**
 * Created by PhpStorm.
 * User: mark
 * Date: 2019/3/18
 * Time: 5:10
 */
declare(strict_types = 1); // 开启强类型模式
spl_autoload_register(function(string $className){
    include $className;
});