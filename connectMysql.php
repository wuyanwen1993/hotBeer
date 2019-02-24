<?php
/**
 * Created by PhpStorm.
 * User: mark
 * Date: 2019/2/4
 * Time: 3:35
 */

// 采用mysqli来连接数据库并进行数据处理
//注意采用单例模式来避免重复实例化mysqli 对象
class connectMysql
{
    private static $mysqli;
    private static $instance;
    private static $host;
    private static $user;
    private static $passwd;
    private static $db_name;
    private static $port;
    private static $charset;

    // 私有的构造方法，阻止在类的外部实例化对象
    private function __clone()
    {
    }

    private function __construct($db_config)
    {
        // 单例模式，仅生成一次对象
        self::getSingeton();
        $array = array('host', 'user', 'passwd', 'db_name', 'port', 'charset');
        array_map(function($key, $db_config){
            if(array_key_exists($key, $db_config))
            {
                self::$key = $db_config[$key];
            }
            else{
                return '数据库属性' . $key . '未设定';
            }
        }, $array);
        self::$mysqli = new mysqli(self::$host, self::$user, self::$passwd,
            self::$db_name, self::$port, self::$charset);
    }

    /*
     * 获取单例对象
     * */
    public static function getSingeton($db_config)
    {
        // 判断是否实例化对象
        if(! self::$instance instanceof self)
        {
            self::$instance = new self($db_config);
        }
        return self::$instance;
    }
}