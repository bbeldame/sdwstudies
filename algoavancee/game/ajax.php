<?php

session_start();

require_once('class.player.php');
require_once('class.question.php');

if (isset($_POST['func']) && is_callable($_POST['func'])) {
	echo call_user_func($_POST['func'], $_POST);
}

function init($post) {
	$player = new Player($post['name']);
	$_SESSION['player'] = serialize($player);

	return getPlayerInfo();
}

function getPlayerInfo() {
	$player = unserialize($_SESSION['player']);
	$res = array(
		'name' => $player->getName(),
		'points' => $player->getPoints()
	);

	return json_encode($res);
}

function getQuestion($post) {
	$question = new Question($post['id']);
	$_SESSION['question'] = serialize($question);
	$res = array(
		'question' => $question->getQuestion(),
		'answers_length' => $question->getAnswersLength(),
		'answers' => $question->getAnswers()
	);

	return json_encode($res);
}

function verifyAnswer($post) {
	$question = unserialize($_SESSION['question']);
	$player = unserialize($_SESSION['player']);

	if ($question->getGoodAnswer() == $post['id']) {
		$player->winPoints();
		$_SESSION['player'] = serialize($player);
		return json_encode(1);
	} else {
		$player->losePoints();
		$_SESSION['player'] = serialize($player);
		return json_encode(0);
	}
}

function getPlayerTheEnd() {
	$player = unserialize($_SESSION['player']);
	$res = array(
		'name' => $player->getName(),
		'points' => $player->getPoints(),
		'glory' => $player->getGlory()
	);

	return json_encode($res);
}