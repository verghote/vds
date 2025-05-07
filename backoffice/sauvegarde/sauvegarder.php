<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . '/include/autoload.php';

// vérification de l'authentification
Jeton::verifier();

// chargement du composant
require RACINE . '/vendor/autoload.php';
use Ifsnop\Mysqldump as IMysqldump;

// nom du fichier de sauvegarde
$date = date('Y-m-d-H-i-s');
$file = "sql/$date.sql";

// Paramètre de connexion à la base
$config = Database::getLesParametres();

$dbHost = $config['host'];
$dbBase = $config ['database'];
$dbUser = $config['user'];
$dbPassword = $config['password'];

// Paramètres de la sauvegarde
$lesParametres = [
    'routines' => true,
    'skip-definer' => true,
    'add-drop-table' => true,
    'add-drop-trigger' => true,
    'add-locks' => true,
];

// lancement de la sauvegarde
try {
    $dump = new IMysqldump\Mysqldump("mysql:host=$dbHost;dbname=$dbBase;charset=utf8mb4", $dbUser, $dbPassword, $lesParametres);
    // le passage de paramètre peut se faire par appel des méthodes
    $dump->start($file);
// retour sur la page d'accueil du module
    header("Location: index.php");
} catch (\Exception $e) {
    Erreur::envoyerReponse($e->getMessage() . "- $file", 'global') ;
}

