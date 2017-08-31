<?php
abstract class Tariff {

    protected $value;
    public function getTariff()
    {
        return $this->value;
    }
}
abstract class Lessons {
    private $tariff;
    private $quantity;
    public function __construct($tariff, $quantity)
    {
        $this->tariff  = $tariff;
        $this->quantity = $quantity;
    }
    public function getCost()
    {
        echo $this->tariff  * $this->quantity;
    }

}
class Speaking extends Lessons {}
class Grammar extends Lessons {}
class Fixed extends Tariff {
    protected $value = 200;
}
class Hourly extends Tariff {
    protected $value = 100;
}
class Factory {

    public static function make($type)
    {
        $className = $type['type'];

        if(class_exists($type['tariff']) && class_exists($className)) {

            $tariff = new $type['tariff'];
            return new $className($tariff->getTariff(), $type['quantity']);

        } else {

            throw new Exception('Class not exist');
        }

    }
}
class LessonController
{
    public function create($type)
    {
        $product = Factory::make($type);
        return $product;
    }
}
$typeLessons = array(
    "speaking" => array(
        'type'  => 'Speaking',
        'tariff' => 'fixed',
        'quantity' => 2
    ),
    "grammar" => array(
        'type'  => 'Grammar',
        'tariff' => 'hourly',
        'quantity' => 1
    )
);
$lesson = new LessonController();
foreach($typeLessons as $key=>$type) {
    try {
        $obj[] = $lesson->create($type);
    } catch(Exception $e) {
        echo $e->getMessage();
    }
}

print_r($obj);