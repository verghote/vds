<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . '/include/autoload.php';


// Contrôle du paramètre attendu
if (!isset($_GET["fichier"])) {
    Erreur::envoyerReponse("Le fichier de sauvegarde à télécharger n'est pas transmis", 'global');
}
$nom = $_GET["fichier"];

// vérification de la valeur du paramètre attendu de la forme :
// le nom doit être de la forme xxxx-xx-xx-xx-xx-xx.sql
if (!preg_match('/^\d{4}-\d{2}-\d{2}-\d{2}-\d{2}-\d{2}\.sql$/', $nom)) {
    Erreur::envoyerReponse("Le nom du fichier de sauvegarde n'est pas valide", 'global');
}

// Le fichier doit exister
$fichier =  "sql/$nom";
// vérification de l'existence du fichier
if (!file_exists($fichier)) {
    Erreur::envoyerReponse( "Ce fichier de sauvegarde n'existe pas", 'global') ;
}

// récupération du type mime du fichier pour alimenter l'attribut content-type de l'entête renvoyé
// attention : pas d'espace avant :
header("Content-type: 'text/plain");
header("Content-Disposition: inline; filename=$nom");

$fp = fopen ( $fichier, 'r' );
$buffer = fread($fp,filesize($fichier));
echo $buffer;