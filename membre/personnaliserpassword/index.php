<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// Il faut être connecté pour accéder à cette page
Membre::controlerAcces();

// il faut être concerné par la personnalisation
if (!isset($_SESSION['personnaliser'])) {
   header('location:/');
   exit;
}

// générer le jeton
$token = Jeton::creer();

// transmission des données à l'interface : le jeton
$head = <<<EOD
 <script>
    let token = '$token';
 </script>
EOD;

// chargement de l'interface
require RACINE . "/include/interface.php";
