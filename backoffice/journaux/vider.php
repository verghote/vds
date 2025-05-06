<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . '/include/autoload.php';

// Vérification de l'authentification
Jeton::verifier();

// contrôle de la transmission du paramètre attendu
if (!isset($_GET['journal']) ) {
    Erreur::envoyerReponse("Le nom du journal à supprimer n'est pas transmis ", 'global');
}

// récupération du paramètre
$journal = $_GET['journal'];

// vérification de la valeur du paramètre attendu
// uniquement des caractères alphanumériques et le tiret bas
if (!preg_match('/^[a-zA-Z0-9_]+$/', $journal)) {
    Erreur::envoyerReponse("Le nom du journal à supprimer n'est pas valide", 'global');
}

// vérification de l'existence du fichier
if (!Journal::verifierExistence($journal)) {
    Erreur::envoyerReponse("Le journal à supprimer n'existe pas", 'global');
}

// suppression du fichier
Journal::supprimer($journal);

// retour sur la page d'accueil du module
header('Location: index.php');
