<?php

require_once('class.player.php');
require_once('class.question.php');

if (isset($_POST['func']) && is_callable($_POST['func'])) {
	echo call_user_func($_POST['func'], $_POST);
}

function init($post) {
	$player = new Player($post['name']);

	return json_encode(true);
}

function getQuestion($post) {
	$string = file_get_contents("./data/data.json");
	$json = json_decode($string);

	$question = new Question($json[$post['id']]);
	$res = array(
		'question' => $question->getQuestion(),
		'good_answer' => $question->getGoodAnswer(),
		'answers_length' => $question->getAnswersLength(),
		'answers' => $question->getAnswers()
	);

	return json_encode($res);
}