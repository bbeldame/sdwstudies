<?php

class Question {
    private $_goodAnswer;
    private $_question;
    private $_answers = array();

    private function getGoodAnswer() { return $this->_goodAnswer; }
    public function getQuestion() { return $this->_question; }
    private function getAnswers() { return $this->_answers; }
    private function setGoodAnswer($a) { $this->_goodAnswer = $a; }
    private function setQuestion($a) { $this->_question = $a; }
    private function setAnswers($a) { $this->_answers = $a; }

    public function getAnswer($id) {
        $data = $this->getAnswers();
        return $data[$id]->answer;
    }

    public function getAnswersLength() {
        return count($this->getAnswers());
    }

    public function isGoodAnswer($id) {
        return $this->getGoodAnswer() == $id ? 1 : 0;
    }

    public function __construct($data) {
        $this->setGoodAnswer($data->good_answer);
        $this->setQuestion($data->question);
        $this->setAnswers($data->answers);
    }
}