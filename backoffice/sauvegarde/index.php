<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// Gestion de l'authentification
Jeton::creer();

$titre = "Sauvegarde de la base de données";
// chargement des données
// récupération dans un tableau numérique des fichiers .sql du répertoire data/database
$lesFichiers = glob("sql/*.sql");
//retirer le chemin
$lesLignes = array_map('basename', $lesFichiers);

$data = $lesLignes ? json_encode($lesLignes) : '[]';

$head =<<<EOD
    <!-- données transmises -->
    <script>
        let data = $data
    </script>
EOD;

require RACINE . "/backoffice/include/interface.php";