<?php
// load configuration file
require_once('config.php');
// load error handling module
require_once('error_handler.php');

$mysqli = new mysqli(DB_HOST,DB_USER,DB_PASSWORD,DB_DATABASE);
$hint = $_GET['q'];
$retorno = "<ul>";
$query = 'SELECT Nombre FROM `persona` WHERE Nombre LIKE "%'. $hint . '%"';
$result = $mysqli->query($query);
$i = 0;
while($row = $result->fetch_assoc()) {
    $aName =$row["Nombre"];
    $retorno .= "<li class='list' onclick='getNombre(this.innerHTML);'>" . $aName .  "</li>";
    $i++;
    if($i>6){
        break;
    }
}

$retorno .= "</ul>";

$mysqli->close();
echo $retorno;