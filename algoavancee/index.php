<?php

class Car {
	protected $_registrationNumber;
	protected $_dateOfFirstUsage;
	protected $_mileage;
	protected $_model;
	protected $_brand;

	public function __construct($brand) {
		$this->setBrand($brand);
	}

	public function getBrand() {return $this->_brand;}
	public function getRegistrationNumber() {return $this->_registrationNumber;}
	public function getMileage() {return $this->_mileage;}
	public function getModel() {return $this->_model;}
	public function getDateOfFirstUsage() {return $this->_dateOfFirstUsage;}

	public function setBrand($a) {$this->_brand = $a;}
	public function setRegistrationNumber($a) {$this->_registrationNumber = $a;}
	public function setMileage($a) {$this->_mileage = $a;}
	public function setModel($a) {$this->_model = $a;}
	public function setDateOfFirstUsage($a) {$this->_dateOfFirstUsage = $a;}
}

class UtilityCar extends Car {
	private $_weightEmpty;
	private $_maxWeightCapacity;

	public function __construct($brand) {
		parent::__construct($brand);
	}

	public function getWeightEmpty() {return $this->_weightEmpty;}
	public function getMaxWeightCapacity() {return $this->_maxWeightCapacity;}

	public function setWeightEmpty($a) {$this->_weightEmpty = $a;}
	public function setMaxWeightCapacity($a) {$this->_maxWeightCapacity = $a;}
}

class Commercial {
	protected $_name;

	public function __construct($name) {
		$this->setName($name);
	}

	public function getName() {return $this->_name;}

	public function setName($a) {$this->_name = $a;}
}

class CommercialCar extends Car {
	private $_commercial;

	public function __construct($brand) {
		parent::__construct($brand);
	}

	public function getCommercial() {return $this->_commercial;}

	public function setCommercial($a) {$this->_commercial = new Commercial($a);}
}

$voiture1 = new UtilityCar('Renault');
$voiture1->setModel('108');
echo $voiture1->getBrand();

$voiture2 = new CommercialCar('Peugeot');
$voiture2->setCommercial('Henry');
echo $voiture2->getCommercial()->getName();