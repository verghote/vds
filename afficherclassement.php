<?php
/**
 * affichage d'un classement avec comptabilisation et traçabilité de la demande
 */

// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// vérification du paramètre attendu :
if (!isset($_GET['id']) || empty($_GET['id'])) {
    Erreur::envoyerReponse("Le classement n'est pas précisé", 'global');
}

// récupération du paramètre attendu
$id = $_GET['id'];

// http://vds-correction/afficherclassement.php?id=../../../password.pdf

// contrôle de la validité du paramètre
$pattern = '/^20\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]) [a-z 0-9]+\.pdf$/';
if (!preg_match($pattern, $id)) {
   Erreur::bloquerVisiteur();
}


// Le classement doit être présent dans le répertoire /data/classement (fort probable)
$fichier = RACINE . "/data/classement/" . $id;

if (!file_exists($fichier)) {
    Erreur::envoyerReponse("Le classement demandé '$id' n'a pas été trouvé.", 'global');
}


// journalisation de la demande
Journal::enregistrer($id, 'classement');

//  Comptabilisation de l'appel
StatPage::comptabiliser();

// afficher le classement à l'écran
header('Content-Type: application/pdf');
header("Content-Disposition: filename=$id");
readfile($fichier);


