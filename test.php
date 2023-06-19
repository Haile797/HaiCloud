<?php
session_start();
if (isset($_POST['btnLogin'])) {

	echo $us = $_POST['txtUsername'];
	echo $pa = $_POST['txtPass'];
	include_once("con2.php");
	$dblink = $c->connectToPDO();
	$sql = "SELECT Username, Password, state FROM Customer WHERE Username= ? AND Password= ?";
	$stmt = $dblink->prepare($sql);
	$re = $stmt->execute(array($us, "$pa"));
	$numrow = $stmt->rowCount();
	$row = $stmt->fetch(PDO::FETCH_BOTH);
	if ($numrow == 1) {
		echo "Login successfully";
		$_SESSION["us"] = $us;
		$_SESSION["admin"] = $row["state"];
		// $_SESSION['admin'] = 1;
		// echo $_SESSION['admin'];
		echo '<meta http-equiv="refresh" content="0;URL=index.php"/>';
	} else {
		echo "You logged in fail";
	}
}
