<?php
class ShopProduct
{
    public $title = 'default product';
    public $producerMainName = 'main name';
    public $producerFirstName = 'first name';
    public $price = 0;

    function __construct($title, $producerMainName, $producerFirstName, $price)
    {
        $this->title = $title;
        $this->producerMainName = $producerMainName;
        $this->producerFirstName = $producerFirstName;
        $this->price = $price;
    }

    function getProducer()
    {
        return "{$this->producerMainName}" . "{$this->producerFirstName}";
    }

}
$product = new ShopProduct();
print $product->title;
?>