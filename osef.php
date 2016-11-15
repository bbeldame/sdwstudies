<?php

session_start();

function test_activity() {
	$time = time();
	if ($time - $_SESSION['user']['timestamp'] > 200) {
		unset($_SESSION['user']);
	} else {
		$_SESSION['user']['timestamp'] = $time;
	}
}

test_activity();

if (isset($_POST) && !empty($_POST['user']['mail']) && !empty($_POST['user']['password'])) {

	try {
		$pdo = new PDO('mysql:host=localhost;dbname=books;', 'root', 'root');
	} catch (Exception $e) {
		die($e->getMessage());
	}

	$que = $pdo->prepare('SELECT email FROM customer WHERE email=:email AND password=:password');
	$que->execute(array(':email' => $_POST['user']['mail'], ':password' => md5($_POST['user']['password'])));
	$res = $que->fetch(PDO::FETCH_ASSOC);
	echo '<pre>' . print_r($res, 1) . '</pre>';
	if (!empty($res)) {
		$_SESSION['user']['mail'] = $res['email'];
		$_SESSION['user']['timestamp'] = time();
	}
}

if (empty($_SESSION['user'])) {

?>

<form method="post" action="index.php">
	Email : <input type="text" name="user[mail]" /><br>
	Password : <input type="password" name="user[password]" /><br>
	<br>
	<input type="submit" value="Se connecer !" />
</form>

<?php
} else {
?>

Bonjour <?php echo $_SESSION['user']['mail']; ?>, vous êtes en activité depuis
<?php echo time() - $_SESSION['user']['timestamp']; ?> secondes.

<?php
}
?>
