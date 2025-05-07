<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// Si l'utilisateur est déja connecté, on le redirige vers son profil
if (isset($_SESSION['membre'])) {
    header("location:/");
    exit;
}

// contrôle d'accès
$nbTentative = Tentative::getNb();
if ($nbTentative >= 5) {
    $minutes = Tentative::getTempsAttenteRestant();
    $minutes = $minutes === 1 ? 'une minute' : "$minutes minutes";
    Erreur::envoyerReponse("Vous devez encore attendre $minutes avant de pouvoir vous connecter ", 'global');
}

// générer le jeton
$token = Jeton::creer();

// chargement des données


// transmission des données à l'interface
$head = <<<EOD
 <script>
    let token = '$token';
 </script>
EOD;


// chargement de l'interface
require RACINE . "/include/interface.php";


