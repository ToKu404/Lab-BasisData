<?php

$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "login_administrasi";

if(!$con = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname)) 
{

    die("failed to connect!");
}

?>