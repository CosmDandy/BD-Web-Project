<?php
session_start();
$localhost = "localhost";
$db = "project";
$user = "admin";
$password = "admin";
$link = mysqli_connect($localhost, $user, $password) or trigger_error(mysql_error(), E_USER_ERROR);
$select = mysqli_select_db($link, $db);
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
mysqli_query($link, "SET NAMES cp1251;") or die(mysqli_error());
mysqli_query($link, "SET CHARACTER SET cp1251;") or die(mysqli_error());
?>