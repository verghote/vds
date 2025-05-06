<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// vérification des données attendues
if (!isset($_GET['id'])) {
    Erreur::envoyerReponse("Le lien de réinitialisation est absent.", 'global');
}

// vérification de l'existence du token
$id = $_GET['id'];
$ligne = Oubli::getByToken($id);
if (!$ligne) {
    Erreur::envoyerReponse('Le lien de réinitialisation est invalide.', 'global');
}

// récupérer du login
$login = $ligne['login'];

// Vérification de la validité du token
if (!$ligne['valide']) {
    Oubli::supprimer($login);
    Erreur::envoyerReponse('Ce lien de réinitialisation a expiré, veuillez refaire une demande.', 'global');
}

// générer le jeton
$token = Jeton::creer();

// alimentation de l'interface
$head = <<<EOD
 <script>
    const token = '$token';
    const login = '$login'; 
 </script>
EOD;


// chargement de l'interface
require RACINE . "/include/interface.php";


