<?php

class Player {
	private $_name;
	private $_points;

	public function getName() { return $this->_name; }
	public function getPoints() { return $this->_points; }
	private function setName($a) { $this->_name = $a; }
	private function setPoints($a) { $this->_points = $a; }

	public function __construct($name) {
		$this->setPoints(0);
		$this->setName($name);
	}

	public function winPoints() {
		$this->setPoints($this->getPoints() + 1);
		return ($this->getPoints());		
	}
	public function losePoints() {
		if ($this->getPoints() > 0) {
			$this->setPoints($this->getPoints() - 0.5);
		}
		return ($this->getPoints());
	}
}