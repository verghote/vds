<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

$titre = "Statistiques des visites";

// récupération des données
$data = json_encode(StatVisite::getAll());
$stat = json_encode(StatVisite::getStat());
$date = date("Y-m-d");
// chargement de l'interface

// transmission des données à l'interface
$head = <<<EOD
    <script>
        let data = $data;
        let stat = $stat;
        let date = "$date";
    </script>
EOD;

// chargement de l'interface
require RACINE . "/backoffice/include/interface.php";