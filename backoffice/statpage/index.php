<?php

// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

$titre = "Statistiques des pages";
$date = date("Y-m-d");

// récupération des séances
$data = json_encode(StatPage::getAll());

// transmission des données à l'interface
$head = <<<EOD
    <script>
        let data = $data;
        let date = '$date';
    </script>
EOD;


// chargement de l'interface
require RACINE . "/backoffice/include/interface.php";