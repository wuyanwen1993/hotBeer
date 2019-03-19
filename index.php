<?php
class ShopProduct
{
    public $static = 'default product';        
    public $producerMainName = 'main name';
    public $producerFirstName = 'first name';
    public $price = 0;

    function __construct(){
        array_reverse();
    }

    public function getProducer(){
        Echo  "{$this->producerFirstName}" . "{$this->producerMainName}";
    }
};
$ShopProduct = new ShopProduct();
$ShopProduct->getProducer();
?>