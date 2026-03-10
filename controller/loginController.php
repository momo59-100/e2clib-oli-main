<?php

session_start();

require_once("../model/Data.php");

$bdd = new Data();

$email=$_POST["email"];
$password=$_POST["password"];
//var_dump($email, $password);//

$userData = $bdd->authentification($email);

if(!$userData){
 $message = "cette adresse mail n'est pas reconnu";   
} else if ($password !== $userData['password']){
  $message = "mauvais mot de passe";  
} else{
  $message = "connexion réussie"; 
  $_SESSION["userid"] = $userData["id"];
}

header("location: ../index.php?message=$message");
