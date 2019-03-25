<?php
/**
 * Created by PhpStorm.
 * User: mark
 * Date: 2019/2/27
 * Time: 8:01
 */


$redis = new Redis();
$redis->connect('127.0.0.1', 6379);
$redis->auth('123456');
