<?php
// définition du jeu de caractères
header('Content-type: text/html; charset=utf-8');

// initialisation du fuseau horaire
date_default_timezone_set('Europe/Paris');

// accès aux variables de session
// ini_set('session.cookie_lifetime', 0);
session_start();

// Définition d'une constante indiquant la racine du site
define('RACINE', $_SERVER['DOCUMENT_ROOT']);

spl_autoload_register(function ($name) {
    $name = strtolower($name);

    // Recherche dans le répertoire classemetier local
    $fichier = RACINE . "/classemetier/$name.php";
    if (file_exists($fichier)) {
        require $fichier;
        return;
    }

    // Recherche dans le répertoire classetechnique local
    $fichier = RACINE . "/classetechnique/$name.php";
    if (file_exists($fichier)) {
        require $fichier;
        return;
    }

    // Si la classe n'est trouvée nulle part
    throw new Exception("Impossible de charger la classe $name");
});

// Journalisation de la demande
$visiteur = ClientHttp::estUnRobot() ? 'robot' : 'visiteur';
if (isset($_SESSION['membre'])) {
    $visiteur = $_SESSION['membre']['prenom'] . " " . $_SESSION['membre']['nom'];
}
Journal::enregistrer($visiteur, 'evenement');

// Vérifier l'état de la session
if (isset($_SESSION['disable'])) {
    Erreur::envoyerReponse('Votre session a été désactivée suite à un comportement jugé malveillant', 'global');
}

// vérifier le trafic généré par l'ip
$ip = Journal::getIp();
$bloquer = TraficIp::ajouter($ip, true);
if ($bloquer) {
    $_SESSION['disable'] = true;
    Erreur::envoyerReponse('Votre adresse IP est temporairement bloquée suite à un trop grand nombre de requêtes.', 'global');
}