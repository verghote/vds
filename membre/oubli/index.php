<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// générer le jeton
$token = Jeton::creer();

// alimentation de l'interface
$head = <<<EOD
 <script>
    let token = '$token';
 </script>
EOD;

// chargement de l'interface
require $_SERVER['DOCUMENT_ROOT'] . "/include/interface.php";