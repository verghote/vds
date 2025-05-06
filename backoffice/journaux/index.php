<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// Contrôle de l'accès
Jeton::creer();

$titre = "Journaux d'activité";

// chargement des données
$lesJournaux = Journal::getListe();
$data = json_encode($lesJournaux);

$head =<<<EOD
    <script>
        let data = $data
    </script>
EOD;

// chargement de l'interface
require RACINE . "/backoffice/include/interface.php";