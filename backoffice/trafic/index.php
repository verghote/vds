<?php

// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . '/include/autoload.php';

// Gestion de l'authentification
Jeton::creer();

$titre = "Trafic IP";
// récupération des enregistrements de la table traficip
$data = json_encode(TraficIp::getAll());

// chargement de l'interface

// transmission des données et composant à l'interface
$head = <<<EOD
    <script>
        let data = $data;
    </script>
EOD;

// chargement de l'interface
require RACINE . "/backoffice/include/interface.php";