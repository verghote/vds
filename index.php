<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

//  Comptabilisation de l'appel
StatPage::comptabiliser("Accueil");



// chargement des données

// Chargement des derniers classements présents dans le répertoire 'data/classement'
$lesClassements = json_encode(array_map('basename', glob('data/classement/*.pdf')));

// transmission des données à l'interface
$head = <<<EOD
    <script>
        let lesClassements = $lesClassements;
    </script>
EOD;

// chargement de l'interface
require RACINE . "/include/interface.php";


