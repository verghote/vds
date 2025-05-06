<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . '/include/autoload.php';

// vérifier l'authorisation d'accès
Jeton::verifier();

// suppression de l'ensemble des fichiers .sql du répertoire sql
$lesFichiers = glob("sql/*.sql");
foreach ($lesFichiers as $fichier) {
    if (is_file($fichier)) {
        unlink($fichier);
    }
}

// retour sur la page d'accueil du module
header("Location: index.php");

